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
# 实例5-8:注入机制和建立session
# hello = tf.constant("Hello Tensorflow!")
# a = tf.constant(4)
# b = tf.constant(3)
# c = tf.placeholder("int8")
# d = tf.placeholder("int8")
# with tf.Session() as sess:
#     print(sess.run(hello))
#     print("a+b=", sess.run(a + b))
#     print("a-b=", sess.run(a - b))
#     print("c+d=", sess.run(c+d, feed_dict={c: 10, d: 2}))
#
# # 指定GPU运算
# gpu_options = tf.GPUOptions(all_growth=True)  # gpu容量随着使用慢慢增加
# gpu_options = tf.GPUOptions(per_process_gpu_memory_fraction=0.7)  # 给gpu分配固定大小的计算资源
# config = tf.ConfigProto(log_device_placement=True, allow_soft_placement=True, gpu_options=gpu_options)
# session = tf.Session(config=config)

# 实例9:保存和载入模型的方法,实例11:为模型保存检查点
# train_x = np.linspace(-1, 1, 100)
# train_y = 2 * train_x + np.random.randn(*train_x.shape) * 0.3
# input_dict = {"x": tf.placeholder("float"),
#               "y": tf.placeholder("float")}
# # 模型参数通过字典定义
# para_dict = {"w": tf.Variable(tf.random_normal([1]), name="weight"),
#              "b": tf.Variable(tf.zeros([1]), name="bias")}  # 学习参数
# # 前向结构
# y = tf.multiply(para_dict["w"], input_dict["x"]) + para_dict["b"]
# # 反向优化
# cost = tf.reduce_mean(tf.square(y - input_dict["y"]))
# lr = 0.01
# optimizer = tf.train.GradientDescentOptimizer(lr).minimize(cost)
# # 初始化
# init = tf.global_variables_initializer()
# # 定义参数
# train_epochs = 20
# display_step = 2
#
# saver = tf.train.Saver(max_to_keep=5)  # 首先建立一个saver
#
# # # 启动session
# # with tf.Session() as sess:
# #     sess.run(init)
# #     plot_data = {"batch size": [], "loss": []}
# #     for epoch in range(train_epochs):
# #         for (in_x, in_y) in zip(train_x, train_y):
# #             sess.run(optimizer, feed_dict={input_dict["x"]: in_x, input_dict["y"]: in_y})
# #         # 显示详细信息
# #         if epoch % display_step == display_step - 1:
# #             loss = sess.run(cost, feed_dict={input_dict["x"]: train_x, input_dict["y"]: train_y})
# #             print("Epoch:", epoch + 1, "loss:", loss, "w=", sess.run(para_dict["w"]), "b=", sess.run(para_dict["b"]))
# #             if not (loss == "NA"):
# #                 plot_data["batch size"].append(epoch)
# #                 plot_data["loss"].append(loss)
# #                 # 保存模型
# #                 saver.save(sess, "./checkpoints/liner.ckpt-{}".format(epoch))  # 如果路径不存在则会自动创建
# #     print("loss:", cost.eval(feed_dict={input_dict["x"]: train_x, input_dict["y"]: train_y}),
# #           "w=", para_dict["w"].eval(), "b=", para_dict["b"].eval())
# #     out_y = sess.run(y, feed_dict={input_dict["x"]: train_x})
#
#
# with tf.Session() as sess:
#     sess.run(tf.global_variables_initializer())
#     # 加载模型
#     ckpt = tf.train.latest_checkpoint("./checkpoints")
#     if ckpt:
#         saver.restore(sess, ckpt)
#     print("x=5, y={}".format(y.eval(feed_dict={input_dict["x"]: 5})))


"""Tensorflow 基础类型定义和操作函数介绍
   返回的类型都是np.ndarray"""
# tf.slice
# t = [[[1, 1, 1], [2, 2, 2]], [[3, 3, 3], [4, 4, 4]],[[5, 5, 5], [6, 6, 6]]]
# slice1 = tf.slice(t, [1, 0, 0], [1, 1, 3])
# slice2 = tf.slice(t, [1, 0, 0], [1, 2, 3])
# slice3 = tf.slice(t, [2, 0, 0], [1, 1, 3])
# sess = tf.Session()
# print(sess.run(slice1))
# print(sess.run(slice2))
# print(sess.run(slice3))

