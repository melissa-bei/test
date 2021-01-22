# ElasticSearch学习笔记（九）

## 22.指标聚合

ES中的聚合分析，主要从三个方面进行学习：

- 指标聚合
- 桶聚合，有点像关系型数据库中使用 group_by的效果
- 管道聚合

### 22.1 Max Aggregation 【数值类型】

统计最大值。例如查询价格最高的书：

```
GET books/_search
{
  "aggs": {
    "max_price": {
      "max": {
        "field": "price"
      }
    }
  }
}
```

查询结果如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-22-01.jpg)

```
GET books/_search
{
  "aggs": {
    "max_price": {
      "max": {
        "field": "price",
        "missing": 1000
      }
    }
  }
}
```

如果某个文档中缺少 price 字段，则设置该字段的值为 1000。

返回结果仍为 269 是因为没人缺少这个字段，新添加一个文档进行验证，我设置的 missing 值大于269，当它替换给文档 1001 后，最大值就变成 1000 了。

```
PUT books/_doc/1001
{
  "name":"new book"
}
```

也可以通过脚本来查询最大值：

```
GET books/_search
{
  "aggs": {
    "max_price": {
      "max": {
        "script": {
          "source": "if(doc['price'].size()!=0){doc.price.value}"
        }
      }
    }
  }
}
```

使用脚本时，可以先通过 `doc['price'].size()!=0` 去判断文档是否有对应的属性。

### 22.2 Min Aggregation 【数值类型】

统计最小值，用法和 Max Aggregation 基本一致：

```
GET books/_search
{
  "aggs": {
    "min_price": {
      "min": {
        "field": "price",
        "missing": 1000
      }
    }
  }
}
```

脚本：

```
GET books/_search
{
  "aggs": {
    "min_price": {
      "min": {
        "script": {
          "source": "if(doc['price'].size()!=0){doc.price.value}"
        }
      }
    }
  }
}
```

### 22.3 Avg Aggregation 【数值类型】

统计平均值：

```
GET books/_search
{
  "aggs": {
    "avg_price": {
      "avg": {
        "field": "price"
      }
    }
  }
}

GET books/_search
{
  "aggs": {
    "avg_price": {
      "avg": {
        "script": {
          "source": "if(doc['price'].size()!=0){doc.price.value}"
        }
      }
    }
  }
}
```

### 22.4 Sum Aggregation 【数值类型】

求和：

```
GET books/_search
{
  "aggs": {
    "sum_price": {
      "sum": {
        "field": "price"
      }
    }
  }
}

GET books/_search
{
  "aggs": {
    "sum_price": {
      "sum": {
        "script": {
          "source": "if(doc['price'].size()!=0){doc.price.value}"
        }
      }
    }
  }
}
```

### 22.5 Cardinality Aggregation 【基数统计，尽量处理keyword比较精确，统计不同的个数】

cardinality aggregation 用于基数统计。类似于 SQL 中的 distinct count(0)：

text 类型是分析型类型，默认是不允许进行聚合操作的，如果相对 text 类型进行聚合操作，需要设置其 fielddata 属性为 true，这种方式虽然可以使 text 类型进行聚合操作，但是无法满足精准聚合，如果需要精准聚合，可以设置字段的子域为 keyword。

**方式一：**

重新定义 books 索引：

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
        "analyzer": "ik_max_word",
        "fielddata": true
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

定义完成后，重新插入数据（参考之前的视频）。

接下来就可以查询出版社的总数量：

```
GET books/_search
{
  "aggs": {
    "publish_count": {
      "cardinality": {
        "field": "publish"
      }
    }
  }
}
```

查询结果如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-22-02.jpg)

这种聚合方式可能会不准确，因为text会进行分词。可以将 publish 设置为 keyword 类型或者设置子域为 keyword。

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
        "type": "keyword"
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

查询结果如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-22-03.jpg)

对比查询结果可知，使用 fileddata 的方式，查询结果不准确。

### 22.6 Stats Aggregation 【数值类型，一次性返回 count、max、min、avg、sum，基本统计】

```
GET books/_search
{
  "aggs": {
    "stats_query": {
      "stats": {
        "field": "price"
      }
    }
  }
}
```

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-22-04.jpg)

### 22.7 Extends Stats Aggregation 【数值类型，比 stats 多出来：平方和、方差、标准差、平均值加减两个标准差的区间，高级统计】

