#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (c) 2020 libei. All right reserved.
"""=================================================
@IDE    ：PyCharm
@Author ：Li Bei
@Email  : libei@cadg.cn
@Date   ：2020/9/16 14:21
================================================="""
import pylab
import numpy as np
import tensorflow.compat.v1 as tf
from tensorflow.keras.datasets import mnist
tf.disable_v2_behavior()                                             # 关闭动态图模式


# 5.1.2 下载并安装MNIST数据集
(x, y), (test_x, test_y) = mnist.load_data("mnist.npz")              # 导入MNIST数据接口
train_x, validation_x = x[:55000, :, :], x[55000:, :, :]             # 拆分训练集和验证集
train_y, validation_y = y[:55000], y[55000:]

# print("输入数据：{}".format(train_x))
# print("输入数据的shape：{}".format(train_y.shape))
#
# im = train_x[0]
# im = im.reshape(-1, 28)
# pylab.imshow(im)
# pylab.show()


# reshape和one_hot编码
train_x = train_x.reshape(-1, 28 * 28)
train_y = np.eye(10)[train_y]
validation_x = validation_x.reshape(-1, 28 * 28)
validation_y = np.eye(10)[validation_y]
test_x = test_x.reshape(-1, 28 * 28)
test_y = np.eye(10)[test_y]

# 5.3 构建模型
tf.reset_default_graph()

X = tf.placeholder(tf.float32, [None, 28*28])
Y = tf.placeholder(tf.float32, [None, 10])

W = tf.Variable(tf.random_normal([28 * 28, 10]))
b = tf.Variable(tf.zeros([10]))

pred = tf.nn.softmax(tf.matmul(X, W) + b)

cost = tf.reduce_mean(-tf.reduce_sum(Y * tf.log(pred + 0.1), reduction_indices=[1]))
acc = tf.reduce_mean(tf.cast(tf.equal(tf.argmax(pred, 1), tf.argmax(Y, 1)), tf.float32))

lr = 0.01
optimizer = tf.train.GradientDescentOptimizer(lr).minimize(cost)

# 5.4 训练模型并输出中间状态参数
training_epoches = 300
batch_size = 100
display_step = 2

saver = tf.train.Saver()
model_path = "./log/521model.ckpt"

# with tf.Session() as sess:
#     sess.run(tf.global_variables_initializer())
#
#     for epoch in range(training_epoches):                            # 一个epoch遍历一次所有样本
#         avg_cost = 0
#         total_batch = int(train_x.shape[0]/batch_size)               # 计算一个epoch共有几个batch
#
#         for i in range(training_epoches):                            # 遍历所有batch
#             batch_xs = train_x[i * batch_size: (i + 1) * batch_size, :]
#             batch_ys = train_y[i * batch_size: (i + 1) * batch_size, :]
#             _, c = sess.run([optimizer, cost], feed_dict={X: batch_xs, Y: batch_ys})
#
#             avg_cost += c / total_batch                              # 到底是batch_size还是total_batch
#
#         if (epoch + 1) % display_step == 0:
#             print("Epoch:{}, cost:{}".format(epoch + 1, avg_cost))
#             print("acc:{}".format(sess.run(acc, feed_dict={X: validation_x, Y: validation_y})))
#
#     print("Finish training")
#     save_path = saver.save(sess, model_path)
#     print("Model saved in file:{}".format(model_path))

with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    saver.restore(sess, model_path)

    print("acc:{}".format(sess.run(acc, feed_dict={X: test_x, Y: test_y})))
