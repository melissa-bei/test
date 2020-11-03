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
import numpy as np
import matplotlib.pyplot as plt
# 解决中文显示问题
plt.rcParams["font.sans-serif"]=["SimHei"]
plt.rcParams["axes.unicode_minus"] = False


# # 模板匹配----------------------------------------------------------------------------------------------------------------
# """cv.matchTemplate（），cv.minMaxLoc（）
# 模板匹配是一种用于在较大图像中搜索和查找模板图像位置的方法。为此，OpenCV带有一个函数cv.matchTemplate（）。
# 它只是将模板图​​像滑动到输入图像上（就像在2D卷积中一样），然后在模板图像下比较模板和输入图像的补丁。
# OpenCV中实现了几种比较方法。它返回一个灰度图像，其中每个像素表示该像素的邻域与模板匹配多少。
#
# 如果输入图像的尺寸为（WxH），模板图像的尺寸为（wxh），则输出图像的尺寸将为（W-w + 1，H-h + 1）。
# 获得结果后，可以使用cv.minMaxLoc（）函数查找最大/最小值在哪里。将其作为矩形的左上角，并以（w，h）作为矩形的宽度和高度。该矩形是您模板的区域。
#
# 如果使用cv.TM_SQDIFF作为比较方法，则最小值表示最佳匹配。
# """
# img = cv.imread("images/meow.jpg", 0)
# img2 = img.copy()
# template = img[300:500, 300:500]
# w, h = template.shape[::-1]
#
# methods = ["cv." + i for i in dir(cv) if "TM_" in i]                           # 获取cv库中模板匹配的方法
# """['TM_CCOEFF', 'TM_CCOEFF_NORMED', 'TM_CCORR', 'TM_CCORR_NORMED', 'TM_SQDIFF', 'TM_SQDIFF_NORMED']"""
#
# for meth in methods:
#     img = img2.copy()
#     method = eval(meth)
#
#     res = cv.matchTemplate(img, template, method)                    # 模板匹配
#     min_val, max_val, min_loc, max_loc = cv.minMaxLoc(res)
#
#     if meth in [cv.TM_SQDIFF, cv.TM_SQDIFF_NORMED]:
#         top_left = min_loc
#     else:
#         top_left = max_loc
#     bottom_right = (top_left[0] + w, top_left[1] + h)
#
#     cv.rectangle(img, top_left, bottom_right, 255, 2)
#
#     plt.subplot(121), plt.imshow(res, cmap="gray")
#     plt.title(meth), plt.xticks([]), plt.yticks([])
#     plt.subplot(122), plt.imshow(img, cmap="gray")
#     plt.title("Detected Point"), plt.xticks([]), plt.yticks([])
#     plt.show()
#
# # 模板与多个对象匹配
# img_bgr = cv.imread("images/mario.jpg")
# img_gray = cv.cvtColor(img_bgr, cv.COLOR_BGR2GRAY)
# template = img_gray[21:133, 23:95]
# w, h = template.shape[::-1]
#
# res = cv.matchTemplate(img_gray, template, cv.TM_CCOEFF_NORMED)
# threshold = 0.8
# loc = np.where(res >= 0.8)
# for pt in zip(*loc[::-1]):
#     cv.rectangle(img_bgr, pt, (pt[0] + w, pt[1] + h), [0, 0, 255], 2)  # 显示匹配到的对象
# plt.imshow(img_bgr[:, :, ::-1])
# plt.show()


# 霍夫线变换--------------------------------------------------------------------------------------------------------------
"""cv.HoughLines（），cv.HoughLinesP（）"""
img = cv.imread("images/sudoku.png", 0)
edges = cv.Canny(img, 50, 150, apertureSize=3)
# # 手动实现霍夫变换
# h, w = edges.shape
# loc = np.where(edges == 255)
# rho_max = np.ceil(np.sqrt(h ** 2 + w ** 2)).astype(np.int)
# counter = np.zeros([180, rho_max])
#
# for y, x in zip(*loc):
#     for theta in range(0, 180):
#         t = np.pi / 180 * theta
#         rho = int(x * np.cos(t) + y * np.sin(t))
#         counter[theta, rho] += 1
# lines = np.where(counter > 150)
# for theta, rho in zip(*lines):
#     t = np.pi / 180. * theta
#     a = np.cos(t)
#     b = np.sin(t)
#     x0 = a * rho
#     y0 = b * rho
#     x1 = int(x0 + 1000 * (-b))
#     y1 = int(y0 + 1000 * a)
#     x2 = int(x0 - 1000 * (-b))
#     y2 = int(y0 - 1000 * a)
#     cv.line(img, (x1, y1), (x2, y2), 255, 2)
# plt.imshow(img, cmap="gray")
# plt.show()
# opencv进行霍夫变换
lines = cv.HoughLines(edges, 1, np.pi/180, 150)
for line in lines:
    rho, theta = line[0]
    a = np.cos(theta)
    b = np.sin(theta)
    x0 = a * rho
    y0 = b * rho
    x1 = int(x0 + 1000 * (-b))
    y1 = int(y0 + 1000 * a)
    x2 = int(x0 - 1000 * (-b))
    y2 = int(y0 - 1000 * a)
    cv.line(img, (x1, y1), (x2, y2), 255, 2)
plt.imshow(img, cmap="gray")
plt.show()
