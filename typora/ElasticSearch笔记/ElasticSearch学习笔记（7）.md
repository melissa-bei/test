# ElasticSearch学习笔记（七）

## 17.ElasticSearch 复合查询

### 17.1 constant_score query

当我们**不关心检索词项的频率（TF）对搜索结果排序的影响**时，可以使用 constant_score 将查询语句或者过滤语句包裹起来。

```
GET books/_search
{
  "query": {
    "constant_score": {
      "filter": {
        "term": {
          "name": "java"
        }
      },
      "boost": 1.5
    }
  }
}
```

这样检索出来的两个文档的score都是1.5

### 17.2 bool query

bool query 可以将任意多个简单查询组装在一起，有四个关键字可供选择，四个关键字所描述的条件可以有一个或者多个。

- must：文档必须匹配 must 选项下的查询条件。
- should：文档可以匹配 should 下的查询条件，也可以不匹配。
- must_not：文档必须不满足 must_not 选项下的查询条件。
- filter：类似于 must，但是 **filter 不评分，只是过滤数据**。

例如查询 name 属性中必须包含 java，同时书价不在 [0,35] 区间内，info 属性可以包含 程序设计 也可以不包含程序设计：

```
GET books/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "name": {
              "value": "java"
            }
          }
        }
      ],
      "must_not": [
        {
          "range": {
            "price": {
              "gte": 0,
              "lte": 35
            }
          }
        }
      ],
      "should": [
        {
          "match": {
            "info": "程序设计"
          }
        }
      ]
    }
  }
}
```

这里还涉及到一个关键字，`minmum_should_match` 参数。

`minmum_should_match` 参数在 es 官网上称作最小匹配度。在之前学习的`multi_match` 或者这里的 `should` 查询中，都可以设置 `minmum_should_match` 参数。

假设我们要做一次查询，查询 name 中包含 语言程序设计 关键字的文档：

```
GET books/_search
{
  "query": {
    "match": {
      "name": "语言程序设计"
    }
  }
}
```

在这个查询过程中，首先会进行分词

```
GET book/_analyze
{
  "text": ["语言程序设计"],
  "analyzer": "ik_max_word"
}
```

分词结果如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-17-01.jpg)

分词后的 term 会构造成一个 should 的 bool query，每一个 term 都会变成一个 term query 的子句。换句话说，上面的查询和下面的查询等价：

```
GET books/_search
{
  "query": {
    "bool": {
      "should": [
        {
          "term": {
            "name": {
              "value": "语言"
            }
          }
        },
        {
          "term": {
            "name": {
              "value": "程序设计"
            }
          }
        },
        {
          "term": {
            "name": {
              "value": "程序"
            }
          }
        },
        {
          "term": {
            "name": {
              "value": "设计"
            }
          }
        }
      ]
    }
  }
}
```

在这两个查询语句中，都是文档只需要包含词项中的任意一项即可，文档就回被返回，在 match 查询中，可以通过 operator 参数设置文档必须匹配所有词项。

如果想匹配一部分词项，就涉及到一个参数，就是`minmum_should_match`，即最小匹配度。即至少匹配多少个词。

```
GET books/_search
{
  "query": {
    "match": {
      "name": {
        "query": "语言程序设计",
        "operator": "and"
      }
    }
  }
}

GET books/_search
{
  "query": {
    "bool": {
      "should": [
        {
          "term": {
            "name": {
              "value": "语言"
            }
          }
        },
        {
          "term": {
            "name": {
              "value": "程序设计"
            }
          }
        },
        {
          "term": {
            "name": {
              "value": "程序"
            }
          }
        },
        {
          "term": {
            "name": {
              "value": "设计"
            }
          }
        }
      ],
      "minimum_should_match": "50%"
    }
  },
  "from": 0,
  "size": 70
}
```

50% 表示词项个数的 50%。设置为**百分比**或者**整数**都可以。设置为整数时如果超过词项个数则查不到。

如下两个查询等价（参数 4 是因为查询关键字分词后有 4 项）：

```
GET books/_search
{
  "query": {
    "match": {
      "name": {
        "query": "语言程序设计",
        "minimum_should_match": 4
      }
    }
  }
}
GET books/_search
{
  "query": {
    "match": {
      "name": {
        "query": "语言程序设计",
        "operator": "and"
      }
    }
  }
}
```

### 17.3 dis_max query【调整得分】

假设现在有两本书：

```
PUT blog
{
  "mappings": {
    "properties": {
      "title":{
        "type": "text",
        "analyzer": "ik_max_word"
      },
      "content":{
        "type": "text",
        "analyzer": "ik_max_word"
      }
    }
  }
}

POST blog/_doc
{
  "title":"如何通过Java代码调用ElasticSearch",
  "content":"松哥力荐，这是一篇很好的解决方案"
}

POST blog/_doc
{
  "title":"初识 MongoDB",
  "content":"简单介绍一下 MongoDB，以及如何通过 Java 调用 MongoDB，MongoDB 是一个不错 NoSQL 解决方案"
}
```

