#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (c) 2020 libei. All right reserved.
"""=================================================
@IDE    ：PyCharm
@Author ：Li Bei
@Email  : libei@cadg.cn
@Date   ：2020/9/16 14:21
================================================="""
import numpy as np
import tensorflow.compat.v1 as tf  # 将tensorFlow 1.x版本中的静态图接口，替换成将tensorFlow.compat.v1模块下的对应接口
tf.disable_v2_behavior()  # 关闭动态图模式


"""编程模式"""
# # 注入机制和建立session
# hello = tf.constant('Hello Tensorflow!')
# a = tf.constant(4)
# b = tf.constant(3)
# c = tf.placeholder('int8')
# d = tf.placeholder('int8')
# with tf.Session() as sess:
#     print(sess.run(hello))
#     print('a+b=', sess.run(a + b))
#     print('a-b=', sess.run(a - b))
#     print('c+d=', sess.run(c+d, feed_dict={c: 10, d: 2}))
#
# # 指定GPU运算
# gpu_options = tf.GPUOptions(all_growth=True)  # gpu容量随着使用慢慢增加
# gpu_options = tf.GPUOptions(per_process_gpu_memory_fraction=0.7)  # 给gpu分配固定大小的计算资源
# config = tf.ConfigProto(log_device_placement=True, allow_soft_placement=True, gpu_options=gpu_options)
# session = tf.Session(config=config)
#
# 保存和载入模型的方法
train_x = np.linspace(-1, 1, 100)
train_y = 2 * train_x + np.random.randn(*train_x.shape) * 0.3
input_dict = {'x': tf.placeholder('float'),
              'y': tf.placeholder('float')}
# 模型参数通过字典定义
para_dict = {'w': tf.Variable(tf.random_normal([1]), name='weight'),
             'b': tf.Variable(tf.zeros([1]), name='bias')}  # 学习参数
# 前向结构
y = tf.multiply(para_dict['w'], input_dict['x']) + para_dict['b']
# 反向优化
cost = tf.reduce_mean(tf.square(y - input_dict['y']))
lr = 0.01
optimizer = tf.train.GradientDescentOptimizer(lr).minimize(cost)
# 初始化
init = tf.global_variables_initializer()
# 定义参数
train_epochs = 20
display_step = 2

saver = tf.train.Saver(max_to_keep=5)  # 首先建立一个saver

# # 启动session
# with tf.Session() as sess:
#     sess.run(init)
#     plot_data = {'batch size': [], 'loss': []}
#     for epoch in range(train_epochs):
#         for (in_x, in_y) in zip(train_x, train_y):
#             sess.run(optimizer, feed_dict={input_dict['x']: in_x, input_dict['y']: in_y})
#         # 显示详细信息
#         if epoch % display_step == display_step - 1:
#             loss = sess.run(cost, feed_dict={input_dict['x']: train_x, input_dict['y']: train_y})
#             print('Epoch:', epoch + 1, 'loss:', loss, 'w=', sess.run(para_dict['w']), 'b=', sess.run(para_dict['b']))
#             if not (loss == 'NA'):
#                 plot_data['batch size'].append(epoch)
#                 plot_data['loss'].append(loss)
#                 # 保存模型
#                 saver.save(sess, './checkpoints/liner.ckpt-{}'.format(epoch))  # 如果路径不存在则会自动创建
#     print('loss:', cost.eval(feed_dict={input_dict['x']: train_x, input_dict['y']: train_y}),
#           'w=', para_dict['w'].eval(), 'b=', para_dict['b'].eval())
#     out_y = sess.run(y, feed_dict={input_dict['x']: train_x})


with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    # 加载模型
    ckpt = tf.train.latest_checkpoint('./checkpoints')
    if ckpt:
        saver.restore(sess, ckpt)
    print('x=5, y={}'.format(y.eval(feed_dict={input_dict['x']: 5})))

