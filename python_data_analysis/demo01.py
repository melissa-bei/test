#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (c) 2020 libei. All right reserved.
"""=================================================
@IDE    ：PyCharm
@Author ：Li Bei
@Email  : libei@cadg.cn
@Date   ：2020/9/16 14:21
================================================="""

import json
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import uuid


plt.style.use("fivethirtyeight")
sns.set_style({"font.sans-serif": ["SimHei", "Arial"]})

with open("E:\\cbim_revit_batch\\resource\\exportedjson\\06-丁肇中科技馆\\141551-main-AS-center2016.json") as f:
    dt = json.load(f)

    df1 = pd.read_json(json.dumps(dt["project_info"]), orient="columns", lines=True)
    objlist = ['FileName', 'FileName', 'PlaceName', 'OrganizationDescription', 'PlaceName', 'OrganizationName', 'Author',
               'Number', 'Name', 'ClientName', 'Status', 'IssueDate', 'BuildingType', 'Major', 'OtherProperties']
    for obj in objlist:
        df1[obj] = df1[obj].astype("str")
    # print(df1.info())

    df2 = pd.json_normalize(dt, ["element_info"])
    objlist = ['Id', 'Name', 'Category', 'CategoryName', 'FamilyId', 'FamilyName', 'FamilyType',
               'TypeId', 'TypeName', 'OtherProperties']
    for obj in objlist:
        df2[obj] = df2[obj].astype("str")
    # print(df2.info())

    c = df2.groupby(["Category"])["FamilyName"].count()
    f, axs = plt.subplots(2, 2, figsize=(20, 15))
    sns.barplot(x=c.values[:10], y=c.index.values[:10], palette="Greens_d", data=c, ax=axs[0, 0])
    axs[0, 0].set_title('2011年SF工资top5', fontsize=15)  # 标题
    axs[0, 0].set_xlabel('工作')
    axs[0, 0].set_ylabel('平均薪资')
    plt.show()

