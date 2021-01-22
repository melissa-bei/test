#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (c) 2020 libei. All right reserved.
"""=================================================
@IDE    ：PyCharm
@Author ：Li Bei
@Email  : libei@cadg.cn
@Date   ：2020/8/5 9:38
        使用jieba实现TF-IDF算法
            jieba.analyse.extract_tags(sentence, topK=20, withWeight=False, allowPOS=())
                sentence 为待提取的文本
                topK 为返回几个 TF/IDF 权重最大的关键词，默认值为 20
                withWeight 为是否一并返回关键词权重值，默认值为 False
                allowPOS 仅包括指定词性的词，默认值为空，即不筛选
================================================="""

import jieba.analyse

text = """关键词是能够表达文档中心内容的词语，常用于计算机系统标引论文内容特征、
信息检索、系统汇集以供读者检阅。关键词提取是文本挖掘领域的一个分支，是文本检索、
文档比较、摘要生成、文档分类和聚类等文本挖掘研究的基础性工作
"""

keywords = jieba.analyse.extract_tags(text, topK=5, withWeight=True, allowPOS=())
print(keywords)
