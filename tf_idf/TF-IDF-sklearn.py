#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (c) 2020 libei. All right reserved.
"""=================================================
@IDE    ：PyCharm
@Author ：Li Bei
@Email  : libei@cadg.cn
@Date   ：2020/8/4 17:30
        使用Sklearn实现TF-IDF算法
================================================="""


from sklearn.feature_extraction.text import CountVectorizer
from sklearn.feature_extraction.text import TfidfTransformer


class TF_IDF:
    def __init__(self):
        self.vectorizer = CountVectorizer(max_features=10)  # 该类会将文本中的词语转换为词频矩阵，矩阵元素a[i][j] 表示j词在i类文本下的词频
        self.tf_idf_transformer = TfidfTransformer()  # 该类会统计每个词语的tf-idf权值，可以使用参数stop_words=stpwrdlst来传递停用词代码

        self.counts = None  # 统计各个词语出现的次数
        self.words = None  # 记录词袋中所有的文本关键词

    def feature_select(self, corpus: list):
        """
        特征选择TF-IDF算法
        :params corpus: 词列表，语料
        :return weight: 特征选择词字典
        """
        self.counts = (self.vectorizer.fit_transform(corpus)).toarray()  # 计算各个词语出现的次数（词频矩阵）
        self.words = self.vectorizer.get_feature_names()  # 获取词袋中所有的文本关键词

        tf_idf = self.tf_idf_transformer.fit_transform(self.counts)  # 计算tf-idf

        weight = tf_idf.toarray()  # 将tf-idf矩阵抽取出来，元素a[i][j]表示j词在i类文本中的tf-idf权重

        return weight

    def select_test(self, word_list):
        """
        对测试集进行tf-idf权重计算
        :params word_list: 测试词列表
        :return weight: 特征选择词字典
        """
        tf_idf = self.tf_idf_transformer.transform(self.vectorizer.transform(word_list))

        weight = tf_idf.toarray()  # 测试集TF-IDF权重矩阵
        return weight


if __name__ == "__main__":
    x_train = ['TF-IDF 主要 思想 是', '算法 一个 重要 特点 可以 脱离 语料库 背景',
               '如果 一个 网页 被 很多 其他 网页 链接 说明 网页 重要']  # 语料
    x_test = ['原始 文本 进行 标记', '主要 思想']

    TF_IDF = TF_IDF()
    x_train_weight = TF_IDF.feature_select(x_train)
    '''
    print("输出语料中各个词语出现的次数：")
    print(TF_IDF.counts)
    print('输出词袋中所有的文本关键词：')
    print(TF_IDF.words)'''

    x_test_weight = TF_IDF.select_test(x_test)
    print('输出x_train文本向量：')
    print(x_train_weight)
    print('输出x_test文本向量：')
    print(x_test_weight)
