#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (c) 2020 libei. All rights reserved.

"""
  Author:  libei
  Email:   libei@cadg.cn
  Created: 2020/7/24

  实验python中的富比较方法,__lt__, __gt__, __le__, __ge__, __eq__, __ne__这6个富比较方法
"""

class Test(object):
    def __init__(self, value):
        self.value = value

    def __lt__(self, other):
        print('调用Test的__lt__方法')
        return self.value < other.value

    def __gt__(self, other):
        print('调用Test的__gt__方法')
        return self.value > other.value

t1 = Test(1)
t2 = Test(2)
print(t1 > t2)
print(t2 < t1)


'''# 拿python3中的functools中的cmp_to_key函数作为例子。下面是该函数的源代码：

def cmp_to_key(mycmp):
    """
    Convert a cmp= function into a key= function
    该函数内部定义了一个类，该类有5个方法，分别是__lt__, __gt__，__eq__，__le__，__ge__其实还可以定义__ne__方法。
    这分别对应了：小于，大于，等于，小于等于，大于等于，不等于。这六个就是富比较方法。

    对象之所以能够比较大小，就是因为这六个富比较方法在其作用。例如，__lt__富比较方法可以直接映射到对应的操作符如“<”,操作更方便简洁。
    """
    class K(object):
        __slots__ = ['obj']
        def __init__(self, obj):
            self.obj = obj
        def __lt__(self, other):
            return mycmp(self.obj, other.obj) < 0
        def __gt__(self, other):
            return mycmp(self.obj, other.obj) > 0
        def __eq__(self, other):
            return mycmp(self.obj, other.obj) == 0
        def __le__(self, other):
            return mycmp(self.obj, other.obj) <= 0
        def __ge__(self, other):
            return mycmp(self.obj, other.obj) >= 0
        __hash__ = None
    return K'''