# tf.split
# split0, split1, split2 = tf.split(tf.ones([4, 20, 9]), [3, 3, 3], 2)
# sess = tf.Session()
# print(sess.run(tf.shape(split0)))
# print(sess.run(tf.shape(split1)))
# print(sess.run(tf.shape(split2)))

# tf.concate
# t1 = tf.convert_to_tensor([[1, 2, 3], [4, 5, 6]], dtype="float")  # convert_to_tensor由list转为tensor
# t2 = tf.convert_to_tensor([[7, 8, 9], [10, 11, 12]], dtype="float")
# tensor = tf.concat([t1, t2], 1)  # 两个tensor不合并的维度必须相同
# tt = tf.concat([tf.expand_dims(t, 2) for t in [t1, t2]], 2)
# sess = tf.Session()
# print(sess.run(tt))

# tf.stack
# t1 = tf.convert_to_tensor([[1, 2, 3], [4, 5, 6]], dtype="float")
# t2 = tf.convert_to_tensor([[7, 8, 9], [10, 11, 12]], dtype="float")
# t = tf.stack([t1, t2], axis=2)  # axis取值必须在[-len(t1.shape), len(t1.shape)-1)内
# sess = tf.Session()
# print(sess.run(t))

# tf.unstack
# t1 = tf.convert_to_tensor([[1, 2, 3], [4, 5, 6]], dtype="float")
# t = tf.unstack(t1, axis=1)  # 返回的类型是np.ndarray
# sess = tf.Session()
# print(sess.run(t))

# tf.gather
# t1 = tf.convert_to_tensor([[1, 2, 3], [4, 5, 6], [7, 8, 9]], dtype="float")
# t = tf.gather(t1, [2, 0])
# sess = tf.Session()
# print(sess.run(t))

# tf.one_hot  /   tf.count_nonzero
# t1 = tf.convert_to_tensor([1, 3, 7, 8, 9], dtype="uint8")  # one_hot输入向量必须为整型数字
# depth = 15  # 与输入向量的元素取值范围没关系，如果向量中元素可取值比较多则可以截断，较少则多于维度补零；此外默认从0往后数，与输入向量无关
# on_value = 7.0
# off_value = 0.0
# axis = -1
# t = tf.one_hot(t1, depth, on_value, off_value, axis)
# sess = tf.Session()
# print(sess.run(t))
# print(sess.run(tf.count_nonzero(t)))  # 统计非零元素的个数

# tf.reduce_sum
# t1 = tf.ones([5, 5, 5])
# sum = tf.reduce_sum(t1)
# sess = tf.Session()
# print(sess.run(sum))

# tf.reduce_prod
# t1 = tf.convert_to_tensor([[1, 2, 3], [4, 5, 6]])
# product1 = tf.reduce_prod(t1)  # 将所有元素相乘，即降到0维
# product2 = tf.reduce_prod(t1, 1)  # 按指定维度相乘
# sess = tf.Session()
# print(sess.run(product1))
# print(sess.run(product2))

# tf.unquie
# x = tf.convert_to_tensor([9, 4, 3, 2, 6, 5, 8, 4, 2, 5, 6])
# y, index = tf.unique(x)
# sess = tf.Session()
# with sess.as_default():
#     print(sess.run(y), sess.run(index))

"""共享变量"""
# 实例14:Variable和get_variable的区别
# 用Variable定义普通变量
# var1 = tf.Variable(1.0, name="first_var")
# print("var1:{}".format(var1.name))
# var1 = tf.Variable(2.0, name="first_var")
# print("again var1:{}".format(var1.name))  # 输出的变量和上面不同，多了后缀_1
# var2 = tf.Variable(3.0)  # 没有定义name时，tensorflow默认自动命名为Variable
# print("var2:{}".format(var2.name))
# var2 = tf.Variable(4.0)
# print("again var2:{}".format(var2.name))
#
# with tf.Session() as sess:
#     sess.run(tf.global_variables_initializer())
#     print("var1={}".format(var1.eval()))
#     print("var2={}".format(var2.eval()))

