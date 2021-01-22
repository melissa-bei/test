#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (c) 2020 libei. All right reserved.
"""=================================================
@IDE    ：PyCharm
@Author ：Li Bei
@Email  : libei@cadg.cn
@Date   ：2020/8/4 16:59
        使用NLTK实现TF-IDF算法
        nltk(natural language toolkit)是python的自然语言处理工具包
================================================="""

from nltk.text import TextCollection
from nltk.tokenize import word_tokenize

# 首先，构建语料库corpus
sents = ['this is sentence one', 'this is sentence two', 'this is sentence three']
sents = [word_tokenize(sent) for sent in sents]  # 对每个句子进行分词
print(sents)  # 输出分词后的结果
corpus = TextCollection(sents)  # 构建语料库
print(corpus)  # 输出语料库

# 计算语料库中"one"的tf值
tf = corpus.tf('one', corpus)  # 1/12
print(tf)

# 计算语料库中"one"的idf值
idf = corpus.idf('one')  # log(3/1)
print(idf)

# 计算语料库中"one"的tf-idf值
tf_idf = corpus.tf_idf('one', corpus)
print(tf_idf)