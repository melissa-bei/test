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
import time


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


# # 图像上的算术运算---------------------------------------------------------------------------------------------------------
# """cv.add()，cv.addWeighted()等。"""
# # 图像叠加
# x = np.uint8([250])
# y = np.uint8([10])
#
# print(cv.add(x, y))  # -->[[255]]，250 + 10 = 260 => 255，opencv的加法是饱和运算，也就是说两个图像相加时像素会更亮
# print(x + y)         # -->[4]，250 + 10 = 260 % 256 = 4，numpy的加法是模运算
#
# # 图像融合
# img1 = cv.imread("meow.png")[600:1100, 200:700, :]
# img2 = cv.resize(cv.imread("meow2.png"), (500, 500))
# dst = cv.addWeighted(img1,                                           # 源图像1
#                      0.7,                                            # 比例
#                      img2,                                           # 源图像2
#                      0.3,                                            # 比例
#                      0)                                              # 偏移值。类型
# cv.imshow("image", dst)
# cv.waitKey(0)
# cv.destroyAllWindows()
#
# # 位操作
# img1 = cv.imread("opencv.jpg") + 1
# img2 = cv.imread("meow2.png")
#
# rows, cols, channels = img1.shape
# roi = img2[:rows, :cols]                                             # ROI区域
#
# img1gray = cv.cvtColor(img1, cv.COLOR_BGR2GRAY)
# ret, mask = cv.threshold(img1gray, 10, 250, cv.THRESH_BINARY)        # 创建img1的掩码
# mask_inv = cv.bitwise_not(mask)
#
# img2_bg = cv.bitwise_and(roi, roi, mask)                             # 用mask遮住img2中的ROI
# img1_fg = cv.bitwise_and(img1, img1, mask)                           # 在img1中抠出mask
# dst = cv.add(img1_fg, img2_bg)                                       # 把抠出来的图像放入主图像中
# img2[:rows, :cols] = dst
#
# cv.namedWindow("image", 0)
# cv.imshow("image", img2)
# cv.waitKey(0)
# cv.destroyAllWindows()

# # homework:Create a slide show of images in a folder with smooth transition between images using cv.addWeighted function
# img1 = cv.imread("meow.png")[100:600, 200:700, :]
# img2 = cv.resize(cv.imread("meow2.png"), (500, 500))
#
# ratios = [0, 0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1]
#
# cv.namedWindow("image", 0)
# for ratio in ratios:
#     merged_img = cv.addWeighted(img1, ratio, img2, 1 - ratio, 0)
#     cv.imshow("image", merged_img)
#     cv.waitKey(50)
# cv.waitKey(0)
# cv.destroyAllWindows()


# 衡量性能和改进技术，衡量代码效率--------------------------------------------------------------------------------------------
"""cv.getTickCount()，cv.getTickFrequency()等。"""
"""cv.getTickCount函数返回从参考事件到调用此函数时的时钟周期数。如果在函数执行前和执行后调用它则会获得用域函数执行的时钟数周期"""
img1 = cv.imread("meow.png")[100:600, 200:700, :]

e1 = cv.getTickCount()
e3 = time.time()
for i in range(5, 49, 2):
    img1 = cv.medianBlur(img1, i)
e2 = cv.getTickCount()
e4 = time.time()
print((e2-e1)/cv.getTickFrequency())                                 # getTickFrequency返回每秒的计算次数
print(e4-e3)                                                         # 与上面等价

# opencv中的默认优化
"""许多OpenCV功能已使用SSE2，AVX等进行了优化。它还包含未优化的代码。因此，如果我们的系统支持这些功能，则应该利用它们
  （几乎所有现代处理器都支持它们）。默认在编译时启用。因此，如果已启用，OpenCV将运行优化的代码，否则将运行未优化的代码。
   您可以使用cv.useOptimized（）来检查是否启用/禁用它，并使用cv.setUseOptimized（）来启用/禁用它。"""
print(cv.useOptimized())
"""
Console:
img1 = cv.imread("opencv_exercise/meow.png")[100:600, 200:700, :]
%timeit res = cv.medianBlur(img1, 49)
39.9 ms ± 454 µs per loop (mean ± std. dev. of 7 runs, 10 loops each)
"""
cv.setUseOptimized(False)
print(cv.useOptimized())
"""
Console:
%timeit res = cv.medianBlur(img1, 49)
40.4 ms ± 655 µs per loop (mean ± std. dev. of 7 runs, 10 loops each)
"""

# 评估性能
"""IPython提供了一个神奇的命令计时器来执行此操作。它会多次运行代码以获得更准确的结果，适合于测量单行代码。"""
# 通常情况下opencv的函数比numpy的函数要快，除非numpy处理的是视图
"""
Console:
x = 5
%timeit y = x ** 2
481 ns ± 2.61 ns per loop (mean ± std. dev. of 7 runs, 1000000 loops each)
%timeit y = x * x                                                              ---->faster
102 ns ± 0.9 ns per loop (mean ± std. dev. of 7 runs, 10000000 loops each)
import numpy as np
z = np.uint8([5])
%timeit y = z * z                                                              ---->faster
704 ns ± 3.86 ns per loop (mean ± std. dev. of 7 runs, 1000000 loops each)
%timeit y = np.square(z)
719 ns ± 4.02 ns per loop (mean ± std. dev. of 7 runs, 1000000 loops each)
"""
# Python标量运算比Numpy标量运算快。因此，对于包含一两个元素的运算，Python标量比Numpy数组好。数组大小稍大时，Numpy会占优势。
"""
Console:
img1 = cv.imread("opencv_exercise/meow.png", 0)[100:600, 200:700]
%timeit z = cv.countNonZero(img1)                                              ---->faster
42.4 µs ± 2.38 µs per loop (mean ± std. dev. of 7 runs, 10000 loops each)
%timeit z = np.count_nonzero(img1)
719 µs ± 8.14 µs per loop (mean ± std. dev. of 7 runs, 1000 loops each)
"""

# 性能优化技术
"""
除非需要，尽量不要取copy数组的副本，尝试改用视图view，复制数组操作十分耗时
创建视图有两个方法：1.切片，2.使用ndarray.view()
第一个方法没有复制，改变索引内容也会改变原来数组的内容；
第二个方法会创建一个新的数组对象，改变新的对象不会影响原始数据。

to do:这里还设计到浅拷贝和深拷贝，需要去了解

to do: python优化技术 http://wiki.python.org/moin/PythonSpeed/PerformanceTips
to do: Scipy讲义-进阶Numpy http://scipy-lectures.github.io/advanced/advanced_numpy/index.html#advanced-numpy
to go: IPython中的时序和性能分析 http://pynash.org/2013/03/06/timing-and-profiling/

"""

