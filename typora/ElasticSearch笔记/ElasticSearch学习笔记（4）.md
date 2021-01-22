# ElasticSearch学习笔记（三）

## 10.ElasticSearch字段类型

### 10.1 核心类型

#### 10.1.1 字符串类型

- string：这是一个已经过期的字符串类型。在 es5 之前，用这个来描述字符串，现在的话，它已经被 text 和 keyword 替代了。
- text：如果一个字段是要被全文检索的，比如说博客内容、新闻内容、产品描述，那么可以使用 text。用了 text 之后，字段内容会被分析，在生成倒排索引之前，字符串会被分词器分成一个个词项。text 类型的字段不用于排序，很少用于聚合。这种字符串也被称为 analyzed 字段。
- keyword：这种类型适用于结构化的字段，例如标签、email 地址、手机号码等等，这种类型的字段可以用作过滤、排序、聚合等。这种字符串也称之为 not-analyzed 字段。

#### 10.1.2 数字类型

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-9-05.jpg)

- 在满足需求的情况下，优先使用范围小的字段。字段长度越短，索引和搜索的效率越高。
- 浮点数，优先考虑使用 scaled_float。

scaled_float 举例：

```
PUT product
{
  "mappings": {
    "properties": {
      "name":{
        "type": "text"
      },
      "price":{
        "type": "scaled_float",
        "scaling_factor": 100
      }
    }
  }
}
```

#### 10.1.3 日期类型

由于 JSON 中没有日期类型，所以 es 中的日期类型形式就比较多样：

- 2020-11-11 或者 2020-11-11 11:11:11
- 一个从 1970.1.1 零点到现在的一个秒数或者毫秒数。

es 内部将时间转为 UTC，然后将时间按照 millseconds-since-the-epoch 的长整型来存储。

自定义日期类型：

```
PUT product
{
  "mappings": {
    "properties": {
      "date":{
        "type": "date"
      }
    }
  }
}
```

这个能够解析出来的时间格式比较多。

```
PUT product/_doc/1
{
  "date":"2020-11-11"
}

PUT product/_doc/2
{
  "date":"2020-11-11T11:11:11Z"
}


PUT product/_doc/3
{
  "date":"1604672099958"
}
```

上面三个文档中的日期都可以被解析，内部存储的是毫秒计时的长整型数。

#### 10.1.4 布尔类型（boolean）

JSON 中的 “true”、“false”、true、false 都可以。

#### 10.1.5 二进制类型（binary）

二进制接受的是 base64 编码的字符串，默认不存储，也不可搜索。

#### 10.1.6 范围类型

- integer_range
- float_range
- long_range
- double_range
- date_range
- ip_range

定义的时候，指定范围类型即可：

```
PUT product
{
  "mappings": {
    "properties": {
      "date":{
        "type": "date"
      },
      "price":{
        "type":"float_range"
      }
    }
  }
}
```

插入文档的时候，需要指定范围的界限：

```
PUT product
{
  "mappings": {
    "properties": {
      "date":{
        "type": "date"
      },
      "price":{
        "type":"float_range"
      }
    }
  }
}
```

指定范围的时，可以使用 gt、gte、lt、lte。

### 10.2 复合类型

#### 10.2.1 数组类型

es 中没有专门的数组类型。默认情况下，任何字段都可以有一个或者多个值。需要注意的是，数组中的元素必须是同一种类型。

添加数组是，数组中的第一个元素决定了整个数组的类型。

#### 10.2.2 对象类型（object）

由于 JSON 本身具有层级关系，所以文档包含内部对象。内部对象中，还可以再包含内部对象。

```
PUT product/_doc/2
{
  "date":"2020-11-11T11:11:11Z",
  "ext_info":{
    "address":"China"
  }
}
```

#### 10.2.3 嵌套类型（nested）

nested 是 object 中的一个特例。

如果使用 object 类型，假如有如下一个文档：

```
{
  "user":[
    {
      "first":"Zhang",
      "last":"san"
    },
    {
      "first":"Li",
      "last":"si"
    }
    ]
}
```

由于 Lucene 没有内部对象的概念，所以 es 会将对象层次扁平化，将一个对象转为字段名和值构成的简单列表。即上面的文档，最终存储形式如下：

```
{
"user.first":["Zhang","Li"],
"user.last":["san","si"]
}
```

扁平化之后，用户名之间的关系没了。这样会导致如果搜索 Zhang si 这个人，会搜索到。

此时可以 nested 类型来解决问题，nested 对象类型可以保持数组中每个对象的独立性。nested 类型将数组中的每一饿对象作为独立隐藏文档来索引，这样每一个嵌套对象都可以独立被索引。

```
{
{
"user.first":"Zhang",
"user.last":"san"
},{
"user.first":"Li",
"user.last":"si"
}
}
```

**优点**

文档存储在一起，读取性能高。

**缺点**

更新父或者子文档时需要更新更个文档。

### 10.3 地理类型

使用场景：

- 查找某一个范围内的地理位置
- 通过地理位置或者相对中心点的距离来聚合文档
- 把距离整个到文档的评分中
- 通过距离对文档进行排序

#### 10.3.1 geo_point

geo_point 就是一个坐标点，定义方式如下：

```
PUT people
{
  "mappings": {
    "properties": {
      "location":{
        "type": "geo_point"
      }
    }
  }
}
```

创建时指定字段类型，存储的时候，有四种方式：

```
PUT people/_doc/1
{
  "location":{
    "lat": 34.27,
    "lon": 108.94
  }
}

PUT people/_doc/2
{
  "location":"34.27,108.94"
}

PUT people/_doc/3
{
  "location":"uzbrgzfxuzup"
}

PUT people/_doc/4
{
  "location":[108.94,34.27] # 经度在前，纬度在后
}
```

注意，使用数组描述，先经度后纬度。

地址位置转 geo_hash：http://www.csxgame.top/#/

#### 10.3.2 geo_shape

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-9-06.jpg)

指定 geo_shape 类型：

```
PUT people
{
  "mappings": {
    "properties": {
      "location":{
        "type": "geo_shape"
      }
    }
  }
}
```

添加文档时需要指定具体的类型：

```
PUT people/_doc/1
{
  "location":{
    "type":"point",
    "coordinates": [108.94,34.27]
  }
}
```

如果是 linestring，如下：

```
PUT people/_doc/2
{
  "location":{
    "type":"linestring",
    "coordinates": [[108.94,34.27],[100,33]]
  }
}
```

### 10.4 特殊类型

#### 10.4.1 IP

存储 IP 地址，类型是 ip：

```
PUT blog
{
  "mappings": {
    "properties": {
      "address":{
        "type": "ip"
      }
    }
  }
}
```

添加文档：

```
PUT blog/_doc/1
{
  "address":"192.168.91.1"
}
```

搜索文档：根据网段来搜索，**我自己搭建的es没搜索到**。

```
GET blog/_search
{
  "query": {
    "term": {
      "address": "192.168.0.0/16"
    }
  }
}
```

#### 10.4.2 token_count

用于统计字符串分词后的词项个数。

```
PUT blog
{
  "mappings": {
    "properties": {
      "title":{
        "type": "text",
        "fields": {
          "length":{
            "type":"token_count",
            "analyzer":"standard"
          }
        }
      }
    }
  }
}
```

相当于新增了 title.length 字段用来统计分词后词项的个数。

添加文档：

```
PUT blog/_doc/1
{
  "title":"zhang san"
}
```

可以通过 token_count 去查询：

```
GET blog/_search
{
  "query": {
    "term": {
      "title.length": 2
    }
  }
}
```

