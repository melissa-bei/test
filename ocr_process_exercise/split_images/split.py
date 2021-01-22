#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (c) 2020 gongzihui. All rights reserved.

"""
  Author:  gongzihui
  Email:   gongzihui@cadg.cn
  Created: 2020/7/1
"""

import os
import cv2 as cv
import numpy as np
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from sklearn.metrics import silhouette_score
import scipy.signal as signal


def norn_maxmin(data):
	"""(效果不明显，没有使用)最大值最小值归一化，把数值缩放到0-1之间，为了防止kmeans计算数值太大"""
	min_num = np.min(data)
	max_num = np.max(data)
	result = data - min_num
	result = result / (max_num - min_num)
	result = np.around(result, decimals=5)
	return result, min_num, max_num



def cal_split_points(train_x):
	"""
	利用kmeans算法计算列与列之间的切割点
	根据轮廓系数自动选择聚类数量
	"""
	result = {}
	Scores = {}
	for i in range(4, 7+1):
		kmeans = KMeans(n_clusters=i, random_state=10).fit(train_x)
		centers = kmeans.cluster_centers_
		centers_index = np.ceil(centers).astype(np.int).tolist()
		centers_index = sum(centers_index, [])
		centers_index.sort()
		result[i] = centers_index
		# print(f'质心为【{i}】时, 结果是{centers_index}')

		# 存放轮廓系数
		Scores[i] = silhouette_score(train_x, kmeans.labels_, metric='euclidean')
	# 选择最优的k值
	best_k = sorted(Scores.items(), key=lambda Scores:Scores[1], reverse=True)[0][0]

	return result[best_k]



def vertical_projection(img_binary_data, height=0, width=0, is_projection=True):
	"""图片垂直投影算法（把黑色的点堆积起来）
		1、按列统计
		2、建立一个和原图大小的图片，按列填充
	"""
	if is_projection:
		# 初始化一个跟图像宽一样长度的数组，用于记录每一列的黑点个数
		a = [0 for z in range(0, width)]
		for i in range(0, width):                   # 遍历每一列
			for j in range(0, height):              # 遍历每一行
				if img_binary_data[j, i] == 0:      # 判断该点是否为黑点，0代表是黑点
					a[i] += 1                       # 该列的计数器加1
					img_binary_data[j, i] = 255     # 记录完后将其变为白色，即等于255
		for i in range(0, width):                   # 遍历每一列
			for j in range(height - a[i], height):  # 从该列应该变黑的最顶部的开始向最底部设为黑点
				img_binary_data[j, i] = 0           # 设为黑点
	# 画图
	cv.imshow("img", img_binary_data)
	cv.waitKey(0)
	cv.destroyAllWindows()



def plot_image_weight_data(weight, result):
	"""对图片的列统计数据，画折线图"""
	# result = np.sort(result)
	plt.plot(range(0, weight), result)
	plt.show()



def split_pdf_image(image_path, threshold=0.99, split_num=6):
	"""切割一页PDF图片
		对于某一张pdf的大图（含有多列），把它切割成小列，存放在 `resource/image/temp` ，并以数字序列的命名。
	"""
	img = cv.imread(image_path, 0)                            # 灰度化读取图片
	# ret, img_binary = cv.threshold(img, 80, 255, cv.THRESH_BINARY)   # 二值化
	(h, w) = img.shape

	if h>w:
		img = np.rot90(img)     ## 如果图片角度不对，就进行旋转
		(h, w) = img.shape


	result = np.sum(img, axis=0) / h / 255
	result = np.around(result, decimals=5)
	for i in range(result.shape[0]):
		if result[i]<=0.5:
			result[i]=1     ## 黑线变白，去除图片中原来的长竖线
			img[:, i]=255   ## 原图去除黑线，黑点变白

	img[img<=180] = 0       ## 图片黑色加强，将原来不是那么黑的像素变黑，使黑色的文字更加清晰

	# plot_image_weight_data(w, result)                        ## 使用matplotlib画折线图
	# vertical_projection(img, h, w, is_projection=False)      ## 使用opencv的组件画图

	index_list = []
	for i in range(w):
		if result[i] >= threshold:
			index_list.append(i)

	train_x = np.array(index_list)
	train_x = train_x.reshape(-1, 1)
	centers_index = cal_split_points(train_x)    ## 计算切割点
	# print(centers_index)

	'''temp_path = 'C:/Users/lib/Desktop/split/'
	if os.path.exists(temp_path):
		for file in os.listdir(temp_path):
			p = os.path.join(temp_path, file)
			os.remove(p)
	else:
		os.makedirs(temp_path)'''

	_, image_name = os.path.split(image_path)
	image_name, _ = os.path.splitext(image_name)
	start = 0
	for index, point in enumerate(centers_index):
		cropped = img[:, start:point]
		jpg_path = f'C:/Users/lib/Desktop/split/{image_name}-0{index}.jpg'
		temp_h, temp_w = cropped.shape
		cropped = cv.resize(cropped, (int(temp_w*1), int(temp_h*1)))  ## 如果ocr的效果不好，可以调整图片的大小
		# cv.imshow('image', cropped)
		cv.imwrite(jpg_path, cropped)      ## 路径中如果有中文，不会输出图片
		start = point
	print(f"图片 `{image_path}` 切割完毕。")



if __name__ == '__main__':
	path = "C:/Users/lib/Desktop/images"
	for pdf in os.listdir(path):
		pdf_path = os.path.join(path, pdf)
		if pdf_path.endswith(".jpg"):
			split_pdf_image(pdf_path)









