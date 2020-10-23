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
plt.rcParams['font.sans-serif']=['SimHei']
plt.rcParams['axes.unicode_minus'] = False

# # opencv中的轮廓----------------------------------------------------------------------------------------------------------
# """cv.findContours(), cv.drawContours()"""
# img = cv.resize(cv.imread("meow2.png"), (1024, 1024))
# img_gray = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
# ret, thresh = cv.threshold(img_gray, 127, 255, 0)
# contours, hierarchy = cv.findContours(thresh,                        # 检索轮廓
#                                       cv.RETR_TREE,                  # 轮廓检索模式
#                                       cv.CHAIN_APPROX_SIMPLE)        # 轮廓逼近方法，cv.CHAIN_APPROX_SIMPLE如果是直线只保存两个端点，
#                                                                      #             cv.CHAIN_APPROX_NONE保存所有的点
# # 返回的contours时图像中所有轮廓的list，每个轮廓都是由包含对象边界点的（x，y）的数组构成；hierarchy是轮廓的层次结构。
#
# cv.drawContours(img,
#                 contours,
#                 -1,                                                  # 轮廓编号
#                 (0, 255, 0),                                         # 颜色
#                 1)                                                   # 线宽
# cv.imshow("contours", img)
# cv.waitKey(0)
# cv.destroyAllWindows()


# # 轮廓特征----------------------------------------------------------------------------------------------------------------
# img = cv.imread("star.png")
# ret, thresh = cv.threshold(cv.cvtColor(img, cv.COLOR_BGR2GRAY), 127, 255, 0)
# contours, hierarchy = cv.findContours(thresh, 1, 2)
#
# # cv.drawContours(img, contours, -1, (0, 255, 0), 1)
# # cv.imshow("contours", img)
# # cv.waitKey(0)
# # cv.destroyAllWindows()
#
# cnt = contours[1]
# m = cv.moments(cnt)
# print(m)
#
# cx = int(m["m10"] / m["m00"])                                        # 中心点x
# cy = int(m["m01"] / m["m00"])                                        # 中心点y
# print("轮廓中心点坐标：", cx, cy)
#
# area = cv.contourArea(cnt)                                           # 轮廓面积
# print("轮廓面积：", area)
#
# perimeter = cv.arcLength(cnt, True)                                  # 轮廓周长
# print("轮廓周长：", perimeter)
#
# img = cv.imread("bad_rect.png")
# ret, thresh = cv.threshold(cv.cvtColor(img, cv.COLOR_BGR2GRAY), 127, 255, 0)
# contours, hierarchy = cv.findContours(thresh, 1, 2)
# cnt = contours[0]
# approx_1 = cv.approxPolyDP(cnt,                                      # 轮廓近似
#                            0.1 * cv.arcLength(cnt, True),            # 原本轮廓到近似轮廓的最大距离
#                            True)                                     # 指定曲线是否闭合
# approx_2 = cv.approxPolyDP(cnt, 0.01 * cv.arcLength(cnt, True), True)
#
# img = cv.imread("bad_rect.png")
# cv.drawContours(img, [cnt], -1, (0, 255, 0), 2)
# cv.imshow("contours", img)
#
# img = cv.imread("bad_rect.png")
# cv.drawContours(img, [approx_1], -1, (0, 255, 0), 2)
# cv.imshow("approx_1", img)
#
# img = cv.imread("bad_rect.png")
# cv.drawContours(img, [approx_2], -1, (0, 255, 0), 2)
# cv.imshow("approx_2", img)
#
# cv.waitKey(0)
# cv.destroyAllWindows()


# # 凸包------------------------------------------------------------------------------------------------------------------
# img = cv.imread("hand.png")
# ret, thresh = cv.threshold(cv.cvtColor(img, cv.COLOR_BGR2GRAY), 127, 255, cv.THRESH_BINARY_INV)
#
# contours, hierarchy = cv.findContours(thresh, 1, 2)
# cnt = contours[0]
# hull = cv.convexHull(cnt,
#                      hull=None,
#                      clockwise=None,                                 # True--顺时针，False--逆时针
#                      returnPoints=None)                              # True--返回坐标值，False--返回点在轮廓中的索引
#
# img = cv.imread("hand.png")
# cv.drawContours(img, [cnt], -1, (0, 255, 0), 2)
# cv.imshow("contours", img)
# img = cv.imread("hand.png")
# cv.drawContours(img, [hull], -1, (0, 255, 0), 2)
# cv.imshow("hull", img)
# cv.waitKey(0)
# cv.destroyAllWindows()


