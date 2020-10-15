#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (c) 2020 libei. All right reserved.
"""=================================================
@IDE    ：PyCharm
@Author ：Li Bei
@Email  : libei@cadg.cn
@Date   ：2020/9/16 14:21
================================================="""
import cv2 as cv
import matplotlib.pyplot as plt
import numpy as np


# # 图像入门---------------------------------------------------------------------------------------------------------------
# """cv.imread()，cv.imshow()，cv.imwrite()"""
# # 加载彩色灰度图像
# img = cv.imread("meow.jpg")                                       # 路径有问题时会返回None
#
# # 显示图像
# # cv.imshow("image", img)
# # cv.waitKey(0)                                                        # 绑定键盘功能，0是无限等待击键
# # cv.destroyAllWindows()                                               # 销毁所有窗口，destoryWindow(窗口名)销毁特定窗口
# # 还可先创建一个空窗口
# cv.namedWindow("image", cv.WINDOW_NORMAL)                            # WINDOW_NORMAL可以调整窗口大小
# cv.imshow("image", img)
# k = cv.waitKey(0) & 0xFF                                             # 获取敲击的键
# if k == ord("s"):
#     # 保存图像
#     cv.imwrite("meow.png", img)
# cv.destroyWindow("image")
#
# # 使用matplotlib，python自带的画图的包
# plt.imshow(img[:, :, ::-1], cmap="jet", interpolation="bicubic")     # [:, :, ::-1]反转最后一个轴，由cv读入的BGR转为RGB
# plt.xticks([]), plt.yticks([])                                       # 隐藏X和Y轴上的刻度值
# plt.show()


# # 视频入门---------------------------------------------------------------------------------------------------------------
# """cv.VideoCapture()，cv.VideoWriter()"""
# cap = cv.VideoCapture("peacock.mp4")       # 参数可以是设备索引或视频名称
# if not cap.isOpened():                     # 检查cap是否初始化，初始化成功则可以用cap.open()打开
#     print("Cannot open camera")
#     exit()
#
# # 还可使用cap.get(propID)去访问该视频中的某些功能，其中propID是0到18之间的一个数字。
# height = cap.get(cv.CAP_PROP_FRAME_HEIGHT)
# width = cap.get(cv.CAP_PROP_FRAME_WIDTH)
# # 定义编解码器，创建VideoWriter对象
# fourcc = cv.VideoWriter_fourcc(*"mp4v")
# out = cv.VideoWriter("peacock_gray.mp4",                           # 文件名
#                      0,                                            # api偏好
#                      fourcc,                                       # 编解码器，保存为MP4时选“mp4v”
#                      cap.get(cv.CAP_PROP_FPS),                     # 帧数
#                      (int(width), int(height)),                    # 帧尺寸
#                      1)                                            # 保存的视频是彩色还是灰度，1为彩色，0为灰度，设置必须与图像相对应
#
# while True:
#     ret, frame = cap.read()                # 逐帧捕获，如果正确读取到帧ret为True，可以通过检查此返回值来检查视频的结尾
#     if not ret:
#         print("Cannot receive frame (stream end?). Exiting ……")  # 结尾读不到下一帧时退出
#         break
#     gray = cv.flip(frame, 0)  # cv.cvtColor(frame, cv.COLOR_BGR2GRAY)
#     out.write(gray)                        # 逐帧保存
#     cv.namedWindow("frame")
#     cv.imshow("frame", gray)
#     if cv.waitKey(10) & 0xFF == ord("q"):  # 10表示延时10ms切换到下一帧图像，0表示只显示当前帧图像，相当于视频暂停,q表示键盘输入该值时执行操作
#         break
#
# cap.release()                              # 处理完后释放捕获
# out.release()                              # 释放
# cv.destroyAllWindows()


