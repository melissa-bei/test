```
/*7.x*/
DELETE revit_model_index*
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
    "large-grid": {
      "nested": {
        "path": "projectInfo"
      },
      "aggs": {
        "NAME": {
          "geohash_grid": {
            "field": "projectInfo.address",
            "precision": 5
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

GET revit_model_index/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "level": "element"
          }
        },
        {
          "nested": {
            "path": "projectInfo",
            "query": {
              "term": {
                "projectInfo.major": "A"
              }
            }
          }
        }
      ]
    }
  }, 
  "aggs": {
    "BuildingType_count": {
      "nested": {
        "path": "projectInfo"
      },
      "aggs": {
        "count": {
          "terms": {
            "field": "projectInfo.major"
          },
          "aggs": {
            "Major_count": {
              "nested": {
                "path": "projectInfo"
              },
              "aggs": {
                "count": {
                  "terms": {
                    "field": "projectInfo."
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


GET test/_search
{
  "query": {
    "has_parent": {
      "parent_type": "project",
      "query": {
        "match_phrase_prefix": {
          "ownerProject": "18172-B-AR&ST-F1~RF-center_A-yanxt_0122提资（房间名称更新）"
        }
      }
    }
  },
  "aggs": {
    "AGG_category": {
      "terms": {
        "field": "category",
        "size": 10
      }
    }
  }
}


POST test_p&c_revit_model/_search
{
  "query": {
    "has_parent": {
      "parent_type": "project",
      "query": {
        "match": {
          "ownerProject": {
            "query": "福州地铁站",
            "operator": "and"
          }
        }
      }
    }
  },
  "aggs": {
    "to-category": {
      "terms": {
        "field": "category",
        "size": 10
      },
      "aggs": {
        "top-familyName": {
          "terms": {
            "field": "familyName.keyword",
            "size": 10
          }
        }
      }
    }
  }
}
POST test_p&c_revit_model/_search
{
  "query": {
    "term": {
      "level": {
        "value": "project"
      }
    }
  }
}


























































GET _analyze
{
  "text": ["TL_center_gallery.rvt"]
}
GET _analyze
{
  "text": ["08-石溪地铁站"]
}





GET test_revit_model_index/_search
{
  "query": {
    "bool": {
      "filter": {
        "has_child": {
          "type": "element",
          "query": {
            "match_all": {}
          }
        }
      },
      "must": [
        {
          "bool": {
            "should": [
              {
                "match_phrase_prefix": {
                  "fileName": {
                    "query": "170215-CD-AS-CENTRAL"
                  }
                }
              }
            ]
          }
        }
      ]
    }
  }
}


GET test_revit_model_index/_search
{
  "query": {
    "function_score": {
      "query": {
        "bool": {
          "filter": {
            "has_child": {
              "type": "element",
              "query": {
                "match_all": {}
              }
            }
          },
          "must": [
            {
              "match": {
                "fileName": {
                  "query": "170215-CD-AS-CENTRAL",
                  "operator": "and"
                }
              }
            },
            {
              "match_phrase": {
                "filePath": "03 大运河孔雀城英国宫五期幼儿园\\03-施工图设计\\02-建筑"
              }
            }
          ]
        }
      },
      "functions": [
        {
          "script_score": {
            "script": {
              "lang": "painless",
              "source": "_score / doc['fileName'].length()"
            }
          }
        }
      ],
      "boost_mode": "replace"
    }
  }
}

POST test_revit_model_index/_update/a13729b3-25ab-4af4-b25d-8fe4bae9865f
{
  "ownerProject": "",
  "filePath": """04 xxx-通辽蒙古族服饰博物馆、通辽美术馆\03-施工图设计\美术馆\02-建筑""",
  "elevation": "180",
  "address": {
    "lat": 39.916,
    "lon": 116.433
  },
  "id": "a13729b3-25ab-4af4-b25d-8fe4bae9865f",
  "timeZone": "8",
  "status": "",
  "placeName": "北京，中国",
  "issueDate": "2014.04",
  "otherProps": """{"PROJECT_ADDRESS":"请在此处输入地址","PROJECT_ISSUE_DATE":"2014.04","PROJECT_NUMBER":"14031","CLIENT_NAME":"客户名称"}""",
  "level": "project",
  "fileName": "TL_center_gallery_已分离.rvt",
  "myJoinField": "project"
}



GET test_revit_model_index/_search
{
  "query": {
    "has_child": {
      "type": "element",
      "query": {
        "multi_match": {
          "query": "双开 门",
          "operator": "and",
          "fields": ["name", "familyName", "categoryName", "typeName"]
        }
      }
    }
  },
  "aggs": {
    "all": {
      "children": {
        "type": "element"
      },
      "aggs": {
        "fileAGG": {
          "terms": {
            "field": "fileName.keyword",
            "size": 10
          },
          "aggs": {
            "category": {
              "terms": {
                "field": "categoryName.keyword",
                "size": 10
              },
              "aggs": {
                "faily": {
                  "terms": {
                    "field": "familyName.keyword",
                    "size": 10
                  }
                },
                "type":{
                  "terms": {
                    "field": "typeName.keyword",
                    "size": 10
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


GET test_revit_model_index/_search
{
  "query": {
    "bool": {
      "minimum_should_match": 1, 
      "must": [
        {
          "has_parent": {
            "parent_type": "project",
            "query": {
              "match_all": {}
            }
          }
        }
      ],
      "should": [
        {
          "match_phrase": {
            "name": "双开 门"
          }
        },
        {
          "match_phrase": {
            "familyName": "双开 门"
          }
        },
        {
          "match_phrase": {
            "categoryName": "双开 门"
          }
        },
        {
          "match_phrase": {
            "typeName": "双开 门"
          }
        }
      ]
    }
  },
  "sort": [
    {
      "_score": {
        "order": "asc"
      }
    }
  ], 
  "aggs": {
    "fileAGG": {
      "terms": {
        "field": "fileName.keyword",
        "size": 10
      },
      "aggs": {
        "category": {
          "terms": {
            "field": "categoryName.keyword",
            "size": 10
          },
          "aggs": {
            "faily": {
              "terms": {
                "field": "familyName.keyword",
                "size": 10
              }
            },
            "type": {
              "terms": {
                "field": "typeName.keyword",
                "size": 10
              }
            }
          }
        }
      }
    }
  }
}





GET test_revit_model_index/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "fileName.keyword": "18172-C-AR&ST-F1~RF-center_已分离.rvt"
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


POST test_revit_model_index/_update/f1e39e85-ce58-4547-bbdb-ef37674b5189?routing=f1e39e85-ce58-4547-bbdb-ef37674b5189
{
  "script": {
    "lang": "painless",
    "source": "ctx._source.fileName = '18172-C-AR&ST-F1~RF-center.rvt'"
  }
}




GET /_template/revit_model_template

PUT /_template/revit_model_template
{
  "template": "revit_model_index_*",
  "order": 1,
  "settings": {
    "number_of_shards": 1
  },
  "mappings": {
    "properties": {
      "address": {
        "type": "geo_point"
      },
      "buildingType": {
        "type": "keyword"
      },
      "category": {
        "type": "keyword"
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
      "elevation": {
        "type": "keyword"
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
        "type": "keyword"
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
      "level": {
        "type": "keyword"
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
      "ownerProject": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword",
            "ignore_above": 256
          }
        }
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
  }
}




GET /revit_model_index_0002/_doc/e75b2ff5-73b4-4f85-87db-1a0c83768455-00017813
GET /_analyze
{
  "text": ["18172-A-AR&ST-F1~RF-curtain wall center_1222.rvt", "18172-AR&ST-Axis&Redline-Center.rvt"]
}
POST /test_revit_model_index_*/_search?typed_keys=true
{
  "query": {
    "bool": {
      "filter": [
        {
          "term": {
            "level": {
              "value": "project"
            }
          }
        }
      ],
      "must": [
        {
          "match": {
            "fileName": {
              "operator": "and",
              "query": "2019-济南华侨城章丘住宅#-AS-UG-Center"
            }
          }
        },
        {
          "match": {
            "filePath": {
              "operator": "and",
              "query": """18-华侨城\01-建筑"""
            }
          }
        }
      ]
    }
  },
  "size": 1,
  "sort": [
    {
      "_score": {
        "order": "desc"
      }
    }
  ]
}

POST test_pc_model_index/_delete_by_query
{
  "query": {
    "term": {
      "typeName.keyword": {
        "value": "三维视图"
      }
    }
  }
}

GET test/_search?version=true
{
  "query": {
    "match": {
      "fileName": "18172-AR&ST-Axis&Redline-Center"
    }
  }
}

GET test_pc_model_index/_doc/99fa059e-daed-4ff8-8e2b-9dfe6e5a2ccb-0026a274?routing=dd8060e3-fd6e-42ad-b4dd-2746cf14188b

POST test_nested_revit_model_index/_delete_by_query
{
  "query": {
    "match_all": {}
  }
}
```



