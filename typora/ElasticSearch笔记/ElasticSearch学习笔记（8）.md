# ElasticSearch学习笔记（八）

## 18.ElasticSearch嵌套查询

关系型数据库有关联关系。在ES中，我们也有类似的需求，例如订单表和商品表，在ES中，这样的一对多一般来说有两种方式：

- 嵌套文档：nested
- 父子文档：parent/children

### 18.1 嵌套文档

假设：有一个电影文档，每个电影都有演员信息：

```
PUT movies
{
  "mappings": {
    "properties": {
      "actors":{
        "type": "nested"
      }
    }
  }
}

PUT movies/_doc/1
{
  "name":"霸王别姬",
  "actors":[
    {
      "name":"张国荣",
      "gender":"男"
    },
    {
      "name":"巩俐",
      "gender":"女"
    }
    ]
}
```

注意 actors 类型要是 nested，具体原因参考 10.2.3 小节。

**缺点**

查看文档数量：

```
GET _cat/indices?v
```

查看结果如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-18-01.jpg)

这是因为 nested 文档在 es 内部其实也是独立的 lucene 文档，只是在我们查询的时候，es 内部帮我们做了 join 处理，所以最终看起来就像一个独立文档一样。因此这种方案性能并不是特别好。

### 18.2 嵌套查询

这个用来查询嵌套文档：

```
GET movies/_search
{
  "query": {
    "nested": {
      "path": "actors",
      "query": {
        "bool": {
          "must": [
            {
              "match": {
                "actors.name": "张国荣"
              }
            },
            {
              "match": {
                "actors.gender": "男"
              }
            }
          ]
        }
      }
    }
  }
}
```

### 18.3 父子文档

相比于嵌套文档，父子文档主要有如下优势：

- 更新父文档时，不会重新索引子文档
- 创建、修改或者删除子文档时，不会影响父文档或者其他的子文档。
- 子文档可以作为搜索结果独立返回。

例如学生和班级的关系：

```
PUT stu_class
{
  "mappings": {
    "properties": {
      "name":{
        "type": "keyword"
      },
      "s_c":{
        "type": "join",
        "relations":{
          "class":"student"
        }
      }
    }
  }
}
```

`s_c` 表示父子文档关系的名字，可以自定义。join 表示这是一个父子文档。relations 里边，class 这个位置是 parent，student 这个位置是 child。

接下来，插入两个父文档：

```
PUT stu_class/_doc/1
{
  "name":"一班",
  "s_c":{
    "name":"class"
  }
}
PUT stu_class/_doc/2
{
  "name":"二班",
  "s_c":{
    "name":"class"
  }
}
```

再来添加三个子文档：

```
PUT stu_class/_doc/3?routing=1
{
  "name":"zhangsan",
  "s_c":{
    "name":"student",
    "parent":1
  }
}
PUT stu_class/_doc/4?routing=1
{
  "name":"lisi",
  "s_c":{
    "name":"student",
    "parent":1
  }
}
PUT stu_class/_doc/5?routing=2
{
  "name":"wangwu",
  "s_c":{
    "name":"student",
    "parent":2
  }
}
```

首先大家可以看到，子文档都是独立的文档。特别需要注意的地方是，子文档需要和父文档在同一个分片上，所以 routing 关键字的值为父文档的 id。另外，name 属性表明这是一个子文档。子文档可以独立返回更新。

父子文档需要注意的地方：

1. 每个索引只能定义一个 join filed
2. 父子文档需要在同一个分片上（查询，修改需要routing）
3. 可以向一个已经存在的 join filed 上新增关系

### 18.4 has_child query【query】

通过子文档查询父文档使用 `has_child` query。

```
GET stu_class/_search
{
  "query": {
    "has_child": {
      "type": "student",
      "query": {
        "match": {
          "name": "wangwu"
        }
      }
    }
  }
}
```

查询 wangwu 所属的班级。

### 18.5 has_parent query 【query】

通过父文档查询子文档：

```
GET stu_class/_search
{
  "query": {
    "has_parent": {
      "parent_type": "class",
      "query": {
        "match": {
          "name": "二班"
        }
      }
    }
  }
}
```

查询二班的学生。但是大家注意，这种查询没有评分。

可以使用 parent id 查询子文档：

```
GET stu_class/_search
{
  "query": {
    "parent_id":{
      "type":"student",
      "id":1
    }
  }
}
```

通过 parent id 查询，默认情况下使用相关性计算分数。

### 18.6 小结

整体上来说：

1. 普通子对象实现一对多，会损失子文档的边界，子对象之间的属性关系丢失。
2. nested 可以解决第 1 点的问题，但是 nested 有两个缺点：更新主文档的时候要全部更新，不支持子文档属于多个主文档。
3. 父子文档解决 1、2 点的问题，但是它主要适用于写多读少的场景。



## 19.ElasticSearch 地理位置查询

### 19.1 数据准备

创建一个索引：

```
PUT geo
{
  "mappings": {
    "properties": {
      "name":{
        "type": "keyword"
      },
      "location":{
        "type": "geo_point"
      }
    }
  }
}
```

