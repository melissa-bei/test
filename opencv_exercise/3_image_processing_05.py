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
"""cv.matchTemplate（），cv.minMaxLoc（）
模板匹配是一种用于在较大图像中搜索和查找模板图像位置的方法。为此，OpenCV带有一个函数cv.matchTemplate（）。
它只是将模板图​​像滑动到输入图像上（就像在2D卷积中一样），然后在模板图像下比较模板和输入图像的补丁。
OpenCV中实现了几种比较方法。它返回一个灰度图像，其中每个像素表示该像素的邻域与模板匹配多少。

如果输入图像的尺寸为（WxH），模板图像的尺寸为（wxh），则输出图像的尺寸将为（W-w + 1，H-h + 1）。
获得结果后，可以使用cv.minMaxLoc（）函数查找最大/最小值在哪里。将其作为矩形的左上角，并以（w，h）作为矩形的宽度和高度。该矩形是您模板的区域。

如果使用cv.TM_SQDIFF作为比较方法，则最小值表示最佳匹配。
"""
img = cv.imread("images/meow.jpg", 0)
img2 = img.copy()
template = cv.imread("images/meow_face.png", 0)
w, h = template.shape[::-1]

methods = [i for i in dir(cv) if "TM_" in i]                           # 获取cv库中模板匹配的方法
"""['TM_CCOEFF', 'TM_CCOEFF_NORMED', 'TM_CCORR', 'TM_CCORR_NORMED', 'TM_SQDIFF', 'TM_SQDIFF_NORMED']"""

for meth in methods:
    img = img2.copy()
    method = eval(meth)

    res = cv.matchTemplate(img, template, method)                    # 模板匹配
    min_val, max_val, min_loc, max_loc = cv.minMaxLoc(res)

    if meth in [cv.TM_SQDIFF, cv.TM_SQDIFF_NORMED]:
        top_left = min_loc
    else:
        top_left = max_loc
    bottom_right = (top_left[0] + w, top_left[1] + h)

    cv.rectangle(img, top_left, bottom_right, 255, 2)

    plt.subplot(121), plt.imshow(res, cmap="gray")
    plt.title("Matching Result"), plt.xticks([]), plt.yticks([])
    plt.subplot(122), plt.imshow(img, cmap="gray")
    plt.title("Detected Point"), plt.xticks([]), plt.yticks([])
    plt.show()





