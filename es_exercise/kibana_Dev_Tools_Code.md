# kibana Dev Tools Code

```kibana
/*6.8*/
# PDF-创建索引test_pdf_index
PUT test_pdf_index
{
  "settings":{
    "number_of_shards": 5,
    "number_of_replicas": 1
  }
}

# PDF-添加映射1
POST test_pdf_index/parameter/_mappings
{
  "parameter":{
    "properties":{
      "belongs":{
        "type":"text",
        "analyzer":"ik-smart",
        "fields": {
          "keyword": {
              "type": "keyword"
            }
          }
      },
      "id":{
        "type":"keyword"
      },
      "tags":{
        "type":"text",
        "analyzer":"ik-smart",
        "fields": {
          "keyword": {
              "type": "keyword"
            }
          }
      },
      "key":{
        "type":"text",
        "analyzer":"ik-smart",
        "fields": {
          "keyword": {
              "type": "keyword"
            }
          }
      },
      "value":{
        "type":"text",
        "analyzer":"ik-smart",
        "fields": {
          "keyword": {
              "type": "keyword"
            }
          }
      },
      "sentence":{
        "type":"text",
        "analyzer":"ik-smart",
        "fields": {
          "keyword": {
              "type": "keyword"
            }
          }
      },
      "position":{
        "type":"text"
      },
      "search_key":{
        "type":"text",
        "analyzer":"ik-smart",
        "fields": {
          "keyword": {
              "type": "keyword"
            }
          }
      },
      "search_key_cut":{
        "type":"text"
      },
      "search_reg":{
        "type":"text"
      },
      "value_bbox":{
        "type":"nested",
        "properties":{
          "page_num":{
            "type":"long",
            "fields": {
              "keyword": {
                  "type": "keyword"
                  }
              }
          },
          "pos":{
            "type":"text"
          }
        }
      }
    }
  }
}
# PDF-添加映射2，去掉中文分词器
PUT test_pdf_index/parameter/_mappings
{
  "parameter":{
    "properties":{
      "belongs":{
        "type":"text",
        "fields": {
          "keyword": {
              "type": "keyword"
            }
          }
      },
      "id":{
        "type":"keyword"
      },
      "tags":{
        "type":"text",
        "fields": {
          "keyword": {
              "type": "keyword"
            }
          }
      },
      "key":{
        "type":"text",
        "fields": {
          "keyword": {
              "type": "keyword"
            }
          }
      },
      "value":{
        "type":"text",
        "fields": {
          "keyword": {
              "type": "keyword"
            }
          }
      },
      "sentence":{
        "type":"text",
        "fields": {
          "keyword": {
              "type": "keyword"
            }
          }
      },
      "position":{
        "type":"text"
      },
      "search_key":{
        "type":"text",
        "fields": {
          "keyword": {
              "type": "keyword"
            }
          }
      },
      "search_key_cut":{
        "type":"text"
      },
      "search_reg":{
        "type":"text"
      },
      "value_bbox":{
        "type":"nested",
        "properties":{
          "page_num":{
            "type":"long",
            "fields": {
              "keyword": {
                  "type": "keyword"
                  }
              }
          },
          "pos":{
            "type":"text"
          }
        }
      }
    }
  }
}


# 测试分词效果，没有ik中文分词器
GET _analyze/
{
  "text": "设计依据,门窗,规范"
}
GET _analyze/
{
  "text": "it`s so hot today!"
}

# PDF-插入一条数据
PUT test_pdf_index/parameter/1
{
        "id": 1,
        "key": "市规划国土函",
        "position": "27,45",
        "search_key": "规划国土",
        "search_key_cut": "规划 国土",
        "search_reg": "《(.*)》（?([A-Z]+)?(d+)?(/|／)?([A-Z]*d+)?[-－]?(d+)?）?",
        "sentence": "(1)市[规划][国土]函xx市(县）[规划]和[国土]资源管理委员会《关于xxxx项目[规划][国土]意见的函》市[规划][国土]函（20xx）xxxx号",
        "value": "《关于xxxx项目规划国土意见的函》",
        "value_bbox": {
            "page_num": 0,
            "pos": [
                [
                    "《",
                    0,
                    393.990,
                    131.236,
                    405.989,
                    143.422
                ],
                [
                    "关",
                    0,
                    405.989,
                    131.236,
                    417.987,
                    143.422
                ],
                [
                    "于",
                    0,
                    417.987,
                    131.236,
                    429.986,
                    143.422
                ],
                [
                    "x",
                    0,
                    429.986,
                    131.236,
                    435.986,
                    143.422
                ],
                [
                    "x",
                    0,
                    435.986,
                    131.236,
                    441.985,
                    143.422
                ],
                [
                    "x",
                    0,
                    441.985,
                    131.236,
                    447.984,
                    143.422
                ],
                [
                    "x",
                    0,
                    447.984,
                    131.236,
                    453.984,
                    143.422
                ],
                [
                    "项",
                    0,
                    453.984,
                    131.236,
                    465.982,
                    143.422
                ],
                [
                    "目",
                    0,
                    465.982,
                    131.236,
                    477.981,
                    143.422
                ],
                [
                    "规",
                    0,
                    477.981,
                    131.236,
                    489.980,
                    143.422
                ],
                [
                    "划",
                    0,
                    489.980,
                    131.236,
                    501.979,
                    143.422
                ],
                [
                    "国",
                    0,
                    501.979,
                    131.236,
                    513.977,
                    143.422
                ],
                [
                    "土",
                    0,
                    513.977,
                    131.236,
                    525.976,
                    143.422
                ],
                [
                    "意",
                    0,
                    525.976,
                    131.236,
                    537.975,
                    143.422
                ],
                [
                    "见",
                    0,
                    537.975,
                    131.236,
                    549.974,
                    143.422
                ],
                [
                    "的",
                    0,
                    549.974,
                    131.236,
                    561.972,
                    143.422
                ],
                [
                    "函",
                    0,
                    124.018,
                    149.234,
                    136.017,
                    161.421
                ],
                [
                    "》",
                    0,
                    136.017,
                    149.234,
                    148.016,
                    161.421
                ]
            ]
        }
    }

