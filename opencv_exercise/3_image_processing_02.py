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

# # 图像阈值----------------------------------------------------------------------------------------------------------------
# """cv.threshold()和cv.adaptiveThreshold()
#     简单阈值类型:
#     cv.THRESH_BINARY：            大于阈值则为最大值，否则为0
#     cv.THRESH_BINARY_INV:        大于阈值为0，否则为最大值
#     cv.THRESH_TRUNC:             大于阈值为最大值，否则不改变
#     cv.THRESH_TOZERO:            大于阈值不改变，否则为0
#     cv.THRESH_TOZERO_INV:        大于阈值为0，否则不改变
# """
# # 全局阈值
# img = np.array([[i for i in range(256)] for _ in range(256)],        # 生成灰度渐变图像
#                dtype=np.uint8)
# ret, threshold1 = cv.threshold(img,                                  # 源图像
#                                127,                                  # 阈值
#                                255,                                  # 最大值
#                                cv.THRESH_BINARY)                     # 阈值类型
# _, threshold2 = cv.threshold(img, 127, 255, cv.THRESH_BINARY_INV)
# _, threshold3 = cv.threshold(img, 127, 255, cv.THRESH_TRUNC)
# _, threshold4 = cv.threshold(img, 127, 255, cv.THRESH_TOZERO)
# _, threshold5 = cv.threshold(img, 127, 255, cv.THRESH_TOZERO_INV)
#
# titles = ["Original image", "BINARY", "BINARY_INV", "TRUNC", "TOZERO", "TOZERO_INV"]
# images = [img, threshold1, threshold2, threshold3, threshold4, threshold5]
#
# for i in range(6):
#     plt.subplot(2, 3, i+1), plt.imshow(images[i], "gray")
#     plt.title(titles[i])
#     plt.xticks([]), plt.yticks([])
# plt.show()
#
# # 自适应阈值，局部阈值
# img = cv.imread("sudoku.png", 0)
# img = cv.medianBlur(img, 5)
#
# _, threshold1 = cv.threshold(img, 127, 255, cv.THRESH_BINARY)
# threshold2 = cv.adaptiveThreshold(img,                               # 源图像
#                                   255,                               # 最大值
#                                   cv.ADAPTIVE_THRESH_MEAN_C,         # 自适应方法
#                                   cv.THRESH_BINARY,                  # 阈值类型
#                                   11,                                # 邻域大小
#                                   2)                                 # 从平均值或加权平均值中减去的常数。通常为正数，但也可能为零或负数。
# threshold3 = cv.adaptiveThreshold(img, 255, cv.ADAPTIVE_THRESH_GAUSSIAN_C, cv.THRESH_BINARY, 11, 2)
#
# titles = ['Original Image', 'Global Thresholding (v = 127)',
#           'Adaptive Mean Thresholding', 'Adaptive Gaussian Thresholding']
# images = [img, threshold1, threshold2, threshold3]
#
# for i in range(4):
#     plt.subplot(2, 2, i+1), plt.imshow(images[i], 'gray')
#     plt.title(titles[i])
#     plt.xticks([]), plt.yticks([])
# plt.show()
#
#
# # OTSU二值化
# def sp_noise(image, prob):
#     """
#         添加椒盐噪声
#         :param image:
#         :param prob:    噪声比例
#         """
#     output = np.zeros(image.shape, np.uint8)
#     thres = 1 - prob
#     for i in range(image.shape[0]):
#         for j in range(image.shape[1]):
#             rdn = np.random.random()
#             if rdn < prob:
#                 output[i][j] = 0
#             elif rdn > thres:
#                 output[i][j] = 255
#             else:
#                 output[i][j] = image[i][j]
#     return output
#
#
# def gasuss_noise(image, mean=0, var=0.001):
#     """
#         添加高斯噪声
#         :param image:
#         :param mean:  均值
#         :param var:   方差
#         """
#     image = np.array(image/255, dtype=float)
#     noise = np.random.normal(mean, var ** 0.5, image.shape)
#     out = image + noise
#     if out.min() < 0:
#         low_clip = -1.
#     else:
#         low_clip = 0.
#     out = np.clip(out, low_clip, 1.0)
#     out = np.uint8(out*255)
#     return out
#
#
# img = (np.ones([256, 256]) * 255).astype("uint8")                    # 生成带椒盐噪声的图像
# img = cv.copyMakeBorder(img, 128, 128, 128, 128, borderType=cv.BORDER_CONSTANT, value=[0])
# img = sp_noise(img, 0.1)
#
# ret1, threshold1 = cv.threshold(img, 127, 255, cv.THRESH_BINARY)
# ret2, threshold2 = cv.threshold(img, 0, 255, cv.THRESH_BINARY + cv.THRESH_OTSU)
# blur = cv.GaussianBlur(img, (5, 5), 0)
# ret3, threshold3 = cv.threshold(blur, 0, 255, cv.THRESH_BINARY + cv.THRESH_OTSU)
#
# images = [img, 0, threshold1,
#           img, 0, threshold2,
#           blur, 0, threshold3]
# titles = ['Original Noisy Image', 'Histogram', 'Global Thresholding (v=127)',
#           'Original Noisy Image', 'Histogram', "Otsu's Thresholding",
#           'Gaussian filtered Image', 'Histogram', "Otsu's Thresholding"]
# for i in range(3):
#     plt.subplot(3, 3, i * 3 + 1), plt.imshow(images[i * 3], 'gray')
#     plt.title(titles[i * 3]), plt.xticks([]), plt.yticks([])
#     plt.subplot(3, 3, i * 3 + 2), plt.hist(images[i * 3].ravel(), 256)
#     plt.title(titles[i * 3 + 1]), plt.xticks([]), plt.yticks([])
#     plt.subplot(3, 3, i * 3 + 3), plt.imshow(images[i * 3 + 2], 'gray')
#     plt.title(titles[i * 3 + 2]), plt.xticks([]), plt.yticks([])
# plt.show()