# # 绘图功能---------------------------------------------------------------------------------------------------------------
# """cv.line()，cv.circle()，cv.rectangle()，cv.ellipse()，cv.putText()等。"""
# img = np.ones((512, 512, 3), np.uint8) * 255                         # 创建画布
# # 画线
# cv.line(img,                                                         # 画布
#         (0, 0),                                                      # 起点
#         (511, 511),                                                  # 终点
#         (255, 0, 0),                                                 # 颜色
#         5)                                                           # 线宽
# # 画矩形
# cv.rectangle(img,                                                    # 画布
#              (128, 128),                                             # 左上
#              (384, 384),                                             # 右下
#              (0, 255, 0),                                            # 颜色
#              3)                                                      # 线宽，负数默认全部填充
# # 画圆
# cv.circle(img,                                                       # 画布
#           (255, 255),                                                # 圆心
#           50,                                                        # 半径
#           (0, 0, 255),                                               # 颜色
#           -1)                                                        # 线宽，负数默认全部填充
# # cv.clipLine裁切保留矩形内的线，如果直线完全在矩形外，则retval返回False
# retval, pt1, pt2 = cv.clipLine((128, 128, 256, 256),                 # 左，上，宽，高
#                                (0, 0),                               # 线的起点
#                                (511, 511))                           # 线的终点
# cv.line(img, pt1, pt2, (256, 256, 256), 2)                           # 画出裁切后的线
# # 画椭圆
# cv.ellipse(img,                                                      # 画布
#            (256, 256),                                               # 指定中心位置
#            (100, 50),                                                # （长轴，短轴）
#            0,                                                        # 主轴沿逆时针方向旋转的角度
#            0,                                                        # 起始角度
#            180,                                                      # 终止角度
#            (60, 128, 32),                                            # 颜色
#            -1)
# # 画多边形
# pts = np.array([[10, 5], [388, 20], [100, 128], [150, 5], [150, 50]], np.int32)
# pts = pts.reshape((-1, 1, 2))
# cv.polylines(img,                                                    # 画布
#              [pts],                                                  # 多边形角点
#              True,                                                   # 是否闭合，不闭合则得到的是一条连接所有点的折线
#              (0, 255, 255),                                          # 颜色
#              5)                                                      # 线宽
# # 添加文本
# font = cv.FONT_HERSHEY_SIMPLEX
# cv.putText(img,                                                      # 画布
#            "OpenCV",                                                 # 内容
#            (10, 500),                                                # 起点
#            font,                                                     # 字形
#            4,                                                        # 字的大小
#            (0, 0, 0),                                                # 颜色
#            0,                                                        # 线的类型
#            cv.LINE_AA,                                               # 线宽
#            False)                                                    # 文本的对齐起点
#
# cv.imshow("figure", img)                                             # 显示画布
# cv.waitKey()
# cv.destroyAllWindows()