# PDF-嵌套类型查询
GET test_pdf_index/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "nested": {
            "path": "value_bbox",
            "query": {
              "match": {
                      "value_bbox.page_num": 1
                    }
            }
          }
        },
        {
          "match":{
            "id": 66
          }
        },
        {
          "match": {
            
            "belongs": "西宁"
          }
        }
      ]
    }
  }
}

# PDF-获取文档数量
GET test_pdf_index/parameter/_count

# PDF-根据_id获取文档
GET test_pdf_index/parameter/ASOISnYBvy7JNgnbL1Tx

# PDF-轻量搜索(只能搜索id？)
GET test_pdf_index/parameter/_search?q=id: 1

# PDF-筛选排序查询（表达式搜索）
GET test_pdf_index/parameter/_search
{
  "query": {
    "bool": {
      "must": {
        "match": {
          "belongs": "西宁"
        }
      },
      "filter": {
        "range": {
          "id": {
            "lt": 30
          }
        }
      }
    }
  },
  "sort": [
    {
      "id": {
        "order": "asc"
      }
    }
  ]
}

# PDF-全文搜索（默认会进行分词之后再搜索）
GET test_pdf_index/parameter/_search
{
  "query":{
    "match":{
      "tags": "设计依据，规范，防火"
    }
  }
}

# PDF-短语搜索(完全按照短语进行搜索，所以没有匹配的文档)
GET test_pdf_index/parameter/_search
{
  "query":{
    "match_phrase":{
      "tags": "设计依据，规范，防火"
    }
  }
}

# PDF-高亮搜索（返回结果多了highlight这一部分）
GET test_pdf_index/parameter/_search
{
  "query":{
    "match_phrase":{
      "tags": "设计依据"
    }
  },
  "highlight": {
    "fields": {
      "tags": {}
    }
  }
}

# PDF-聚合分析（返回结果多了aggregattions这一部分，支持分级汇总）
GET test_pdf_index/parameter/_search
{
  "query":{
    "match":{
      "belongs":"西宁"
    }
  },
  "aggs": {
    "all_tags": {
      "terms": {"field": "tags.keyword"},
      "aggs": {
        "all_ids": {
          "terms": {
            "field": "id",
            "size": 5
          }
        }
      }
    }
  }
}


# REVIT-第一版-创建索引test_revit_model_index
PUT test_revit_model_index
{
  "settings":{
    "number_of_shards": 5,
    "number_of_replicas": 1
  }
}

# REVIT-添加映射
PUT test_revit_model_index/project/_mappings
{
  "properties": {
    "project_info": {
    "properties": {
      "file name": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      },
      "file path": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      },
      "组织描述": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      },
      "项目发布日期": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      },
      "设计选项": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      },
      "建筑名称": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      },
      "客户姓名": {
        "type": "keyword"
      },
      "组织名称": {
        "type": "keyword"
      },
      "作者": {
        "type": "keyword"
      },
      "项目状态": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      },
      "项目名称": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      },
      "项目编号": {
        "type": "keyword"
      },
      "项目地址": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      }
    }
  },
  "type_info": {
    "properties": {
      "uniqueid": {
        "type": "keyword"
      },
      "name": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      },
      "类型": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      },
      "类型名称": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      },
      "族名称": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      },
      "族 ID": {
        "type": "keyword"
      },
      "类别": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      },
      "类别名称": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      }
    }
  },
  "element_info": {
    "properties": {
      "uniqueid": {
        "type": "keyword"
      },
      "name": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      },
      "类型": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      },
      "类型名称": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      },
      "类型 ID": {
        "type": "keyword"
      },
      "族": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      },
      "族名称": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      },
      "族 ID": {
        "type": "keyword"
      },
      "类别": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      },
      "类别名称": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      }
    }
  }
  }
}
# REVIT-插入一条数据
POST test_revit_model_index/project/
{
  "project_info":{
      "file name": "西宁",
      "file path": "localhost"
    }
}
# REVIT-插入文档时field如果不存在则会自动再mappings中创建
PUT test_revit_model_index/project/1
{
  "project_info":{
    "file_name":[
      {
        "name":"1",
        "context":"first"
      },
      {
        "name":"2",
        "context":"second"
      }
      ]
  }
}
# REVIT-获取文档的一部份
GET test_revit_model_index/project/1?_source=project_info.file_name.context
# REVIT-获取文档的term向量
GET test_revit_model_index/project/1/_termvectors
# REVIT-获取文档_source
GET test_revit_model_index/project/1/_source
# REVIT-检查文档是否存在（存在返回200，不能村子啊返回404）
HEAD test_revit_model_index/project/1
HEAD test_revit_model_index/project/1000
# REVIT-使用创建操作去检查索引是否存在（存在返回409，不存在则创建）
PUT /test_revit_model_index/project/1000/_create
{}
PUT /test_revit_model_index/project/1?op_type=create
{}
# REVIT-删除文档（存在则删除，不存在则返回404）
DELETE /test_revit_model_index/project/1000



# REVIT-第二版
#Parent/Child
DELETE test_revit_project_index
#创建索引
PUT /test_revit_project_index
{
  "mappings": {
    "project": {
      "properties": {
        "project_element_relation": {
          "type": "join",
          "relations": {
            "project": "element"
          }
        },
        "file name": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "file path": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "组织描述": {
          "type": "keyword"
        },
        "项目发布日期": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "设计选项": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "建筑名称": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "客户姓名": {
          "type": "keyword"
        },
        "组织名称": {
          "type": "keyword"
        },
        "作者": {
          "type": "keyword"
        },
        "项目状态": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "项目名称": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "项目编号": {
          "type": "keyword"
        },
        "项目地址": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        }
      }
    }
  }
}

