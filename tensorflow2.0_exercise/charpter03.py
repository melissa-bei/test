#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (c) 2020 libei. All right reserved.
"""=================================================
@IDE    ：PyCharm
@Author ：Li Bei
@Email  : libei@cadg.cn
@Date   ：2020/9/15 17:13
================================================="""

import numpy as np
import matplotlib.pyplot as plt
import tensorflow.compat.v1 as tf  # 将tensorFlow 1.x版本中的静态图接口，替换成将tensorFlow.compat.v1模块下的对应接口
tf.disable_v2_behavior()  # 关闭动态图模式


# ----------------------------------------------------------------------------------------------------------------------
"""线性回归"""
# # 生成数据
# train_x = np.linspace(-1, 1, 100)
# train_y = 2 * train_x + np.random.randn(*train_x.shape) * 0.3
# # 创建模型
# x = tf.placeholder('float')
# y_ = tf.placeholder('float')
# # 模型参数
# w = tf.Variable(tf.random_normal([1]), name='weight')
# b = tf.Variable(tf.zeros([1]), name='bias')
# # 前向结构
# y = tf.multiply(w, x) + b
# # 反向优化
# cost = tf.reduce_mean(tf.square(y - y_))
# lr = 0.01
# optimizer = tf.train.GradientDescentOptimizer(lr).minimize(cost)
# # 初始化
# init = tf.global_variables_initializer()
# # 定义参数
# train_epochs = 20
# display_step = 2
# # 启动session
# with tf.Session() as sess:
#     sess.run(init)
#     plot_data = {'batch size': [], 'loss': []}
#     for epoch in range(train_epochs):
#         for (in_x, in_y) in zip(train_x, train_y):
#             sess.run(optimizer, feed_dict={x: in_x, y_: in_y})
#         # 显示详细信息
#         if epoch % display_step == display_step - 1:
#             loss = sess.run(cost, feed_dict={x: train_x, y_: train_y})
#             print('Epoch:', epoch + 1, 'loss:', loss, 'w=', sess.run(w), 'b=', sess.run(b))
#             if not (loss == 'NA'):
#                 plot_data['batch size'].append(epoch)
#                 plot_data['loss'].append(loss)
#     print('loss:', sess.run(cost, feed_dict={x: train_x, y_: train_y}), 'w=', sess.run(w), 'b=', sess.run(b))
#     out_y = sess.run(y, feed_dict={x: train_x})
# # 显示模拟数据点
# plt.plot(train_x, train_y, 'ro', label='original data')
# # 显示拟合直线
# plt.plot(train_x, out_y, 'b-', label='fitted line')
# plt.legend()
# plt.show()
# # Training loss
# plt.plot(plot_data['batch size'], plot_data['loss'], 'g--', label='training loss')
# plt.xlabel('Minibatch number')
# plt.ylabel('Loss')
# plt.title('Minibatch number run vs. Training loss')
# plt.show()

# ----------------------------------------------------------------------------------------------------------------------
# 生成数据
train_x = np.linspace(-1, 1, 100)
train_y = 2 * train_x + np.random.randn(*train_x.shape) * 0.3
input_dict = {'x': tf.placeholder('float'),
              'y': tf.placeholder('float')}
# 模型参数通过字典定义
para_dict = {'w': tf.Variable(tf.random_normal([1]), name='weight'),
             'b': tf.Variable(tf.zeros([1]), name='bias')}  # 学习参数
# 前向结构
y = tf.multiply(para_dict['w'], input_dict['x']) + para_dict['b']
tf.summary.histogram('predict y', y)                                                    # 记录预测结果到tf.summary，以直方图显示
# 反向优化
cost = tf.reduce_mean(tf.square(y - input_dict['y']))
tf.summary.scalar('loss function', cost)                                              # 记录损失到tf.summary，以标量形式显示
lr = 0.01
optimizer = tf.train.GradientDescentOptimizer(lr).minimize(cost)
# 初始化
init = tf.global_variables_initializer()
# 定义参数
train_epochs = 20
display_step = 2
# 启动session
with tf.Session() as sess:
    sess.run(init)
    merge_summary_op = tf.summary.merge_all()                                         # 合并所有summary
    summary_writer = tf.summary.FileWriter('./log/mnist_with_summaries', sess.graph)  # 创建summary_writer，用于写入文件
    plot_data = {'batch size': [], 'loss': []}
    for epoch in range(train_epochs):
        for (in_x, in_y) in zip(train_x, train_y):
            sess.run(optimizer, feed_dict={input_dict['x']: in_x, input_dict['y']: in_y})

        summary_str = sess.run(merge_summary_op, feed_dict={input_dict['x']: train_x, input_dict['y']: train_y})  # 生成summary
        summary_writer.add_summary(summary_str, epoch)                                # 将summary写入文件
        # 显示详细信息
        if epoch % display_step == display_step - 1:
            loss = sess.run(cost, feed_dict={input_dict['x']: train_x, input_dict['y']: train_y})
            print('Epoch:', epoch + 1, 'loss:', loss, 'w=', sess.run(para_dict['w']), 'b=', sess.run(para_dict['b']))
            if not (loss == 'NA'):
                plot_data['batch size'].append(epoch)
                plot_data['loss'].append(loss)
    print('loss:', cost.eval(feed_dict={input_dict['x']: train_x, input_dict['y']: train_y}),
          'w=', para_dict['w'].eval(), 'b=', para_dict['b'].eval())
    out_y = sess.run(y, feed_dict={input_dict['x']: train_x})
# 显示模拟数据点
plt.plot(train_x, train_y, 'ro', label='original data')
# 显示拟合直线
plt.plot(train_x, out_y, 'b-', label='fitted line')
plt.legend()
plt.show()
# Training loss
plt.plot(plot_data['batch size'], plot_data['loss'], 'g--', label='training loss')
plt.xlabel('Minibatch number')
plt.ylabel('Loss')
plt.title('Minibatch number run vs. Training loss')
plt.show()