准备一个 geo.json 文件：

```
{"index":{"_index":"geo","_id":1}}
{"name":"西安","location":"34.288991865037524,108.9404296875"}
{"index":{"_index":"geo","_id":2}}
{"name":"北京","location":"39.926588421909436,116.43310546875"}
{"index":{"_index":"geo","_id":3}}
{"name":"上海","location":"31.240985378021307,121.53076171875"}
{"index":{"_index":"geo","_id":4}}
{"name":"天津","location":"39.13006024213511,117.20214843749999"}
{"index":{"_index":"geo","_id":5}}
{"name":"杭州","location":"30.259067203213018,120.21240234375001"}
{"index":{"_index":"geo","_id":6}}
{"name":"武汉","location":"30.581179257386985,114.3017578125"}
{"index":{"_index":"geo","_id":7}}
{"name":"合肥","location":"31.840232667909365,117.20214843749999"}
{"index":{"_index":"geo","_id":8}}
{"name":"重庆","location":"29.592565403314087,106.5673828125"}
```

最后，执行如下命令，批量导入 geo.json 数据：

```
curl -XPOST "http://localhost:9200/geo/_bulk?pretty" -H "content-type:application/json" --data-binary @geo.json
```

可能用到的工具网站：

http://geojson.io/#map=6/32.741/116.521

### 19.2 geo_distance query【query、bool、filter】

给出一个中心点，查询距离该中心点指定范围内的文档：

```
GET geo/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "match_all": {}
        }
      ],
      "filter": [
        {
          "geo_distance": {
            "distance": "600km",
            "location": {
              "lat": 34.288991865037524,
              "lon": 108.9404296875
            }
          }
        }
      ]
    }
  }
}
```

以(34.288991865037524,108.9404296875) 为圆心，以 600KM 为半径，这个范围内的数据。

### 19.3 geo_bounding_box query【query、bool、filter】

在某一个矩形内的点，通过两个点锁定一个矩形：

```
GET geo/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "match_all": {}
        }
      ],
      "filter": [
        {
          "geo_bounding_box": {
            "location": {
              "top_left": {
                "lat": 32.0639555946604,
                "lon": 118.78967285156249
              },
              "bottom_right": {
                "lat": 29.98824461550903,
                "lon": 122.20642089843749
              }
            }
          }
        }
      ]
    }
  }
}
```

以 南京 经纬度作为矩形的左上角，以 舟山 经纬度作为矩形的右下角，构造出来的矩形中，包含 上海 和 杭州 两个城市。

### 19.4 geo_polygon query【query、bool、filter】

在某一个多边形范围内的查询。

```
GET geo/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "match_all": {}
        }
      ],
      "filter": [
        {
          "geo_polygon": {
            "location": {
              "points": [
                {
                  "lat": 31.793755581217674,
                  "lon": 113.8238525390625
                },
                {
                  "lat": 30.007273923504556,
                  "lon":114.224853515625
                },
                {
                  "lat": 30.007273923504556,
                  "lon":114.8345947265625
                }
              ]
            }
          }
        }
      ]
    }
  }
}
```

给定多个点，由多个点组成的多边形中的数据。

### 19.5 geo_shape query【query、bool、filter】

`geo_shape` 用来查询图形，针对 `geo_shape`，两个图形之间的关系有：相交、包含、不相交。

新建索引：

```
PUT geo_shape
{
  "mappings": {
    "properties": {
      "name":{
        "type": "keyword"
      },
      "location":{
        "type": "geo_shape"
      }
    }
  }
}
```

然后添加一条线：

```
PUT geo_shape/_doc/1
{
  "name":"西安-郑州",
  "location":{
    "type":"linestring",
    "coordinates":[
      [108.9404296875,34.279914398549934],
      [113.66455078125,34.768691457552706]
      ]
  }
}
```

接下来查询某一个图形中是否包含该线：

```
GET geo_shape/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "match_all": {}
        }
      ],
      "filter": [
        {
          "geo_shape": {
            "location": {
              "shape": {
                "type": "envelope",
                "coordinates": [
                  [
                    106.5234375,
                    36.80928470205937
                  ],
                  [
                    115.33447265625,
                    32.24997445586331
                  ]
                ]
              },
              "relation": "within"
            }
          }
        }
      ]
    }
  }
}
```

relation 属性表示两个图形的关系：

- within 包含
- intersects 相交
- disjoint 不相交



## 20.ElasticSearch 特殊查询

### 20.1 more_like_this query 【query】

`more_like_this` query 可以实现基于内容的推荐，给定一篇文章，可以查询出和该文章相似的内容。

```
GET books/_search
{
  "query": {
    "more_like_this": {
      "fields": [
        "info"
      ],
      "like": "大学战略",
      "min_term_freq": 1,
      "max_query_terms": 12
    }
  }
}
```