```
GET books/_search
{
  "aggs": {
    "es": {
      "extended_stats": {
        "field": "price"
      }
    }
  }
}
```

<img src="E:\newbie\Exercise\test\typora\typora-user-images\es-22-05.jpg" alt="image-20210121165727337" style="zoom: 200%;" />

### 22.8 Percentiles Aggregation 【数值类型】

百分位统计。统计不同百分位的值是什么

```
GET books/_search
{
  "aggs": {
    "p": {
      "percentiles": {
        "field": "price",
        "percents": [
          1,
          5,
          10,
          15,
          25,
          50,
          75,
          95,
          99
        ]
      }
    }
  }
}
```

### 22.9 Value Count Aggregation

可以按照字段统计文档数量（包含指定字段的文档数量）：即不统计当前字段为空的文档

```
GET books/_search
{
  "aggs": {
    "count": {
      "value_count": {
        "field": "price"
      }
    }
  }
}
```



## 23.ElasticSearch 桶聚合（bucket）

### 23.1 Terms Aggregation

Terms Aggregation 用于分组聚合，例如，统计各个出版社出版的图书总数量:

```
GET books/_search
{
  "aggs": {
    "NAME": {
      "terms": {
        "field": "publish",
        "size": 20
      }
    }
  }
}
```

统计结果如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-23-01.jpg)

在 terms 分桶的基础上，还可以对每个桶进行指标聚合。

统计不同出版社所出版的图书的平均价格：

```
GET books/_search
{
  "aggs": {
    "NAME": {
      "terms": {
        "field": "publish",
        "size": 20
      },
      "aggs": {
        "avg_price": {
          "avg": {
            "field": "price"
          }
        }
      }
    }
  }
}
```

统计结果如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-23-02.jpg)

### 23.2 Filter Aggregation

过滤器聚合。可以将符合过滤器中条件的文档分到一个桶中，然后可以求其平均值。

例如查询书名中包含 java 的图书的平均价格：

```
GET books/_search
{
  "aggs": {
    "NAME": {
      "filter": {
        "term": {
          "name": "java"
        }
      },
      "aggs": {
        "avg_price": {
          "avg": {
            "field": "price"
          }
        }
      }
    }
  }
}
```

### 23.3 Filters Aggregation

多过滤器聚合。过滤条件可以有多个。

例如查询书名中包含 java 或者 office 的图书的平均价格：

```
GET books/_search
{
  "aggs": {
    "NAME": {
      "filters": {
        "filters": [
          {
            "term":{
              "name":"java"
            }
          },{
            "term":{
              "name":"office"
            }
          }
          ]
      },
      "aggs": {
        "avg_price": {
          "avg": {
            "field": "price"
          }
        }
      }
    }
  }
}
```

---

#### 注意点：

这里要注意的一个问题是：`filter`叠加`terms`与`filters`叠加`term`的效果是不一样的。

1. `filter`叠加`terms`

```
GET book/_search?size=0
{
  "aggs": {
    "1": {
      "filter": {
        "terms": {
          "name": ["java", "office"]
        }
      },
      "aggs": {
        "2": {
          "avg": {
            "field": "price"
          }
        }
      }
    }
  }
}
```

返回结果如下：结果在计算时，是把包含`java`的书和包含`office`的书放在一起来计算的平均值。

<img src="E:\newbie\Exercise\test\typora\typora-user-images\es-23-03.jpg" alt="image-20210121171956642" style="zoom:150%;" />

2. `filters`叠加`term`

```
GET book/_search?size=0
{
  "aggs": {
    "1": {
      "filters": {
        "filters": [
          {
            "term":{
              "name": "java"
            }
          },
          {
            "term":{
              "name": "office"
            }
          }
        ]
      },
      "aggs": {
        "2": {
          "avg": {
            "field": "price"
          }
        }
      }
    }
  }
}
```

返回结果如下：filters 把满足不同条件的文档分别放在了不同的 bucket 里再计算相应的平均值。

<img src="E:\newbie\Exercise\test\typora\typora-user-images\es-23-04.jpg" alt="image-20210121172221808" style="zoom:150%;" />

**至于计算出的值之间有什么样的关系？**

