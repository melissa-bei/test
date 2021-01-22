# ElasticSearch学习笔记（六）

## 13.ElasticSearch 搜索数据导入

1. 在微信公众号后台回复 **bookdata.json** 下载脚本。
2. 创建索引：

```
   PUT books
   {
     "mappings": {
       "properties": {
         "name":{
           "type": "text",
           "analyzer": "ik_max_word"
         },
         "publish":{
           "type": "text",
           "analyzer": "ik_max_word"
         },
         "type":{
           "type": "text",
           "analyzer": "ik_max_word"
         },
         "author":{
           "type": "keyword"
         },
         "info":{
           "type": "text",
           "analyzer": "ik_max_word"
         },
         "price":{
           "type": "double"
         }
       }
     }
   }
```

执行如下脚本导入命令：

```
curl -XPOST "http://localhost:9200/books/_bulk?pretty" -H "content-type:application/json" --data-binary @bookdata.json
```



## 14.ElasticSearch 搜索入门

搜索分为两个过程：

1. 当向索引中保存文档时，默认情况下，es 会保存两份内容，一份是`_source` 中的数据，另一份则是通过分词、排序等一系列过程生成的倒排索引文件，倒排索引中保存了词项和文档之间的对应关系。
2. 搜索时，当 es 接收到用户的搜索请求之后，就会去倒排索引中查询，通过的倒排索引中维护的倒排记录表找到关键词对应的文档集合，然后对文档进行评分、排序、高亮等处理，处理完成后返回文档。

### 14.1 简单搜索

查询文档：

```
GET books/_search
{
  "query": {
    "match_all": {}
  }
}
```

查询结果如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-14-01.jpg)image-20201111204708546

hits 中就是查询结果，total 是符合查询条件的文档数。

简单搜索可以简写为：

```
GET books/_search
```

简单搜索默认查询 10 条记录。

### 14.2 词项查询

即 term 查询，就是根据**词**去查询，查询指定字段中包含给定单词的文档，term 查询不被解析，只有搜索的词和文档中的词精确匹配，才会返回文档。应用场景如：人名、地名等等。

查询 name 字段中包含 **十一五** 的文档。

```
GET books/_search
{
  "query": {
    "term": {
      "name": "十一五"
    }
  }
}
```

### 14.3 分页

默认返回前 10 条数据，es 中也可以像关系型数据库一样，给一个分页参数：

```
GET books/_search
{
  "query": {
    "term": {
      "name": "十一五"
    }
  },
  "size": 10,
  "from": 10  # 指从第十个往后开始查询
}

# 使用match_all验证，返回结果从第11条开始
GET book/_search
{
  "query": {
    "match_all": {}
  },
  "size": 10,
  "from": 10
}

```

### 14.4 过滤返回字段

如果返回的字段比较多，又不需要这么多字段，此时可以指定返回的字段：

```
GET books/_search
{
  "query": {
    "term": {
      "name": "十一五"
    }
  },
  "size": 10,
  "from": 10,
  "_source": ["name","author"]
}
```

此时，返回的字段就只有 name 和 author 了。

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-14-02.jpg)

### 14.5 最小评分

有的文档得分特别低，说明这个文档和我们查询的关键字相关度很低。我们可以设置一个最低分，只有得分超过最低分的文档才会被返回。

```
GET books/_search
{
  "query": {
    "term": {
      "name": "十一五"
    }
  },
  "min_score":1.75,
  "_source": ["name","author"]
}
```

得分低于 1.75 的文档将直接被舍弃。

### 14.6 高亮

查询关键字高亮：

```
GET books/_search
{
  "query": {
    "term": {
      "name": "十一五"
    }
  },
  "min_score":1.75,
  "_source": ["name","author"],
  "highlight": {
    "fields": {
      "name": {}
    }
  }
}
```

搜索的词在`name`字段中，我们对其高亮

![](E:\newbie\Exercise\test\typora\typora-user-images\es-14-03.jpg)



## 15.ElasticSearch 全文查询

### 15.1 match query【对查询语句进行分词，默认词项之间是 OR 的关系】

match query 会对查询语句进行**分词**，分词后，如果查询语句中的任何一个词项被匹配，则文档就会被索引到。

```
GET books/_search
{
  "query": {
    "match": {
      "name": "美术"
    }
  }
}

GET books/_search
{
  "query": {
    "match": {
      "name": "计算机"
    }
  }
}

GET books/_search
{
  "query": {
    "match": {
      "name": "美术计算机"
    }
  }
}
```