# # 检查凸度----------------------------------------------------------------------------------------------------------------
# """cv.isContourConvex(cnt)，检查曲线是否是凸性"""
# img = cv.imread("hand.png")
# ret, thresh = cv.threshold(cv.cvtColor(img, cv.COLOR_BGR2GRAY), 127, 255, cv.THRESH_BINARY_INV)
# contours, hierarchy = cv.findContours(thresh, 1, 2)
# cnt = contours[0]
# print(cv.isContourConvex(cnt))


# # 边界矩形----------------------------------------------------------------------------------------------------------------
# img = cv.imread("hand.png")
# ret, thresh = cv.threshold(cv.cvtColor(img, cv.COLOR_BGR2GRAY), 127, 255, cv.THRESH_BINARY_INV)
# contours, hierarchy = cv.findContours(thresh, 1, 2)
# cnt = contours[0]
#
# img = cv.imread("hand.png")
# x, y, w, h = cv.boundingRect(cnt)                                    # 垂直边界矩形
# tmp = np.asarray([[[x, y], [x + w, y], [x + w, y + h], [x, y + h]]])
# cv.drawContours(img, tmp, -1, (0, 255, 0), 2)
# # 旋转边界矩形
# rect = cv.minAreaRect(cnt)                                           # 旋转边界矩形，最小外接矩形
# box = cv.boxPoints(rect)                                             # 查找旋转矩形的四个顶点
# box = np.int0(box)
# cv.drawContours(img, [box], -1, (0, 0, 255), 2)
# cv.imshow("外接矩形", img)
# cv.waitKey(0)
# cv.destroyAllWindows()


# # 最小外接圆--------------------------------------------------------------------------------------------------------------
# img = cv.imread("hand.png")
# ret, thresh = cv.threshold(cv.cvtColor(img, cv.COLOR_BGR2GRAY), 127, 255, cv.THRESH_BINARY_INV)
# contours, hierarchy = cv.findContours(thresh, 1, 2)
# cnt = contours[0]
#
# (x, y), radius = cv.minEnclosingCircle(cnt)
# center = (int(x), int(y))
# radius = int(radius)
# cv.circle(img, center, radius, (255, 0, 0), 2)
# cv.imshow("最小外接圆", img)
# cv.waitKey(0)
# cv.destroyAllWindows()


# # 拟合椭圆----------------------------------------------------------------------------------------------------------------
# img = cv.imread("hand.png")
# ret, thresh = cv.threshold(cv.cvtColor(img, cv.COLOR_BGR2GRAY), 127, 255, cv.THRESH_BINARY_INV)
# contours, hierarchy = cv.findContours(thresh, 1, 2)
# cnt = contours[0]
#
# ellipse = cv.fitEllipse(cnt)
# cv.ellipse(img, ellipse, (255, 0, 0), 2)                             # 第二种用法，ellipse传入tuple，包含椭圆所有信息
# cv.imshow("拟合椭圆", img)
# cv.waitKey(0)
# cv.destroyAllWindows()


# # 拟合直线----------------------------------------------------------------------------------------------------------------
# img = cv.imread("hand.png")
# rows, cols, _ = img.shape
# ret, thresh = cv.threshold(cv.cvtColor(img, cv.COLOR_BGR2GRAY), 127, 255, cv.THRESH_BINARY_INV)
# contours, hierarchy = cv.findContours(thresh, 1, 2)
# cnt = contours[0]
#
# vx, vy, x, y = cv.fitLine(cnt, cv.DIST_L2, 0, 0.01, 0.01)
# lefty = int((-x * vy / vx) + y)
# righty = int(((cols - x) * vy / vx) + y)
# cv.line(img, (cols - 1, righty), (0, lefty), (0, 255, 0), 2)
# cv.imshow("拟合直线", img)
# cv.waitKey(0)
# cv.destroyAllWindows()


