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


# 模板匹配----------------------------------------------------------------------------------------------------------------
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
# img = cv.imread("images/sudoku.png", 0)
# edges = cv.Canny(img, 50, 150, apertureSize=3)
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

# # opencv进行霍夫变换
# lines = cv.HoughLines(edges, 1, np.pi/180, 150)
# for line in lines:
#     rho, theta = line[0]
#     a = np.cos(theta)
#     b = np.sin(theta)
#     x0 = a * rho
#     y0 = b * rho
#     x1 = int(x0 + 1000 * (-b))
#     y1 = int(y0 + 1000 * a)
#     x2 = int(x0 - 1000 * (-b))
#     y2 = int(y0 - 1000 * a)
#     cv.line(img, (x1, y1), (x2, y2), 255, 2)
# plt.imshow(img, cmap="gray")
# plt.show()
#
# # 概率霍夫变换
# """概率霍夫变换是对霍夫变换的优化，它不是考虑所有的点，而是采用随机的点子集，相应的需要降低阈值，新添加了两个参数，
# minLineLength： 线的最小长度，小于此长度的线段将会被拒绝
# maxLineGap：    可以将两条线段视为同一条线的最大间隙
# """
# img = cv.imread("images/sudoku.png", 0)
# edges = cv.Canny(img, 50, 150, apertureSize=3)
#
# lines = cv.HoughLinesP(edges, 1, np.pi / 180, 50, minLineLength=100, maxLineGap=10)
# for line in lines:
#     x1, y1, x2, y2 = line[0]
#     cv.line(img, (x1, y1), (x2, y2), 255, 2)
# plt.imshow(img, cmap="gray")
# plt.show()


#  霍夫圆变换--------------------------------------------------------------------------------------------------------------
# """cv.HoughCircles（）"""
# img = cv.imread("images/opencv.jpg")
# img_blur = cv.medianBlur(img, 5)
# img_gray = cv.cvtColor(img_blur, cv.COLOR_BGR2GRAY)
#
# circles = cv.HoughCircles(img_gray,
#                           cv.HOUGH_GRADIENT,
#                           1,
#                           20,
#                           param1=50,
#                           param2=30,
#                           minRadius=0,
#                           maxRadius=0)
# for i in circles[0, :]:
#     # 画圆
#     cv.circle(img, (i[0], i[1]), i[2], (255, 255, 0), 2)
#     # 画圆心
#     cv.circle(img, (i[0], i[1]), 2, (255, 0, 255), 2)
# plt.imshow(img[:, :, ::-1])
# plt.show()


# 使用分水岭算法进行图像分割------------------------------------------------------------------------------------------------
"""cv.watershed（），需要熟悉分水岭算法的逻辑以及原理"""
img = cv.imread("images/coins.jpg")
img_gray = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
# 利用OTSU分割确定前景和背景大概的位置
ret, thresh = cv.threshold(img_gray, 0, 255, cv.THRESH_BINARY_INV + cv.THRESH_OTSU)
coins = cv.bitwise_and(img, img, mask=thresh)
plt.imshow(coins[:, :, ::-1])
plt.show()
# 利用腐蚀保留确定属于前景的部分，利用膨胀保留确定属于背景的部分，用背景部分减去前景部分可以得到剩下的边界部分
# 但是不确定分界线在哪里，可以同意通过分水岭算法来找到分界线
# 移除噪声
kernel = np.ones((3, 3), np.uint8)
opening = cv.morphologyEx(thresh, cv.MORPH_OPEN, kernel, iterations=2)
# 膨胀保留确定的背景
sure_bg = cv.dilate(opening, kernel, iterations=3)
# 确定的前景 TODO:没看懂，需要查阅distanceTransform函数的意义？？？？？？？？？？？？？？？？？？？？？？？？？？？？？
dist_transform = cv.distanceTransform(opening, cv.DIST_L2, 5)
ret, sure_fg = cv.threshold(dist_transform, 0.7*dist_transform.max(), 255, 0)
# 找到不确定区域
sure_fg = np.uint8(sure_fg)
unknown = cv.subtract(sure_bg, sure_fg)
# Marker labelling
ret, markers = cv.connectedComponents(sure_fg)
# Add one to all labels so that sure background is not 0, but 1
markers = markers + 1
# Now, mark the region of unknown with zero
markers[unknown == 255] = 0
plt.imshow(markers, cmap="jet")  # TODO:为什么上面的原始蓝色的，下面的圆是红色的
plt.show()
markers = cv.watershed(img, markers)
img[markers == -1] = [255, 0, 0]
plt.imshow(img)
plt.show()