这个查询首先会对 `美术计算机` 进行分词，分词之后，再去查询，只要文档中包含一个分词结果，就回返回文档。换句话说，**默认词项之间是 OR 的关系**，如果想要修改，也可以改为 **AND**。

```
GET books/_search
{
  "query": {
    "match": {
      "name": {
        "query": "美术计算机",
        "operator": "and"
      }
    }
  }
}
```

此时就回要求文档中必须同时包含 **美术** 和 **计算机** 两个词。

对于`match` “十一五”和“计算机”的顺修并不影响查询结果

### 15.2 match_phrase query

match_phrase query 也会对查询的关键字进行分词，但是它分词后有两个特点：

- 分词后的词项顺序必须和文档中词项的顺序一致
- 所有的词都必须出现在文档中

示例如下：

> 我们前面用“十一五计算机”能够查到两个文档，在使用match_phrase直接查询时查不到（如下请求），有一个要注意的点是查询时默认的`slop`是0，而那两个词之间是不挨着的，就可能造成查不到，需要修改`slop`的值.
>
> ```
> GET book/_search
> {
>   "query": {
>     "match_phrase": {
>       "name": "十一五计算机"
>     }
>   }
> }
> ```

设置`slop`为7

```
GET books/_search
{
  "query": {
    "match_phrase": {
        "name": {
          "query": "十一五计算机",
          "slop": 7
        }
    }
  }
}
```

query 是查询的关键字，会被分词器进行分解，分解之后去倒排索引中进行匹配。

slop 是指关键字之间的最小距离，但是注意不是关键之间间隔的字数，而是分词后两个词之间所距的position。文档中的字段被分词器解析之后，解析出来的词项都包含一个 position 字段表示词项的位置，查询短语分词之后 的 position 之间的间隔要满足 slop 的要求。

比如对进行`普通高等教育“十一五”国家级规划教材：大学计算机基础`分词

```
GET book/_analyze
{
  "text": "普通高等教育“十一五”国家级规划教材：大学计算机基础",
  "analyzer": "ik_max_word"
}
```

分词结果：

```
{
  "tokens" : [
    {
      "token" : "普通",
      "start_offset" : 0,
      "end_offset" : 2,
      "type" : "CN_WORD",
      "position" : 0
    },
    {
      "token" : "高等教育",
      "start_offset" : 2,
      "end_offset" : 6,
      "type" : "CN_WORD",
      "position" : 1
    },
    {
      "token" : "高等",
      "start_offset" : 2,
      "end_offset" : 4,
      "type" : "CN_WORD",
      "position" : 2
    },
    {
      "token" : "教育",
      "start_offset" : 4,
      "end_offset" : 6,
      "type" : "CN_WORD",
      "position" : 3
    },
    {
      "token" : "十一五",
      "start_offset" : 7,
      "end_offset" : 10,
      "type" : "CN_WORD",
      "position" : 4
    },
    {
      "token" : "十一",
      "start_offset" : 7,
      "end_offset" : 9,
      "type" : "CN_WORD",
      "position" : 5
    },
    {
      "token" : "五",
      "start_offset" : 9,
      "end_offset" : 10,
      "type" : "CN_CHAR",
      "position" : 6
    },
    {
      "token" : "国家级",
      "start_offset" : 11,
      "end_offset" : 14,
      "type" : "CN_WORD",
      "position" : 7
    },
    {
      "token" : "国家",
      "start_offset" : 11,
      "end_offset" : 13,
      "type" : "CN_WORD",
      "position" : 8
    },
    {
      "token" : "级",
      "start_offset" : 13,
      "end_offset" : 14,
      "type" : "CN_CHAR",
      "position" : 9
    },
    {
      "token" : "规划",
      "start_offset" : 14,
      "end_offset" : 16,
      "type" : "CN_WORD",
      "position" : 10
    },
    {
      "token" : "教材",
      "start_offset" : 16,
      "end_offset" : 18,
      "type" : "CN_WORD",
      "position" : 11
    },
    {
      "token" : "大学",
      "start_offset" : 19,
      "end_offset" : 21,
      "type" : "CN_WORD",
      "position" : 12
    },
    {
      "token" : "计算机",
      "start_offset" : 21,
      "end_offset" : 24,
      "type" : "CN_WORD",
      "position" : 13
    },
    {
      "token" : "计算",
      "start_offset" : 21,
      "end_offset" : 23,
      "type" : "CN_WORD",
      "position" : 14
    },
    {
      "token" : "算机",
      "start_offset" : 22,
      "end_offset" : 24,
      "type" : "CN_WORD",
      "position" : 15
    },
    {
      "token" : "基础",
      "start_offset" : 24,
      "end_offset" : 26,
      "type" : "CN_WORD",
      "position" : 16
    }
  ]
}
```

