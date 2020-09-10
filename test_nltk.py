'''import nltk
# 使用词性标注器
text=nltk.word_tokenize("And now for something completely different")
nltk.pos_tag(text)
import nltk

sent="I am going to Beijing tomorrow"
tokens = nltk.word_tokenize(sent)
taged_sent = nltk.pos_tag(tokens)
print(taged_sent)'''

from pyhanlp import *

s_zh = '(1)市规划国土函xx市(县）规划和国土资源管理委员会《关于xxxx项目规划国土意见的'
dep_zh = HanLP.parseDependency(s_zh)
print(list(dep_zh))
print(dep_zh)