- fields：要匹配的字段，可以有多个
- like：要匹配的文本
- min_term_freq：词项的最低频率，默认是 2。**特别注意，这个是指词项在要匹配的文本中的频率，而不是 es 文档中的频率**
- max_query_terms：query 中包含的最大词项数目
- min_doc_freq：最小的文档频率，搜索的词，至少在多少个文档中出现，少于指定数目，该词会被忽略
- max_doc_freq：最大文档频率
- analyzer：分词器，默认使用字段的分词器
- stop_words：停用词列表
- minmum_should_match

### 20.2 script query【query、bool、filter】

脚本查询，例如查询所有价格大于 200 的图书：

```
GET books/_search
{
  "query": {
    "bool": {
      "filter": [
        {
          "script": {
            "script": {
              "lang": "painless",
              "source": "if(doc['price'].size()!=0){doc['price'].value > 200}"
            }
          }
        }
      ]
    }
  }
}
```

### 20.3 percolate query 【query】

percolate query 译作渗透查询或者反向查询。

- 正常操作：根据查询语句找到对应的文档 query->document
- percolate query：根据文档，返回与之匹配的查询语句，document->query

应用场景：

- 价格监控
- 库存报警
- 股票警告
- ...

例如阈值告警，假设指定字段值大于阈值，报警提示。

percolate mapping 定义：

```
PUT log
{
  "mappings": {
    "properties": {
      "threshold":{
        "type": "long"
      },
      "count":{
        "type": "long"
      },
      "query":{
        "type":"percolator"
      }
    }
  }
}
```

percolator 类型相当于 keyword、long 以及 integer 等，是not analyze的类型。

插入文档：这里文档也就是一条query语句

```
PUT log/_doc/1
{
  "threshold":10,
  "query":{
    "bool":{
      "must":{
        "range":{
          "count":{
            "gt":10
          }
        }
      }
    }
  }
}
```

最后查询：

```
GET log/_search
{
  "query": {
    "percolate": {
      "field": "query",
      "documents": [
        {
          "count":3
        },
        {
          "count":6
        },
        {
          "count":90
        },
        {
          "count":12
        },
        {
          "count":15
        }
        ]
    }
  }
}
```

查询结果中会列出不满足条件的文档。

查询结果中的 `_percolator_document_slot` 字段表示满足条件的文档的 position，从 0 开始计。



## 21.搜索高亮与排序

### 21.1 搜索高亮

普通高亮，默认会自动添加 em 标签：

```
GET books/_search
{
  "query": {
    "match": {
      "name": "大学"
    }
  },
  "highlight": {
    "fields": {
      "name": {}
    }
  }
}
```

查询结果如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-21-01.jpg)

正常来说，我们见到的高亮可能是红色、黄色之类的。

可以自定义高亮标签：

```
GET books/_search
{
  "query": {
    "match": {
      "name": "大学"
    }
  },
  "highlight": {
    "fields": {
      "name": {
        "pre_tags": ["<strong>"],
        "post_tags": ["</strong>"]
      }
    }
  }
}
```

搜索结果如下：

<img src="E:\newbie\Exercise\test\typora\typora-user-images\es-21-02.jpg" alt="image-20210121161608073" style="zoom:150%;" />

有的时候，虽然我们是在 name 字段中搜索的，但是我们希望 info 字段中，相关的关键字也能高亮：

```
GET books/_search
{
  "query": {
    "match": {
      "name": "大学"
    }
  },
  "highlight": {
    "require_field_match": "false", 
    "fields": {
      "name": {
        "pre_tags": ["<strong>"],
        "post_tags": ["</strong>"]
      },
      "info": {
        "pre_tags": ["<strong>"],
        "post_tags": ["</strong>"]
      }
    }
  }
}
```

搜索结果如下：

<img src="E:\newbie\Exercise\test\typora\typora-user-images\es-21-03.jpg" alt="image-20210121161843432" style="zoom:150%;" />

> 不同的高亮语句效率不同。

### 21.2 排序

排序很简单，**默认是按照查询文档的相关度来排序**的，即（`_score` 字段）：

```
GET books/_search
{
  "query": {
    "term": {
      "name": {
        "value": "java"
      }
    }
  }
}
```

等价于：

```
GET books/_search
{
  "query": {
    "term": {
      "name": {
        "value": "java"
      }
    }
  },
  "sort": [
    {
      "_score": {
        "order": "desc"
      }
    }
  ]
}
```

**match_all** 查询只是返回所有文档，不评分，**默认按照添加顺序返回**，可以通过 `_doc` 字段对其进行排序：

```
GET books/_search
{
  "query": {
    "match_all": {}
  },
  "sort": [
    {
      "_doc": {
        "order": "desc"
      }
    }
  ],
  "size": 20
}
```

es 同时也支持多字段排序。

```
GET books/_search
{
  "query": {
    "match_all": {}
  },
  "sort": [
    {
      "price": {
        "order": "asc"
      }
    },
    {
      "_doc": {
        "order": "desc"
      }
    }
  ],
  "size": 20
}
```

> 分片是会影响评分的。因为评分是在每个分片上单独进行的。
>
> 不同的分词器也会影响评分。因为不同分词七导致最终分词后词项数不同，从而影响评分。