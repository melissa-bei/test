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

# # 直方图-----------------------------------------------------------------------------------------------------------------
# """cv.calcHist（），np.histogram（），绘制灰度直方图
# cv.calcHist > np.bincount > np.histogram
# """
# img = cv.imread("rock.png", 0)
#
# # 计算直方图
# hist = cv.calcHist([img],                                            # 单通道还是多通道图像都必须放在方括号内
#                    [0],                                              # 指定通道
#                    None,                                             # 指定区域mask
#                    [256],                                            # bins
#                    [0, 256])                                         # 范围
#
# hist1, bins1 = np.histogram(img.ravel(), 256, [0, 256])
# hist2 = np.bincount(img.ravel(), minlength=256)
#
# # 绘制直方图
# plt.hist(img.ravel(), 256, [0, 256]), plt.show()                     # 1.使用plt.hist
#
# img = cv.imread("rock.png")[:, :, ::-1]
# color = ("b", "g", "r")
# for i, col in enumerate(color):                                      # 2.使用cv.calcHist和plt.plot
#     histc = cv.calcHist([img], [i], None, [256], [0, 256])
#     plt.plot(histc, color=col)
#     plt.xlim([0, 256])
# plt.show()
#
# mask = np.zeros(img.shape[:2], np.uint8)                             # 3.使用opencv
# mask[100:300, 100:400] = 255
# masked_img = cv.bitwise_and(img, img, mask=mask)
#
# hist_full = cv.calcHist([img], [0], None, [256], [0, 256])                # 统计全局直方图
# hist_mask = cv.calcHist([img], [0], mask, [256], [0, 256])                # 统计掩码区域直方图
# plt.subplot(221), plt.imshow(img, "gray")
# plt.subplot(222), plt.imshow(mask, "gray")
# plt.subplot(223), plt.imshow(masked_img, "gray")
# plt.subplot(224), plt.plot(hist_full), plt.plot(hist_mask)
# plt.xlim([0, 256])
# plt.show()
#
#
# # 直方图均衡--------------------------------------------------------------------------------------------------------------
# img = cv.imread("foggy.png", 0)
#
# hist, bins = np.histogram(img.flatten(), 256, [0, 256])
#
# cdf = hist.cumsum()                                                  # 原图累积分布函数
# cdf_normalization = cdf * float(hist.max()) / cdf.max()              # 归一化到0~1
#
# plt.plot(cdf_normalization, color="b")
# plt.hist(img.flatten(), 256, [0, 256], color="r")
# plt.xlim([0, 256])
# plt.legend(("cdf", "histogram"), loc="upper left")
# plt.show()
#
# cdf_m = np.ma.masked_equal(cdf, 0)                                   # 屏蔽cdf中的0
# cdf_m = (cdf_m - cdf_m.min()) * 255 / (cdf_m.max() - cdf_m.min())    # 归一化到0~1
# cdf = np.ma.filled(cdf_m, 0).astype("uint8")                         # 填补屏蔽的0
# img2 = cdf[img]                                                      # 根据新的cdf生成直方图均衡后的图像
# plt.subplot(121), plt.imshow(img, cmap="gray"), plt.title("Original"), plt.xticks([]), plt.yticks([])
# plt.subplot(122), plt.imshow(img2, cmap="gray"), plt.title("直方图均衡化"), plt.xticks([]), plt.yticks([])
# plt.show()
#
# equ = cv.equalizeHist(img)                                           # opencv中的直方图均衡
# plt.imshow(np.hstack([img, equ]), cmap="gray"), plt.xticks([]), plt.yticks([])
# plt.show()
#
# img = cv.imread("sculpture.png", 0)
# equ = cv.equalizeHist(img)
# CLAHE = cv.createCLAHE(                                              # 对比度受限的自适应直方图均衡
#     clipLimit=2.0,                                                   # 截断比例
#     tileGridSize=(8, 8))                                             # 窗口大小
# clahe = CLAHE.apply(img)
# plt.subplot(211), plt.imshow(np.hstack([img, equ]), cmap="gray"), plt.xticks([]), plt.yticks([])
# plt.subplot(212), plt.imshow(np.hstack([img, clahe]), cmap="gray"), plt.xticks([]), plt.yticks([])
# plt.show()
#
#
# # 绘制二维直方图，通常用于查找颜色直方图，包含色相和饱和度
# img = cv.imread("meow2.png")
# hsv = cv.cvtColor(img, cv.COLOR_BGR2HSV)
#
# hist = cv.calcHist(img,
#                    [0, 1],                                           # h和s通道
#                    None,
#                    [180, 256],
#                    [0, 180, 0, 256])                                 # h的范围是[0, 180], s的范围是[0, 256]
# hist1, xbins1, ybins1 = np.histogram2d(hsv[0, :, :].ravel(),         # x轴统计的对象
#                                        hsv[1, :, :].ravel(),         # y轴统计的对象
#                                        [180, 256],
#                                        [[0, 180], [0, 256]])         # [x的范围, y的范围]
# plt.imshow(hist, interpolation="nearest")
# plt.show()
#
#
# # 直方图反投影????????????????????????????????????????????????TODO:没有明白具体原理
# target = cv.imread("rock.png")
# hsvt = cv.cvtColor(target, cv.COLOR_BGR2HSV)                              # 目标图像hsv
#
# roi = target[:100, :300, :]
# hsv = cv.cvtColor(roi, cv.COLOR_BGR2HSV)                                  # roi hsv
#
# roihist = cv.calcHist([hsv], [0, 1], None, [180, 256], [0, 180, 0, 256])  # roi hist
#
# # # numpy方法
# # targethist = cv.calcHist([hsvt], [0, 1], None, [180, 256], [0, 180, 0, 256])
# # R = roihist / targethist
# # h, s, v = cv.split(hsv)
# # dst = R[h.ravel(), s.ravel()]
# # dst = np.minimum(dst, 1)
# # dst = dst.reshape(hsvt.shape[:2])
#
# # opencv方法，返回与目标直方图相同的概率图像
# cv.normalize(roihist, roihist, 0, 255, cv.NORM_MINMAX)                    # 归一化roi hist
# dst = cv.calcBackProject([hsvt],
#                          [0, 1],
#                          roihist,                                         # 传入的直方图需进行标准化
#                          [0, 180, 0, 256],
#                          1)
#
# disc = cv.getStructuringElement(cv.MORPH_ELLIPSE, (5, 5))                 # 获取核
# cv.filter2D(dst, -1, disc, dst)
#
# ret, thresh = cv.threshold(dst, 127, 255, 0)                              # 期望图像的阈值范围
# thresh = cv.merge((thresh, thresh, thresh))
# res = cv.bitwise_and(target, thresh)
#
# cv.imshow("figure", np.vstack((target, thresh, res)))
# cv.waitKey(0)
# cv.destroyAllWindows()