#创建父文档
PUT test_revit_project_index/project/project_1
{
  "project_element_relation": {
    "name": "project"
  },
  "file name": "rac_basic_sample_project.rvt",
  "file path": """E:\\cbim_revit_batch\\resource\\unexportedfile\\1""",
  "类别": "OST_ProjectInformation",
  "类型名称": "",
  "项目状态": "Project Status",
  "项目名称": "Sample House",
  "族名称": "",
  "项目地址": "Enter address here",
  "线路分析设置": "",
  "作者": "Samuel Macalister",
  "组织描述": "",
  "客户姓名": "Autodesk",
  "设计选项": "INVALID",
  "能量设置": "",
  "项目发布日期": "Issue Date",
  "建筑名称": "Samuel Macalister sample house design",
  "项目编号": "001-00",
  "组织名称": "Autodesk"
}  
#创建子文档
PUT test_revit_project_index/project/element_1?routing=project_1
{
  "project_element_relation": {
    "name": "element",
    "parent": "project_1"
  },
  "uniqueid": "203cff26-4c9d-4eb4-93e5-28d28a01f256-0002b2a4",
  "name": "Generic 150mm",
  "类型 ID": "e3e052f9-0156-11d5-9301-0000863f27ad-00000153",
  "图像": "INVALID",
  "拆除的阶段": "INVALID",
  "标高": "Level 1",
  "体积": "15.89 m³",
  "类别": "OST_Floors",
  "族": "Generic 150mm",
  "族名称": "楼板",
  "注释": "",
  "启用分析模型": "False",
  "创建的阶段": "Working Drawings",
  "厚度": "150",
  "周长": "48000",
  "族与类型": "Generic 150mm",
  "设计选项": "INVALID",
  "结构": "False",
  "房间边界": "True",
  "自标高的高度偏移": "0",
  "面积": "106 m²",
  "类型": "Generic 150mm",
  "类型名称": "Generic 150mm",
  "标记": "",
  "底部高程": "-150",
  "坡度": "0.00°",
  "顶部高程": "0",
  "与体量相关": "False",
  "类别名称": "楼板"
}
PUT test_revit_project_index/project/element_2?routing=project_1
{
  "project_element_relation": {
    "name": "element",
    "parent": "project_1"
  },
  "uniqueid": "ef57b02a-5e81-49e7-93bb-ae5f002d921c-00030826",
  "name": "SIP 202mm Wall - conc clad",
  "族与类型": "SIP 202mm Wall - conc clad",
  "与体量相关": "False",
  "类型": "SIP 202mm Wall - conc clad",
  "类型 ID": "c85e5be0-d8d5-4148-836f-b55e711ef373-00068b9b",
  "底部延伸距离": "0",
  "结构": "False",
  "顶部约束": "Roof Line",
  "创建的阶段": "Working Drawings",
  "类别": "OST_Walls",
  "已附着顶部": "False",
  "类型名称": "SIP 202mm Wall - conc clad",
  "定位线": "",
  "结构用途": "",
  "面积": "22 m²",
  "无连接高度": "3300",
  "顶部延伸距离": "0",
  "底部偏移": "-300",
  "族": "SIP 202mm Wall - conc clad",
  "体积": "4.52 m³",
  "设计选项": "INVALID",
  "顶部偏移": "0",
  "底部约束": "Level 2",
  "族名称": "基本墙",
  "拆除的阶段": "INVALID",
  "启用分析模型": "False",
  "标记": "",
  "注释": "",
  "图像": "INVALID",
  "房间边界": "True",
  "已附着底部": "False",
  "长度": "6202",
  "类别名称": "墙"
}
# parent_id查询：返回某父文档的子文档
GET test_revit_project_index/_search
{
  "query": {
    "parent_id":{
      "type": "element",
      "id": "project_1"
    }
  }
}       
# has_child查询：返回包含某子文档的父文档
GET test_revit_project_index/_search
{
  "query": {
    "has_child": {
      "type": "element",
      "query": {
        "match": {
          "族名称": "基本墙"
        }
      }
    }
  }
} 
# has_parent查询：返回包含某父文档的子文档
GET test_revit_project_index/_search
{
  "query": {
    "has_parent": {
      "parent_type": "project",
      "query": {
        "match": {
          "组织名称": "Autodesk"
        }
      }
    }
  }
}           



# REVIT-第三版
# REVIT-创建索引test_revit_model_index
PUT test_revit_model_index
{
  "settings":{
    "number_of_shards": 5,
    "number_of_replicas": 1
  }
}
PUT test_lib
{
  "settings":{
    "mapper": false
  }
}