分词后，检索`十一五计算机`时其分词结果如下，分为`十一五`、`十一`、`五`，所以是从最后的`五`开始算起，在原句中pisition为6，`计算机`的position为13，这两个的差是最小的，只有当这个差小于slop时才能被检索到

```
{
  "tokens" : [
    {
      "token" : "十一五",
      "start_offset" : 0,
      "end_offset" : 3,
      "type" : "CN_WORD",
      "position" : 0
    },
    {
      "token" : "十一",
      "start_offset" : 0,
      "end_offset" : 2,
      "type" : "CN_WORD",
      "position" : 1
    },
    {
      "token" : "五",
      "start_offset" : 2,
      "end_offset" : 3,
      "type" : "CN_CHAR",
      "position" : 2
    },
    {
      "token" : "计算机",
      "start_offset" : 3,
      "end_offset" : 6,
      "type" : "CN_WORD",
      "position" : 3
    },
    {
      "token" : "计算",
      "start_offset" : 3,
      "end_offset" : 5,
      "type" : "CN_WORD",
      "position" : 4
    },
    {
      "token" : "算机",
      "start_offset" : 4,
      "end_offset" : 6,
      "type" : "CN_WORD",
      "position" : 5
    }
  ]
}
```

---

#### ***疑问：为什么检索`十一计算机`没有结果匹配，而检索`十一 计算机`就能够匹配上？两个的分词相差一个`一计`***

同等`普通高等教育`可以搜到`普通教育`搜不到，只有设置为`普通 教育`。

**可能的解释**：这应该只会发生在中文分词中，当原文档中两个词之间中间还有其他的词，即`AXB`，在检索时使用`AB`能否检索到完全取决于A、B连在一起后A后面的个别字会不会跟B前面的字连成词语。如果能，则检索不到，如果不能，则可以检索到。

```
GET book/_search
{
  "query": {
    "match_phrase": {
      "name": {
        "query": "十一计算机",
        "slop": 20
      }
    }
  }
}

GET book/_search
{
  "query": {
    "match_phrase": {
      "name": {
        "query": "十一 计算机",
        "slop": 20
      }
    }
  }
}
```

---

### 15.3 match_phrase_prefix query【不推荐】

这个类似于 match_phrase query，只不过这里多了一个通配符，match_phrase_prefix 支持最后一个词项的前缀匹配，但是由于这种匹配方式效率较低，因此大家作为了解即可。

```
GET books/_search
{
  "query": {
    "match_phrase_prefix": {
      "name": "计"
    }
  }
}
```

这个查询过程，会自动进行单词匹配，会自动查找以**计**开始的单词，默认是 50 个，可以自己控制：（这里个数的意思是，以“计”开始的词语，比如设置为2时，找到“计分”、“计划”这两个词，设置为几就按词表以计开始的词冲前往后找几个。这一步操作完也就拿到了要检索的词，再在索引中去检索当前字段包含这两个词的所有文档。）

```
GET books/_search
{
  "query": {
    "match_phrase_prefix": {
      "name": {
        "query": "计",
        "max_expansions": 3
      }
    }
  }
}
```

match_phrase_prefix 是针对分片级别的查询，假设 max_expansions 为 1，可能返回多个文档，但是只有一个词，这是我们预期的结果。有的时候实际返回结果和我们预期结果并不一致，原因在于**这个查询是分片级别的**，每个不同的分片确实只返回了一个词，但是最终返回结果可能来自多个分片的不同的词，所以最终会看到多个词的检索结果。

```
# 新建索引，设置分片数，重新导入数据，进行验证
PUT book_new
{
  "settings": {
    "number_of_shards": 3  # 设置分片数为3
  }, 
  "mappings": {
    "properties": {
      "name": {
        "type": "text",
        "analyzer": "ik_max_word"
      },
      "publish": {
        "type": "text",
        "analyzer": "ik_max_word"
      },
      "type": {
        "type": "text",
        "analyzer": "ik_max_word"
      },
      "author": {
        "type": "keyword"
      },
      "info": {
        "type": "text",
        "analyzer": "ik_max_word"
      },
      "price": {
        "type": "double"
      }
    }
  }
}

GET book_new/_search
{
  "query": {
    "match_phrase_prefix": {
      "name": {
        "query": "计",
        "max_expansions": 1
      }
    }
  },
  "size": 30,
  "_source": "name",
  "highlight": {
    "fields": {
      "name":{}
    }
  }
}
# 居然返回了5个词的检索结果？？？？？？？？？？？？？？？？？？？
```

