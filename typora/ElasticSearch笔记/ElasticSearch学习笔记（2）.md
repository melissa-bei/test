# ElasticSearch学习笔记（二）

## 5.ElasticSearch 索引管理

### 5.1 新建索引

#### 5.1.1 通过 head 插件新建索引

在 head 插件中，选择 索引选项卡，然后点击新建索引。新建索引时，需要填入索引名称、分片数以及副本数。

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-5-01.jpg)

索引创建成功后，如下图：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-5-02.jpg)

0、1、2、3、4 分别表示索引的分片，粗框表示主分片，细框表示副本（点一下框，通过 primary 属性可以查看是主分片还是副本）。.kibana 索引只有一个分片和一个副本，所以只有 0。

#### 5.1.2 通过请求创建

可以通过 postman 发送请求，也可以通过 kibana 发送请求，由于 kibana 有提示，所以这里采用 kibana。

创建索引请求：

```
PUT book
```

创建成功后，可以查看索引信息：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-5-03.jpg)

需要注意两点：

- 索引名称不能有大写字母

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-5-04.jpg)

- 索引名是唯一的，不能重复，重复创建会出错

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-5-05.jpg)

### 5.2 更新索引

索引创建好之后，可以修改其属性。

例如修改索引的副本数：

```
PUT book/_settings
{
  "number_of_replicas": 2
}
```

修改成功后，如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-5-06.jpg)

更新分片数也是一样。

### 5.3 修改索引的读写权限

索引创建成功后，可以向索引中写入文档：

```
PUT book/_doc/1
{
  "title":"三国演义"
}
```

写入成功后，可以在 head 插件中查看：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-5-07.jpg)

默认情况下，索引是具备读写权限的，当然这个读写权限可以关闭。

例如，关闭索引的写权限：

```
PUT book/_settings
{
  "blocks.write": true
}
```

关闭之后，就无法添加文档了。关闭了写权限之后，如果想要再次打开，方式如下：

```
PUT book/_settings
{
  "blocks.write": false
}
```

其他类似的权限有：

- blocks.write
- blocks.read
- blocks.read_only

### 5.4 查看索引

head 插件查看方式如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-5-08.jpg)

请求查看方式如下：

```
GET book/_settings
```

也可以同时查看多个索引信息：

```
GET book,test/_settings
```

也可以查看所有索引信息：

```
GET _all/_settings
```

### 5.5 删除索引

head 插件可以删除索引：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-5-09.jpg)

请求删除如下：

```
DELETE test
```

删除一个不存在的索引会报错。

### 5.6 索引打开/关闭

关闭索引：

```
POST book/_close
```

打开索引：

```
POST book/_open
```

当然，可以同时关闭/打开多个索引，多个索引用 , 隔开，或者直接使用 _all 代表所有索引。

### 5.7 复制索引

索引复制，只会复制数据，不会复制索引配置。

```
POST _reindex
{
  "source": {"index":"book"},
  "dest": {"index":"book_new"}
}
```

复制的时候，可以添加查询条件。

### 5.8 索引别名

可以为索引创建别名，如果这个别名是唯一的，该别名可以代替索引名称。

```
POST /_aliases
{
  "actions": [
    {
      "add": {
        "index": "book",
        "alias": "book_alias"
      }
    }
  ]
}
```

添加结果如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-5-10.jpg)

将 add 改为 remove 就表示移除别名：

```
POST /_aliases
{
  "actions": [
    {
      "remove": {
        "index": "book",
        "alias": "book_alias"
      }
    }
  ]
}
```

查看某一个索引的别名：

```
GET /book/_alias
```

查看某一个别名对应的索引（book_alias 表示一个别名）：

```
GET /book_alias/_alias
```

可以查看集群上所有可用别名：

```
GET /_alias
```



## 6.ElasticSearch 文档的基本操作

### 6.1 新建文档

首先新建一个索引。

然后向索引中添加一个文档：

```
PUT blog/_doc/1
{
  "title":"6. ElasticSearch 文档基本操作",
  "date":"2020-11-05",
  "content":"新建索引"
}
```

1 表示新建文档的 id。

添加成功后，响应的 json 如下：

```
{
  "_index" : "blog",
  "_type" : "_doc",
  "_id" : "1",
  "_version" : 1,
  "result" : "created",
  "_shards" : {
    "total" : 2,
    "successful" : 2,
    "failed" : 0
  },
  "_seq_no" : 0,
  "_primary_term" : 1
}
```

- _index 表示文档索引。
- _type 表示文档的类型。
- _id 表示文档的 id。
- _version 表示文档的版本（更新文档，版本会自动加 1，针对一个文档的）。
- result 表示执行结果。
- _shards 表示分片信息。
- `_seq_no` 和 `_primary_term` 这两个也是版本控制用的（针对当前 index）。

添加成功后，可以查看添加的文档：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-6-01.jpg)

当然，添加文档时，也可以不指定 id，此时系统会默认给出一个 id，如果不指定 id，则需要使用 POST 请求，而不能使用 PUT 请求。

```
POST blog/_doc
{
  "title":"666",
  "date":"2020-11-05",
  "content":"新建索引"
}
```

### 6.2 获取文档

