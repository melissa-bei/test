#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (c) 2020 libei. All right reserved.
"""=================================================
@IDE    ：PyCharm
@Author ：Li Bei
@Email  : libei@cadg.cn
@Date   ：2020/9/16 14:21
================================================="""
import os


sql_path = ""
sql_file = "dbtest.sql"

sql = open(os.path.join(sql_path, sql_file), "r", encoding="utf8")
sql_txt = sql.readlines()                                            # list
sql.close()


table_sign = "-- Table structure for "
dividing_sign = "-- --"

filter_sql_txt = []
table_name = None
start_structure = None                                               # 表格结构的起点
end_structure = None                                                 # 表格结构的终点
start_record = None                                                  # 表格内容的起点
end_record = None                                                    # 表格内容的终点
count = 0                                                            # 分割行的个数

start = 0
for i in range(len(sql_txt)):                                        # 存储脚本前注释
    line = sql_txt[i]                                                # 取出当前行

    if not line.startswith(dividing_sign):
        filter_sql_txt.append(line)
    else:
        start = i
        break

for i in range(start, len(sql_txt)):
    if sql_txt[i].startswith(dividing_sign):                         # 找到整个表格
        if start_structure and i < start_structure:                  # 跳过已经存储的表格内容
            continue
        start_structure = i                                          # 初始化表格的前分割行
        for j in range(start_structure, len(sql_txt)):
            cur_line = sql_txt[j]

            if cur_line.startswith(dividing_sign):                   # 统计分割行的个数
                count += 1

            if count == 1 and cur_line.startswith(table_sign):       # 第一个分割行的下一行
                table_name = sql_txt[j][len(table_sign):]            # 表名

            if count == 3:                                           # 第三个分割行
                end_structure = j
                start_record = j
            if count == 5:                                           # 第五个分割行
                end_record = j

            if start_structure and end_structure and start_record and end_record:  # 找到完整表格
                table_record = [item for item in sql_txt[start_record:end_record]  # 表格内容
                                if item.startswith("INSERT")]
                if len(table_record):                                # 有表格内容，存储表格
                    filter_sql_txt += sql_txt[start_structure:end_record]
                else:
                    pass

                start_structure = int(end_record)                    # 新表格结构的起点
                end_structure = start_record = end_record = None
                count = 0
                break
    elif start_structure and i < start_structure:                    # 跳过已经存储的表格内容
        continue

txt = "".join(filter_sql_txt)

with open("filtered.sql", "w") as f:
    for line in filter_sql_txt:
        f.write(line)