# # 轮廓更多功能------------------------------------------------------------------------------------------------------------
#
#
# def get_foot_point(point, line_p1, line_p2):
#     """
#         找垂足
#         @point, line_p1, line_p2 : [x, y]
#         """
#     x0, y0 = point
#     x1, y1 = line_p1
#     x2, y2 = line_p2
#
#     k = -((x1 - x0) * (x2 - x1) + (y1 - y0) * (y2 - y1)) / ((x2 - x1) ** 2 + (y2 - y1) ** 2) * 1.0
#
#     xn = k * (x2 - x1) + x1
#     yn = k * (y2 - y1) + y1
#
#     return xn, yn
#
#
# img = cv.imread("hand.png")
# rows, cols, _ = img.shape
# ret, thresh = cv.threshold(cv.cvtColor(img, cv.COLOR_BGR2GRAY), 127, 255, cv.THRESH_BINARY_INV)
# contours, hierarchy = cv.findContours(thresh, 1, 2)
# cnt = contours[0]
#
# hull = cv.convexHull(cnt,                                            # 检测凸度缺陷
#                      returnPoints=False)                             # 必须设置为False，以便于寻找凸缺陷
# defects = cv.convexityDefects(cnt,                                   # 轮廓
#                               hull)                                  # 凸包
#                                                                      # 返回起点，终点，最远点，到最远点的近似距离，其中前三个值是在轮廓中的索引
#
# for i in range(defects.shape[0]):
#     s, e, f, d = defects[i, 0]
#     start = tuple(cnt[s][0])
#     end = tuple(cnt[e][0])
#     far = tuple(cnt[f][0])
#     foot = get_foot_point(far, start, end)                           # 找到垂足
#     cv.line(img, start, end, [0, 255, 0], 2)
#     cv.line(img, far, (int(foot[0]), int(foot[1])), [0, 0, 255], 2)  # cv.circle(img, far, 5, [0, 0, 255], -1)
# cv.imshow("检测轮廓缺陷", img)
# cv.waitKey(0)
# cv.destroyAllWindows()


# # 点与轮廓的最短距离-------------------------------------------------------------------------------------------------------
# img = cv.imread("hand.png")
# ret, thresh = cv.threshold(cv.cvtColor(img, cv.COLOR_BGR2GRAY), 127, 255, cv.THRESH_BINARY_INV)
# contours, hierarchy = cv.findContours(thresh, 1, 2)
# cnt = contours[0]
#
# dist = cv.pointPolygonTest(cnt,                                      # 轮廓
#                            (50, 50),                                 # 点的坐标
#                            True)  # 如果为True，则找到带符号的距离。如果为False，它将查找该点是在轮廓内部还是外部或轮廓上（分别返回+ 1，-1、0）
# print(dist)


# # 形状匹配---------------------------------------------------------------------------------------------------------------
# """cv.matchShapes（），使我们能够比较两个形状或两个轮廓，并返回显示相似度的度量。结果越低，匹配越好"""
# star_a = cv.imread("stara.png")
# _, thresh = cv.threshold(cv.cvtColor(star_a, cv.COLOR_BGR2GRAY), 127, 255, cv.THRESH_BINARY_INV)
# contours, _ = cv.findContours(thresh, 1, 2)
# cnt_a = contours[2]
#
# star_b = cv.imread("starb.png")                                      # 图形即使旋转对形状影响较小
# _, thresh = cv.threshold(cv.cvtColor(star_b, cv.COLOR_BGR2GRAY), 127, 255, cv.THRESH_BINARY_INV)
# contours, _ = cv.findContours(thresh, 1, 2)
# cnt_b = contours[3]
#
# rect_c = cv.imread("rectc.png")
# _, thresh = cv.threshold(cv.cvtColor(rect_c, cv.COLOR_BGR2GRAY), 127, 255, cv.THRESH_BINARY_INV)
# contours, _ = cv.findContours(thresh, 1, 2)
# cnt_c = contours[0]
#
# print(cv.matchShapes(cnt_a, cnt_b, 1, 0.0))                          # a和b的形状差异度
# print(cv.matchShapes(cnt_a, cnt_c, 1, 0.0))                          # a和c的形状差异度


# # Homework1：Check the documentation for cv.pointPolygonTest(), you can find a nice image in Red and Blue color. It
# # represents the distance from all pixels to the white curve on it. All pixels inside curve is blue depending on the
# # distance. Similarly outside points are red. Contour edges are marked with White. So problem is simple. Write a code
# # to create such a representation of distance.
# img = cv.imread("hand.png")
# rows, cols, _ = img.shape
# ret, thresh = cv.threshold(cv.cvtColor(img, cv.COLOR_BGR2GRAY), 127, 255, cv.THRESH_BINARY_INV)
# contours, hierarchy = cv.findContours(thresh, 1, 2)
# cnt = contours[0]
#
# for r in range(rows):
#     for c in range(cols):
#         dst = cv.pointPolygonTest(cnt,                               # 轮廓
#                                   (c, r),                            # (x, y)
#                                   True)                              # 返回具体距离
#         level = max(200 - abs(dst), 0)
#         if dst > 0:                                                  # 在轮廓内，设置为红色
#             img[r, c, :] = [0, 0, level]
#         elif dst == 0:
#             img[r, c, :] = [255, 255, 255]
#         else:
#             img[r, c, :] = [level, 0, 0]
# cv.imshow("color dist", img)
# cv.waitKey(0)
# cv.destroyAllWindows()


