#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (c) 2020 libei. All right reserved.
"""=================================================
@IDE    ：PyCharm
@Author ：Li Bei
@Email  : libei@cadg.cn
@Date   ：2020/9/16 14:21
================================================="""


def application(                                           # application()函数必须由WSGI服务器来调用。
        environ,                                           # 一个包含所有HTTP请求信息的dict对象
        start_response):                                   # 一个发送HTTP响应的函数

    start_response(                                        # 发送HTTP相应的Header，只能发送一次，即只能调用一次start_response
        "302 FOUND",                                       # HTTP响应码
        [("Content-type", "text/html")]                    # list表示的HTTP Header，每个Header用一个包含两个str的tuple表示
    )

    body = "<h1>Hello {}!<h1>".format(environ["PATH_INFO"][1:] or "web")

    return [body.encode("utf-8")]                          # 函数的返回值将作为HTTP响应的Body发送给浏览器。
