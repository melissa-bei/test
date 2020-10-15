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


# # 改变色彩空间------------------------------------------------------------------------------------------------------------
# """cv.cvtColor()，cv.inRange()等。"""
# flags = [i for i in dir(cv) if i.startswith("COLOR_")]
# print(flags)
#
# # 对象跟踪
# cap = cv.VideoCapture("peacock.mp4")
#
# while True:
#     ret, frame = cap.read()
#     if not ret:
#         break
#     hsv = cv.cvtColor(frame, cv.COLOR_BGR2HSV)
#     lower_blue = np.array([110, 50, 50])
#     upper_blue = np.array([130, 255, 255])
#
#     mask = cv.inRange(hsv, lower_blue, upper_blue)                 # 找出HSV图像中在阈值范围中的模板
#     res = cv.bitwise_and(frame, frame, mask=mask)                    # 给frame加mask
#
#     cv.imshow("frame", frame)
#     cv.imshow("mask", mask)
#     cv.imshow("res", res)
#     k = cv.waitKey(int(cap.get(cv.CAP_PROP_FPS))) & 0xFF
#     if k == 27:
#         break
#
# cv.destroyAllWindows()
#
# # cvtColor也可以只输入颜色，而不输入图像
# b = np.uint8([[[255, 0, 0]]])
# g = np.uint8([[[0, 255, 0]]])
# r = np.uint8([[[0, 0, 255]]])
#
# hsv_b = cv.cvtColor(b, cv.COLOR_BGR2HSV)
# print(hsv_b)
# hsv_g = cv.cvtColor(g, cv.COLOR_BGR2GRAY)
# print(hsv_g)
# hsv_r = cv.cvtColor(r, cv.COLOR_BGR2HSV)
# print(hsv_r)
#
# # homework: Try to find a way to extract more than one colored objects,
# #           for eg, extract red, blue, green objects simultaneously.
# # 可以分别生成B、G、R的掩码，然后对三个掩码求并集
# img = cv.imread("opencv.jpg")
# hsv = cv.cvtColor(img, cv.COLOR_BGR2HSV)
#
# mask_b = cv.bitwise_or(cv.inRange(hsv, np.array([170, 50, 50]), np.array([180, 255, 255])),
#                        cv.inRange(hsv, np.array([0, 50, 50]), np.array([10, 255, 255])))
# mask_g = cv.inRange(hsv, np.array([110, 50, 50]), np.array([130, 255, 255]))
# mask_r = cv.inRange(hsv, np.array([50, 50, 50]), np.array([70, 255, 255]))
#
# mask = np.array(cv.bitwise_or(cv.bitwise_or(mask_b, mask_g), mask_r))
# res = cv.bitwise_and(img, img, mask=mask)                            # 必须写成mask=mask
# res_b = cv.bitwise_and(img, img, mask=mask_b)
# res_g = cv.bitwise_and(img, img, mask=mask_g)
# res_r = cv.bitwise_and(img, img, mask=mask_r)
#
# cv.imshow("original image", img)
# cv.imshow("mask", mask)
# cv.imshow("res", res)
# cv.imshow("res_blue", res_b)
# cv.imshow("res_green", res_g)
# cv.imshow("res_red", res_r)
# cv.waitKey(0)
# cv.destroyAllWindows()


# 图像的几何变换-----------------------------------------------------------------------------------------------------------
"""cv.getPerspectiveTransform()
opencv提供了两个转换功能，cv.warpAffine和cv.warpPerspective
cv.warpAffine：       仿射变换，采用2x3的转换矩阵
cv.warpPerspective：  透视变换，采用3x3的转换矩阵
"""
# Scaling，缩放
img = cv.imread("opencv.jpg")

resize1 = cv.resize(img,
                    None,
                    fx=2,
                    fy=2,
                    interpolation=cv.INTER_CUBIC)
# 或者
height, width = img.shape[:2]                                        # (高，宽，通道数)
resize2 = cv.resize(img,
                    (2 * width, 2 * height),                         # (宽， 高)
                    interpolation=cv.INTER_CUBIC)
# Translation，平移
rows, cols = img.shape[:2]
M = np.float32([[1, 0, 100], [0, 1, 50]])                            # 转换矩阵[[1, 0, tx], [0, 1, ty]]
translation = cv.warpAffine(img,
                            M,                                       # 平移矩阵 x=M11*x+M12*y+M13, y=M21*x+M22*y+M23
                            (cols, rows))                            # (宽，高)

# Rotation，旋转，opencv加入了可设置旋转中心
"""
转换矩阵[[cos x, -sin x],
        [sin x, cos x]]
---->
[[a,  b, (1 - a) * center * x - b * center * y],
 [-b, a, b * center * x + (1 + a) * center * y]]
其中，a = scale * cos x, 
     b = scale * sin x
     
opencv提供了cv.getRotationMatrix2D函数来找到该转换矩阵
"""
M = cv.getRotationMatrix2D(((cols-1)/2.0, (rows-1)/2.0),             # center
                           90,                                       # angle
                           1)                                        # scale
rotation = cv.warpAffine(img, M, (cols, rows))

# Affine Transformation仿射变换
"""在仿射变换中，原始图像中的所有平行线在输出图像中仍将平行"""
grid = cv.imread("grid.png")
rows, cols = grid.shape[:2]

pts1 = np.float32([[50, 50], [200, 50], [50, 200]])                  # 变换前的点
pts2 = np.float32([[10, 100], [200, 50], [100, 250]])                # 变换后的点

M = cv.getAffineTransform(pts1, pts2)                                # 由图像中的三个点确定转换矩阵

affine = cv.warpAffine(grid, M, (cols, rows))
for _, pt in enumerate(pts1):
    cv.circle(grid, (pt[0], pt[1]), 3, [0, 0, 255], -1)
for _, pt in enumerate(pts2):
    cv.circle(affine, (pt[0], pt[1]), 3, [255, 0, 0], -1)


# Perspective Transformation，透视变换
"""
透视变换需要3x3的变换矩阵，变换后直线仍是直线
"""
chessboard = cv.imread("chessboard.jpg")
rows, cols = chessboard.shape[:2]

pts1 = np.float32([[110, 92], [405, 75], [131, 285], [413, 270]])    # 变换前的点
pts2 = np.float32([[0, 0], [cols, 0], [0, rows], [cols, rows]])      # 变换后的点

M = cv.getPerspectiveTransform(pts1, pts2)                           # 由图像中的四个点确定转换矩阵

perspective = cv.warpPerspective(chessboard, M, (cols, rows))

for _, pt in enumerate(pts1):
    cv.circle(chessboard, (pt[0], pt[1]), 3, [0, 0, 255], -1)
for _, pt in enumerate(pts2):
    cv.circle(perspective, (pt[0], pt[1]), 3, [255, 0, 0], -1)

cv.imshow("original image", img)
cv.imshow("resize1", resize1)
cv.imshow("resize2", resize2)
cv.imshow("translation", translation)
cv.imshow("rotation", rotation)
cv.imshow("affine", np.hstack((grid, affine)))                         # np.vstack水平方向拼接矩阵
cv.imshow("perspective", np.hstack((chessboard, perspective)))         # np.vstack水平方向拼接矩阵
cv.waitKey(0)
cv.destroyAllWindows()
