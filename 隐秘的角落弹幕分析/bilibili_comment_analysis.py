#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (c) 2020 libei. All right reserved.
"""=================================================
@IDE    ：PyCharm
@Author ：Li Bei
@Email  : libei@cadg.cn
@Date   ：2020/9/16 14:21

1.需要安装pandas，numpy，jieba，pyecharts；jieba，stylecloud
2.需要的包如果都安装好了，可以直接全部运行看个效果
3.可视化以及生成词云可以不运行，注释掉就ok：不执行哪行，就在哪行前面加上 #
4.后面难度较大的部分不想运行可以大段地注释，选中之后按Ctrl+/
5.注释后面所有代码对前面的运行没有影响，但是注释前面部分对后面代码的运行可能有影响，所以建议分阶段，看第一阶段的时候把后面所有代码注释。可以只看第一阶段的效果
6.看到第四阶段就很ok了。
7.读代码过程中如果有理解不了的单词（也就是接口），一般都是导的别的包的函数，不用深究里面是怎么实现的，只需要了解我给它输入什么就能用它得到输出

注：1.这里处理出的一些效果由于包本身的特性，所以不在pycharm中显示，另外保存成了文件，就在当前目录下;
   2."danmu2.csv"这个文件中数据量比较大可能运行速度比较慢，可以取一部份数据进行处理。
   3.需要注意这段代码只读取了数据进行处理，并没有重新保存成excel文件，可以探索一下。
   4.在这个文件熟悉的基础上，可以换一个excel文件进行处理，仿照这个文件去写处理流程，函数用法基本相同，不同的地方是在于取哪一列或者哪几列数据进行处理，需要注意修改列标题。
================================================="""

# 导包
import pandas as pd                                        # 用来读取和存储表格数据的包
import numpy as np                                         # 用来做数学运算的包
import jieba                                               # 用来对中文语句分词的包

import pyecharts                                           # 用来可视化数据图表的包，https://blog.csdn.net/helloxiaozhe/article/details/80718323
from pyecharts.charts import Bar                           # 从pyecharts中导入柱状图
from pyecharts.charts import Polar                         # 导入极坐标图
from pyecharts import options as opts                      # 从pyecharts中导入设置


# 第一阶段----------------------------------------------------------------------------------------------------------------
# 读入数据
df_all = pd.read_csv("danmu2.csv", header=0, index_col=0, encoding='utf-8-sig')
df = df_all.copy()                                         # 复制df_all到df，两个表格存储的物理地址不同

# 重置索引
df = df.reset_index(drop=True)                             # reset_index的作用：https://www.cnblogs.com/keye/p/11229863.html
print(df.head(), end="\n\n")                               # 显示前多少条的内容，括号写个数，默认为5条

print(df.info())                                           # 显示df的一些信息


# 第二阶段----------------------------------------------------------------------------------------------------------------
# 累计用户发送的弹幕数，以了解哪些用户比较活跃
"""uid是用户id，contentsId，要实现上述目的，需要先将所有弹幕按照用户id分组，然后统计每个用户所发的弹幕数。
   第51行代码最后把统计出的结果由大到小进行了排序"""
danmu_counts = df.groupby('uid')['contentsId'].count().sort_values(ascending=False).reset_index()
danmu_counts.columns = ['用户id', '累计发送弹幕数']
print(danmu_counts.head())

# 查看用户 1810351987 的所有弹幕，并按照“点赞”的数量由大到小排序，以查看哪些该用户的那些弹幕点赞比较多
df_top1 = df[df['uid'] == 1810351987].sort_values(by="likeCount", ascending=False).reset_index()
print(df_top1.head(10))

# 统计上述用户每一集发的弹幕总数
data_top1 = df_top1.groupby('tv_name')['contentsId'].count()
print(data_top1.head())


# 第三阶段----------------------------------------------------------------------------------------------------------------
# 可视化数据
bar0 = Bar(init_opts=opts.InitOpts(width='960px', height='500px'))  # 设置柱状图像素大小
bar0.add_xaxis(data_top1.index.tolist())                            # 添加x坐标
bar0.add_yaxis("", data_top1.values.tolist())                       # 添加y坐标
bar0.set_global_opts(title_opts=opts.TitleOpts(title='弹幕发射器'))   # 添加标题
bar0.set_series_opts(
        label_opts=opts.LabelOpts(is_show=False),
        markline_opts=opts.MarkLineOpts(
            data=[opts.MarkLineItem(y=213.4, name="yAxis=213.4")]
        ))