现在假设搜索 **Java解决方案** 关键字，但是不确定关键字是在 title 还是在 content，所以两者都搜索：

```
GET blog/_search
{
  "query": {
    "bool": {
      "should": [
        {
          "match": {
            "title": "java解决方案"
          }
        },
        {
          "match": {
            "content": "java解决方案"
          }
        }
      ]
    }
  }
}
```

搜索结果如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-17-02.jpg)

肉眼观察，感觉第二个和查询关键字相似度更高，但是实际查询结果并非这样。

要理解这个原因，我们需要来看下 should query 中的评分策略：

1. 首先会执行 should 中的两个查询
2. 对两个查询结果的评分求和
3. 对求和结果乘以匹配语句总数
4. 在对第三步的结果除以所有语句总数

反映到具体的查询中：

**前者**

1. title 中 包含 java，假设评分是 1.1
2. content 中包含解决方案，假设评分是 1.2
3. 有得分的 query 数量，这里是 2
4. 总的 query 数量也是 2

最终结果：`（1.1+1.2）*2/2=2.3`

**后者**

1. title 中 不包含查询关键字，没有得分
2. content 中包含解决方案和 java，假设评分是 2
3. 有得分的 query 数量，这里是 1
4. 总的 query 数量也是 2

最终结果：`2*1/2=1`

**在这种查询中，title 和 content 相当于是相互竞争的关系**，所以我们需要找到一个**最佳匹配字段**，即返回最高的评分作为查询结果。

为了解决这一问题，就需要用到 dis_max query（disjunction max query，分离最大化查询）：匹配的文档依然返回，但是只将最佳匹配的评分作为查询的评分。

```
GET blog/_search
{
  "query": {
    "dis_max": {
      "queries": [
        {
          "match": {
            "title": "java解决方案"
          }
        },
        {
          "match": {
            "content": "java解决方案"
          }
        }
        ]
    }
  }
}
```

查询结果如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-17-03.jpg)

在 dis_max query 中，还有一个参数 `tie_breaker`（取值在0～1），**在 dis_max query 中，是完全不考虑其他 query 的分数**，只是将最佳匹配的字段的评分返回。但是，有的时候，我们又不得不考虑一下其他 query 的分数，此时，可以通过 `tie_breaker` 来优化 dis_max query。`tie_breaker` 会将其他 query 的分数，乘以 `tie_breaker`，然后和分数最高的 query 进行一个综合计算。

### 17.4 function_score query【调整得分，keyword字段】

场景：例如想要搜索附近的肯德基，搜索的关键字是肯德基，但是我希望能够将评分较高的肯德基优先展示出来。但是默认的评分策略是没有办法考虑到餐厅评分的，他只是考虑相关性，这个时候可以通过 function_score query 来实现。

准备两条测试数据：

```
PUT dining
{
  "mappings": {
    "properties": {
      "title":{
        "type": "text",
        "analyzer": "ik_max_word"
      },
      "votes":{
        "type": "integer"
      }
    }
  }
}

PUT dining/_doc/1
{
  "title":"KFC 肯德基",
  "votes":5
}

PUT dining/_doc/2
{
  "title":"KFC 肯德基，KFC 肯德基",
  "votes":3.2
}
```

现在搜索标题中包含 java 关键字的文档：

```
GET blog/_search
{
  "query": {
    "match": {
      "title": "java"
    }
  }
}
```

查询结果如下：