取决于这两个条件之间是否有交集。没有交集结果可以将第二种情况得到的结果进行简单计算即可得到第一种情况的结果；如果有交集，则需要考虑到相交的是那些文档以及相应字段的值，就稍微有点麻烦。

---

### 23.4 Range Aggregation 【数值类型， [日期类型]】

按照范围聚合，在某一个范围内的文档数统计。

例如统计图书价格在 0-50、50-100、100-150、150以上的图书数量：

`from` 从……

`to` 到……

```
GET books/_search
{
  "aggs": {
    "NAME": {
      "range": {
        "field": "price",
        "ranges": [
          {
            "to": 50
          },{
            "from": 50,
            "to": 100
          },{
            "from": 100,
            "to": 150
          },{
            "from": 150
          }
        ]
      }
    }
  }
}
```

### 23.5 Date Range Aggregation 【日期类型】

Range Aggregation 也可以用来统计日期，但是也可以使用 Date Range Aggregation，后者的优势在于可以使用日期表达式。

造数据：

```
PUT blog/_doc/1
{
  "title":"java",
  "date":"2018-12-30"
}
PUT blog/_doc/2
{
  "title":"java",
  "date":"2020-12-30"
}
PUT blog/_doc/3
{
  "title":"java",
  "date":"2022-10-30"
}
```

统计一年前到一年后的博客数量：

```
GET blog/_search
{
  "aggs": {
    "NAME": {
      "date_range": {
        "field": "date",
        "ranges": [
          {
            "from": "now-12M/M",
            "to": "now+1y/y"
          }
        ]
      }
    }
  }
}
```

返回结果如下：

![image-20210121173611899](E:\newbie\Exercise\test\typora\typora-user-images\es-23-05.jpg)

- 12M/M 表示 12 个月。
- 1y/y 表示 1年。
- d 表示天

### 23.6 Date Histogram Aggregation

时间直方图聚合。

例如统计各个月份的博客数量

```
GET blog/_search
{
  "aggs": {
    "NAME": {
      "date_histogram": {
        "field": "date",
        "calendar_interval": "month"
      }
    }
  }
}
```

窗口中不会画出来，但是回返回一个json结构文件，可以拷贝出来去画图。

![image-20210121173823138](E:\newbie\Exercise\test\typora\typora-user-images\es-23-06.jpg)

### 23.7 Missing Aggregation 【空值聚合】

统计所有没有 price 字段的文档：只能处理 not analyze 类型。

```
GET books/_search
{
  "aggs": {
    "NAME": {
      "missing": {
        "field": "price"
      }
    }
  }
}
```

### 23.8 Children Aggregation

可以根据父子文档关系进行分桶。

查询子类型为 student 的文档数量：

```
GET stu_class/_search
{
  "aggs": {
    "NAME": {
      "children": {
        "type": "student"
      }
    }
  }
}
```

---

#### 疑问：

为什么 parent 聚合 和 children 聚合 的类型都只能设置为子文档。

```
GET test_p&c_revit_model/_search?size=0
{
  "aggs": {
    "NAME": {
      "parent": {
        "type": "element"
      }
    }
  }
}

GET test_p&c_revit_model/_search?size=0
{
  "aggs": {
    "NAME": {
      "chileren": {
        "type": "element"
      }
    }
  }
}
```

---

### 23.9 Geo Distance Aggregation

对地理位置数据做统计。

例如查询(34.288991865037524,108.9404296875)坐标方圆 600KM 和 超过 600KM 的城市数量。

```
GET geo/_search
{
  "aggs": {
    "NAME": {
      "geo_distance": {
        "field": "location",
        "origin": "34.288991865037524,108.9404296875",
        "unit": "km", 
        "ranges": [
          {
            "to": 600
          },{
            "from": 600
          }
        ]
      }
    }
  }
}
```

单位有以下几种：

- `cm` 厘米
- `in` 寸
- `km` 千米
- `m` 米
- `mi` 英里
- `mm` 毫米
- `yd` 码

### 23.10 IP Range Aggregation

IP 地址范围查询。

准备数据：

```
PUT blog
{
  "mappings": {
    "properties": {
      "ip":{
        "type": "ip"
      }
    }
  }
}
PUT blog/_doc/1
{
  "title":"java",
  "date":"2018-12-30",
  "ip":"127.0.0.1"
}
PUT blog/_doc/2
{
  "title":"java",
  "date":"2020-12-30",
  "ip":"127.0.0.5"
}
PUT blog/_doc/3
{
  "title":"java",
  "date":"2022-10-30",
  "ip":"127.0.0.10"
}
```

