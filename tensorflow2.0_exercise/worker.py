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
# from tensorflow.examples.tutorials.mnist import input_data
# mnist = input_data.read_data_sets("MNIST_data/", one_hot=True)
tf.disable_v2_behavior()                                             # 关闭动态图模式


# 实例20:使用Tensorflow实现分布式部署训练
train_X = np.linspace(-1, 1, 100)
train_Y = 2 * train_X + np.random.randn(*train_X.shape) * 0.3
# 定义IP和端口
strps_hosts = "localhost:1681"                                       # localhost即是本机域名的写法,等同于127.0.0.1
strworker_hosts = "localhost:1682, localhost:1683"

# 定义角色名称
strjob_name = "worker"                                               # 运算终端
task_index = 0                                                       # 0
# 将字符串转成数组
ps_hosts = strps_hosts.split(",")
worker_hosts = strworker_hosts.split(",")
cluster_spec = tf.train.ClusterSpec({"ps": ps_hosts, "worker": worker_hosts})
# 创建server
server = tf.train.Server({"ps": ps_hosts, "worker": worker_hosts}, job_name=strjob_name, task_index=task_index)

# ps角色使用join进行等待
if strjob_name == "ps":
    print("wait")
    server.join()

# 创建网络结构
with tf.device(                                                      # 使用tf.device函数将全部的节点都放在当前任务下
        tf.train.replica_device_setter(                              # 指定任务
            worker_device="/job:worker/task:{}".format(task_index),  # 定义具体任务名称
            cluster=cluster_spec)):                                  # 指定角色及对应的IP地址
    X = tf.placeholder("float")
    Y = tf.placeholder("float")
    # 模型参数
    W = tf.Variable(tf.random_normal([1]), name="weight")
    b = tf.Variable(tf.zeros([1]), name="bias")

    global_step = tf.train.get_or_create_global_step()               # 获得迭代次数,方便检查点文件同步迭代次数

    # 前向结构
    z = tf.multiply(X, W) + b
    tf.summary.histogram("z", z)                                     # 将预测值显示为直方图
    # 反向优化
    cost = tf.reduce_mean(tf.square(z - Y))
    tf.summary.scalar("loss_function", cost)                         # 将损失以标量显示
    optimizer = tf.train.GradientDescentOptimizer(learning_rate=0.01).minimize(cost)

    saver = tf.train.Saver(max_to_keep=1)
    merge_summary_op = tf.summary.merge_all()                        # 合并所有summary

    init = tf.global_variables_initializer()                         # 必须放在所有变量之后,是初始化前面的所有变量

    # 定义参数
    train_epochs = 2201
    display_step = 2
    # 创建Supervisor,管理session
    sv = tf.train.Supervisor(is_chief=(task_index == 0),             # 是否为chief supervisor角色,0号worker为chief
                             logdir="log/super",                     # 加差点文件和summary文件保存的路径
                             init_op=init,                           # 初始化变量的函数
                             summary_op=None,                        # 是否自动保存summary文件
                             saver=saver,                            # saver对象,不保存设为None
                             global_step=global_step,
                             save_model_secs=5)                      # 每隔几秒保存一次检查点文件
    plotdata = {}
    # 连接目标角色创建session
    with sv.managed_session(server.target) as sess:
        # 迭代训练
        print("sess OK!")
        print(global_step.eval(session=sess))

        for epoch in range(global_step.eval(session=sess), train_epochs * len(train_X)):
            for (x, y) in zip(train_X, train_Y):
                _, epoch = sess.run([optimizer, global_step], feed_dict={X: x, Y: y})
                # 生成summary
                summary_str = sess.run(merge_summary_op, feed_dict={X: x, Y: y})
                sv.summary_computed(sess, summary_str, global_step=epoch)  # 保存summary文件
                if epoch % display_step == 0:
                    loss = sess.run(cost, feed_dict={X: train_X, Y: train_Y})
                    print("Epoch:{}, cost:{}, W={}, b={}".format(epoch + 1, loss, sess.run(W), sess.run(b)))
                    if not (loss == "NA"):
                        plotdata["batchsize"].append(epoch)
                        plotdata["loss"].append(loss)
        print("Finish!")
        sv.saver.save(sess, "log/mnist_with_summaries" + "sv.cpk", global_step=epoch)
    sv.stop()
