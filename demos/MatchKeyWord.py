#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (c) 2020 libei. All right reserved.
"""=================================================
@IDE    ：PyCharm
@Author ：Li Bei
@Email  : libei@cadg.cn
@Date   ：2020/8/3 10:43
          实现多关键词匹配，尽量让扫描文章的次数靠近1次
          1.构造关键词线索树
          2.检索关键词：当需要检索关键词时，就将文章切割成char数组，一个一个字符的比较

          最坏情况下每次都比较到最大长度的关键词，则此环节要检索关键词最大程度k次，
          对于文章的每一个字符都要发起对关键词的比较，要发起文章长度m次，
          因此该算法的最差的时间复杂度为O（km）。
          即此算法与关键词的数量没有关系，只与文章长度和最大关键词长度有关，
          然而最大关键词长度一般不会很大，所以次算法主要取决于文章的长度，因此就很接近于扫描1次文章就完成关键词匹配的目标了。
================================================="""


class Node(object):
    """
    树节点类
    """
    def __init__(self, values, length=-1):
        self.values = values  # 表示节点对应的值
        self.length = length  # 表示该节点是否为根节点和关键词最后一个节点 ## -2表示根节点，-1表示中间节点(默认)，大于1的数表示关键词长度
        self.nextNode = {}  # values: Node，表示当前节点指向的下一个关键词，及各个关键词对应的节点

    def __str__(self):
        # 打印节点的值
        return str(self.values)


class MatchKsyWord:
    """
    实现多关键词匹配的类函数
    """
    def __init__(self):
        self.root = Node("root", -2)

    def add(self, str: list):
        """
        给root中添加关键词
        :return: 无
        """
        str_len = len(str)  # 关键词串的长度
        if str_len <= 0:  # 添加的关键词为空，则不做任何操作
            return None
        new_root = self.root  # 新的根节点
        for idx in range(str_len):  # 遍历关键词序列
            keys = new_root.nextNode.keys()
            if str[idx] not in keys:  # 该节点下不存在关键词的第idx个字符对应的节点
                if idx == str_len-1:  # 当前节点是关键词的最后一个字符
                    add_node = Node(str[idx], str_len)  # 生成新的节点，并设置这个关键词的长度
                else:
                    add_node = Node(str[idx])
                new_root.nextNode[str[idx]] = add_node  # 添加新的节点
            else:
                add_node = new_root.nextNode[str[idx]]
            new_root = add_node  # 进入新加入关键词所对应的节点

        return None

    def check(self, scrStr):
        """
        检查是否存在关键词
        :param scrStr: 文章
        :return: 返回Boolean，关键词是否匹配上
        """
        str_len = len(scrStr)  # 文章长度
        if str_len <= 0:  # 若文件长度为0，则肯定不存在关键词
            return False
        for idx in range(str_len):  # idx表示开始符对应文章中的索引
            new_root = self.root  # 初始化开始符
            for i in range(idx, str_len):  # 进入与关键词比对的环节
                if scrStr[i] not in new_root.nextNode.keys():  # 关键词线索树中，没有值为scrStr[idx]的关键词节点
                    break
                else:  # 有该节点
                    search_node = new_root.nextNode[scrStr[i]]
                    if search_node.length > 0:  # 该节点是关键词的最后一个字符
                        return True  # 不匹配
                    else:
                        new_root = search_node
        return False  # 匹配

    def filter(self, scrStr, replaceStr):
        """
        过滤关键词，并且把关键词替换成替换词
        :param scrStr: 原始关键词
        :param replaceChar: 替换关键词
        :return: 返回替换后的字符串
        """
        str_len = len(scrStr)  #
        if str_len <= 0:
            return scrStr
        tmp_idx = 0  # 记录匹配结束时的id，初始化为0
        for idx in range(str_len):
            if tmp_idx >= idx:  # 跳到文章中该关键字的下一个字符开始扫描
                continue
            else:
                new_root = self.root
                for i in range(idx, str_len):
                    if scrStr[i] not in new_root.nextNode.keys():
                        break
                    else:  # 若匹配到一个关键词
                        search_node = new_root.nextNode[scrStr[i]]
                        if search_node.length > 0:  # 多个关键词全部匹配完毕
                            for j in range(i, i-search_node.length, -1):
                                scrStr[j] = replaceStr  # 把前面所有的关键词都替换成replaceStr
                            tmp_idx = i
                            break  # 跳出关键词比较环节
                        else:  # 不是最后一个关键词
                            new_root = search_node  # 继续匹配
        return scrStr


if __name__ == "__main__":
    model = MatchKsyWord()  # 初始化模型
    tree_list = ['A B C', 'A B D E', 'A B F G', 'A H', 'I B', 'J K', 'I B L',  'M', 'N O', 'N B L', 'N B L P']
    for item in tree_list:  # 构造关键词线索树
        item = item.split()
        model.add(item)

    # 文章
    ll = 'A S A B D E N D'.split()
    model.check(ll)  # 关键词匹配
    ll_O = model.filter(ll, 'S')  # 关键词替换
    print(ll_O)