![图片](https://mmbiz.qpic.cn/mmbiz_png/GvtDGKK4uYlfibAYmhhWicY9tfA456k1UWhuqcHRc9Ww27cWWG468hLQNC7qXz2VOu2OU1r4ft2TP0QFGVz45Utw/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1)

默认情况下，id 为 2 的记录得分较高，因为他的 title 中包含两个 java。

如果我们在查询中，希望能够充分考虑 votes 字段，将 votes 较高的文档优先展示，就可以通过 function_score 来实现。

具体的思路，就是在旧的得分基础上，根据 votes 的数值进行综合运算，重新得出一个新的评分。

具体有几种不同的计算方式：

- weight
- random_score
- script_score
- field_value_factor

**weight**

weight 可以对评分设置权重，就是在旧的评分基础上乘以 weight，它其实无法解决我们上面所说的问题。具体用法如下：

```
GET blog/_search
{
  "query": {
    "function_score": {
      "query": {
        "match": {
          "title": "java"
        }
      },
      "functions": [
        {
          "weight": 10
        }
      ]
    }
  }
}
```

查询结果如下：

![图片](https://mmbiz.qpic.cn/mmbiz_png/GvtDGKK4uYlfibAYmhhWicY9tfA456k1UWd69376vMa41ibsd7PRRPAY5NzF932kJ75Gib3rhmpB1vBSZickB5PfSzg/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1)

可以看到，此时的评分，在之前的评分基础上`*`10

**random_score**

`random_score` 会根据 uid 字段进行 hash 运算，生成分数，使用 `random_score` 时可以配置一个种子，如果不配置，默认使用当前时间。

```
GET blog/_search
{
  "query": {
    "function_score": {
      "query": {
        "match": {
          "title": "java"
        }
      },
      "functions": [
        {
          "random_score": {}
        }
      ]
    }
  }
}
```

**script_score** 

自定义评分脚本。假设每个文档的最终得分是旧的分数加上votes。查询方式如下：

```
GET blog/_search
{
  "query": {
    "function_score": {
      "query": {
        "match": {
          "title": "java"
        }
      },
      "functions": [
        {
          "script_score": {
            "script": {
              "lang": "painless",
              "source": "_score + doc['votes'].value"
            }
          }
        }
      ]
    }
  }
}
```

现在，最终得分是 `(oldScore+votes)*oldScore`。

如果不想乘以 oldScore，查询方式如下：

```
GET blog/_search
{
  "query": {
    "function_score": {
      "query": {
        "match": {
          "title": "java"
        }
      },
      "functions": [
        {
          "script_score": {
            "script": {
              "lang": "painless",
              "source": "_score + doc['votes'].value"
            }
          }
        }
      ],
      "boost_mode": "replace"
    }
  }
}
```

通过 `boost_mode` 参数，可以设置最终的计算方式。该参数还有其他取值：

- multiply：分数相乘【默认】
- sum：分数相加
- avg：求平均数
- max：最大分
- min：最小分
- replace：不进行二次计算

**field_value_factor**

这个的功能类似于 `script_score`，但是不用自己写脚本。

假设每个文档的最终得分是旧的分数乘以votes。查询方式如下：

```
GET blog/_search
{
  "query": {
    "function_score": {
      "query": {
        "match": {
          "title": "java"
        }
      },
      "functions": [
        {
          "field_value_factor": {
            "field": "votes"  # 指定匹配上后，将votes的值做为score
          }
        }
      ]
    }
  }
}
```

默认的得分就是`oldScore*votes`。

还可以利用 es 内置的函数进行一些更复杂的运算：

```
GET blog/_search
{
  "query": {
    "function_score": {
      "query": {
        "match": {
          "title": "java"
        }
      },
      "functions": [
        {
          "field_value_factor": {
            "field": "votes",
            "modifier": "sqrt"  # 进行复杂计算
          }
        }
      ],
      "boost_mode": "replace"
    }
  }
}
```

此时，最终的得分是（sqrt(votes)）。

modifier 中可以设置内置函数，其他的内置函数还有：

![图片](https://mmbiz.qpic.cn/mmbiz_png/GvtDGKK4uYlfibAYmhhWicY9tfA456k1UWz7icyjiaBYs7cm58QqWQkTR575CfpIzl0eOMnERPSic8wmImFO0ejiaHcw/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1)

另外还有个参数 factor ，影响因子。字段值先乘以影响因子，然后再进行计算。以 sqrt 为例，计算方式为 `sqrt(factor*votes)`：

```
GET blog/_search
{
  "query": {
    "function_score": {
      "query": {
        "match": {
          "title": "java"
        }
      },
      "functions": [
        {
          "field_value_factor": {
            "field": "votes",
            "modifier": "sqrt",
            "factor": 10
          }
        }
      ],
      "boost_mode": "replace"
    }
  }
}
```

还有一个参数 `max_boost`，控制计算结果的范围：

```
GET blog/_search
{
  "query": {
    "function_score": {
      "query": {
        "match": {
          "title": "java"
        }
      },
      "functions": [
        {
          "field_value_factor": {
            "field": "votes"
          }
        }
      ],
      "boost_mode": "sum",
      "max_boost": 100  # 控制上面function的计算结果不能超过多少，而不是整体不能超过多少
    }
  }
}
```

`max_boost` 参数表示 functions 模块中，最终的计算结果上限。如果超过上限，就按照上线计算。以上面代码为例：`match`语句如果匹配score是0.22，functions 中该文档的 votes 为 50，即 function 的 score 也为 50，使用 sum 模式，max_boost 如果设置为10，则意味着将 function 的 score 控制在不能超过10，现在 50 就会变成 10，再经过 sum 计算，10+0.22=10.22，也就是为什么最终 score 为什么可以超过 10，因为 max_boost 只限制 functions 的最大值.

### 17.5 boosting query【降低得分】

boosting query 中包含三部分：

- positive：得分不变
- negative：降低得分
- negative_boost：降低的权重，要求必须设置`negative`才能使用，可以用`function_score`替换。

示例：match `java` 对于`name`中包含 2008 的降低相应 score

```
GET books/_search
{
  "query": {
    "boosting": {
      "positive": {
        "match": {
          "name": "java"
        }
      },
      "negative": {
        "match": {
          "name": "2008"
        }
      },
      "negative_boost": 0.5  # 得分除以2
    }
  }
}
```

查询结果如下：

![图片](https://mmbiz.qpic.cn/mmbiz_png/GvtDGKK4uYlfibAYmhhWicY9tfA456k1UWc5FHenmatXvt2Kl2H5SuaeVjuNibqqFhkoKqFWF95MzrPSTRs2CgBiaA/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1)

可以看到，id 为 86 的文档满足条件，因此它的最终得分在旧的分数上`*0.5`。