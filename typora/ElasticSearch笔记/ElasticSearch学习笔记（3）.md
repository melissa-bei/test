# ElasticSearch学习笔记（三）

## 7.ElasticSearch文档路由

es 是一个分布式系统，当我们存储一个文档到 es 上之后，这个文档实际上是被存储到 master 节点中的某一个主分片上。

例如新建一个索引，该索引有两个分片，0个副本，如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-7-01.jpg)

接下来，向该索引中保存一个文档：

```
PUT blog/_doc/a
{
  "title":"a"
}
```

文档保存成功后，可以查看该文档被保存到哪个分片中去了：

```
GET _cat/shards/blog?v
```

查看结果如下：

```
index shard prirep state   docs store ip        node
blog  1     p      STARTED    0  208b 127.0.0.1 slave02
blog  0     p      STARTED    1 3.6kb 127.0.0.1 master
```

从这个结果中，可以看出，文档被保存到分片 0 （也就是master）中。

那么 es 中到底是按照什么样的规则去分配分片的？

es 中的路由机制是通过哈希算法，将具有相同哈希值的文档放到一个主分片中，分片位置的计算方式如下：

shard=hash(routing) % number_of_primary_shards

routing 可以是一个任意字符串，es 默认是将文档的 id 作为 routing 值，通过哈希函数根据 routing 生成一个数字，然后将该数字和分片数取余，取余的结果就是分片的位置。

默认的这种路由模式，最大的优势在于负载均衡，这种方式可以保证数据平均分配在不同的分片上。但是他有一个很大的劣势，就是查询时候无法确定文档的位置，此时它会将请求广播到所有的分片上去执行。另一方面，使用默认的路由模式，后期修改分片数量不方便。

当然开发者也可以自定义 routing 的值，方式如下：

```
PUT blog/_doc/d?routing=javaboy
{
  "title":"d"
}
```

**如果文档在添加时指定了 routing，则查询、删除、更新时也需要指定 routing，否则命令无法找到文档在哪儿。**

```
# 查询时未指定routing
GET blog/_doc/d
# 返回：
{
  "_index" : "blog",
  "_type" : "_doc",
  "_id" : "d",
  "found" : false
}

# 指定touting
GET blog/_doc/d?routing=javaboy
# 返回
{
  "_index" : "blog",
  "_type" : "_doc",
  "_id" : "d",
  "_version" : 1,
  "_seq_no" : 1,
  "_primary_term" : 1,
  "_routing" : "melissa",
  "found" : true,
  "_source" : {
    "title" : "d"
  }
}
```

>  如果已经指定id和routing上传了一个文档，再次PUT相同id的文档时使用不同routing，分到同一个分片上则指向同一个文档并进行**更新**操作，而不在同一个分片上且新分片上没有相同id的文档时，则执行**创建**操作，这时虽然是相同id但是不同的routing指向不同的文档。

自定义 routing 有可能会导致负载不均衡，这个还是要结合实际情况选择。

> 因为提供的routing只是通过哈希值取余来计算文档存在哪个分片上，因此想要文档存在同一分片上方便查询时，需要指定相同的routing值。

典型场景：

对于用户数据，我们可以将 userid 作为 routing，这样就能保证同一个用户的数据保存在同一个分片中，检索时，同样使用 userid 作为 routing，这样就可以精准的从某一个分片中获取数据。

同一种属性存在同一个分片上能够提高查询的准确性。



## 8.ElasticSearch版本控制

当我们使用 es 的 API 去进行文档更新时，它首先读取原文档出来，然后对原文档进行更新，更新完成后再重新索引整个文档。不论你执行多少次更新，最终保存在 es 中的是最后一次更新的文档。但是如果有两个线程同时去更新，就有可能出问题。

要解决问题，就是锁。

### 8.1 锁

**悲观锁**

很悲观，每一次去读取数据的时候，都认为别人可能会修改数据，所以屏蔽一切可能破坏数据完整性的操作。关系型数据库中，悲观锁使用较多，例如行锁、表锁等等。

**乐观锁**

很乐观，每次读取数据时，都认为别人不会修改数据，因此也不锁定数据，只有在提交数据时，才会检查数据完整性。这种方式可以省去锁的开销，进而提高吞吐量。

在 es 中，实际上使用的就是乐观锁。

### 8.2 版本控制

**es6.7之前**

在 es6.7 之前，使用 version+version_type 来进行乐观并发控制。根据前面的介绍，文档每被修改一个，version 就会自增一次，es 通过 version 字段来确保所有的操作都有序进行。

version 分为内部版本控制和外部版本控制。

#### 8.2.1 内部版本

es 自己维护的就是内部版本，当创建一个文档时，es 会给文档的版本赋值为 1。

每当用户修改一次文档，版本号就回自增 1。

如果使用内部版本，es 要求 version 参数的值必须和 es 文档中 version 的值相当，才能操作成功。

#### 8.2.2 外部版本

也可以维护外部版本。

在添加文档时，就指定版本号：

```
PUT blog/_doc/1?version=200&version_type=external
{
  "title":"2222"
}
```

以后更新的时候，版本要大于已有的版本号。

- vertion_type=external 或者 vertion_type=external_gt 表示以后更新的时候，版本要大于已有的版本号。
- vertion_type=external_gte 表示以后更新的时候，版本要大于等于已有的版本号。

#### 8.2.3 最新方案（Es6.7 之后）

现在使用 `if_seq_no` 和 `if_primary_term` 两个参数来做并发控制。