# # 图像平滑----------------------------------------------------------------------------------------------------------------
# """学习各种低通滤波来模糊图像，cv.filter2D()
# 低通滤波用于去噪模糊等，高通滤波用于找到图像边缘
# """
# img = cv.imread("meow.jpg")[:, :, ::-1]
#
# kernel = np.ones((5, 5), np.float32) / 25
# dst = cv.filter2D(img,                                               # 二维卷积
#                   -1,                                                # 通道数，-1
#                   kernel)                                            # 卷积核
#
# plt.subplot(121), plt.imshow(img), plt.title("Original")
# plt.xticks([]), plt.yticks([])
# plt.subplot(122), plt.imshow(dst), plt.title("Averaging")
# plt.xticks([]), plt.yticks([])
# plt.show()
#
# blur = cv.blur(img,                                                  # 模糊图像，均值滤波
#                (5, 5))                                               # 模糊核
# plt.subplot(121), plt.imshow(img), plt.title("Original")
# plt.xticks([]), plt.yticks([])
# plt.subplot(122), plt.imshow(blur), plt.title("Average Blur")
# plt.xticks([]), plt.yticks([])
# plt.show()
#
# gauss_blur = cv.GaussianBlur(img,                                    # 模糊图像，高斯滤波
#                              (5, 5),                                 # 高斯卷积核
#                              0)                                      # sigma
# plt.subplot(121), plt.imshow(img), plt.title("Original")
# plt.xticks([]), plt.yticks([])
# plt.subplot(122), plt.imshow(gauss_blur), plt.title("Gaussian Blur")
# plt.xticks([]), plt.yticks([])
# plt.show()
#
# median_blur = cv.medianBlur(img,                                     # 模糊图像，中值滤波
#                             5,                                       # 核大小
#                             0)                                       # sigma
# plt.subplot(121), plt.imshow(img), plt.title("Original")
# plt.xticks([]), plt.yticks([])
# plt.subplot(122), plt.imshow(median_blur), plt.title("Media Blur")
# plt.xticks([]), plt.yticks([])
# plt.show()
#
# bilateral_blur = cv.bilateralFilter(img,                             # 模糊图像，双边滤波
#                                     9,                               # 核大小
#                                     75,                              # 颜色空间过滤的sigma
#                                     75)                              # 坐标空间中过滤的sigma
# plt.subplot(121), plt.imshow(img), plt.title("Original")
# plt.xticks([]), plt.yticks([])
# plt.subplot(122), plt.imshow(bilateral_blur), plt.title("Bilateral Blur")
# plt.xticks([]), plt.yticks([])
# plt.show()


