#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (c) 2020 libei. All right reserved.
"""=================================================
@IDE    ：PyCharm
@Author ：Li Bei
@Email  : libei@cadg.cn
@Date   ：2020/9/10 14:12
================================================="""
import pdfplumber
from pdf2image import convert_from_path
import numpy as np
import copy

import cv2 as cv2
from pylsd.bindings.lsd_ctypes import *


def hough_line_detection(image, is_show=False):
    """经典霍夫变换，不可控因素太多，pass"""
    out_image = copy.copy(image)
    gray = cv2.cvtColor(out_image, cv2.COLOR_RGB2GRAY)
    gray_blur = cv2.GaussianBlur(gray, (3, 3), 0)
    # apertureSize做Canny时梯度窗口的大小
    edges = cv2.Canny(gray_blur, 50, 150, apertureSize=3)
    # 返回的是r和theta
    lines = cv2.HoughLines(edges, 1, np.pi/2, 300)  # 最后一个参数根据经验取值
    for line in lines:
        rho, theta = line[0]
        a = np.cos(theta)
        b = np.sin(theta)
        x0 = a*rho
        y0 = b*rho
        # 乘以1000，是根据源码乘的，通过x1、x2、y1、y2画一条直线
        x1 = int(x0+10000*(-b))
        y1 = int(y0+10000*a)
        x2 = int(x0-10000*(-b))
        y2 = int(y0-10000*a)
        cv2.line(out_image, (x1, y1), (x2, y2), (0, 0, 255), 2)  # 2是所画直线长度的宽
    if is_show:
        cv2.imshow('image_lines', out_image)
        cv2.waitKey(0)
        cv2.destroyAllWindows()

    return out_image


def hough_line_detection_possible(image, is_show=False):
    """渐进概率式霍夫变换"""
    out_image = copy.copy(image)
    gray = cv2.cvtColor(out_image, cv2.COLOR_BGR2GRAY)
    gray_blur = cv2.GaussianBlur(gray, (3, 3), 0)
    # 做Canny时梯度窗口的大小
    edges = cv2.Canny(gray_blur, 50, 150, apertureSize=3)
    # minLineLength是线段最小长度，maxLineGap是线段最大间隔，该间隔之内的认为是一条直线
    lines = cv2.HoughLinesP(edges, 1, np.pi/2, 100, minLineLength=50, maxLineGap=10)
    for line in lines:
        # （x1,y1）,(x2,y2)是线段的两点，只画出了一个个线段
        x1, y1, x2, y2 = line[0]
        cv2.line(out_image, (x1, y1), (x2, y2), (0, 0, 255), 2)
    if is_show:
        cv2.imshow('image_lines', out_image)
        cv2.waitKey(0)
        cv2.destroyAllWindows()

    return out_image


def lsd(src):
    rows, cols = src.shape
    src = src.reshape(1, rows * cols).tolist()[0]

    temp = 'L'

    lens = len(src)
    src = (ctypes.c_double * lens)(*src)
    lsdlib.lsdGet(src, ctypes.c_int(rows), ctypes.c_int(cols), temp)

    fp = open(temp, 'r')
    cnt = fp.read().strip().split(' ')
    fp.close()
    os.remove(temp)

    count = int(cnt[0])
    dim = int(cnt[1])
    lines = np.array([float(each) for each in cnt[2:]])
    lines = lines.reshape(count, dim)

    return lines


def lsd_line_detection(image, is_show=False):
    """lsd--a Line Segment Detector"""
    out_image = copy.copy(image)
    gray = cv2.cvtColor(out_image, cv2.COLOR_RGB2GRAY)
    dlines = lsd(gray)
    dlines_int = []
    # 在图像上显示检测到的所有线条
    for dline in dlines:
        x0 = int(round(dline[0]))
        y0 = int(round(dline[1]))
        x1 = int(round(dline[2]))
        y1 = int(round(dline[3]))
        width = int(round(dline[4]))
        dlines_int.append([x0, y0, x1, y1, width])
        if (x0 == x1 and abs(y0-y1) > 10) or (y0 == y1 and abs(x0-x1) > 10):
            cv2.line(out_image, (x0, y0), (x1, y1), (0, 0, 255), width)
    if is_show:
        cv2.imshow('image_lines', out_image)
        cv2.waitKey(0)
        cv2.destroyAllWindows()

    return out_image


if __name__ == '__main__':
    path = r"C:/Users/lib/Desktop/resource/pdf/txt_pdf"
    for file in os.listdir(path):
        file_path = os.path.join(path, file)
        from wand.image import Image
        image_pdf = Image(filename=file_path, resolution=72)
        image_jpeg = image_pdf.convert('jpg')
        image_jpg = Image(image=image_jpeg).make_blob('jpeg')  # 得到二进制图像文件
        from PIL import Image as PILImage
        from io import BytesIO
        img = PILImage.open(BytesIO(image_jpg))
        img.show()
        with pdfplumber.open(file_path) as pdf:
            page = pdf.pages[0]
            pilimage = page.to_image(resolution=72).original.resize((page.width, page.height))
            cv2image = cv2.cvtColor(np.asarray(pilimage), cv2.COLOR_BGR2RGB)

            # result1 = hough_line_detection(cv2image, is_show=True)
            # result2 = hough_line_detection_possible(cv2image, is_show=True)
            result3 = lsd_line_detection(cv2image, is_show=True)
            # cv2.imwrite('./tmp_result/hough_line.jpg', result1)
            # cv2.imwrite('./tmp_result/possible_hough_line.jpg', result2)
            cv2.imwrite('./tmp_result/lsd_line.jpg', result3)

    # #
    # DIR = r"C:/Users/lib/Desktop/resource/pdf/pic_pdf_all"  # 不能使用中文路径
    # for pdf_file in os.listdir(DIR):
    #     file_path = os.path.join(DIR, pdf_file)
    #     try:
    #         with pdfplumber.open(file_path) as pdf:
    #             print('procrssing……')
    #             page = pdf.pages[0]
    #             pilimage = page.to_image(resolution=96).original.resize((page.width, page.height))
    #             cv2image = cv2.cvtColor(np.asarray(pilimage), cv2.COLOR_BGR2RGB)
    #
    #             result1 = hough_line_detection(cv2image, is_show=False)
    #             result2 = hough_line_detection_possible(cv2image, is_show=False)
    #             result3 = lsd_line_detection(cv2image, is_show=False)
    #             cv2.imwrite('./result/{}_hough_line.jpg'.format(pdf_file[:-4]), result1)
    #             cv2.imwrite('./result/{}_possible_hough_line.jpg'.format(pdf_file[:-4]), result2)
    #             cv2.imwrite('./result/{}_lsd_line.jpg'.format(pdf_file[:-4]), result3)
    #     except:
    #         continue