`seq_no` 不属于某一个文档，它是属于整个索引的（version 则是属于某一个文档的，每个文档的 version 互不影响）。现在更新文档时，使用 `seq_no` 来做并发。由于 `seq_no` 是属于整个 index 的，所以任何文档的修改或者新增，`seq_no` 都会自增。

现在就可以通过 `seq_no` 和 `primary_term` 来做乐观并发控制。

```
PUT blog/_doc/2?if_seq_no=5&if_primary_term=1
{
  "title":"6666"
}
```



## (0)8.倒排索引

倒排索引是 es 中非常重要的索引结构，是从**文档词项到文档 ID** 的一个映射过程。

### 8.1 "正排索引"

我们在关系型数据库中见到的索引，就是“正排索引”。

关系型数据库中的索引如下，假设我有一个博客表：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-8-01.jpg)

我们可以针对这个表建立索引（正排索引）：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-8-02.jpg)

当我们通过 id 或者标题去搜索文章时，就可以快速搜到。

但是如果我们按照文章内容的关键字去搜索，就只能去内容中做字符匹配了。为了提高查询效率，就要考虑使用倒排索引。

### 8.2 倒排索引

倒排索引就是以内容的关键字建立索引，通过索引找到文档 id，再进而找到整个文档。

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-8-03.jpg)

一般来说，倒排索引分为两个部分：

- 单词词典（记录所有的文档词项，以及词项到倒排列表的关联关系）
- 倒排列表（记录单词与对应的关系，由一系列倒排索引项组成，倒排索引项指：文档 id、词频（TF）（词项在文档中出现的次数，评分时使用）、位置（Position，词项在文档中分词的位置，match_phase会用到）、偏移（记录词项开始和结束的位置，高亮会用到））

当我们去索引一个文档时，就回建立倒排索引，搜索时，直接根据倒排索引搜索。



## 9.ElasticSearch映射

映射就是 Mapping，它用来定义一个文档以及文档所包含的字段该如何被存储和索引。所以，它其实有点类似于关系型数据库中表的定义。

### 9.1 映射分类

**动态映射**

顾名思义，就是自动创建出来的映射。es 根据存入的文档，自动分析出来文档中字段的类型以及存储方式，这种就是动态映射。

举一个简单例子，新建一个索引，然后查看索引信息：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-9-01.jpg)image-20201106201219878

在创建好的索引信息中，可以看到，mappings 为空，这个 mappings 中保存的就是映射信息。

现在我们向索引中添加一个文档，如下：

```
PUT blog/_doc/1
{
  "title":"1111",
  "date":"2020-11-11"
}
```

文档添加成功后，就会自动生成 Mappings：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-9-02.jpg)image-20201106201516427

可以看到，date 字段的类型为 date，title 的类型有两个，text 和 keyword。

默认情况下，文档中如果新增了字段，mappings 中也会自动新增进来。

有的时候，如果希望新增字段时，能够抛出异常来提醒开发者，这个可以通过 mappings 中 dynamic 属性来配置。

dynamic 属性有三种取值：

- true，默认即此。自动添加新字段。
- false，忽略新字段。
- strict，严格模式，发现新字段会抛出异常。

具体配置方式如下，创建索引时指定 mappings（这其实就是**静态映射**）：

```
PUT blog
{
  "mappings": {
    "dynamic":"strict",
    "properties": {
      "title":{
        "type": "text"
      },
      "age":{
        "type":"long"
      }
    }
  }
}
```

然后向 blog 中索引中添加数据：

```
PUT blog/_doc/2
{
  "title":"1111",
  "date":"2020-11-11",
  "age":99
}
```

在添加的文档中，多出了一个 date 字段，而该字段没有预定义，所以这个添加操作就回报错：

```
{
  "error" : {
    "root_cause" : [
      {
        "type" : "strict_dynamic_mapping_exception",
        "reason" : "mapping set to strict, dynamic introduction of [date] within [_doc] is not allowed"
      }
    ],
    "type" : "strict_dynamic_mapping_exception",
    "reason" : "mapping set to strict, dynamic introduction of [date] within [_doc] is not allowed"
  },
  "status" : 400
}
```

动态映射还有一个日期检测的问题。

例如新建一个索引，然后添加一个含有日期的文档，如下：

```
PUT blog/_doc/1
{
  "remark":"2020-11-11"
}
```

添加成功后，remark 字段会被推断是一个日期类型。

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-9-03.jpg)image-20201106203240406

此时，remark 字段就无法存储其他类型了。

```
PUT blog/_doc/1
{
  "remark":"javaboy"
}
```

此时报错如下：

```
{
  "error" : {
    "root_cause" : [
      {
        "type" : "mapper_parsing_exception",
        "reason" : "failed to parse field [remark] of type [date] in document with id '1'. Preview of field's value: 'javaboy'"
      }
    ],
    "type" : "mapper_parsing_exception",
    "reason" : "failed to parse field [remark] of type [date] in document with id '1'. Preview of field's value: 'javaboy'",
    "caused_by" : {
      "type" : "illegal_argument_exception",
      "reason" : "failed to parse date field [javaboy] with format [strict_date_optional_time||epoch_millis]",
      "caused_by" : {
        "type" : "date_time_parse_exception",
        "reason" : "Failed to parse with all enclosed parsers"
      }
    }
  },
  "status" : 400
}
```

要解决这个问题，可以使用静态映射，即在索引定义时，将 remark 指定为 text 类型。也可以关闭日期检测（必须在创建的时候就关闭）。

```
PUT blog
{
  "mappings": {
    "date_detection": false
  }
}
```

此时日期类型就回当成文本来处理。

**静态映射**

略。

### 9.2 类型推断

es 中动态映射类型推断方式如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-9-04.jpg)

