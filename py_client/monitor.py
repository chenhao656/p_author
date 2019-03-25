#coding:utf8
#author:lcamry
from watchdog.observers import Observer
from watchdog.events import *
import time
import glob
import os
import os.path
import pymysql.cursors
import shutil
import requests
import io
import configparser

class FileEventHandler(FileSystemEventHandler):

    def __init__(self):
        FileSystemEventHandler.__init__(self)

    def getConfig(self,section, key):
        config = configparser.ConfigParser()
        path = os.path.split(os.path.realpath(__file__))[0] + '/config.ini'
        config.read(path,'UTF-8')
        return config.get(section, key)

    def on_created(self, event):
        if event.is_directory:
            print("directory created:{0}".format(event.src_path))
        else:
            opdir = FileEventHandler.getConfig(self,'PATH','FaceVerifyPath')+'\\LOGO'
            bakupdir=FileEventHandler.getConfig(self,'PATH','FaceVerifyPath')+'\\bak'
            photodir=FileEventHandler.getConfig(self,'PATH','FaceVerifyPath')+'\\Capture\\Success'
            for parent, dirnames, filenames in os.walk(opdir):

                # 连接数据库
                connect = pymysql.Connect(
                    host=FileEventHandler.getConfig(self,'DATABASE','host'),
                    port=3306,
                    user='p_author',
                    passwd='!pfxx123',
                    db='p_author',
                    charset='utf8'
                )

                # 获取游标
                cursor = connect.cursor()
                #上传图片的接口地址
                post_url=FileEventHandler.getConfig(self,'POSTURL','url')
                for filename in filenames:  # 输出文件信息
                    qury_sql="select count(1) from p_person_control where is_delete=0 and id_card='%s'"
                    id_card=filename.split('.')[0]
                    cursor.execute(qury_sql%id_card)
                    for row in cursor.fetchall():
                        is_monitor_person = row[0]
                    if(is_monitor_person>0):
                        #插入数据
                        insert_sql = "INSERT INTO p_person_spot_info (id_card,is_deal,collect_point,add_time) VALUES ( '%s','0','%s',NOW())"
                        data=(id_card,FileEventHandler.getConfig(self,'POINT','point'))
                        cursor.execute(insert_sql % data)
                        connect.commit()

                        #现场图片上传
                        post_dir=photodir + '\\' + id_card + '.jpg'
                        if(os.path.exists(post_dir)):
                            post_data = {'file': open(post_dir, 'rb')}
                            requests.post(FileEventHandler.getConfig(self,'POSTURL','url'), files=post_data)
                    shutil.move(os.path.join(parent, filename), bakupdir)
                cursor.close()
                connect.close()

if __name__ == "__main__":
    observer = Observer()
    event_handler = FileEventHandler()
    observer.schedule(event_handler,event_handler.getConfig('PATH','FaceVerifyPath')+'\\LOGO',True)
    observer.start()
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()