# # 鼠标作为画笔------------------------------------------------------------------------------------------------------------
# """cv.setMouseCallback()"""
# events = [i for i in dir(cv) if "EVENT" in i]                        # 获取cv库中鼠标操作的名称
# # print(events)
# """鼠标操作说明
# 'EVENT_FLAG_ALTKEY',                                                 # 按住ALT
# 'EVENT_FLAG_CTRLKEY',                                                # 按住Ctrl
# 'EVENT_FLAG_LBUTTON',                                                # 按住左键
# 'EVENT_FLAG_MBUTTON',                                                # 按住中键
# 'EVENT_FLAG_RBUTTON',                                                # 按住右键
# 'EVENT_FLAG_SHIFTKEY',                                               # 按住Shift
# 'EVENT_LBUTTONDBLCLK',                                               # 左键双击
# 'EVENT_LBUTTONDOWN',                                                 # 左键击下
# 'EVENT_LBUTTONUP',                                                   # 左键弹起
# 'EVENT_MBUTTONDBLCLK',                                               # 中键双击
# 'EVENT_MBUTTONDOWN',                                                 # 中键击下
# 'EVENT_MBUTTONUP',                                                   # 中键弹起
# 'EVENT_MOUSEHWHEEL',                                                 # 滚动条向左，flag>0，向右，flag<0
# 'EVENT_MOUSEMOVE',                                                   # 鼠标移动
# 'EVENT_MOUSEWHEEL',                                                  # 滚动条向上，flag>0，向下，flag<0
# 'EVENT_RBUTTONDBLCLK',                                               # 右键双击
# 'EVENT_RBUTTONDOWN',                                                 # 右键击下
# 'EVENT_RBUTTONUP'                                                    # 右键弹起
# """
#
#
# def draw_circle(event, x, y, flags, param):
#     if event == cv.EVENT_LBUTTONDBLCLK:
#         cv.circle(img, (x, y), 100, (255, 0, 0), -1)
#
#
# img = np.ones((512, 512, 3))                                         # 创建画布
# cv.namedWindow("figure")
# cv.setMouseCallback("figure", draw_circle)                           # setMouseCallback捕捉鼠标操作，默认返回五个参数
#
# while True:
#     cv.imshow("figure", img)
#     if cv.waitKey(20) & 0xFF == 27:                            # 退出显示
#         break
#
# cv.destroyAllWindows()
#
#
# drawing = False                                                      # 是否敲击鼠标
# mode = True                                                          # 如果为True，则绘制矩形。按“ m”切换到曲线
# ix, iy = -1, -1
#
#
# # 鼠标回调函数
# def draw_circle(event, x, y, flags, param):
#     global ix, iy, drawing, mode
#
#     if event == cv.EVENT_LBUTTONDOWN:                                # 点击左键
#         drawing = True
#         ix, iy = x, y
#     elif event == cv.EVENT_MOUSEMOVE:                                # 移动鼠标
#         if drawing:
#             if mode:
#                 cv.rectangle(img, (ix, iy), (x, y), (0, 255, 0), 5)
#             else:
#                 cv.circle(img, (x, y), 5, (0, 0, 255), 5)
#     elif event == cv.EVENT_LBUTTONUP:                                # 弹起左键
#         drawing = False
#         if mode:
#             cv.rectangle(img, (ix, iy), (x, y), (0, 255, 0), 5)
#         else:
#             cv.circle(img, (x, y), 5, (0, 0, 255), 5)
#
#
# img = np.ones((512, 512, 3), np.uint8) * 255
# cv.namedWindow("figure")
# cv.setMouseCallback("figure", draw_circle)
#
# while True:
#     cv.imshow("figure", img)
#     k = cv.waitKey(1) & 0xFF
#     if k == ord("m"):
#         mode = not mode
#     elif k == 27:
#         break
#
# cv.destroyAllWindows()


# 生成调色板callback，滑动RGB轨迹栏，改变窗口显示的颜色-------------------------------------------------------------------------
"""cv.getTrackbarPos()，cv.createTrackbar()等。"""
def nothing(x):
    pass


img = np.ones((512, 512, 3), np.uint8) * 255
cv.namedWindow("figure")

# 创建用于改变颜色Trackbars
cv.createTrackbar("R",                                               # 轨迹栏名称
                  "figure",                                          # 窗口名
                  0,                                                 # 最小值
                  255,                                               # 最大值
                  nothing)                                           #
cv.createTrackbar("G", "figure", 0, 255, nothing)
cv.createTrackbar("B", "figure", 0, 255, nothing)

# 创建开关
switch = "0: OFF\n1: ON"
cv.createTrackbar(switch, "figure", 0, 1, nothing)

while True:
    cv.imshow("figure", img)
    k = cv.waitKey(0) & 0xFF
    if k == 27:
        break

    # 获取Trackbars现在的位置
    r = cv.getTrackbarPos("R",                                       # 轨迹栏名称
                          "figure")                                  # 窗口名
    g = cv.getTrackbarPos("G", "figure")
    b = cv.getTrackbarPos("B", "figure")
    s = cv.getTrackbarPos(switch, "figure")

    if s == 0:
        img[:] = 255
    else:
        img[:] = [b, g, r]

cv.destroyAllWindows()