### 15.4 multi_match query

match 查询的升级版，可以指定多个查询域：

```
GET books/_search
{
  "query": {
    "multi_match": {
      "query": "java",
      "fields": ["name","info"]
    }
  }
}
```

这种查询方式还可以指定字段的权重：

```
GET books/_search
{
  "query": {
    "multi_match": {
      "query": "阳光",
      "fields": ["name^4","info"]
    }
  }
}
```

这个表示关键字出现在 name 中的权重是出现在 info 中权重的 4 倍。

### 15.5 query_string query

query_string 是一种紧密结合 Lucene 的查询方式，在一个查询语句中可以用到 Lucene 的一些查询语法：

```
GET books/_search
{
  "query": {
    "query_string": {
      "default_field": "name",
      "query": "(十一五) AND (计算机)"
    }
  }
}
```

### 15.6 simple_query_string

这个是 query_string 的升级，可以直接使用 +、|、- 代替 AND、OR、NOT 等。

```
GET books/_search
{
  "query": {
    "simple_query_string": {
      "fields": ["name"],
      "query": "(十一五) + (计算机)"
    }
  }
}
```

查询结果和 query_string。



## 16.词项查询

### 16.1 term query

词项查询。词项查询不会分析查询字符，直接拿查询字符去倒排索引中比对。

```
GET books/_search
{
  "query": {
    "term": {
      "name": "程序设计"
    }
  }
}
```

### 16.2 terms query

词项查询，但是可以给多个关键词。

```
GET books/_search
{
  "query": {
    "terms": {
      "name": ["程序","设计","java"]
    }
  }
}
```

**思考**：这里面不同关键词之间的检索结果与最终结果之间有什么样的关系？

​		**并集**

### 16.3 range query

范围查询，可以按照日期范围、数字范围等查询。

range query 中的参数主要有四个：

- gt
- lt
- gte
- lte

案例：

```
GET books/_search
{
  "query": {
    "range": {
      "price": {
        "gte": 10,
        "lt": 20
      }
    }
  },
  "sort": [
    {
      "price": {
        "order": "desc"
      }
    }
  ]
}
```

### 16.4 exists query

exists query 会返回**指定字段中至少有一个非空值的文档**：

```
GET books/_search
{
  "query": {
    "exists": {
      "field": "javaboy"
    }
  }
}
```

**注意，*空字符串* 也是有值。null 是空值。**

### 16.5 prefix query【不推荐】

前缀查询，效率略低，除非必要，一般不太建议使用。

给定关键词的前缀去查询：

```
GET books/_search
{
  "query": {
    "prefix": {
      "name": {
        "value": "大学"
      }
    }
  }
}
```

### 16.6 wildcard query

wildcard query 即通配符查询。支持单字符和多字符通配符：

- ？表示一个任意字符。
- `*` 表示零个或者多个字符。

查询所有姓张的作者的书：

```
GET books/_search
{
  "query": {
    "wildcard": {
      "author": {
        "value": "张*"
      }
    }
  }
}
```

查询所有姓张并且名字只有两个字的作者的书：

```
GET books/_search
{
  "query": {
    "wildcard": {
      "author": {
        "value": "张?"
      }
    }
  }
}
```

### 16.7 regexp query

支持正则表达式查询。

查询所有姓张并且名字只有两个字的作者的书：

```
GET books/_search
{
  "query": {
    "regexp": {
      "author": "张."
    }
  }
}
```

### 16.8 fuzzy query

在实际搜索中，有时我们可能会打错字，从而导致搜索不到，在 match query 中，可以通过 fuzziness 属性实现模糊查询。

fuzzy query 返回与搜索关键字相似的文档。怎么样就算相似？以LevenShtein 编辑距离为准。编辑距离是指将一个字符变为另一个字符所需要更改字符的次数，更改主要包括四种：

- 更改字符（javb--〉java）
- 删除字符（javva--〉java）
- 插入字符（jaa--〉java）
- 转置字符（ajva--〉java），转置相邻的两个字符

为了找到相似的词，模糊查询会在指定的编辑距离中创建搜索关键词的所有可能变化或者扩展的集合，然后进行搜索匹配。

```
GET books/_search
{
  "query": {
    "fuzzy": {
      "name": "javba"
    }
  }
}

GET book/_search
{
  "query": {
    "fuzzy": {
      "name": {
        "fuzziness": 1,
        "value": "jaav"
      }
    }
  }
}
```

### 16.9 ids query

根据指定的 id 查询。

```
GET books/_search
{
  "query": {
    "ids":{
      "values":  [1,2,3]
    }
  }
}
```

### 