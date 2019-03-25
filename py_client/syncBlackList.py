#! /usr/bin/python
# -*- coding: utf-8 -*
import os
import os.path, time, datetime
import configparser
import pymysql.cursors
import configparser
import shutil

class SyncBlackList():
    def getConfig(self,section, key):
        config = configparser.ConfigParser()
        path = os.path.split(os.path.realpath(__file__))[0] + '/config.ini'
        config.read(path, 'UTF-8')
        return config.get(section, key)

    def syncBlackFile(self):
        bakupdir = SyncBlackList.getConfig(self,'PATH', 'FaceVerifyPath') + '\\bak'
        blackdir = SyncBlackList.getConfig(self,'PATH', 'FaceVerifyPath') + '\\List'
        connect = pymysql.Connect(
            host=SyncBlackList.getConfig(self,'DATABASE', 'host'),
            port=3306,
            user='p_author',
            passwd='!pfxx123',
            db='p_author',
            charset='utf8'
        )
        # 获取游标
        cursor1 = connect.cursor()
        cursor2 = connect.cursor()
        qury_sql = "select ps.deal_type,ps.id from p_sync_task ps,p_point pp where ps.collect_point_id=pp.id and pp.is_delete=0 and ps.is_delete=0 and ps.is_deal=0 and pp.point_name='%s'"
        cursor1.execute(qury_sql % SyncBlackList.getConfig(self,'POINT','point'))
        for row in cursor1.fetchall():
            oldfile = os.path.join(blackdir, "BlackList.txt")
            bakupfile=os.path.join(bakupdir,"BlackList.txt")
            print(row[1])
            if (os.path.exists(oldfile)):
                if(os.path.exists(bakupfile)):
                    os.rename(bakupfile,bakupfile+str(time.time()))
                shutil.move(oldfile, bakupdir)
            #os.mknod(oldfile)
            if(row[0]==1):
                getBlackList_sql="select id_card from p_person_control where is_delete=0"
                cursor2.execute(getBlackList_sql)
                black_str =""
                for blist in cursor2.fetchall():
                    black_str =black_str+blist[0]+"\n"
                fp=open(oldfile,"w")
                fp.write(black_str)
                fp.close()
                result_sql="UPDATE p_sync_task SET is_deal = 1,edit_time=NOW() WHERE id = '%s'"
                cursor2.execute(result_sql % row[1])
            result_sql = "UPDATE p_sync_task SET is_deal = 1,edit_time=NOW() WHERE id = '%s'"
            cursor2.execute(result_sql % row[1])
            connect.commit()
        cursor1.close()
        cursor2.close()
        connect.close()



if __name__ == "__main__":
    while True:
        syncBlackList=SyncBlackList()
        syncBlackList.syncBlackFile()
        time.sleep(600)