# # 图像转换----------------------------------------------------------------------------------------------------------------
# """cv.dft(), cv.idft()傅里叶变换和傅里叶逆变换"""
# img = cv.imread("messi.png", 0)
# fft = np.fft.fft2(img)                                                 # numpy中傅里叶变换
# # np.fft.fft2默认返回结果零频率分量是位于左上角要使其居中则要偏移一半可以用np.fft.fftshift()来实现
# fftshift = np.fft.fftshift(fft)
# magnitude_spectrum = 20 * np.log(np.abs(fftshift))                     # 中间最亮，说明低频多
#
# plt.subplot(121), plt.imshow(img, cmap="gray")
# plt.title("Input Image"), plt.xticks([]), plt.yticks([])
# plt.subplot(122), plt.imshow(magnitude_spectrum, cmap="gray")
# plt.title("Magnitude Spectrum"), plt.xticks([]), plt.yticks([])
# plt.show()
#
#
# rows, cols = img.shape
# crow, ccol = rows // 2, cols // 2
# fftshift[crow - 30:crow + 31, ccol - 30:ccol + 31] = 0               # 使用一个60*60的矩形窗口过滤低频
# fft_ishift = np.fft.ifftshift(fftshift)                              # 使用np.fft.ifftshift()把频谱图平移回去
# img_back = np.fft.ifft2(fft_ishift)                                  # 使用np.ifft2()找到逆FFT
# img_back = np.real(img_back)                                         # 取复数的实部，图像偏灰
# img_back = cv.magnitude(np.real(img_back), np.imag(img_back))        # 取复数的大小，真实原图的高频
#
#
# plt.subplot(121), plt.imshow(img, cmap="gray")
# plt.title("Input Image"), plt.xticks([]), plt.yticks([])
# plt.subplot(122), plt.imshow(img_back, cmap="gray")                  # 高通滤波是是边缘检测操作
# plt.title("Image after HPF"), plt.xticks([]), plt.yticks([])
# plt.show()
#
# """但可以看出有一些振铃效果，这是应为使用矩形窗口遮盖引起的，矩形被转换为了正弦波形，所以一般不采用矩形窗口滤波，而是采用高斯窗口。
# OpenCV为此提供了功能cv.dft（）和cv.idft（）。返回与以前相同的结果，但是有两个通道。第一个通道将具有结果的实部，第二个通道将具有结果的虚部。
# 输入的图像应首先转换为np.float32。
# cv.dft（）和cv.idft（）的速度比numpy快
# """
# dft = cv.dft(np.float32(img), flags=cv.DFT_COMPLEX_OUTPUT)
# dft_shift = np.fft.fftshift(dft)
#
# magnitude_spectrum = 20 * np.log(cv.magnitude(dft_shift[:, :, 0],    # 与np.fft.fftshift(fft)效果相同
#                                               dft_shift[:, :, 1]))
# # 还可以使用cv.cartToPolar（）一次返回大小和相位
#
# plt.subplot(121), plt.imshow(img, cmap="gray")
# plt.title("Input Image"), plt.xticks([]), plt.yticks([])
# plt.subplot(122), plt.imshow(magnitude_spectrum, cmap="gray")
# plt.title("Magnitude Spectrum"), plt.xticks([]), plt.yticks([])
# plt.show()
#
#
# rows, cols = img.shape
# crow, ccol = rows // 2, cols // 2
#
# mask = np.zeros((rows, cols, 2))
# mask[crow - 30:crow + 31, ccol - 30:ccol + 31] = 1                   # 生成一个60*60的矩形窗口过滤高频
#
# fftshift = dft_shift * mask
# fft_ishift = np.fft.ifftshift(fftshift)
# img_back = cv.idft(fft_ishift)                                       # 使用cv.idft()找到逆FFT
# img_back = cv.magnitude(img_back[:, :, 0], img_back[:, :, 1])
#
# plt.subplot(121), plt.imshow(img, cmap="gray")
# plt.title("Input Image"), plt.xticks([]), plt.yticks([])
# plt.subplot(122), plt.imshow(img_back, cmap="gray")
# plt.title("Image after LPF"), plt.xticks([]), plt.yticks([])
# plt.show()
#
#
# """DFT性能优化，矩阵大小为2的幂时是最快的，大小为2、3、5乘积的数组也得到了有效处理，为了提高代码性能，再找到DFT之前通过补零将数组修改为最佳大小，
# 在opencv中必须手动补零，在numpy中可以指定FFT计算的新的尺寸来自动补零，opencv提供了getOptimalDFTSize()，来配合cv.dft()和np.fft.fft2()"""
# """在Console中检测性能
# img = cv.imread('messi.png',0)
# rows,cols = img.shape
# print("{} {}".format(rows,cols))
# 353 500
# nrows = cv.getOptimalDFTSize(rows)
# ncols = cv.getOptimalDFTSize(cols)
# print("{} {}".format(nrows, ncols))
# 360 500
# nimg = np.zeros((nrows, ncols))
#   ...: nimg[:rows,:cols] = img
# right = ncols - cols
#    ...: bottom = nrows - rows
#    ...: bordertype = cv.BORDER_CONSTANT #just to avoid line breakup in PDF file
#    ...: nimg = cv.copyMakeBorder(img,0,bottom,0,right,bordertype, value = 0)
# %timeit fft1 = np.fft.fft2(img)
# 17.6 ms ± 354 µs per loop (mean ± std. dev. of 7 runs, 100 loops each)
# %timeit fft2 = np.fft.fft2(img,[nrows,ncols])
# 9.71 ms ± 125 µs per loop (mean ± std. dev. of 7 runs, 100 loops each)
# %timeit dft1= cv.dft(np.float32(img),flags=cv.DFT_COMPLEX_OUTPUT)
# 3.3 ms ± 35.5 µs per loop (mean ± std. dev. of 7 runs, 100 loops each)
# %timeit dft2= cv.dft(np.float32(nimg),flags=cv.DFT_COMPLEX_OUTPUT)
# 2.1 ms ± 17.2 µs per loop (mean ± std. dev. of 7 runs, 100 loops each)
# """