# REVIT-添加映射
PUT test_revit_model_index/revit_project/_mappings?include_type_name=true
{
  "properties": {
    "relations": {
      "properties": {
        "level_": {
          "type": "keyword"
        },
        "project_": {
          "type": "keyword"
        }
      }
    },
    "project_info": {
      "properties": {
        "dynamic" : false,
        "file name": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "file path": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "组织描述": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "项目发布日期": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "设计选项": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "建筑名称": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "客户姓名": {
          "type": "keyword"
        },
        "组织名称": {
          "type": "keyword"
        },
        "作者": {
          "type": "keyword"
        },
        "项目状态": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "项目名称": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "项目编号": {
          "type": "keyword"
        },
        "项目地址": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        }
      }
    },
    "type_info": {
      "properties": {
        "uniqueid": {
          "type": "keyword"
        },
        "name": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "类型": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "类型名称": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "族名称": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "族 ID": {
          "type": "keyword"
        },
        "类别": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "类别名称": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        }
      }
    },
    "element_info": {
      "properties": {
        "uniqueid": {
          "type": "keyword"
        },
        "name": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "类型": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "类型名称": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "类型 ID": {
          "type": "keyword"
        },
        "族": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "族名称": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "族 ID": {
          "type": "keyword"
        },
        "类别": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "类别名称": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        }
      }
    }
  }
}
PUT test_revit_model_index/revit_project/project_1
{
  "relations": {
    "level_": "project"
  },
  "project_info": {
    "file name": "rac_basic_sample_project.rvt",
    "file path": """E:\\cbim_revit_batch\\resource\\unexportedfile\\1""",
    "类别": "OST_ProjectInformation",
    "类型名称": "",
    "项目状态": "Project Status",
    "项目名称": "Sample House",
    "族名称": "",
    "项目地址": "Enter address here",
    "线路分析设置": "",
    "作者": "Samuel Macalister",
    "组织描述": "",
    "客户姓名": "Autodesk",
    "设计选项": "INVALID",
    "能量设置": "",
    "项目发布日期": "Issue Date",
    "建筑名称": "Samuel Macalister sample house design",
    "项目编号": "001-00",
    "组织名称": "Autodesk"
  }
}
PUT test_revit_model_index/revit_project/type_1?routing=project_1
{
  "relations": {
    "level_": "type",
    "project_": "project_1"
  },
  "type_info": {
    "uniqueid": "e3e052f9-0156-11d5-9301-0000863f27ad-00000153",
    "name": "Generic 150mm",
    "粗略比例填充颜色": "",
    "热质量": "0.00 kJ/K",
    "粗糙度": "",
    "功能": "",
    "部件说明": "",
    "默认的厚度": "150",
    "类型标记": "",
    "注释记号": "",
    "说明": "",
    "类别": "OST_Floors",
    "类型名称": "Generic 150mm",
    "结构": "",
    "热阻(R)": "0.0000 (m²·K)/W",
    "型号": "",
    "类型图像": "INVALID",
    "URL": "",
    "制造商": "",
    "成本": "0.00",
    "结构材质": "SH_resin Floor",
    "传热系数(U)": "0.0000 W/(m²·K)",
    "部件代码": "",
    "类型注释": "",
    "设计选项": "INVALID",
    "族名称": "楼板",
    "吸收率": "0.1",
    "粗略比例填充样式": "INVALID",
    "类别名称": "楼板"
  }
}
PUT test_revit_model_index/revit_project/type_1?routing=project_1
{
  "relations": {
    "level_": "type",
    "project_": "project_1"
  },
  "type_info": {
    "uniqueid": "c85e5be0-d8d5-4148-836f-b55e711ef373-00068b9b",
    "name": "SIP 202mm Wall - conc clad",
    "热阻(R)": "0.0210 (m²·K)/W",
    "类型标记": "WT1",
    "在插入点包络": "",
    "类型注释": "",
    "类别": "OST_Walls",
    "制造商": "",
    "粗略比例填充样式": "&lt;实体填充&gt;",
    "热质量": "3.09 kJ/K",
    "类型名称": "SIP 202mm Wall - conc clad",
    "结构": "",
    "防火等级": "",
    "成本": "0.00",
    "在端点包络": "",
    "类型图像": "INVALID",
    "URL": "",
    "部件说明": "",
    "吸收率": "0.1",
    "说明": "Structural Insulation Panel Wall with Kiln Dried Timber Panel Rainscreen",
    "族名称": "基本墙",
    "部件代码": "",
    "功能": "",
    "粗略比例填充颜色": "",
    "型号": "",
    "粗糙度": "",
    "设计选项": "INVALID",
    "厚度": "202",
    "传热系数(U)": "47.5455 W/(m²·K)",
    "结构材质": "Structure - Timber Insulated Panel - Insulation",
    "注释记号": "F10",
    "类别名称": "墙"
  }
}
PUT test_revit_model_index/revit_project/element_1?routing=project_1
{
  "relations": {
    "level_": "element",
    "project_": "project_1"
  },
  "element_info": {
    "uniqueid": "203cff26-4c9d-4eb4-93e5-28d28a01f256-0002b2a4",
    "name": "Generic 150mm",
    "类型 ID": "e3e052f9-0156-11d5-9301-0000863f27ad-00000153",
    "图像": "INVALID",
    "拆除的阶段": "INVALID",
    "标高": "Level 1",
    "体积": "15.89 m³",
    "类别": "OST_Floors",
    "族": "Generic 150mm",
    "族名称": "楼板",
    "注释": "",
    "启用分析模型": "False",
    "创建的阶段": "Working Drawings",
    "厚度": "150",
    "周长": "48000",
    "族与类型": "Generic 150mm",
    "设计选项": "INVALID",
    "结构": "False",
    "房间边界": "True",
    "自标高的高度偏移": "0",
    "面积": "106 m²",
    "类型": "Generic 150mm",
    "类型名称": "Generic 150mm",
    "标记": "",
    "底部高程": "-150",
    "坡度": "0.00°",
    "顶部高程": "0",
    "与体量相关": "False",
    "类别名称": "楼板"
  }
}
PUT test_revit_model_index/revit_project/element_2?routing=project_1
{
  "relations": {
    "level_": "element",
    "project_": "project_1"
  },
  "element_info": {
    "uniqueid": "ef57b02a-5e81-49e7-93bb-ae5f002d921c-00030826",
    "name": "SIP 202mm Wall - conc clad",
    "族与类型": "SIP 202mm Wall - conc clad",
    "与体量相关": "False",
    "类型": "SIP 202mm Wall - conc clad",
    "类型 ID": "c85e5be0-d8d5-4148-836f-b55e711ef373-00068b9b",
    "底部延伸距离": "0",
    "结构": "False",
    "顶部约束": "Roof Line",
    "创建的阶段": "Working Drawings",
    "类别": "OST_Walls",
    "已附着顶部": "False",
    "类型名称": "SIP 202mm Wall - conc clad",
    "定位线": "",
    "结构用途": "",
    "面积": "22 m²",
    "无连接高度": "3300",
    "顶部延伸距离": "0",
    "底部偏移": "-300",
    "族": "SIP 202mm Wall - conc clad",
    "体积": "4.52 m³",
    "设计选项": "INVALID",
    "顶部偏移": "0",
    "底部约束": "Level 2",
    "族名称": "基本墙",
    "拆除的阶段": "INVALID",
    "启用分析模型": "False",
    "标记": "",
    "注释": "",
    "图像": "INVALID",
    "房间边界": "True",
    "已附着底部": "False",
    "长度": "6202",
    "类别名称": "墙"
  }
}




