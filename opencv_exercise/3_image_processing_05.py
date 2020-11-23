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


# # 使用分水岭算法进行图像分割------------------------------------------------------------------------------------------------
# """cv.watershed（），需要熟悉分水岭算法的逻辑以及原理"""
# img = cv.imread("images/coins.jpg")
# img_gray = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
# # 利用OTSU分割确定前景和背景大概的位置
# ret, thresh = cv.threshold(img_gray, 0, 255, cv.THRESH_BINARY_INV + cv.THRESH_OTSU)
# plt.imshow(thresh, cmap="gray")
# plt.show()
# coins = cv.bitwise_and(img, img, mask=thresh)
# plt.imshow(coins[:, :, ::-1], cmap="gray")
# plt.show()
# # 利用腐蚀保留确定属于前景的部分，利用膨胀保留确定属于背景的部分，用背景部分减去前景部分可以得到剩下的边界部分
# # 但是不确定分界线在哪里，可以同意通过分水岭算法来找到分界线
# # 移除噪声
# kernel = np.ones((3, 3), np.uint8)
# opening = cv.morphologyEx(thresh, cv.MORPH_OPEN, kernel, iterations=2)
# plt.imshow(opening, cmap="gray")
# plt.show()
# # 膨胀保留确定的背景
# sure_bg = cv.dilate(opening, kernel, iterations=3)  # 0标记确定背景
# plt.imshow(sure_bg, cmap="gray")
# plt.show()
# # 确定的前景
# """distanceTransform函数的意义是做距离变换：距离变换的定义是计算一个图像中非零像素点到最近的零像素点的距离，也就是到零像素点的最短距离。
# 距离变换的处理图像通常都是二值图像，而二值图像其实就是把图像分为两部分，即背景和物体两部分，物体通常又称为前景目标！
# 通常我们把前景目标的灰度值设为255，即白色，背景的灰度值设为0，即黑色。所以定义中的非零像素点即为前景目标，零像素点即为背景。
# 所以图像中前景目标中的像素点距离背景越远，那么距离就越大，如果我们用这个距离值替换像素值，那么新生成的图像中这个点越亮。"""
# dist_transform = cv.distanceTransform(opening, cv.DIST_L2, 5)
# plt.imshow(dist_transform, cmap="gray")
# plt.show()
# ret, sure_fg = cv.threshold(dist_transform, 0.7*dist_transform.max(), 255, 0)  # 用来去除不同对象之间重叠的边缘
# # 因为经过距离转换后，重叠部分离背景像素的距离更近，值也就更小，设定一定阈值可以过滤掉
# plt.imshow(sure_fg, cmap="gray")  # 1标记确定前景
# plt.show()
# # 找到不确定区域
# sure_fg = np.uint8(sure_fg)
# unknown = cv.subtract(sure_bg, sure_fg)  # 1标记不确定部分
# plt.imshow(unknown, cmap="gray")
# plt.show()
# # Marker labelling
# ret, markers = cv.connectedComponents(sure_fg)  # 确定前景的连通域分析，给每个连通域都进行编号，从0开始，相当于找到有几个对象
# # Add one to all labels so that sure background is not 0, but 1
# markers = markers + 1  # 给labels都加1，保证背景的编号是1，而不是0
# plt.imshow(markers, cmap="gray")
# plt.show()
# # Now, mark the region of unknown with zero
# markers[unknown == 255] = 0  # 把不确定部分标记为0
# plt.imshow(markers, cmap="gray")
# # 为什么上面的原始蓝色的，下面的圆是红色的？这是因为markers中传入的轮廓会被当作注水点，即分割中的种子点，因此需要不同编号
# plt.show()
# markers = cv.watershed(img, markers)  # 执行分水岭算法
# img[markers == -1] = [255, 0, 0]  # -1标记得到的边缘
# plt.imshow(img, cmap="gray")
# plt.show()


# 使用GrabCut算法进行交互式前景提取-----------------------------------------------------------------------------------------
"""cv.grabCut（）
"GrabCut": interactive foreground extraction using iterated graph cuts 论文地址：http://dl.acm.org/citation.cfm?id=1015720
1.用户输入矩形。此矩形外部的所有内容都将用作背景（这是在矩形应包含所有对象之前提到的原因）。矩形内的所有内容都是未知的。
  同样，任何指定前景和背景的用户输入都被视为硬标签，这意味着它们在此过程中不会更改。
2.计算机根据我们提供的数据进行初始标记。它标记前景和背景像素（或对其进行硬标记）
3.现在，使用高斯混合模型（GMM）对前景和背景进行建模。
4.根据我们提供的数据，GMM可以学习并创建新的像素分布。也就是说，根据颜色统计上未知像素与其他硬标记像素的关系，
  它们被标记为可能的前景或可能的背景（就像聚类一样）。
5.根据该像素分布构建图形。图中的节点为像素。添加了另外两个节点，即Source节点和Sink节点。
  每个前景像素都连接到源节点，每个背景像素都连接到接收器节点。
6.将像素连接到源节点/末端节点的边缘的权重由像素是前景/背景的概率定义。像素之间的权重由边缘信息或像素相似度定义。
  如果像素颜色差异很大，则它们之间的边缘将变低。
7.然后使用mincut算法对图进行分段。它将图切成具有最小成本函数的两个分离的源节点和宿节点。成本函数是被切割边缘的所有权重的总和。
  剪切后，连接到“源”节点的所有像素都变为前景，而连接到“接收器”节点的像素都变为背景。
8.继续该过程，直到分类收敛为止。"""
img = cv.imread("images/messi.png")
mask = np.zeros(img.shape[:2], np.uint8)

bgdModel = np.zeros((1, 65), np.float64)
fgdModel = np.zeros((1, 65), np.float64)

rect = (50, 50, 450, 290)
cv.grabCut(img, mask, rect, bgdModel, fgdModel, 5, cv.GC_INIT_WITH_RECT)

mask2 = np.where((mask == 2) | (mask == 0), 0, 1).astype('uint8')
img = img*mask2[:, :, np.newaxis]

plt.imshow(img), plt.colorbar(), plt.show()

