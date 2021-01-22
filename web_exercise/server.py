#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (c) 2020 libei. All right reserved.
"""=================================================
@IDE    ：PyCharm
@Author ：Li Bei
@Email  : libei@cadg.cn
@Date   ：2020/9/16 14:21
================================================="""

# server.py负责启动WSGI服务器，加载application()函数

from wsgiref.simple_server import make_server              # 从wsgiref模块导入WSGI服务器
from web_exercise.test_WSGI import application             # 导入application函数

httpd = make_server("", 8000, application)                 # 创建一个服务器，IP地址为空，端口是8000，处理函数是application
print("Serving HTTP on port 8000……")

httpd.serve_forever()                                      # 开始监听HTTP请求
