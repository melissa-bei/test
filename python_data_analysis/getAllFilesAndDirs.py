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


def get_all_files_and_dirs(path="./", pattern=".txt"):
    dir_list = []
    file_list = []

    if not os.path.exists(path):
        raise FileNotFoundError
    if not os.path.isdir(path):
        raise OSError("The given path is a file, not a folder.")

    dir_list.append(path)
    while dir_list:
        tmp_dir = dir_list.pop()
        tmp_list = os.listdir(tmp_dir)
        for f in tmp_list:
            tmp_path = os.path.join(tmp_dir, f)
            if os.path.isdir(tmp_path):
                dir_list.append(tmp_path)
            elif os.path.isfile(tmp_path) & tmp_path.endswith(pattern):
                file_list.append(tmp_path)

    return file_list


if __name__ == "__main__":
    ll = get_all_files_and_dirs("E:\\cbim_revit_batch\\resource\\unsuccessful", pattern=".rvt")
    print(ll)