# 多字段查询
GET test_lib/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "relations.level_": "element"
          }
        },
        {
          "term": {
            "element_info.类型名称.keyword": "基础底板250"
          }
        }
      ]
    }
  },
  "size": 10,
  "sort": [
    {
      "_id": {
        "order": "desc"
      }
    }
  ]
}
# 通配符查询
GET test_lib/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "relations.level_": "element"
          }
        },
        {
          "wildcard": {
            "element_info.族": {
              "value": "?墙"
            }
          }
        }
      ]
    }
  }
}

GET test_lib/_search
{
    "aggs":{
        "group_by_type":{
            "terms":{
                "field":"element_info.族.keyword"
            }
        }
    }
}

# 复制索引
POST _reindex
{
  "source": {
    "index": "test_lib"
  },
  "dest": {
    "index": "test"
  }
}

GET /test_revit_model_index/_search
{
  "query":{
    "match_all": {}
  }
}

PUT lib_/_doc/1
{
  "group" : "1",
  "user" : [ 
    {
      "first" : "John",
      "last" :  "Smith"
    },
    {
      "first" : "Alice",
      "last" :  "White"
    }
  ]
}

GET lib_/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "match": {"user.first": "Alice" }
        },
        {
          "match": {"user.last": "Smith" }
        }
      ]
    }
  }
}

PUT lib_
{
  "mappings": {
    "_doc": {
      "properties": {
        "group": {
          "type": "long"
        },
        "user": {
          "type": "nested",
          "properties": {
            "first": {
              "type": "text"
            },
            "last": {
              "type": "text"
            }
          }
        }
      }
    }
  }
}

GET lib_/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "nested": {
            "path": "user",
            "query": {
              "match": {
                "user.first": "Alice"
              }
            }
          }
        },
        {
          "match": {
            "group": 1
          }
        }
      ]
    }
  }
}



GET test_revit_model_index/_search
{
  "query":{
    "bool": {
      "must":[
        {"match": {"relations.project_": "project_00000009"}},
        {"match": {"element_info.类别名称": "窗"}}
        ]
    }
  }
}


PUT lib
{
  "mappings": {
    "person": {
      "properties": {
        "id": {
          "type": "integer"
        },
        "name": {
          "type": "text"
        }
      }
    }
  }
}

POST lib/person/1
{
  "id":1,
  "name": "alice"
}

PUT lib/person/_mappings
{
  "properties": {
    "id": {
      "type": "integer"
    },
    "name": {
      "type": "text"
    }
  }
}

POST test_lib/_delete_by_query
{
  "query":{
    "match_all": {}
  }
}

# 聚合查询 bucket
GET test_lib/revitproject/_search
{
  "query": {
    "nested": {
      "path": "elementInfo",
      "query": {
        "bool": {
          "must": [
            {
              "term": {
                "elementInfo.category.keyword": "墙"
              }
            }
          ]
        }
      }
    }
  },
  "aggs": {
    "tmp": {
      "nested": {
        "path": "elementInfo"
      },
      "aggs": {
        "count": {
          "terms": {
            "field": "elementInfo.type.keyword"
          }
        }
      }
    }
  }
}


GET test_lib/_search
{
  "query":{
    "match": {
      "level": "project"
    }
  }
}

# PUT会全部更新 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
#PUT test_lib/revitproject/FuMtqHYBgagOUDpHMAIT
#{
#  "projectInfo":{
#    "addr":{
#      "lat": 39.91600036621092,
#      "lon": 116.43299865722656
#    }
#  }
#}

# 局部更新
POST test_lib/revitproject/9tdV9HYBNbQfTs3sBKPm/_update
{
  "projectInfo": {
      "filePath": "02\\ 清华大学深圳国际校区\\02-初步设计\\02-建筑\\02-建筑\\20190122建筑提图\\B座"}
}


GET test_revit_model_index/revitproject/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "nested": {
            "path": "projectInfo",
            "query": {
              "match": {
                "projectInfo.filePath": "02 清华大学深圳国际校区\\02-初步设计\\02-建筑\\A座"
              }
            }
          }
        },
        {
          "match_phrase_prefix": {
            "ownerProject": "18172-A-AR&ST-F1~RF-curtain wall center_1222"
          }
        },
        {
          "term": {
            "level": "project"
          }
        }
      ]
    }
  }
}
POST test_revit_model_index/revitproject/_delete_by_query
{
  "query": {
    "term": {
      "ownerProject": {
        "value": "遂宁宋瓷文化中心土建模型_已分离.rvt"
      }
    }
  }
}
```



```kibana
/*7.10.0*/

# 查询所有“规范”
GET book/_search
{
  "query": {
    "match": {
      "tags": "规范"
    }
  }
}

# 查询所有“抗渗等级”的参数
GET book/_search
{
  "query": {
    "term": {
      "key.keyword": "抗渗等级"
    }
  }
}

# 查询所有标签为“门窗”的参数
GET book/_search
{
  "query": {
    "match_phrase": {
      "tags": "门窗"
    }
  }
}

# 查询“K建施”+“门窗”+“材料”的参数值
GET book/_search
{
  "query": {
    "bool":{
      "must": [
        {"match_phrase":{"belongs": "K建施"}},
        {"match_phrase":{"key": "门窗"}},
        {"match_phrase":{"key": "材料"}}
      ]
    }
  }
}




