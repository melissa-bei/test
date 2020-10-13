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
from matplotlib import pyplot as plt


# # 图像的基本操作-----------------------------------------------------------------------------------------------------------
# img = cv.imread("meow.jpg")
#
# # 访问和修改像素
# px = img[100, 100]
# print(px)
# b = px[2]
# print(b)
#
# img[100, 100] = [255, 255, 255]                            # numpy是用于快速数组计算的优化库，简单访问每个像素值进行修改会非常慢
# print(img[100, 100])
#
# b = img.item(100, 100, 0)                                  # 访问和编辑像素更好的方法时使用array.item()和array.item()
# g = img.item(100, 100, 1)
# r = img.item(100, 100, 2)
# print(b, g, r)
#
# print(img.shape)                                           # 图像的尺寸
# print(img.size)                                            # 图像的像素总个数
# print(img.dtype)                                           # 图像中像素的默认类型
#
# # 提取ROI
# head = img[200:500, 300:600]
# img[0:300, 0:300] = head
# cv.namedWindow("image")
# cv.imshow("image", img)
# cv.waitKey()
# cv.destroyAllWindows()
#
# # 分割和合并通道
# b, g, r = cv.split(img)                                    # 拆分通道，十分耗时！！！
# img = cv.merge((b, g, r))                                  # 合并通道
# # img[:, :, 0] = 0                                           # 修改某个通道的值时numpy的索引更快
# cv.namedWindow("image")
# cv.imshow("image", img)
# cv.waitKey()
# cv.destroyAllWindows()
#
# # 给图像padding
# img = cv.imread("meow.jpg")[:, :, ::-1]
# replicate = cv.copyMakeBorder(img,                                   # 源图像
#                               100,                                   # top padding size
#                               100,                                   # bottom padding size
#                               100,                                   # left padding size
#                               100,                                   # right padding size
#                               cv.BORDER_REPLICATE)                   # 复制最外围一排像素
# reflect = cv.copyMakeBorder(img, 100, 100, 100, 100,
#                             cv.BORDER_REFLECT)                       # 反射
# reflect101 = cv.copyMakeBorder(img, 100, 100, 100, 100,
#                                cv.BORDER_REFLECT_101)                # 与reflect类似
# wrap = cv.copyMakeBorder(img, 100, 100, 100, 100,
#                          cv.BORDER_WRAP)                             # 拓展，上面的复值最下面，下面的复制最上面
# constant = cv.copyMakeBorder(img, 100, 100, 100, 100,
#                              cv.BORDER_CONSTANT, value=[255, 0, 0])  # 固定值
#
# plt.subplot(231), plt.imshow(img, "gray"), plt.title("ORIGINAL")
# plt.subplot(232), plt.imshow(replicate, "gray"), plt.title("REPLICATE")
# plt.subplot(233), plt.imshow(reflect, "gray"), plt.title("REFLECT")
# plt.subplot(234), plt.imshow(reflect101, "gray"), plt.title("REFLECT101")
# plt.subplot(235), plt.imshow(wrap, "gray"), plt.title("WRAP")
# plt.subplot(236), plt.imshow(constant, "gray"), plt.title("CONSTANT")
# plt.show()


# 图像上的算术运算---------------------------------------------------------------------------------------------------------
# 图像叠加
x = np.uint8([250])
y = np.uint8([10])

print(cv.add(x, y))  # -->[[255]]，250 + 10 = 260 => 255，opencv的加法是饱和运算，也就是说两个图像相加时像素会更亮
print(x + y)         # -->[4]，250 + 10 = 260 % 256 = 4，numpy的加法是模运算

# 图像融合
img1 = cv.imread("meow.png")[600:1100, 200:700, :]
img2 = cv.resize(cv.imread("meow2.png"), (500, 500))
dst = cv.addWeighted(img1,                                           # 源图像1
                     0.7,                                            # 比例
                     img2,                                           # 源图像2
                     0.3,                                            # 比例
                     0)                                              # 偏移值。类型
cv.imshow("image", dst)
cv.waitKey(0)
cv.destroyAllWindows()

# 位操作
img1 = cv.imread("opencv.jpg") + 1
img2 = cv.imread("meow2.png")

rows, cols, channels = img1.shape
roi = img2[:rows, :cols]                                             # ROI区域

img1gray = cv.cvtColor(img1, cv.COLOR_BGR2GRAY)
ret, mask = cv.threshold(img1gray, 10, 250, cv.THRESH_BINARY)        # 创建img1的掩码
mask_inv = cv.bitwise_not(mask)

img2_bg = cv.bitwise_and(roi, roi, mask)                             # 用mask遮住img2中的ROI
img1_fg = cv.bitwise_and(img1, img1, mask)                           # 在img1中抠出mask
dst = cv.add(img1_fg, img2_bg)                                       # 把抠出来的图像放入主图像中
img2[:rows, :cols] = dst

cv.namedWindow("image", 0)
cv.imshow("image", img2)
cv.waitKey(0)
cv.destroyAllWindows()

# homework:Create a slide show of images in a folder with smooth transition between images using cv.addWeighted function