查询：

from……to……左闭右开

```
GET blog/_search
{
  "aggs": {
    "NAME": {
      "ip_range": {
        "field": "ip",
        "ranges": [
          {
            "from": "127.0.0.5",
            "to": "127.0.0.11"
          }
        ]
      }
    }
  }
}
```



## 24.ElasticSearch 管道聚合

管道聚合相当于在之前聚合的基础上，再次聚合。

Avg Bucket ==> Avg

Max Bucket ==> Max

Min Bucket ==> Min

Sum Bucket ==> Sum

Stats Bucket ==> Stats

Extended Bucket ==> Extended

Percentiles Bucket ==> Percentiles

### 24.1 Avg Bucket Aggregation

计算聚合平均值。例如，统计每个出版社所出版图书的平均值，然后再统计所有出版社的平均值：

```
GET books/_search
{
  "aggs": {
    "book_count": {
      "terms": {
        "field": "publish",
        "size": 3
      },
      "aggs": {
        "book_avg": {
          "avg": {
            "field": "price"
          }
        }
      }
    },
    "avg_book":{
      "avg_bucket": {
        "buckets_path": "book_count>book_avg"
      }
    }
  }
}
```

### 24.2 Max Bucket Aggregation

统计每个出版社所出版图书的平均值，然后再统计平均值中的最大值：

```
GET books/_search
{
  "aggs": {
    "book_count": {
      "terms": {
        "field": "publish",
        "size": 3
      },
      "aggs": {
        "book_avg": {
          "avg": {
            "field": "price"
          }
        }
      }
    },
    "avg_book":{
      "max_bucket": {
        "buckets_path": "book_count>book_avg"
      }
    }
  }
}
```

### 24.3 Min Bucket Aggregation

统计每个出版社所出版图书的平均值，然后再统计平均值中的最小值：

```
GET books/_search
{
  "aggs": {
    "book_count": {
      "terms": {
        "field": "publish",
        "size": 3
      },
      "aggs": {
        "book_avg": {
          "avg": {
            "field": "price"
          }
        }
      }
    },
    "avg_book":{
      "min_bucket": {
        "buckets_path": "book_count>book_avg"
      }
    }
  }
}
```

### 24.4 Sum Bucket Aggregation

统计每个出版社所出版图书的平均值，然后再统计平均值之和：

```
GET books/_search
{
  "aggs": {
    "book_count": {
      "terms": {
        "field": "publish",
        "size": 3
      },
      "aggs": {
        "book_avg": {
          "avg": {
            "field": "price"
          }
        }
      }
    },
    "avg_book":{
      "sum_bucket": {
        "buckets_path": "book_count>book_avg"
      }
    }
  }
}
```

### 24.5 Stats Bucket Aggregation

统计每个出版社所出版图书的平均值，然后再统计平均值的各种数据：

```
GET books/_search
{
  "aggs": {
    "book_count": {
      "terms": {
        "field": "publish",
        "size": 3
      },
      "aggs": {
        "book_avg": {
          "avg": {
            "field": "price"
          }
        }
      }
    },
    "avg_book":{
      "stats_bucket": {
        "buckets_path": "book_count>book_avg"
      }
    }
  }
}
```

### 24.6 Extended Stats Bucket Aggregation

```
GET books/_search
{
  "aggs": {
    "book_count": {
      "terms": {
        "field": "publish",
        "size": 3
      },
      "aggs": {
        "book_avg": {
          "avg": {
            "field": "price"
          }
        }
      }
    },
    "avg_book":{
      "extended_stats_bucket": {
        "buckets_path": "book_count>book_avg"
      }
    }
  }
}
```

### 24.7 Percentiles Bucket Aggregation

```
GET books/_search
{
  "aggs": {
    "book_count": {
      "terms": {
        "field": "publish",
        "size": 3
      },
      "aggs": {
        "book_avg": {
          "avg": {
            "field": "price"
          }
        }
      }
    },
    "avg_book":{
      "percentiles_bucket": {
        "buckets_path": "book_count>book_avg"
      }
    }
  }
}
```