```
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

GET test_revit_model_index/_search
{
  "query": {
    "match": {
      "fileName": "_已分离"
    }
  }
}

POST test_revit_model_index/_update_by_query?conflicts=proceed
{
  "script": {
    "lang": "painless",
    "source": "ctx._source.fileName = '18172-B-AR&ST-F1~RF-Stairs&Elevator-center.rvt'"
  },
  "query": {
    "term": {
      "fileName.keyword":"18172-B-AR&ST-F1~RF-Stairs&Elevator-center_已分离.rvt"
    }
  }
}

POST /_reindex?wait_for_completion=false
{
  "dest": {
    "index": "test_lib"
  },
  "source": {
    "index": "test_revit_model_index"
  }
}




# 从element角度去检索
GET test_revit_model_index/_search?size=0
{
  "query": {
    "bool": {
      "minimum_should_match": 1, 
      "must": [
        {
          "has_parent": {
            "parent_type": "project",
            "query": {
              "match_all": {}
            }
          }
        }
      ],
      "should": [
        {
          "match_phrase": {
            "name": "双开 门"
          }
        },
        {
          "match_phrase": {
            "familyName": "双开 门"
          }
        },
        {
          "match_phrase": {
            "categoryName": "双开 门"
          }
        },
        {
          "match_phrase": {
            "typeName": "双开 门"
          }
        }
      ]
    }
  },
  "sort": [
    {
      "_score": {
        "order": "asc"
      }
    }
  ], 
  "aggs": {
    "fileAGG": {
      "terms": {
        "field": "fileName.keyword",
        "size": 10
      },
      "aggs": {
        "category": {
          "terms": {
            "field": "categoryName.keyword",
            "size": 10
          },
          "aggs": {
            "faily": {
              "terms": {
                "field": "familyName.keyword",
                "size": 10
              }
            },
            "type": {
              "terms": {
                "field": "typeName.keyword",
                "size": 10
              }
            }
          }
        }
      }
    }
  }
}

# 从element角度去检索
GET test_revit_model_index/_search?size=0
{
  "query": {
    "has_child": {
      "type": "element",
      "query": {
        "match_all": {}
      }
    }
  },
  "sort": [
    {
      "_score": {
        "order": "asc"
      }
    }
  ],
  "aggs": {
    "agg_project": {
      "terms": {
        "field": "ownerProject.keyword",
        "size": 10
      },
      "aggs": {
        "agg_element": {
          "children": {
            "type": "element"
          },
          "aggs": {
            "search": {
              "filters": {
                "filters": [
                  {
                    "match": {
                      "categoryName":{
                        "query":"门窗"
                      }
                    }
                  }
                ]
              },
              "aggs": {
                "agg_category": {
                  "terms": {
                    "field": "categoryName.keyword",
                    "size": 10
                  },
                  "aggs": {
                    "agg_family": {
                      "terms": {
                        "field": "familyName.keyword",
                        "size": 10
                      },
                      "aggs": {
                        "agg_type": {
                          "terms": {
                            "field": "typeName.keyword",
                            "size": 10
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
      }
    }
  }
}

# 从project角度去分析
GET test_revit_model_index/_search?size=0
{
  "query": {
    "has_child": {
      "type": "element",
      "query": {
        "match_all": {}
      }
    }
  },
  "sort": [
    {
      "_score": {
        "order": "asc"
      }
    }
  ],
  "aggs": {
    "agg_project": {
      "terms": {
        "field": "ownerProject.keyword",
        "size": 1
      },
      "aggs": {
        "agg_element": {
          "children": {
            "type": "element"
          },
          "aggs": {
            "agg_category": {
              "terms": {
                "field": "categoryName.keyword",
                "size": 1
              },
              "aggs": {
                "agg_family": {
                  "terms": {
                    "field": "familyName.keyword",
                    "size": 1
                  },
                  "aggs": {
                    "agg_type": {
                      "terms": {
                        "field": "typeName.keyword",
                        "size": 1
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
  }
}

GET /_cat/indices/test*
POST /test_pdf_index/_close

GET /_template/test_revit_model*
PUT /_template/test_revit_model_template
{
  "template": "revit_model_index_*", 
  "order":    1, 
  "settings": {
    "number_of_shards": 1,
    "number_of_replicas": 1
  },
  "mappings": {
    "revitmodel": {
      "properties": {
        "address": {
          "type": "geo_point"
        },
        "buildingType": {
          "type": "keyword"
        },
        "category": {
          "type": "keyword"
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
        "elevation": {
          "type": "keyword"
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
          "type": "keyword"
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
        "level": {
          "type": "keyword"
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
        "ownerProject": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
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
    }
  }
}

GET _template/revit_model*
DELETE test_revit_model_index_*

POST /test_revit_model_index_*/_search
{
  "query": {
    "bool": {
      "filter": [
        {
          "term": {
            "level": {
              "value": "project"
            }
          }
        }
      ],
      "must": [
        {
          "match": {
            "fileName": {
              "operator": "and",
              "query": "170215-CD-AS-CENTRAL"
            }
          }
        },
        {
          "match": {
            "filePath": {
              "operator": "and",
              "query": """03 大运河孔雀城英国宫五期幼儿园\03-施工图设计\02-建筑"""
            }
          }
        }
      ]
    }
  },
  "size": 1,
  "sort": [
    {
      "_score": {
        "order": "desc"
      }
    }
  ]
}

POST test_revit_model_index/_delete_by_query
{
  "query": {
    "term": {
      "typeName.keyword": {
        "value": "三维视图"
      }
    }
  }
}

GET test_revit_model_index_*/_search
{
  "size": 10,
  "query": {
    "match_all": {}
  },
  "sort": [
    {
      "_id": {
        "order": "asc"
      }
    }
  ],
  "search_after":["000bce23-aa01-4986-b99b-76d8d7d6752c-0016e22c"]
}

GET test_revit_model_index_*/_search?scroll=1m
{
  "size": 10,
  "query": {
    "match_all": {}
  }
}
POST /_search/scroll
{
  "scroll":"1m",
  "scroll_id": "DnF1ZXJ5VGhlbkZldGNoOQAAAAAAAuFcFjU3b2RJLWN1UWtxbjRIbGVNYXVkQXcAAAAAAALhYBY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC4V4WNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuFfFjU3b2RJLWN1UWtxbjRIbGVNYXVkQXcAAAAAAALhYhY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC4V0WNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuu1FkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALrthZFZ1JPbDBxeVFsR2NHc1hJVjY1TkN3AAAAAAAC4WQWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuu3FkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALhYxY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC4WEWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuu4FkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALruRZFZ1JPbDBxeVFsR2NHc1hJVjY1TkN3AAAAAAAC4WYWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuu6FkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALruxZFZ1JPbDBxeVFsR2NHc1hJVjY1TkN3AAAAAAAC4WUWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuu9FkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALrvBZFZ1JPbDBxeVFsR2NHc1hJVjY1TkN3AAAAAAAC4WcWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuu-FkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALrvxZFZ1JPbDBxeVFsR2NHc1hJVjY1TkN3AAAAAAAC4WkWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuFoFjU3b2RJLWN1UWtxbjRIbGVNYXVkQXcAAAAAAALhdRY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC4WsWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuvAFkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALrwRZFZ1JPbDBxeVFsR2NHc1hJVjY1TkN3AAAAAAAC68IWRWdST2wwcXlRbEdjR3NYSVY2NU5DdwAAAAAAAuvDFkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALhahY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC68QWRWdST2wwcXlRbEdjR3NYSVY2NU5DdwAAAAAAAuFxFjU3b2RJLWN1UWtxbjRIbGVNYXVkQXcAAAAAAALhbBY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC4W0WNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuFuFjU3b2RJLWN1UWtxbjRIbGVNYXVkQXcAAAAAAALhbxY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC4XAWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuFyFjU3b2RJLWN1UWtxbjRIbGVNYXVkQXcAAAAAAALrxRZFZ1JPbDBxeVFsR2NHc1hJVjY1TkN3AAAAAAAC4XMWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuvGFkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALhdBY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC4XYWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuF3FjU3b2RJLWN1UWtxbjRIbGVNYXVkQXcAAAAAAALheBY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC68gWRWdST2wwcXlRbEdjR3NYSVY2NU5DdwAAAAAAAuvHFkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALhexY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC4XkWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuvJFkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALhehY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC68oWRWdST2wwcXlRbEdjR3NYSVY2NU5DdwAAAAAAAuvLFkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALrzBZFZ1JPbDBxeVFsR2NHc1hJVjY1TkN3AAAAAAAC680WRWdST2wwcXlRbEdjR3NYSVY2NU5Ddw=="
}
DELETE /_search/scroll
{
    "scroll_id" : "DnF1ZXJ5VGhlbkZldGNoOQAAAAAAAuFcFjU3b2RJLWN1UWtxbjRIbGVNYXVkQXcAAAAAAALhYBY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC4V4WNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuFfFjU3b2RJLWN1UWtxbjRIbGVNYXVkQXcAAAAAAALhYhY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC4V0WNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuu1FkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALrthZFZ1JPbDBxeVFsR2NHc1hJVjY1TkN3AAAAAAAC4WQWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuu3FkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALhYxY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC4WEWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuu4FkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALruRZFZ1JPbDBxeVFsR2NHc1hJVjY1TkN3AAAAAAAC4WYWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuu6FkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALruxZFZ1JPbDBxeVFsR2NHc1hJVjY1TkN3AAAAAAAC4WUWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuu9FkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALrvBZFZ1JPbDBxeVFsR2NHc1hJVjY1TkN3AAAAAAAC4WcWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuu-FkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALrvxZFZ1JPbDBxeVFsR2NHc1hJVjY1TkN3AAAAAAAC4WkWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuFoFjU3b2RJLWN1UWtxbjRIbGVNYXVkQXcAAAAAAALhdRY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC4WsWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuvAFkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALrwRZFZ1JPbDBxeVFsR2NHc1hJVjY1TkN3AAAAAAAC68IWRWdST2wwcXlRbEdjR3NYSVY2NU5DdwAAAAAAAuvDFkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALhahY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC68QWRWdST2wwcXlRbEdjR3NYSVY2NU5DdwAAAAAAAuFxFjU3b2RJLWN1UWtxbjRIbGVNYXVkQXcAAAAAAALhbBY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC4W0WNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuFuFjU3b2RJLWN1UWtxbjRIbGVNYXVkQXcAAAAAAALhbxY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC4XAWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuFyFjU3b2RJLWN1UWtxbjRIbGVNYXVkQXcAAAAAAALrxRZFZ1JPbDBxeVFsR2NHc1hJVjY1TkN3AAAAAAAC4XMWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuvGFkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALhdBY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC4XYWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuF3FjU3b2RJLWN1UWtxbjRIbGVNYXVkQXcAAAAAAALheBY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC68gWRWdST2wwcXlRbEdjR3NYSVY2NU5DdwAAAAAAAuvHFkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALhexY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC4XkWNTdvZEktY3VRa3FuNEhsZU1hdWRBdwAAAAAAAuvJFkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALhehY1N29kSS1jdVFrcW40SGxlTWF1ZEF3AAAAAAAC68oWRWdST2wwcXlRbEdjR3NYSVY2NU5DdwAAAAAAAuvLFkVnUk9sMHF5UWxHY0dzWElWNjVOQ3cAAAAAAALrzBZFZ1JPbDBxeVFsR2NHc1hJVjY1TkN3AAAAAAAC680WRWdST2wwcXlRbEdjR3NYSVY2NU5Ddw=="
}

DELETE test_nested_revit_model_index
PUT test_nested_revit_model_index
{
  "settings":{
    "number_of_shards": 1,
    "number_of_replicas": 1
  },
  "mappings": {
    "revitmodel": {
      "properties": {
        "elementInfo": {
          "type": "nested",
          "properties": {
            "category": {
              "type": "keyword"
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
              "type": "keyword"
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
        "ownerProject": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        },
        "projectInfo": {
          "type": "nested",
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
  }
}

```