# 用get_variable定义共享变量
# get_var1 = tf.get_variable("first_var", [1], initializer=tf.constant_initializer(0.3))
# print("get_var1:{}".format(get_var1.name))
# get_var1 = tf.get_variable("first_var1", [1], initializer=tf.constant_initializer(0.4))
# print("get_var1:{}".format(get_var1.name))
#
# with tf.Session() as sess:
#     sess.run(tf.global_variables_initializer())
#     print("get_var1={}".format(get_var1.eval()))

# 实例15:在特定作用域tf.variable_scope下获取变量
# with tf.variable_scope("test1"):  # 定义一个作用域test1
#     var1 = tf.get_variable("firstvar", shape=[2], dtype=tf.float32)
# print("var1:{}".format(var1.name))
# with tf.variable_scope("test2"):
#     var1 = tf.get_variable("firstvar", shape=[2, 2], dtype=tf.uint8)
# print("var1:{}".format(var1.name))

# 实例16:共享变量功能的实现tf.variable_scope的reuse参数
# with tf.variable_scope("test1"):  # 定义一个作用域test1
#     var1 = tf.get_variable("firstvar", shape=[2], dtype=tf.float32)
#     with tf.variable_scope("test2"):  # 支持可嵌套
#         var2 = tf.get_variable("firstvar", shape=[2, 2], dtype=tf.uint8)
# print("var1:{}".format(var1.name))
# print("var2:{}".format(var2.name))
#
# with tf.variable_scope("test1", reuse=True):  # 定义一个作用域test1
#     var3 = tf.get_variable("firstvar", shape=[2], dtype=tf.float32)
#     with tf.variable_scope("test2"):
#         var4 = tf.get_variable("firstvar", shape=[2, 2], dtype=tf.uint8)
# print("var3:{}".format(var3.name))
# print("var4:{}".format(var2.name))

# 实例17:初始化共享变量的作用域
# with tf.variable_scope("test1", initializer=tf.constant_initializer(0.5)):  # 作用域统一初始化为0.5
#     var1 = tf.get_variable("firstvar", shape=[2], dtype=tf.float32)  # 没有初始化,自动初始化test1作用域的初始值
#     with tf.variable_scope("test2"):  # 继承test1
#         var2 = tf.get_variable("firstvar", shape=[2], dtype=tf.float32)  # 没有初始化
#         var3 = tf.get_variable("var3", shape=[2], initializer=tf.constant_initializer(0.1))  # 初始化为0.1
# with tf.Session() as sess:
#     sess.run(tf.global_variables_initializer())
#     print("var1:{}".format(var1.eval()))
#     print("var2:{}".format(var2.eval()))
#     print("var3:{}".format(var3.eval()))

# 实例18:作用域与操作符的受限范围
with tf.variable_scope("scope1") as sp:
    var1 = tf.get_variable("firstvar1", shape=[2])
# with tf.variable_scope("scope2"):
#     var2 = tf.get_variable("firstvar", shape=[2])
#     with tf.variable_scope(sp) as sp1:  # variable_scope用了as后,再次被调用时不受外围scope的限制
#         var3 = tf.get_variable("firstvar2", shape=[2])
# print("var1:{}".format(var1.name))
# print("var2:{}".format(var2.name))
# print("var3:{}".format(var3.name))
# print()
# # name_scope只能限制op,不能限制变量的命名
# with tf.variable_scope("scope2"):
#     var2 = tf.get_variable("v", shape=[2])
#     with tf.variable_scope(sp) as sp2:  # variable_scope用了as后,再次被调用时不受外围scope的限制
#         var3 = tf.get_variable("v3", shape=[2])
#         with tf.variable_scope(""):  # 空字符无作用
#             var4 = tf.get_variable("v4", shape=[2])
# print("v:{}".format(var2.name))
# print("v3:{}".format(var3.op.name))
# print("v4:{}".format(var4.op.name))
# print()
# with tf.variable_scope("scope"):
#     with tf.name_scope("bar"):
#         v = tf.get_variable("v", shape=[2])
#         x = 1.0 + v
#         with tf.name_scope(""):  # 空字符将作用域返回到顶层
#             y = 1.0 + v
# print("v:{}".format(v.name))
# print("x:{}".format(x.op.name))
# print("y:{}".format(y.op.name))
# print()

