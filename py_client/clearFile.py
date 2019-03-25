#! /usr/bin/python
# -*- coding: utf-8 -*
import os
import os.path, time, datetime
import configparser

class ClearFile():
    def getConfig(section, key):
        config = configparser.ConfigParser()
        path = os.path.split(os.path.realpath(__file__))[0] + '/config.ini'
        config.read(path, 'UTF-8')
        return config.get(section, key)

    def clearDir():
        cleardir = []
        cleardir.append(ClearFile.getConfig('CLEANDIR','id_photo'))
        cleardir.append(ClearFile.getConfig('CLEANDIR','failed'))
        cleardir.append(ClearFile.getConfig('CLEANDIR','success'))
        cleardir.append(ClearFile.getConfig('CLEANDIR','logs'))
        for opdir in cleardir:
            for parent, dirnames, filenames in os.walk(opdir):
                     for filename in filenames:
                           fullname = parent + "/" + filename  # 文件全称
                           createTime = int(os.path.getctime(fullname))  # 文件创建时间
                           delete_time=int((int(time.time())-createTime)/3600)#删除多少小时之前的文件
                           if delete_time > 48:  # 创建时间在n小时前的文件删除
                               os.remove(os.path.join(parent, filename))
if __name__ == "__main__":
    while True:
        ClearFile.clearDir()
        time.sleep(3600)