# 分析为什么拉普拉斯是高通滤波器？对拉普拉斯算子进行傅里叶变换
mean_filter = np.ones((3, 3))                                        # 简单的中值滤波器，不带缩放参数

x = cv.getGaussianKernel(5, 10)                                      # 高斯算子
gaussian = x * x.T

scharr_x = np.array([[-3, 0, 3],                                     # scharr算子 x方向
                     [-10, 0, 10],
                     [-3, 0, 3]])

sobel_x = np.array([[-1, 0, 1],                                      # sobel算子 x方向
                    [-2, 0, 2],
                    [-1, 0, 1]])

sobel_y = np.array([[-1, -2, -1],                                    # sobel算子 y方向
                    [0, 0, 0],
                    [1, 2, 1]])

laplacian = np.array([[0, 1, 0],                                     # 拉普拉斯算子
                      [1, -4, 1],
                      [0, 1, 0]])

filters = [mean_filter, gaussian, laplacian, sobel_x, sobel_y, scharr_x]
filter_name = ["mean_filter", "gaussian", "laplacian", "sobel_x", "sobel_y", "scharr_x"]
fft_filters = [np.fft.fft2(x) for x in filters]
fft_shift = [np.fft.fftshift(y) for y in fft_filters]
magnitude_spectrum = [np.log(np.abs(z) + 1) for z in fft_shift]

for i in range(6):
    plt.subplot(2, 3, i + 1)
    plt.imshow(magnitude_spectrum[i], cmap="gray")
    plt.title(filter_name[i])
    plt.xticks([]), plt.yticks([])
plt.show()

