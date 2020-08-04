#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (c) 2020 libei. All right reserved.
"""=================================================
@IDE    ：PyCharm
@Author ：Li Bei
@Email  : libei@cadg.cn
@Date   ：2020/7/28 14:48
================================================="""

import os
import re


class Extract_Title:
    def __init__(self):
        """三级标题的默认集合"""
        self.titleA_sets = ['一', '']
        self.titleB_sets = ['[0-9].']
        self.titleC_sets = ['[0-9]{.}[0-9]{.}[0-9]', '([0-9])', '[0-9].[0-9]', '[a-z])', '[0-9])']

    def set_titleA_type(self, val: list):
        """设置一级标题集合"""
        self.titleA_sets = val
        return None

    def set_titleB_type(self, val: list):
        """设置二级标题集合"""
        self.titleB_sets = val
        return None

    def set_titleC_type(self, val: list):
        """设置三级标题集合"""
        self.titleC_sets = val
        return None

    def read_txt_file(self, path):
        """
        读取txt文件内容
        :param path: txt所在目录
        :return 文件的字典架构 字典 {文件名 : {lines : list, txt : str}}
        """
        result = dict()

        for file in os.listdir(path):
            if file.endswith('.txt'):
                file_path = path + file
                # print(file_path)

                with open(file_path, 'r', encoding='utf-8') as f:
                    lines = f.readlines()
                    labels = [None]*len(lines)

                result.update({file: {'lines': list(zip(*[lines, labels])), 'txt': ''.join(lines)}})

        return result

    def detect_title_type(self, lines):
        """
        判断txt文件各级序号类型
        :return title_style 一级、二级、三级标题的类型 列表 [[], [], []]
        """
        title_style = []

        # 找出一级标题，除“设计说明”外的第一行默认为一级标题
        if lines[0][0].startswith('设计说明'):
            idxa = 1
        else:
            idxa = 0
        lines[idxa][1] = 1  # 标记为一级标题

        # #进行标签类型匹配
        titleA = lines[idxa][0]
        for style_str in self.titleA_sets:
            if titleA.startswith(style_str):
                title_style.append(style_str)  # 保存一级标题模式
                break
            else:
                pass

        # 找出二级标题模式
        for style_str in self.titleB_sets:
            pattern = re.compile(style_str)
            result = []
            for line in lines[idxa+1:]:
                tmp = pattern.search(line[0][:5])
                line[0] = 2  # 标记为二级标题
                if tmp is not None:
                    result.append(tmp.group())
            if result:
                title_style.append(style_str)  # 保存二级标题模式
                break
            else:
                pass


        # 找出三级标题模式：
        for style_str in self.titleC_sets:
            pattern = re.compile(style_str)
            result = []
            for line in lines[idxa + 1:]:
                tmp = pattern.search(line[:5])
                line[0] = 3  # 标记为二级标题
                if tmp is not None:
                    result.append(tmp.group())
            if result:
                title_style.append(style_str)  # 保存三级标题模式
                break
            else:
                pass


    def main(self, readpath, savepath):
        txt = self.read_txt_file(readpath)
        for file in txt:
            a = txt[file]['lines'][:20]
            title = self.detect_title_type(a)


if __name__ == '__main__':
    readdir = 'E:\\newbie\\Exercise\\pdf_process_exercise\\'
    savedir = '.\\resource\\pdf_json_file\\result_demo.json'

    model = Extract_Title()
    model.main(readdir, savedir)