#Parent/Child
#创建索引
PUT blog_index_parent_child
{
  "mappings": {
    "doc":{
      "properties": {
        "join":{
          "type": "join",
          "relations":{
            "blog":"comment"
          }
        }
      }
    }
  }
}
#创建父文档
PUT blog_index_parent_child/doc/1
{
  "title":"blog",
  "join":"blog"
}  
#创建子文档
PUT blog_index_parent_child/doc/comment-1?routing=1
{
  "comment":"comment world",
  "join":{
    "name":"comment",
    "parent":1
  }
}
# parent_id查询：返回某父文档的子文档
GET blog_index_parent_child/_search
{
  "query": {
    "parent_id":{
      "type":"comment",
      "id":"1"
    }
  }
}       
# has_child查询：返回包含某子文档的父文档
GET blog_index_parent_child/_search
{
  "query": {
    "has_child": {
      "type": "comment",
      "query": {
        "match": {
          "comment": "world"
        }
      }
    }
  }
} 
# has_parent查询：返回包含某父文档的子文档
GET blog_index_parent_child/_search
{
  "query": {
    "has_parent": {
      "parent_type": "blog",
      "query": {
        "match": {
          "title": "blog"
        }
      }
    }
  }
} 



PUT /company?include_type_name=true

PUT /company/_mappings?include_type_name=true
{
  "_doc": {
    "properties": {
      "branch": {},
      "employee": {
        "_parent": {
          "type": "branch"
        }
      }
    }
  }
}


DELETE test_revit_model_index
GET test_revit_model_index/_mapping
# REVIT-创建索引test_revit_model_index
PUT test_revit_model_index
{
  "settings":{
    "number_of_shards": 5,
    "number_of_replicas": 1
  }
}

# REVIT-添加映射
PUT test_revit_model_index/revit_project/_mappings?include_type_name=true
{
  "properties": {
    "relations": {
      "type": "nested",
      "properties": {
        "level_": {
          "type": "keyword"
        },
        "project_": {
          "type": "keyword"
        }
      }
    },
    "project_info": {
      "type": "nested",
      "properties": {
        "file name": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "file path": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "组织描述": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "项目发布日期": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "设计选项": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "建筑名称": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "客户姓名": {
          "type": "keyword"
        },
        "组织名称": {
          "type": "keyword"
        },
        "作者": {
          "type": "keyword"
        },
        "项目状态": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "项目名称": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "项目编号": {
          "type": "keyword"
        },
        "项目地址": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        }
      }
    },
    "type_info": {
      "type": "nested",
      "properties": {
        "uniqueid": {
          "type": "keyword"
        },
        "name": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "类型": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "类型名称": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "族名称": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "族 ID": {
          "type": "keyword"
        },
        "类别": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "类别名称": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        }
      }
    },
    "element_info": {
      "type": "nested",
      "properties": {
        "uniqueid": {
          "type": "keyword"
        },
        "name": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "类型": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "类型名称": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "类型 ID": {
          "type": "keyword"
        },
        "族": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "族名称": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "族 ID": {
          "type": "keyword"
        },
        "类别": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        },
        "类别名称": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword"
            }
          }
        }
      }
    }
  }
}
PUT test_revit_model_index/revit_project/project_1
{
  "relations": {
    "level_": "project"
  },
  "project_info": {
    "file name": "rac_basic_sample_project.rvt",
    "file path": """E:\\cbim_revit_batch\\resource\\unexportedfile\\1""",
    "类别": "OST_ProjectInformation",
    "类型名称": "",
    "项目状态": "Project Status",
    "项目名称": "Sample House",
    "族名称": "",
    "项目地址": "Enter address here",
    "线路分析设置": "",
    "作者": "Samuel Macalister",
    "组织描述": "",
    "客户姓名": "Autodesk",
    "设计选项": "INVALID",
    "能量设置": "",
    "项目发布日期": "Issue Date",
    "建筑名称": "Samuel Macalister sample house design",
    "项目编号": "001-00",
    "组织名称": "Autodesk"
  }
}
PUT test_revit_model_index/revit_project/type_1?routing=project_1
{
  "relations": {
    "level_": "type",
    "project_": "project_1"
  },
  "type_info": {
    "uniqueid": "e3e052f9-0156-11d5-9301-0000863f27ad-00000153",
    "name": "Generic 150mm",
    "粗略比例填充颜色": "",
    "热质量": "0.00 kJ/K",
    "粗糙度": "",
    "功能": "",
    "部件说明": "",
    "默认的厚度": "150",
    "类型标记": "",
    "注释记号": "",
    "说明": "",
    "类别": "OST_Floors",
    "类型名称": "Generic 150mm",
    "结构": "",
    "热阻(R)": "0.0000 (m²·K)/W",
    "型号": "",
    "类型图像": "INVALID",
    "URL": "",
    "制造商": "",
    "成本": "0.00",
    "结构材质": "SH_resin Floor",
    "传热系数(U)": "0.0000 W/(m²·K)",
    "部件代码": "",
    "类型注释": "",
    "设计选项": "INVALID",
    "族名称": "楼板",
    "吸收率": "0.1",
    "粗略比例填充样式": "INVALID",
    "类别名称": "楼板"
  }
}
PUT test_revit_model_index/revit_project/type_1?routing=project_1
{
  "relations": {
    "level_": "type",
    "project_": "project_1"
  },
  "type_info": {
    "uniqueid": "c85e5be0-d8d5-4148-836f-b55e711ef373-00068b9b",
    "name": "SIP 202mm Wall - conc clad",
    "热阻(R)": "0.0210 (m²·K)/W",
    "类型标记": "WT1",
    "在插入点包络": "",
    "类型注释": "",
    "类别": "OST_Walls",
    "制造商": "",
    "粗略比例填充样式": "&lt;实体填充&gt;",
    "热质量": "3.09 kJ/K",
    "类型名称": "SIP 202mm Wall - conc clad",
    "结构": "",
    "防火等级": "",
    "成本": "0.00",
    "在端点包络": "",
    "类型图像": "INVALID",
    "URL": "",
    "部件说明": "",
    "吸收率": "0.1",
    "说明": "Structural Insulation Panel Wall with Kiln Dried Timber Panel Rainscreen",
    "族名称": "基本墙",
    "部件代码": "",
    "功能": "",
    "粗略比例填充颜色": "",
    "型号": "",
    "粗糙度": "",
    "设计选项": "INVALID",
    "厚度": "202",
    "传热系数(U)": "47.5455 W/(m²·K)",
    "结构材质": "Structure - Timber Insulated Panel - Insulation",
    "注释记号": "F10",
    "类别名称": "墙"
  }
}
PUT test_revit_model_index/revit_project/element_1?routing=project_1
{
  "relations": {
    "level_": "element",
    "project_": "project_1"
  },
  "element_info": {
    "uniqueid": "203cff26-4c9d-4eb4-93e5-28d28a01f256-0002b2a4",
    "name": "Generic 150mm",
    "类型 ID": "e3e052f9-0156-11d5-9301-0000863f27ad-00000153",
    "图像": "INVALID",
    "拆除的阶段": "INVALID",
    "标高": "Level 1",
    "体积": "15.89 m³",
    "类别": "OST_Floors",
    "族": "Generic 150mm",
    "族名称": "楼板",
    "注释": "",
    "启用分析模型": "False",
    "创建的阶段": "Working Drawings",
    "厚度": "150",
    "周长": "48000",
    "族与类型": "Generic 150mm",
    "设计选项": "INVALID",
    "结构": "False",
    "房间边界": "True",
    "自标高的高度偏移": "0",
    "面积": "106 m²",
    "类型": "Generic 150mm",
    "类型名称": "Generic 150mm",
    "标记": "",
    "底部高程": "-150",
    "坡度": "0.00°",
    "顶部高程": "0",
    "与体量相关": "False",
    "类别名称": "楼板"
  }
}
PUT test_revit_model_index/revit_project/element_2?routing=project_1
{
  "relations": {
    "level_": "element",
    "project_": "project_1"
  },
  "element_info": {
    "uniqueid": "ef57b02a-5e81-49e7-93bb-ae5f002d921c-00030826",
    "name": "SIP 202mm Wall - conc clad",
    "族与类型": "SIP 202mm Wall - conc clad",
    "与体量相关": "False",
    "类型": "SIP 202mm Wall - conc clad",
    "类型 ID": "c85e5be0-d8d5-4148-836f-b55e711ef373-00068b9b",
    "底部延伸距离": "0",
    "结构": "False",
    "顶部约束": "Roof Line",
    "创建的阶段": "Working Drawings",
    "类别": "OST_Walls",
    "已附着顶部": "False",
    "类型名称": "SIP 202mm Wall - conc clad",
    "定位线": "",
    "结构用途": "",
    "面积": "22 m²",
    "无连接高度": "3300",
    "顶部延伸距离": "0",
    "底部偏移": "-300",
    "族": "SIP 202mm Wall - conc clad",
    "体积": "4.52 m³",
    "设计选项": "INVALID",
    "顶部偏移": "0",
    "底部约束": "Level 2",
    "族名称": "基本墙",
    "拆除的阶段": "INVALID",
    "启用分析模型": "False",
    "标记": "",
    "注释": "",
    "图像": "INVALID",
    "房间边界": "True",
    "已附着底部": "False",
    "长度": "6202",
    "类别名称": "墙"
  }
}