# # Homework2：Compare images of digits or letters using cv.matchShapes(). ( That would be a simple step towards OCR )
# from tensorflow.keras.datasets import mnist                          # 从mnist库获取手写数字
# (x, y), (_, _) = mnist.load_data("mnist.npz")                        # 导入MNIST数据接口
# size = 50
# x = np.asarray([cv.resize(x[i, :, :], (128, 128)) for i in range(size)])
# y = y[:size]
# cnts = []
#
# plt_x = 10
# plt_y = int(np.ceil(size / plt_x))
# for idx in range(size):
#     cnt = cv.findContours(x[idx, :, :], 1, 2)[0]                     # 计算所有数字的轮廓
#     cnts.append(cnt)
#     plt.subplot(plt_y, plt_x, idx + 1)
#     plt.imshow(x[idx, :, :], cmap="gray")
#     plt.title(y[idx]), plt.xticks([]), plt.yticks([])
# plt.show()
#
# cnts_1 = []
# for idx in range(size):
#     if y[idx] == 1:                                                  # 找出所有数字1的轮廓
#         cnts_1.append(cnts[idx])
#         img = x[idx, :, :]
#         cv.drawContours(img, cnts_1[-1], -1, (255, 255, 255), 2)
#         cv.imshow("num", img)
#         cv.waitKey(0)
#         cv.destroyWindow("num")
#
# for i in range(len(cnts_1)):                                         # 计算每两个1之间的差异值
#     for j in range(i + 1, len(cnts_1)):
#         val = cv.matchShapes(cnts_1[i][0], cnts_1[j][0], 1, 0.0)
#         print(i + 1, j + 1, val)


# 轮廓层次----------------------------------------------------------------------------------------------------------------
"""使用cv.findContours（）函数在图像中找到轮廓时，传递了一个参数--轮廓检索模式。通常取cv.RETR_LIST或cv.RETR_TREE，效果很好。
hierarchy----[相同等级下一个轮廓的编号，    没有时为-1
              相同等级上一个轮廓编号，      没有时为-1
              第一个子轮廓，              没有时为-1
              父轮廓]                   没有时为-1
cv.RETR_LIST：                  不创建父子关系，所有轮廓均平等，即hierarchy的后两项始终为-1
cv.RETR_TREE：                  创建轮廓树
cv.RETR_CCOMP：                 生成二级轮廓，外圈为第一层级，内权威第二层级，由最内层二级轮廓及外，包含父轮廓和子轮廓
cv.RETR_EXTERNAL：              仅返回最外层轮廓，也就没有父轮廓和子轮廓，只有兄弟轮廓
0的编号有疑问
"""
img = 255 - cv.imread("contours.png")
ret, thresh = cv.threshold(cv.cvtColor(img, cv.COLOR_BGR2GRAY), 127, 255, cv.THRESH_BINARY)

contours, hierarchy = cv.findContours(thresh, cv.RETR_LIST, cv.CHAIN_APPROX_SIMPLE)
print("list:", hierarchy)
# cv.drawContours(img, contours, -1, (0, 0, 255), 3)
# cv.imshow("c", img)
# cv.waitKey(0)
# cv.destroyAllWindows()

contours, hierarchy = cv.findContours(thresh,
                                      cv.RETR_EXTERNAL,
                                      cv.CHAIN_APPROX_SIMPLE)
print("父轮廓:", hierarchy)
# cv.drawContours(img, contours, -1, (0, 0, 255), 3)
# cv.imshow("c", img)
# cv.waitKey(0)
# cv.destroyAllWindows()

img = 255 - cv.imread("contours2.png")
ret, thresh = cv.threshold(cv.cvtColor(img, cv.COLOR_BGR2GRAY), 127, 255, cv.THRESH_BINARY)
contours, hierarchy = cv.findContours(thresh,
                                      cv.RETR_CCOMP,
                                      cv.CHAIN_APPROX_SIMPLE)
print("二级轮廓:", hierarchy)
# cv.drawContours(img, contours, -1, (0, 0, 255), 3)
# cv.imshow("c", img)
# cv.waitKey(0)
# cv.destroyAllWindows()

contours, hierarchy = cv.findContours(thresh,
                                      cv.RETR_TREE,
                                      cv.CHAIN_APPROX_SIMPLE)
print("轮廓树:", hierarchy)
# cv.drawContours(img, contours, -1, (0, 0, 255), 3)
# cv.imshow("c", img)
# cv.waitKey(0)
# cv.destroyAllWindows()