# # 形态转换----------------------------------------------------------------------------------------------------------------
# """cv.erode(), cv.dilate(), cv.morphologyEx()"""
# img = cv.imread("j.png")
# kernel = np.ones((5, 5), np.uint8)
#
# erosion = cv.erode(img,                                              # 腐蚀
#                    kernel,
#                    iterations=1)                                     # 迭代次数
# plt.imshow(np.hstack([img, erosion])), plt.title("Erosion"), plt.xticks([]), plt.yticks([])
# plt.show()
#
# dilation = cv.dilate(img, kernel, iterations=1)                      # 膨胀
# plt.imshow(np.hstack([img, dilation])), plt.title("Dilation"), plt.xticks([]), plt.yticks([])
# plt.show()
#
# gradient = cv.morphologyEx(img, cv.MORPH_GRADIENT, kernel)           # 形态梯度：膨胀与腐蚀之差，能够保留物体边缘
# plt.imshow(np.hstack([img, gradient])), plt.title("Gradient"), plt.xticks([]), plt.yticks([])
# plt.show()
#
# img = cv.imread("j1.png")
# opening = cv.morphologyEx(img,
#                           cv.MORPH_OPEN,                             # 开运算：先腐蚀再膨胀，能够去除细小点
#                           kernel)                                    # 迭代次数不为1时，是腐蚀->腐蚀->膨胀->膨胀
# plt.imshow(np.hstack([img, opening])), plt.title("Opening"), plt.xticks([]), plt.yticks([])
# plt.show()
#
# img = cv.imread("j1.png")
# tophat = cv.morphologyEx(img, cv.MORPH_TOPHAT, kernel)               # 顶帽，原图像与开运算之差
# plt.imshow(np.hstack([img, tophat])), plt.title("Top Hat"), plt.xticks([]), plt.yticks([])
# plt.show()
#
# img = cv.imread("j2.png")
# closing = cv.morphologyEx(img, cv.MORPH_CLOSE, kernel)               # 闭运算：先膨胀再腐蚀，能够去除孔洞
# plt.imshow(np.hstack([img, closing])), plt.title("Closing"), plt.xticks([]), plt.yticks([])
# plt.show()
#
# img = cv.imread("j2.png")
# blackhat = cv.morphologyEx(img, cv.MORPH_BLACKHAT, kernel)           # 黑帽，闭运算与原图像之差
# plt.imshow(np.hstack([img, blackhat])), plt.title("Black Hat"), plt.xticks([]), plt.yticks([])
# plt.show()
#
# # 结构元素，用来创建特殊形状的核，只需传入核的形状核大小
# k_rect = cv.getStructuringElement(cv.MORPH_RECT, (5, 5))
# print("k_rect:{}".format(k_rect))
# k_ellipse = cv.getStructuringElement(cv.MORPH_ELLIPSE, (5, 5))
# print("k_ellipse:{}".format(k_ellipse))
# k_cross = cv.getStructuringElement(cv.MORPH_CROSS, (5, 5))
# print("k_ellipse:{}".format(k_ellipse))