GET test_revit_model_index/_search
{
  "query": {
    "match_phrase": {
      "relations.level_": "project"
    }
  }
}
















## 解决集群黄色状态的方法
# 删除已有的分片
PUT /test/_settings
{
  "number_of_replicas": 0
}

# 重新添加副分片
PUT /test/_settings
{
  "number_of_replicas": 1
}

# 创建索引
PUT book

## 更新索引
# 修改索引副本数
PUT book/_settings
{
  "number_of_replicas": 2
}
# 向索引中写入文档
POST book/_doc
{
  "title": "三国",
  "price": 35.5
}
PUT book/_doc/2
{
  "title": "三国",
  "price": 35.5
}
# 修改索引的读写权限
# 关闭索引写权限
PUT book/_settings
{
  "blocks.write": false
}
# 查看索引
GET book/_settings
GET test,book/_settings
GET _all/_settings
# 删除索引
DELETE test
# 关闭索引
POST book/_close
# 开启索引
POST book/_open
# 复制索引
POST _reindex
{
  "source": {"index": "book", "query": {"match_all": {}}},
  "dest": {"index": "book_new"}
}
# 为索引创建别名
POST /_aliases
{
  "actions": [
    {
      "add": {
        "index": "book_new",
        "alias": "book_alias"
      }
    }
  ]
}
# 移除别名
POST /_aliases
{
  "actions": [
    {
      "add": {
        "index": "book_new",
        "alias": "book_alias"
      }
    }
  ]
}
# 查看索引的别名
GET book/_alias
# 查看别名对应的索引
GET book_alias/_alias
# 查看所有别名
GET _alias

# 获取文档内容
GET book/_doc/1
# 检测文档是否存在
HEAD book/_doc/1
HEAD book/_doc/3
# 批量获取
GET book/_mget
{
  "ids": ["1", "2"]
}
POST book/_mget
{
  "ids": ["1", "2"]
}
# 更新文档
PUT book/_doc/1
{
  "title": "基督山伯爵"
}
# 更新字段
POST book/_update/1
{
  "script": {
    "lang": "painless",
    "source": "ctx._source.title=params.title",
    "params": {
      "title": "新三国"
    }
  }
}
# 添加字段
POST book/_update/1
{
  "script": {
    "lang": "painless",
    "source": "ctx._source.tags=[\"chinese\",\"gongfu story\"]"
  }
}
POST book/_update/1
{
  "script": {
    "lang": "painless",
    "source": "ctx._source.tags.add(params.author)",
    "params": {
      "author": "金庸"
    }
  }
}
GET book/_doc
# 使用if else进行复杂更新
POST book/_update/1
{
  "script": {
    "lang": "painless",
    "source": "if (ctx._source.tags.contains(\"金庸\")){ctx.op=\"delete\"}else{ctx.op=\"none\"}"
  }
}

# 查询更新
POST book/_update_by_query
{
  "script": {
    "source": "ctx._source.price=60",
    "lang": "painless"
  },
  "query": {
    "match_phrase": {
      "title": "三国"
    }
  }
}