Es 中提供了 GET API 来查看存储在 es 中的文档。使用方式如下：

```
GET blog/_doc/RuWrl3UByGJWB5WucKtP
```

上面这个命令表示获取一个 id 为 RuWrl3UByGJWB5WucKtP 的文档。

如果获取不存在的文档，会返回如下信息：

```
{
  "_index" : "blog",
  "_type" : "_doc",
  "_id" : "2",
  "found" : false
}
```

如果仅仅只是想探测某一个文档是否存在，可以使用 head 请求：

如果文档不存在，响应如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-6-02.jpg)

如果文档存在，响应如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-6-03.jpg)

当然也可以批量获取文档。

```
GET blog/_mget
{
  "ids":["1","RuWrl3UByGJWB5WucKtP"]
}
```

这里可能有小伙伴有疑问，GET 请求竟然可以携带请求体？

某些特定的语言，例如 JavaScript 的 HTTP 请求库是不允许 GET 请求有请求体的，实际上在 RFC7231 文档中，并没有规定 GET 请求的请求体该如何处理，这样造成了一定程度的混乱，有的 HTTP 服务器支持 GET 请求携带请求体，有的 HTTP 服务器则不支持。虽然 es 工程师倾向于使用 GET 做查询，但是为了保证兼容性，es 同时也支持使用 POST 查询。例如上面的批量查询案例，也可以使用 POST 请求。

### 6.3 文档更新

#### 6.3.1 普通更新

注意，文档更新一次，version 就会自增 1。

可以直接更新整个文档：

```
PUT blog/_doc/RuWrl3UByGJWB5WucKtP
{
  "title":"666"
}
```

这种方式，更新的文档会覆盖掉原文档。

大多数时候，我们只是想更新文档字段，这个可以通过脚本来实现。

```
POST blog/_update/1
{
  "script": {
    "lang": "painless",
    "source":"ctx._source.title=params.title",
    "params": {
      "title":"666666"
    }
  }
}
```

更新的请求格式：POST {index}/_update/{id}

在脚本中，lang 表示脚本语言，painless 是 es 内置的一种脚本语言。source 表示具体执行的脚本，ctx 是一个上下文对象，通过 ctx 可以访问到 `_source`、`_title` 等。

也可以向文档中添加字段：

```
POST blog/_update/1
{
  "script": {
    "lang": "painless",
    "source":"ctx._source.tags=[\"java\",\"php\"]"
  }
}
```

添加成功后的文档如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-6-04.jpg)

通过脚本语言，也可以修改数组。例如再增加一个 tag：

```
POST blog/_update/1
{
  "script":{
    "lang": "painless",
    "source":"ctx._source.tags.add(\"js\")"
  }
}
```

当然，也可以使用 if else 构造稍微复杂一点的逻辑。

```
POST blog/_update/1
{
  "script": {
    "lang": "painless",
    "source": "if (ctx._source.tags.contains(\"java\")){ctx.op=\"delete\"}else{ctx.op=\"none\"}"
  }
}
```

#### 6.3.2 查询更新

通过条件查询找到文档，然后再去更新。

例如将 title 中包含 666 的文档的 content 修改为 888。

```
POST blog/_update_by_query
{
  "script": {
    "source": "ctx._source.content=\"888\"",
    "lang": "painless"
  },
  "query": {
    "term": {
      "title":"666"
    }
  }
}
```

### 6.4 删除文档

#### 6.4.1 根据 id 删除

从索引中删除一个文档。

删除一个 id 为 TuUpmHUByGJWB5WuMasV 的文档。

```
DELETE blog/_doc/TuUpmHUByGJWB5WuMasV
```

如果在添加文档时指定了路由，则删除文档时也需要指定路由，否则删除失败。

#### 6.4.2 查询删除

查询删除是 POST 请求。

例如删除 title 中包含 666 的文档：

```
POST blog/_delete_by_query
{
  "query":{
    "term":{
      "title":"666"
    }
  }
}
```

也可以删除某一个索引下的所有文档：

```
POST blog/_delete_by_query
{
  "query":{
    "match_all":{
      
    }
  }
}
```

### 6.5 批量操作

es 中通过 Bulk API 可以执行批量索引、批量删除、批量更新等操作。

首先需要将所有的批量操作写入一个 JSON 文件中，然后通过 POST 请求将该 JSON 文件上传并执行。

例如新建一个名为 aaa.json 的文件，内容如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-6-05.jpg)

首先第一行：index 表示要执行一个索引操作（这个表示一个 action，其他的 action 还有 create，delete，update）。`_index` 定义了索引名称，这里表示要创建一个名为 user 的索引，`_id` 表示新建文档的 id 为 666。

第二行是第一行操作的参数。

第三行的 update 则表示要更新。

第四行是第三行的参数。

注意，结尾要空出一行。

aaa.json 文件创建成功后，在该目录下，执行请求命令，如下：

```
curl -XPOST "http://localhost:9200/user/_bulk" -H "content-type:application/json" --data-binary @aaa.json
```

执行完成后，就会创建一个名为 user 的索引，同时向该索引中添加一条记录，再修改该记录，最终结果如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-6-06.jpg)



## 