# # 图像梯度---------------------------------------------------------------------------------------------------------------
# """cv.Sobel（），cv.Scharr（），cv.Laplacian（）"""
# # sobel算子是高斯平滑家微分运算的联合，更耐噪声
# img = cv.imread("meow.jpg", 0)
#
# laplacian = cv.Laplacian(img, cv.CV_64F)                             # 64位浮点数
# sobel_x = cv.Sobel(img,                                              #
#                    cv.CV_64F,                                        # 输出图像深度
#                    1,                                                # x方向导数的阶数
#                    0,                                                # y方向导数的阶数
#                    ksize=5)
# sobel_y = cv.Sobel(img, cv.CV_64F, 0, 1, ksize=5)
# plt.subplot(221), plt.imshow(img, cmap='gray'), plt.title('Original'), plt.xticks([]), plt.yticks([])
# plt.subplot(222), plt.imshow(laplacian, cmap='gray'), plt.title('Laplacian'), plt.xticks([]), plt.yticks([])
# plt.subplot(223), plt.imshow(sobel_x, cmap='gray'), plt.title('Sobel X'), plt.xticks([]), plt.yticks([])
# plt.subplot(224), plt.imshow(sobel_y, cmap='gray'), plt.title('Sobel Y'), plt.xticks([]), plt.yticks([])
# plt.show()
#
# img = np.ones((256, 256), np.uint8) * 255
# img = cv.copyMakeBorder(img, 128, 128, 128, 128, cv.BORDER_CONSTANT, 0)
#
# # Output dtype = cv.CV_8U，此时由1变为0的负梯度会被截断为0，也就检测不到了
# sobel_x_8u = cv.Sobel(img, cv.CV_8U, 1, 0, ksize=5)
# # Output dtype = cv.CV_64F. Then take its absolute and convert to cv.CV_8U
# sobel_x_64f = cv.Sobel(img, cv.CV_64F, 1, 0, ksize=5)
# abs_sobel_64f = np.absolute(sobel_x_64f)
# sobel_8u = np.uint8(abs_sobel_64f)
# plt.subplot(131), plt.imshow(img, cmap='gray'), plt.title('Original'), plt.xticks([]), plt.yticks([])
# plt.subplot(132), plt.imshow(sobel_x_8u, cmap='gray'), plt.title('Sobel CV_8U'), plt.xticks([]), plt.yticks([])
# plt.subplot(133), plt.imshow(sobel_8u, cmap='gray'), plt.title('Sobel abs(CV_64F)'), plt.xticks([]), plt.yticks([])
# plt.show()


# # Canny边缘检测-----------------------------------------------------------------------------------------------------------
# """cv.Canny()
# 1.降噪，使用5x5的高斯滤波，
# 2.计算梯度，使用sobel算子在水平和竖直方向进行滤波，并计算总的梯度
# 3.非极大值抑制，
# 4.阈值界定，需要设置最小阈值和最大阈值，梯度大于最大阈值的必是边缘，小于最小阈值的必定是非边缘，在最大最小阈值之间的连接到边缘的为边缘，没连接的是非边缘。
# """
# img = cv.imread("meow.png", 0)
# edges = cv.Canny(img,
#                  100,                                                # minVal
#                  200,                                                # maxVal
#                  apertureSize=3,                                     # sobel核的大小，默认为3
#                  L2gradient=None)                                    # 如果为True用精确的梯度计算公式，否则使用|Gx|+|Gy|替代
#
# plt.subplot(121), plt.imshow(img, cmap="gray"), plt.title("Original"), plt.xticks([]), plt.yticks([])
# plt.subplot(122), plt.imshow(edges, cmap="gray"), plt.title("Canny Edges"), plt.xticks([]), plt.yticks([])
# plt.show()
#
# # Homework:Write a small application to find the Canny edge detection whose threshold values can be varied using two
# # trackbars. This way, you can understand the effect of threshold values.
#
#
# def nothing(x):
#     pass
#
#
# cv.namedWindow("Canny edges detection")
# cv.createTrackbar("Low Threshold", "Canny edges detection", 0, 255, nothing)
# cv.createTrackbar("High Threshold", "Canny edges detection", 0, 255, nothing)
#
#
# img = cv.imread("messi.png", 0)
# edges = np.zeros_like(img)
# while True:
#     cv.imshow("Canny edges detection", np.hstack([img, edges]))
#     k = cv.waitKey(0) & 0xFF
#     if k == 27:
#         break
#
#     low = cv.getTrackbarPos("Low Threshold", "Canny edges detection")
#     high = cv.getTrackbarPos("High Threshold", "Canny edges detection")
#     if low >= high:
#         figure = np.zeros_like(img)
#         cv.putText(figure,
#                    "Low threshold must lower than high threshold!",
#                    (10, 100),
#                    cv.FONT_HERSHEY_SIMPLEX,
#                    0.5,
#                    (255, 255, 255),
#                    1,
#                    cv.LINE_AA,
#                    False)
#         cv.imshow("Warning", figure)
#         if cv.waitKey(0) == 27:
#             cv.destroyWindow("Warning")
#     else:
#         edges = cv.Canny(img, low, high)
# cv.destroyAllWindows()