# 删除文档
DELETE book/_doc/Ml9Y2XUBelQ1hsr8JiV9
# 删除某一索引下所有文档
POST book_new/_delete_by_query
{
  "query": {
    "match_all": {}
  }
}

DELETE user/_doc/XeCK33UBhyoo4CL1GwnB

GET default/_mapping
GET user/_settings
PUT project01/_settings
{
  "mapping.total_fields.limit":30000
}

PUT /project01 
{
  "settings":{
    "number_of_shards": "5",
    "number_of_replicas": "1",
    "refresh_interval":"30s"
  }
}


















DELETE revit_model_index
PUT revit_model_index/revitproject/_mapping?include_type_name=true
{
  "properties": {
    "elementInfo": {
      "properties": {
        "category": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        },
        "categoryName": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        },
        "familyId": {
          "type": "keyword"
        },
        "familyName": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        },
        "familyType": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        },
        "id": {
          "type": "keyword"
        },
        "name": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        },
        "otherProps": {
          "type": "text"
        },
        "typeId": {
          "type": "keyword"
        },
        "typeName": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        }
      }
    },
    "level": {
      "type": "keyword"
    },
    "ownerProject": {
      "type": "keyword"
    },
    "projectInfo": {
      "properties": {
        "address": {
          "type": "geo_point"
        },
        "buildingType": {
          "type": "keyword"
        },
        "elevation": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        },
        "fileName": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        },
        "filePath": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        },
        "id": {
          "type": "keyword"
        },
        "issueDate": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        },
        "major": {
          "type": "keyword"
        },
        "name": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        },
        "number": {
          "type": "keyword"
        },
        "otherProps": {
          "type": "text"
        },
        "placeName": {
          "type": "keyword"
        },
        "status": {
          "type": "keyword"
        },
        "subName": {
          "type": "keyword"
        },
        "subNumber": {
          "type": "keyword"
        },
        "timeZone": {
          "type": "keyword"
        }
      }
    }
  }
}

POST _reindex?timeout=10m
{
  "source": {
    "index": "test_revit_model_index"
  },
  "dest": {
    "index": "revit_model_index"
  }
}

POST _reindex?timeout=10m
{
  "source": {
    "index": "revit_model_index"
  },
  "dest": {
    "index": "test_revit_model_index",
    "op_type": "create"
  }
}


GET revit_model_index/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "nested": {
            "path": "projectInfo",
            "query": {
              "bool": {
                "must": [
                  {
                    "term": {
                      "projectInfo.filePath.keyword": "02 清华大学深圳国际校区\\02-初步设计\\02-建筑\\02-建筑\\20190122建筑提图\\B座"
                    }
                  },
                  {
                    "match_phrase_prefix": {
                      "projectInfo.fileName": "18172-B-AR&ST-F1~RF-center_A-yanxt_0122提资（房间名称更新）"
                    }
                  }
                ]
              }
            }
          }
        },
        {
          "term": {
            "level": "project"
          }
        }
      ]
    }
  }
}

GET test_revit_model_index/_search
{
  "query": {
    "term": {
      "elementInfo.familyType.keyword": {
        "value": "Other"
      }
    }
  }, 
  "aggs": {
    "category_count": {
      "terms": {
        "field": "elementInfo.categoryName.keyword"
      }
    }
  }
}

POST test_revit_model_index/_search
{
  "query": {
    "bool": {
      "must": {
        "exists": {
          "field": "elementInfo.familyType"
        }
      }
    }
  },
  "size": 1
}

# filters方法指定bucket名，并指定其余标签名为other_family
GET test_revit_model_index/_search
{
  "aggs": {
    "category": {
      "filters": {
         "other_bucket_key": "other_family",
        "filters": {
          "wall" : {"match":{"elementInfo.familyName":"墙"}},
          "door" : {"match":{"elementInfo.familyName":"门"}}
        }
      }
    }
  }
}
# 匿名filters
GET test_revit_model_index/_search
{
  "aggs": {
    "category": {
      "filters": {
        "filters": [
          {"match":{"elementInfo.familyName":"墙"}},
          {"match":{"elementInfo.familyName":"门"}}
        ]
      }
    }
  }
}

# 默认情况下，距离单位为m(米)，但也可以接受:mi(英里)，in(英寸)，yd(码)，km(千米)，cm(厘米)，mm(毫米)。
GET revit_model_index/_search
{
  "aggs": {
    "rings_around_beijing": {
      "nested": {
        "path": "projectInfo"
      },
      "aggs": {
        "NAME": {
          "geo_distance": {
            "field": "projectInfo.address",
            "origin": "116.433, 39.916",
            "unit": "km",
            "ranges": [
              {
                "to": 3000
              },
              {
                "from": 3000,
                "to": 7000
              },
              {
                "from": 7000
              }
            ]
          }
        }
      }
    }
  }
}
GET revit_model_index/_search
{
  "aggs": {
    "rings_around_beijing": {
      "nested": {
        "path": "projectInfo"
      },
      "aggs": {
        "NAME": {
          "geo_distance": {
            "field": "projectInfo.address",
            "origin": "116.433, 39.916",
            "unit": "km",
            "ranges": [
              {
                "to": 3000,
                "key": "first_ring"
              },
              {
                "from": 3000,
                "to": 7000,
                "key": "second_ring"
              },
              {
                "from": 7000,
                "key": "third_ring"
              }
            ],
            "keyed": true
          }
        }
      }
    }
  }
}

GET revit_model_index/_search
{
  "aggs": {
    "category_count": {
      "nested": {
        "path": "elementInfo"
      },
      "aggs": {
        "category_count": {
          "terms": {
            "field": "elementInfo.category"
          },
          "aggs": {
            "familyType_count": {
              "nested": {
                "path": "elementInfo"
              },
              "aggs": {
                "familyType_count": {
                  "terms": {
                    "field": "elementInfo.familyType"
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

```

