#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (c) 2020 libei. All right reserved.
"""=================================================
@IDE    ：PyCharm
@Author ：Li Bei
@Email  : libei@cadg.cn
@Date   ：2020/9/16 14:21
================================================="""
from flask import Flask
from flask import request
from flask import render_template


app = Flask(__name__)


# @app.route("/", methods=["GET", "POST"])
# def home():                                                          # home页面
#     return "<h1>Home<h1>"
#
#
# @app.route("/signin", methods=["GET"])
# def signin_form():                                                   # 登录表单页面
#     return '''<form action="/signin" method="post">
#               <p><input name="username"></p>
#               <p><input name="password" type="password"></p>
#               <p><button type="submit">Sign In</button></p>
#               </form>'''
#
#
# @app.route("/signin", methods=["POST"])
# def signin():                                                        # 从request对象读取表单内容
#     if request.form["username"] == "admin" and request.form["password"] == "password":
#         return "<h3>Hello admin</h3>"
#     return "<h3>Bad username or password</h3>"


# 用MVC模式改写-----------------------------------------------------------------------------------------------------------
"""Flask通过render_template()函数来实现模板的渲染。和Web框架类似，Python的模板也有很多种。
   Flask默认支持的模板是jinja2，所以我们先直接安装jinja2："""


@app.route("/", methods=["GET", "POST"])
def home():                                                          # home页面
    return render_template("home.html")


@app.route("/signin", methods=["GET"])
def signin_form():                                                   # 登录表单页面
    return render_template("form.html")


@app.route("/signin", methods=["POST"])
def signin():                                                        # 从request对象读取表单内容
    username = request.form["username"]
    password = request.form["password"]
    if username == "admin" and password == "password":
        return render_template("signin-ok.html", username=username)
    return render_template("form.html", message="Bad username or password", username=username)


if __name__ == "__main__":
    app.run()