# 图像金字塔--------------------------------------------------------------------------------------------------------------
"""cv.pyrUp（），cv.pyrDown（）"""
img = cv.imread("messi.png")[:, :, ::-1]
plt.imshow(img), plt.title("Original"), plt.show()
lower_reso = cv.pyrDown(img)
higher_reso = cv.pyrUp(lower_reso)
plt.imshow(lower_reso), plt.title("lower"), plt.show()
plt.imshow(higher_reso), plt.title("higher"), plt.show()

apple = cv.imread("apple.png")[:, :, ::-1]
orange = cv.imread("orange.png")[:, :, ::-1]

# 生成apple的高斯金字塔
G = apple.copy()
gpa = [G]                                                            # --最大的图
for i in range(6):
    G = cv.pyrDown(G)
    gpa.append(G)

# 生成orange的高斯金字塔
G = orange.copy()
gpo = [G]
for i in range(6):
    G = cv.pyrDown(G)
    gpo.append(G)

# 生成orange的高斯金字塔
lpa = [gpa[-1]]                                                      # --最小的图
for i in range(6, 0, -1):
    GE = cv.pyrUp(gpa[i], dstsize=gpa[i - 1].shape[:2])
    L = cv.subtract(gpa[i - 1], GE)                                  # 做差
    lpa.append(L)

# 生成orange的拉普拉斯金字塔
lpo = [gpo[-1]]
for i in range(6, 0, -1):
    GE = cv.pyrUp(gpo[i], dstsize=gpo[i - 1].shape[:2])
    L = cv.subtract(gpo[i - 1], GE)
    lpo.append(L)

# 拼接各个级别的高斯金字塔图像
LS = []
for la, lo in zip(lpa, lpo):
    rows, cols, dpt = la.shape
    ls = np.hstack([la[:, :int(cols/2)], lo[:, int(cols/2):]])
    LS.append(ls)

# 重建图像
ls_ = LS[0]                                                            # --最小的图
for i in range(1, 6):
    ls_ = cv.pyrUp(ls_, dstsize=LS[i].shape[:2])
    ls_ = cv.add(ls_, LS[i])

# 直接拼接最高分辨率两图像
rows, cols, dpt = apple.shape
real = np.hstack([apple[:, :int(cols/2)], orange[:, int(cols/2):]])

plt.subplot(221), plt.imshow(apple), plt.title("apple"), plt.xticks([]), plt.yticks([])
plt.subplot(222), plt.imshow(orange), plt.title("orange"), plt.xticks([]), plt.yticks([])
plt.subplot(223), plt.imshow(ls_), plt.title("金字塔图像融合"), plt.xticks([]), plt.yticks([])
plt.subplot(224), plt.imshow(real), plt.title("直接融合"), plt.xticks([]), plt.yticks([])
plt.show()