"""pyecharts画好的图表生成图片有点麻烦，bar0.render_notebook()是在jupyter notebook工具中显示图片的命令，在pycharm中不能用，
所以这里改为bar0.render()，用这一行直接在当前文件夹下生成一个render.html文件，保存的就是上面画好的柱状图，不需要动这一行的具体原理，看懂上面的参数就行"""
bar0.render("弹幕发射器.html")  # 设置保存的html文件的名称，不设置则保存为render.html


# 统计df中每条弹幕的点赞数，以了解大家都对什么哪些弹幕比较认同
df_like = df[df.groupby(['tv_name'])['likeCount'].rank(method="first", ascending=False) == 1].reset_index()[
    ['tv_name', 'contents', 'likeCount']]                           # 仿照第51行阅读
df_like.columns = ['剧集', '弹幕', '赞']
print(df_like)


# 第四阶段，难度飞升--------------------------------------------------------------------------------------------------------
# 统计每个演员在弹幕中提及的次数
a = {'张东升': '东升|秦昊|张老师',
     '朱朝阳': '朝阳',
     '严良': '严良',
     '普普': '普普',
     '朱永平': '朱永平',
     '周春红': '春红|大娘子',
     '王瑶': '王瑶',
     '徐静': '徐静|黄米依',
     '陈冠声': '王景春|老陈|陈冠声',
     '叶军': '叶军|皮卡皮卡',
     '马主任': '主任|老马',
     '叶驰敏': '叶驰敏'}  # 建立一个字典，key为演员名字，value为弹幕中可能出现的对该演员的称呼

df_actor = {}
for key, value in a.items():
    df_actor[key] = df['contents'].str.contains(value)  # 记录当前行‘contents’是否包含value，返回布尔值。重点理解
staff_count = pd.Series({key: df.loc[df_actor[key], 'contentsId'].count() for key in a.keys()}).sort_values()
print(staff_count)

# 用极坐标图显示
a = ['朱朝阳', '叶军', '徐静', '叶驰敏', '朱永平', '周春红', '朱晶晶', '王瑶', '陈冠声', '严良', '普普', '张东升']
b = [22, 47, 99, 125, 153, 583, 818, 1462, 1942, 5075, 5188, 5734]  # b与第105行统计出的结果相同，这里直接手动写入了
# b = staff_count.values.tolist()                                   # 获取第105行的结果，把上面统计出来的pd.Series转化为list，与第110行作用相同

Polar = Polar(init_opts=opts.InitOpts(width='960px', height='500px'))           # 参考第66行阅读
Polar.add_schema(angleaxis_opts=opts.AngleAxisOpts(data=a, type_="category"))
Polar.add("", b, type_="bar")
Polar.set_global_opts(title_opts=opts.TitleOpts(title="弹幕中提到的主要演员"))
Polar.render("演员讨论量.html")


# 第五阶段，看看就行--------------------------------------------------------------------------------------------------------
# 中文分词
def get_cut_words(content_series):
    """把一句话拆分成有意义的词"""
    # 读入停用词表
    import jieba                                           # 中文分词的包
    stop_words = []

    with open("stop_words.txt", 'r', encoding='utf-8') as f:
        lines = f.readlines()
        for line in lines:
            stop_words.append(line.strip())

    # 添加关键词
    my_words = ['张东升', '一小时', '1小时', '孩子他爸', '孩子他妈', '黄圣依', '无杜华版']
    for i in my_words:
        jieba.add_word(i)

    # 自定义停用词
    my_stop_words = ['真是', '一堆', ]
    stop_words.extend(my_stop_words)

    # 分词
    word_num = jieba.lcut(content_series.str.cat(sep='。'), cut_all=False)

    # 条件筛选
    word_num_selected = [i for i in word_num if i not in stop_words and len(i) >= 2]

    return word_num_selected


text1 = get_cut_words(content_series=df.contents)  # 对df.contents中的内容进行分词处理
print(text1[:5])


# 生成词云---------------------------------------------------------------------------------------------------------------
import stylecloud

stylecloud.gen_stylecloud(text=' '.join(text1), collocations=False,
                          font_path=r'‪C:\Windows\Fonts\msyh.ttc',
                          icon_name='fas fa-play-circle', size=1600,
                          output_name='隐秘的角落-词云.png')  # 根据text1中分好的词生成词云，并保存为“隐秘的角落-词云.png”
