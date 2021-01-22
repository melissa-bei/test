# ElasticSearch学习笔记

## 1.ElasticSearch简介

### 1.1 Lucene

Lucene 是一个开源、免费、高性能、纯 Java 编写的全文检索引擎，可以算作是开源领域最好的全文检索工具包。

在实际开发中，Lucene 几乎适用于任何需要全文检索的场景，所以 Lucene 先后发展出好多语言版本，例如 C++、C#、Python 等。

早在 2005 年，Lucene 就升级为 Apache 顶级开源项目。它的作者是 Doug Cutting，有的人可能没听过这这个人，不过你肯定听过他的另一个大名鼎鼎的作品 Hadoop。

不过需要注意的是，Lucene 只是一个工具包，并非一个完整的搜索引擎，开发者可以基于 Lucene 来开发完整的搜索引擎。比较著名的有 Solr、ElasticSearch，不过在分布式和大数据环境下，ElasticSearch 更胜一筹。

Lucene 主要有如下特点：

- 简单
- 跨语言
- 强大的搜索引擎
- 索引速度快
- 索引文件兼容不同平台

### 1.2 ElasticSearch

ElasticSearch 是一个分布式、可扩展、近实时性的高性能搜索与数据分析引擎。ElasticSearch 基于 Java 编写，通过进一步封装 Lucene，将搜索的复杂性屏蔽起来，开发者只需要一套简单的 RESTful API 就可以操作全文检索。

ElasticSearch 在分布式环境下表现优异，这也是它比较受欢迎的原因之一。它支持 PB 级别的结构化或非结构化海量数据处理

整体上来说，ElasticSearch 有三大功能：

- 数据搜集
- 数据分析
- 数据存储

ElasticSearch 的主要特点：

1. 分布式文件存储。
2. 实时分析的分布式搜索引擎。
3. 高可拓展性。
4. 可插拔的插件支持。



## 2.ElasticSearch 从安装开始

### 2.1 单节点安装

首先打开 Es 官网，找到 Elasticsearch：

- https://www.elastic.co/cn/elasticsearch/

然后点击下载按钮，选择合适的版本直接下载即可。

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-2-01.jpg)

将下载的文件解压，解压后的目录含义如下：

| 目录    | 含义           |
| :------ | :------------- |
| modules | 依赖模块目录   |
| lib     | 第三方依赖库   |
| logs    | 输出日志目录   |
| plugins | 插件目录       |
| bin     | 可执行文件目录 |
| config  | 配置文件目录   |
| data    | 数据存储目录   |

启动方式：

进入到 bin 目录下，直接执行 ./elasticsearch 启动即可。

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-2-02.jpg)

看到 started 表示启动成功。

默认监听的端口是 9200，所以浏览器直接输入 localhost:9200 可以查看节点信息。

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-2-03.jpg)

节点的名字以及集群（默认是 elasticsearch）的名字，我们都可以自定义配置。

打开 config/elasticsearch.yml 文件，可以配置集群名称以及节点名称。配置方式如下：

```
cluster.name: javaboy-es
node.name: master
```

配置完成后，保存配置文件，并重启 es。重启成功后，刷新浏览器 localhost:9200 页面，就可以看到最新信息。

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-2-04.jpg)

Es 支持矩阵：

- https://www.elastic.co/cn/support/matrix

### 2.2 HEAD 插件安装

Elasticsearch-head 插件，可以通过可视化的方式查看集群信息。

这里介绍两种安装思路。

#### 2.2.1 浏览器插件安装

Chrome 直接在 App Store 搜索 Elasticsearch-head，点击安装即可。

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-2-05.jpg)

#### 2.2.2 下载插件安装

四个步骤

- `git clone git://github.com/mobz/elasticsearch-head.git`
- `cd elasticsearch-head`
- `npm install`
- `npm run start`

启动成功，页面如下：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-2-06.jpg)

注意，此时看不到集群数据。原因在于这里通过跨域的方式请求集群数据的，默认情况下，集群不支持跨域，所以这里就看不到集群数据。

解决办法如下，修改 es 的 config/elasticsearch.yml 配置文件，添加如下内容，使之支持跨域：

```
http.cors.enabled: true
http.cors.allow-origin: "*"
```

配置完成后，重启 es，此时 head 上就有数据了。

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-2-07.jpg)

### 2.3 分布式安装

假设：

- 一主二从
- master 的端口是 9200，slave 端口分别是 9201 和 9202

首先修改 master 的 config/elasticsearch.yml 配置文件：

```
node.master: true
network.host: 127.0.0.1
```

配置完成后，重启 master。

将 es 的压缩包解压两份，分别命名为 slave01 和 slave02，代表两个从机。

分别对其进行配置。

slave01/config/elasticsearch.yml：

```
# 集群名称必须保持一致
cluster.name: javaboy-es
node.name: slave01
network.host: 127.0.0.1
http.port: 9201
discovery.zen.ping.unicast.hosts: ["127.0.0.1"]
```

slave02/config/elasticsearch.yml：

```
# 集群名称必须保持一致
cluster.name: javaboy-es
node.name: slave02
network.host: 127.0.0.1
http.port: 9202
discovery.zen.ping.unicast.hosts: ["127.0.0.1"]
```

然后分别启动 slave01 和 slave02。启动后，可以在 head 插件上查看集群信息。

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-2-08.jpg)

### 2.4 Kibana 安装

Kibana 是一个 Elastic 公司推出的一个针对 es 的分析以及数据可视化平台，可以搜索、查看存放在 es 中的数据。

安装步骤如下：

1. 下载 Kibana：https://www.elastic.co/cn/downloads/kibana
2. 解压
3. 配置 es 的地址信息（可选，如果 es 是默认地址以及端口，可以不用配置，具体的配置文件是 config/kibana.yml）
4. 执行 ./bin/kibana 文件启动
5. localhost:5601

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-2-09.jpg)

Kibana 安装好之后，首次打开时，可以选择初始化 es 提供的测试数据，也可以不使用。



## 3.ElasticSearch十大概念

### 3.1 ElasticSearch 十大核心概念

#### 3.1.1 集群（Cluster）

一个或者多个安装了 es 节点的服务器组织在一起，就是集群，这些节点共同持有数据，共同提供搜索服务。

一个集群有一个名字，这个名字是集群的唯一标识，该名字成为 cluster name，默认的集群名称是 elasticsearch，具有相同名称的节点才会组成一个集群。

可以在 config/elasticsearch.yml 文件中配置集群名称：

```
cluster.name: javaboy-es
```

在集群中，节点的状态有三种：绿色、黄色、红色：

- 绿色：节点运行状态为健康状态。所有的主分片、副本分片都可以正常工作。
- 黄色：表示节点的运行状态为警告状态，所有的主分片目前都可以直接运行，但是至少有一个副本分片是不能正常工作的。
- 红色：表示集群无法正常工作。

#### 3.1.2 节点（Node）

集群中的一个服务器就是一个节点，节点中会存储数据，同时参与集群的索引以及搜索功能。一个节点想要加入一个集群，只需要配置一下集群名称即可。默认情况下，如果我们启动了多个节点，多个节点还能够互相发现彼此，那么它们会自动组成一个集群，这是 es 默认提供的，但是这种方式并不可靠，有可能会发生脑裂现象。所以在实际使用中，建议一定手动配置一下集群信息。

#### 3.1.3 索引（Index）

索引可以从两方面来理解：

**名词**

具有相似特征文档的集合。

**动词**

索引数据以及对数据进行索引操作。

#### 3.1.4 类型（Type）

类型是索引上的逻辑分类或者分区。在 es6 之前，一个索引中可以有多个类型，从 es7 开始，一个索引中，只能有一个类型。在 es6.x 中，依然保持了兼容，依然支持单 index 多个 type 结构，但是已经不建议这么使用。

#### 3.1.5 文档（Document）

一个可以被索引的数据单元。例如一个用户的文档、一个产品的文档等等。文档都是 JSON 格式的。

#### 3.1.6 分片（Shards）

索引都是存储在节点上的，但是受限于节点的空间大小以及数据处理能力，单个节点的处理效果可能不理想，此时我们可以对索引进行分片。当我们创建一个索引的时候，就需要指定分片的数量。每个分片本身也是一个功能完善并且独立的索引。

默认情况下，一个索引会自动创建 1 个分片，并且为每一个分片创建一个副本。

#### 3.1.7 副本（Replicas）

副本也就是备份，是对主分片的一个备份。

#### 3.1.8 Settings

集群中对索引的定义信息，例如索引的分片数、副本数等等。

#### 3.1.9 Mapping

Mapping 保存了定义索引字段的存储类型、分词方式、是否存储等信息。

#### 3.1.10 Analyzer

字段分词方式的定义。

### 3.2 ElasticSearch Vs 关系型数据库

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-3-01.jpeg)



## 4.ElasticSearch 中的中文分词器

### 4.1 内置分词器

ElasticSearch 核心功能就是数据检索，首先通过索引将文档写入 es。查询分析则主要分为两个步骤：

1. 词条化：**分词器**将输入的文本转为一个一个的词条流。
2. 过滤：比如停用词过滤器会从词条中去除不相干的词条（的，嗯，啊，呢）；另外还有同义词过滤器、小写过滤器等。

ElasticSearch 中内置了多种分词器可以供使用。

内置分词器：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-4-01.jpg)

### 4.2 中文分词器

在 Es 中，使用较多的中文分词器是 elasticsearch-analysis-ik，这个是 es 的一个第三方插件，代码托管在 GitHub 上：

- https://github.com/medcl/elasticsearch-analysis-ik

#### 4.2.1 安装

两种使用方式：

**第一种：**

1. 首先打开分词器官网：https://github.com/medcl/elasticsearch-analysis-ik。
2. 在 https://github.com/medcl/elasticsearch-analysis-ik/releases 页面找到最新的正式版，下载下来。我们这里的下载链接是 https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.9.3/elasticsearch-analysis-ik-7.9.3.zip。
3. 将下载文件解压。
4. 在 es/plugins 目录下，新建 ik 目录，并将解压后的所有文件拷贝到 ik 目录下。
5. 重启 es 服务。

**第二种：**

```
./bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.9.3/elasticsearch-analysis-ik-7.9.3.zip
```

#### 4.2.2 测试

es 重启成功后，首先创建一个名为 test 的索引：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-4-02.jpg)

接下来，在该索引中进行分词测试：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-4-03.jpg)

#### 4.2.3 自定义扩展词库

##### 4.2.3.1 本地自定义

在 es/plugins/ik/config 目录下，新建 ext.dic 文件（文件名任意），在该文件中可以配置自定义的词库。

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-4-04.jpg)

如果有多个词，换行写入新词即可。

然后在 es/plugins/ik/config/IKAnalyzer.cfg.xml 中配置扩展词典的位置：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-4-05.jpg)

##### 4.2.3.2 远程词库

也可以配置远程词库，远程词库支持热更新（不用重启 es 就可以生效）。

热更新只需要提供一个接口，接口返回扩展词即可。

具体使用方式如下，新建一个 Spring Boot 项目，引入 Web 依赖即可。然后在 resources/stastic 目录下新建 ext.dic 文件，写入扩展词：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-4-06.jpg)

接下来，在 es/plugins/ik/config/IKAnalyzer.cfg.xml 文件中配置远程扩展词接口：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-4-08.jpg)

配置完成后，重启 es ，即可生效。

热更新，主要是响应头的 `Last-Modified` 或者 `ETag` 字段发生变化，ik 就会自动重新加载远程扩展



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



## 11.ElasticSearch映射参数

多数属性时在定义mappings的字段时进行定义，和`type`同等级

### 11.1 analyzer

定义文本字段的分词器。默认对索引和查询都是有效的。

假设不用分词器，我们先来看一下索引的结果，创建一个索引并添加一个文档：

```
PUT blog

PUT blog/_doc/1
{
  "title":"定义文本字段的分词器。默认对索引和查询都是有效的。"
}
```

**查看词条向量（term vectors）**

```
GET blog/_termvectors/1
{
  "fields": ["title"]
}
```

查看结果如下：

```
{
  "_index" : "blog",
  "_type" : "_doc",
  "_id" : "1",
  "_version" : 1,
  "found" : true,
  "took" : 0,
  "term_vectors" : {
    "title" : {
      "field_statistics" : {
        "sum_doc_freq" : 22,
        "doc_count" : 1,
        "sum_ttf" : 23
      },
      "terms" : {
        "义" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 1,
              "start_offset" : 1,
              "end_offset" : 2
            }
          ]
        },
        "分" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 7,
              "start_offset" : 7,
              "end_offset" : 8
            }
          ]
        },
        "和" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 15,
              "start_offset" : 16,
              "end_offset" : 17
            }
          ]
        },
        "器" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 9,
              "start_offset" : 9,
              "end_offset" : 10
            }
          ]
        },
        "字" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 4,
              "start_offset" : 4,
              "end_offset" : 5
            }
          ]
        },
        "定" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 0,
              "start_offset" : 0,
              "end_offset" : 1
            }
          ]
        },
        "对" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 12,
              "start_offset" : 13,
              "end_offset" : 14
            }
          ]
        },
        "引" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 14,
              "start_offset" : 15,
              "end_offset" : 16
            }
          ]
        },
        "效" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 21,
              "start_offset" : 22,
              "end_offset" : 23
            }
          ]
        },
        "文" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 2,
              "start_offset" : 2,
              "end_offset" : 3
            }
          ]
        },
        "是" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 19,
              "start_offset" : 20,
              "end_offset" : 21
            }
          ]
        },
        "有" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 20,
              "start_offset" : 21,
              "end_offset" : 22
            }
          ]
        },
        "本" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 3,
              "start_offset" : 3,
              "end_offset" : 4
            }
          ]
        },
        "查" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 16,
              "start_offset" : 17,
              "end_offset" : 18
            }
          ]
        },
        "段" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 5,
              "start_offset" : 5,
              "end_offset" : 6
            }
          ]
        },
        "的" : {
          "term_freq" : 2,
          "tokens" : [
            {
              "position" : 6,
              "start_offset" : 6,
              "end_offset" : 7
            },
            {
              "position" : 22,
              "start_offset" : 23,
              "end_offset" : 24
            }
          ]
        },
        "索" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 13,
              "start_offset" : 14,
              "end_offset" : 15
            }
          ]
        },
        "认" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 11,
              "start_offset" : 12,
              "end_offset" : 13
            }
          ]
        },
        "词" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 8,
              "start_offset" : 8,
              "end_offset" : 9
            }
          ]
        },
        "询" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 17,
              "start_offset" : 18,
              "end_offset" : 19
            }
          ]
        },
        "都" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 18,
              "start_offset" : 19,
              "end_offset" : 20
            }
          ]
        },
        "默" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 10,
              "start_offset" : 11,
              "end_offset" : 12
            }
          ]
        }
      }
    }
  }
}
```

可以看到，默认情况下，中文就是一个字一个字的分，这种分词方式没有任何意义。如果这样分词，查询就只能按照一个字一个字来查，像下面这样：

```
GET blog/_search
{
  "query": {
    "term": {
      "title": "定"
    }
  }
}
```

无意义！！！

所以，我们要根据实际情况，配置合适的分词器。

给字段设定分词器：

```
PUT blog
{
  "mappings": {
    "properties": {
      "title":{
        "type":"text",
        "analyzer": "ik_smart"
      }
    }
  }
}
```

存储文档：

```
PUT blog/_doc/1
{
  "title":"定义文本字段的分词器。默认对索引和查询都是有效的。"
}
```

查看词条向量：

```
GET blog/_termvectors/1
{
  "fields": ["title"]
}
```

查询结果如下：

```
{
  "_index" : "blog",
  "_type" : "_doc",
  "_id" : "1",
  "_version" : 1,
  "found" : true,
  "took" : 1,
  "term_vectors" : {
    "title" : {
      "field_statistics" : {
        "sum_doc_freq" : 12,
        "doc_count" : 1,
        "sum_ttf" : 13
      },
      "terms" : {
        "分词器" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 4,
              "start_offset" : 7,
              "end_offset" : 10
            }
          ]
        },
        "和" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 8,
              "start_offset" : 16,
              "end_offset" : 17
            }
          ]
        },
        "字段" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 2,
              "start_offset" : 4,
              "end_offset" : 6
            }
          ]
        },
        "定义" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 0,
              "start_offset" : 0,
              "end_offset" : 2
            }
          ]
        },
        "对" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 6,
              "start_offset" : 13,
              "end_offset" : 14
            }
          ]
        },
        "文本" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 1,
              "start_offset" : 2,
              "end_offset" : 4
            }
          ]
        },
        "有效" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 11,
              "start_offset" : 21,
              "end_offset" : 23
            }
          ]
        },
        "查询" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 9,
              "start_offset" : 17,
              "end_offset" : 19
            }
          ]
        },
        "的" : {
          "term_freq" : 2,
          "tokens" : [
            {
              "position" : 3,
              "start_offset" : 6,
              "end_offset" : 7
            },
            {
              "position" : 12,
              "start_offset" : 23,
              "end_offset" : 24
            }
          ]
        },
        "索引" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 7,
              "start_offset" : 14,
              "end_offset" : 16
            }
          ]
        },
        "都是" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 10,
              "start_offset" : 19,
              "end_offset" : 21
            }
          ]
        },
        "默认" : {
          "term_freq" : 1,
          "tokens" : [
            {
              "position" : 5,
              "start_offset" : 11,
              "end_offset" : 13
            }
          ]
        }
      }
    }
  }
}
```

然后就可以通过词去搜索了：

```
GET blog/_search
{
  "query": {
    "term": {
      "title": "索引"
    }
  }
}
```

### 11.2 search_analyzer

查询时候的分词器。默认情况下，如果没有配置 search_analyzer，则查询时，首先查看有没有 search_analyzer，有的话，就用 search_analyzer 来进行分词，如果没有，则看有没有 analyzer，如果有，则用 analyzer 来进行分词，否则使用 es 默认的分词器。

### 11.3 normalizer

normalizer 参数用于解析前（索引或者查询）的标准化配置。

比如，在 es 中，对于一些我们不想切分的字符串，我们通常会将其设置为 keyword，搜索时候也是使用整个词进行搜索。如果在索引前没有做好数据清洗，导致大小写不一致，例如 boy 和 BOY，此时，我们就可以使用 normalizer 在索引之前以及查询之前进行文档的标准化。

先来一个反例，创建一个名为 blog 的索引，设置 author 字段类型为 keyword：

```
PUT blog
{
  "mappings": {
    "properties": {
      "author":{
        "type": "keyword"
      }
    }
  }
}
```

添加两个文档：

```
PUT blog/_doc/1
{
  "author":"boy"
}

PUT blog/_doc/2
{
  "author":"BOY"
}
```

然后进行搜索：

```
GET blog/_search
{
  "query": {
    "term": {
      "author": "BOY"
    }
  }
}
```

大写关键字可以搜到大写的文档，小写关键字可以搜到小写的文档。

如果使用了 normalizer，可以在索引和查询时，分别对文档进行预处理。

> text不能使用normalizer，keyword可以使用

normalizer 定义方式如下：

```
PUT blog
{
  "settings": {
    "analysis": {
      "normalizer":{
        "my_normalizer":{  # 自定义一个normalizer
          "type":"custom",
          "filter":["lowercase"]  # 对于所有文档使用lowercase过滤器
        }
      }
    }
  }, 
  "mappings": {
    "properties": {
      "author":{
        "type": "keyword",
        "normalizer":"my_normalizer"
      }
    }
  }
}
```

**在 settings 中定义 normalizer，然后在 mappings 中引用。**

测试方式和前面一致。此时查询的时候，大写关键字也可以查询到小写文档，因为无论是索引还是查询，都会将大写转为小写。

### 11.4 boost

**boost 参数可以设置字段的权重。**

boost 有两种使用思路，一种就是在定义 mappings 的时候使用，在指定字段类型时使用；另一种就是在查询时使用。

实际开发中建议使用后者，前者有问题：如果不重新索引文档，权重无法修改。

mapping 中使用 boost（不推荐）：

```
PUT blog
{
  "mappings": {
    "properties": {
      "content":{
        "type": "text",
        "boost": 2
      }
    }
  }
}
```

另一种方式就是在查询的时候，指定 boost

```
GET blog/_search
{
  "query": {
    "match": {
      "content": {
        "query": "hello",
        "boost": 2
      }
    }
  }
}
```

设置权重的意义在于，当同样的句子在某一个文档的某个字段中重复出现时， luncene 给出的 score 必然是更高的，示例如下：

```
PUT blog
{
  "mappings": {
    "properties": {
      "content":{
        "type": "text",
        "analyzer": "ik_smart"
      }
    }
  }
}
PUT blog/_doc/1
{
  "content":"hello world"
}
PUT blog/_doc/2
{
  "content":"hello world, hello world, hello world"
}
PUT blog/_doc/3
{
  "content":"hello world, hello world, hello world, hello world, hello world, hello world, hello world, hello world,"
}
```

检索"hello"

```
GET blog/_search
{
  "query": {
    "term": {
      "content": "hello"
    }
  }
}
```

返回的结果：先然频数越高的越匹配。

```
{
  "took" : 38,
  "timed_out" : false,
  "_shards" : {
    "total" : 1,
    "successful" : 1,
    "skipped" : 0,
    "failed" : 0
  },
  "hits" : {
    "total" : {
      "value" : 3,
      "relation" : "eq"
    },
    "max_score" : 0.46537673,
    "hits" : [
      {
        "_index" : "blog",
        "_type" : "_doc",
        "_id" : "3",
        "_score" : 0.46537673,
        "_source" : {
          "content" : "hello world, hello world, hello world, hello world, hello world, hello world, hello world, hello world"
        }
      },
      {
        "_index" : "blog",
        "_type" : "_doc",
        "_id" : "2",
        "_score" : 0.443425,
        "_source" : {
          "content" : "hello world, hello world, hello world"
        }
      },
      {
        "_index" : "blog",
        "_type" : "_doc",
        "_id" : "1",
        "_score" : 0.3852709,
        "_source" : {
          "content" : "hello world"
        }
      }
    ]
  }
}
```



### 11.5 coerce

coerce 用来清除脏数据，默认为 true。

例如一个数字，在 JSON 中，用户可能写错了：

```
{"age":"99"}
```

或者 ：

```
{"age":"99.0"}
```

这些都不是正确的数字格式。

通过 coerce 可以解决该问题。

默认情况下，以下操作没问题，就是 coerce 起作用：

```
PUT blog
{
  "mappings": {
    "properties": {
      "age":{
        "type": "integer"
      }
    }
  }
}

POST blog/_doc
{
  "age":"99.0"
}
```

如果需要修改 coerce ，方式如下：

```
POST blog/_mapping
{
  "properties": {
    "age": {
      "type": "integer",
      "coerce": false
    }
  }
}

POST blog/_doc
{
  "age":99
}
```

当 coerce 修改为 false 之后，数字就只能是数字了，不可以是字符串，该字段传入字符串会报错。

### 11.6 copy_to

这个属性，可以将多个字段的值，复制到同一个字段中。

定义方式如下：

```
PUT blog
{
  "mappings": {
    "properties": {
      "title":{
        "type": "text",
        "copy_to": "full_content"
      },
      "content":{
        "type": "text",
        "copy_to": "full_content"
      },
      "full_content":{
        "type": "text"
      }
    }
  }
}

PUT blog/_doc/1
{
  "title":"ElasticSearch映射",
  "content":"当 coerce 修改为 false 之后，数字就只能是数字了，不可以是字符串，该字段传入字符串会报错。"
}

GET blog/_search
{
  "query": {
    "term": {
      "full_content": "当"
    }
  }
}
```

> 在使用copy_to时，如果字段设置为text类型，则不能使用normalizer（即不能自定义），不管输入什么内容都使用默认全小写规范。检索时，如果检索的内容是区分大小写，则可能检索不到，需要使用全小写进行检索。

### 11.7 doc_values 和 fielddata

es 中的搜索主要是用到倒排索引，doc_values 参数是为了加快排序、聚合操作而生的。当建立倒排索引的时候，会额外增加列式存储映射，即利用空间换取检索时间的做法。

doc_values 默认是开启的，如果确定某个字段不需要排序或者不需要聚合，那么可以关闭 doc_values。

**大部分的字段在索引时都会生成 doc_values，除了 text**。**text 字段在查询时会生成一个 fielddata 的数据结构**，fieldata 在字段首次被聚合、排序的时候生成。

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-11-01.jpg)

doc_values 默认开启，fielddata 默认关闭。

doc_values 演示：

```
PUT users

PUT users/_doc/1
{
  "age":100
}

PUT users/_doc/2
{
  "age":99
}

PUT users/_doc/3
{
  "age":98
}

PUT users/_doc/4
{
  "age":101
}

GET users/_search
{
  "query": {
    "match_all": {}
  },
  "sort":[
    {
      "age":{
        "order": "desc"
      }
    }
    ]
}
```

由于 doc_values 默认时开启的，所以可以直接使用该字段排序，如果想关闭 doc_values ，如下：（关闭后则不能使用该字段进行排序）

```
PUT users
{
  "mappings": {
    "properties": {
      "age":{
        "type": "integer",
        "doc_values": false
      }
    }
  }
}

PUT users/_doc/1
{
  "age":100
}

PUT users/_doc/2
{
  "age":99
}

PUT users/_doc/3
{
  "age":98
}

PUT users/_doc/4
{
  "age":101
}

GET users/_search
{
  "query": {
    "match_all": {}
  },
  "sort":[
    {
      "age":{
        "order": "desc"
      }
    }
    ]
}
```

### 11.8 dynamic

对于新出现的字段如何做处理。

### 11.9 enabled

es 默认会索引所有的字段，但是有的字段可能只需要存储，不需要索引。比如存储一件商品的信息，某个字段存储了商品图片的链接地址，用户当然不会通过链接地址来搜索商品，所以这个字段只需要存储不需要索引。此时可以通过 enabled 字段来控制：

```
PUT blog
{
  "mappings": {
    "properties": {
      "title":{
        "enabled": false
      }
    }
  }
}

PUT blog/_doc/1
{
  "title":"javaboy"
}

GET blog/_search
{
  "query": {
    "term": {
      "title": "javaboy"
    }
  }
}
```

设置了 enabled 为 false 之后，就可以再通过该字段进行搜索了。

### 11.10 format

日期格式。format 可以规范日期格式，而且一次可以定义多个 format。

```
PUT users
{
  "mappings": {
    "properties": {
      "birthday":{
        "type": "date",
        "format": "yyyy-MM-dd||yyyy-MM-dd HH:mm:ss"
      }
    }
  }
}

PUT users/_doc/1
{
  "birthday":"2020-11-11"
}

PUT users/_doc/2
{
  "birthday":"2020-11-11 11:11:11"
}
```

- 多个日期格式之间，使用 || 符号连接，注意没有空格。
- 如果用户没有指定日期的 format，默认的日期格式是 `strict_date_optional_time||epoch_mills`
- 如果没有指定日期格式，在识别了第一个文档后则认定其模式，后续添加的文档必须与第一个文档保持一致。

另外，所有的日期格式，可以在 https://www.elastic.co/guide/en/elasticsearch/reference/current/mapping-date-format.html 网址查看。

### 11.11 ignore_above【只适用于 keyword 类型】

igbore_above 用于指定分词和索引的字符串最大长度，超过最大长度的话，该字段将不会被索引，**这个字段只适用于 keyword 类型**。

```
PUT blog
{
  "mappings": {
    "properties": {
      "title":{
        "type": "keyword",
        "ignore_above": 10
      }
    }
  }
}

PUT blog/_doc/1
{
  "title":"javaboy"
}

PUT blog/_doc/2
{
  "title":"javaboyjavaboyjavaboy"
}

GET blog/_search
{
  "query": {
    "term": {
      "title": "javaboyjavaboyjavaboy"
    }
  }
}
```

### 11.12 ignore_malformed

ignore_malformed 可以忽略不规则的数据，该参数默认为 false。

前面如果没有指定字段类型，es则会根据插入的第一个文档判断类型，确定后则该字段不能插入其他类型数据，插入其他类型数据会报错。

使用`ignore_malformed `属性后，会忽略这种类型错误，文档可以正常插入，但是类型异常的字段无法被索引。

```
PUT users
{
  "mappings": {
    "properties": {
      "birthday":{
        "type": "date",
        "format": "yyyy-MM-dd||yyyy-MM-dd HH:mm:ss"
      },
      "age":{
        "type": "integer",
        "ignore_malformed": true
      }
    }
  }
}

PUT users/_doc/1
{
  "birthday":"2020-11-11",
  "age":99
}

PUT users/_doc/2
{
  "birthday":"2020-11-11 11:11:11",
  "age":"abc"
}


PUT users/_doc/2
{
  "birthday":"2020-11-11 11:11:11aaa",
  "age":"abc"
}
```

### 11.13 include_in_all

这个是针对 `_all` 字段的，但是在 es7 中，该字段已经被废弃了。用`copy_to`替代。

之前版本插入时会把所有字段都和到 `_all` 里，每个字段的内容用空格隔开，检索时如果不知道检索的内容在哪个字段，可以在 `_all` 中进行检索，`include_in_all`为每个字段可设置为`true`或者`false`。

### 11.14 index

index 属性指定一个字段是否被索引，该属性为 true 表示字段被索引，false 表示字段不被索引。

```
PUT users
{
  "mappings": {
    "properties": {
      "age":{
        "type": "integer",
        "index": false
      }
    }
  }
}

PUT users/_doc/1
{
  "age":99
}

GET users/_search
{
  "query": {
    "term": {
      "age": 99
    }
  }
}
```

- 如果 index 为 false，则不能通过对应的字段搜索。

### 11.15 index_options

index_options 控制索引时哪些信息被存储到倒排索引中（用在 text 字段中），有四种取值：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-11-02.jpg)

### 11.16 norms

norms 对字段评分有用，text 默认开启 norms，如果不是特别需要，不要开启 norms。

### 11.17 null_value

在 es 中，值为 null 的字段不索引也不可以被搜索，null_value 可以让值为 null 的字段显式的可索引、可搜索：

```
PUT users
{
  "mappings": {
    "properties": {
      "name":{
        "type": "keyword",
        "null_value": "javaboy_null"
      }
    }
  }
}

PUT users/_doc/1
{
  "name":null,
  "age":99
}
PUT users/_doc/2
{
  "age":99
}
GET users/_search
{
  "query": {
    "term": {
      "name": "javaboy_null"
    }
  }
}
```

如果插入文档时不指定某个字段的值，它与值为null并不等价，查询设定的null_value是查不到该文档的。

### 11.18 position_increment_gap

被解析的 text 字段会将 term 的位置考虑进去，目的是为了支持近似查询和短语查询，当我们去索引一个含有多个值（即存入的是数组）的 text 字段时，会在各个值之间添加一个假想的空间，将值隔开，这样就可以有效避免一些无意义的短语匹配，间隙大小通过 position_increment_gap 来控制，默认是 100。

```
PUT users

PUT users/_doc/1
{
  "name":["zhang san","li si"]
}

GET users/_search
{
  "query": {
    "match_phrase": {
      "name": {
        "query": "sanli"
      }
    }
  }
}
```

- `san li` 搜索不到，因为两个短语之间有一个假想的空隙，为 100。

```
GET users/_search
{
  "query": {
    "match_phrase": {
      "name": {
        "query": "san li",
        "slop": 101
      }
    }
  }
}

GET users/_search
{
  "query": {
    "match_phrase": {
      "name": {
        "query": "zhang san li si",  # 也可以搜到该文档
        "slop": 101
      }
    }
  }
}
```

可以通过 slop 指定空隙大小。

也可以在定义索引的时候，指定空隙：position_increment_gap是指存储`zhang san`和`li si`时中间的间隔有多少，在检索时`san`和`li`是需要由一个空格隔开，才能使其发挥作用。

```
PUT users
{
  "mappings": {
    "properties": {
      "name":{
        "type": "text",
        "position_increment_gap": 0
      }
    }
  }
}

PUT users/_doc/1
{
  "name":["zhang san","li si"]
}

GET users/_search
{
  "query": {
    "match_phrase": {
      "name": {
        "query": "san li"
      }
    }
  }
}
```

### 11.19 properties

### 11.20 similarity

similarity 指定文档的评分模型，默认有三种：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-11-03.jpg)

### 11.21 store

默认情况下，字段会被索引，也可以搜索，但是不会存储，虽然不会被存储的，但是 `_source` 中有一个字段的备份。如果想将字段存储下来，可以通过配置 store 来实现。

### 11.22 term_vectors

term_vectors 是通过分词器产生的信息，包括：

- 一组 terms
- 每个 term 的位置
- term 的首字符/尾字符与原始字符串原点的偏移量

term_vectors 取值：

![图片](E:\newbie\Exercise\test\typora\typora-user-images\es-11-04.jpg)

### 11.23 fields

fields 参数可以让同一字段有多种不同的索引方式。例如：

```
PUT blog
{
  "mappings": {
    "properties": {
      "title":{
        "type": "text",
        "fields": {
          "raw":{
            "type":"keyword"
          }
        }
      }
    }
  }
}

PUT blog/_doc/1
{
  "title":"javaboy"
}

GET blog/_search
{
  "query": {
    "term": {
      "title.raw": "javaboy"
    }
  }
}
```

- https://www.elastic.co/guide/en/elasticsearch/reference/current/mapping-params.html



## 12.ElasticSearch映射模板

es中有动态映射，但是有时候默认的动态映射并不能满足我们的需求，这个时候可以通过映射模板来解决。

举例：

### 12.1 按照默认映射类型来映射为新的类型

ES默认将数字动态映射为long类型，那么如何将所有的数字默认映射为`integer`？

```
PUT blog

PUT blog/_doc/1
{
  "count":99
}
```

默认动态映射`blog`的`mappings`如下：

```
{
  "mappings": {
    "_doc": {
      "properties": {
        "count": {
          "type": "long"
        }
      }
    }
  }
}
```

指定将`long`类型映射为`integer`

```
PUT blog
{
  "mappings": {
    "dynamic_templates": [
      {
        "long2integer":{
          "match_mapping_type":"long",
          "mapping":{
            "type":"integer"
          }
        }
      }
    ]
  }
}
PUT blog/_doc/1
{
  "count":99
}
```

`blog`的`mappings`如下：

```
{
  "mappings": {
    "_doc": {
      "dynamic_templates": [
        {
          "long2integer": {
            "mapping": {
              "type": "integer"
            },
            "match_mapping_type": "long"
          }
        }
      ],
      "properties": {
        "count": {
          "type": "integer"
        }
      }
    }
  }
}
```

存储完成后默认会被识别成`long`类型的数据现在就被识别成`integer`。

### 12.2 复杂的：在类型基础上按照字段名的规则映射

```
PUT blog
{
  "mappings": {
    "dynamic_templates": [
      {
        "string2integer":{
          "match_mapping_type":"string",
          "match":"num_*",
          "unmatch":"*_text",
          "mapping":{
            "type":"integer"
          }
        }
      }
    ]
  }
}
PUT blog/_doc/1
{
  "num_count":"99",
  "num_text":"88"
}
```

插入文档后，动态识别的的`mappings`如下：

- 不匹配字段名以`_text`结尾的；
- 匹配默认识别的string类型；
- 匹配字段名以`num_`开始的。

任意一项不满足都不做映射，任然是默认识别的类型

```
{
  "mappings": {
    "_doc": {
      "dynamic_templates": [
        {
          "string2integer": {
            "unmatch": "*_text",
            "mapping": {
              "type": "integer"
            },
            "match_mapping_type": "string",
            "match": "num_*"
          }
        }
      ],
      "properties": {
        "num_count": {
          "type": "integer"
        },
        "num_text": {
          "type": "text",
          "fields": {
            "keyword": {
              "ignore_above": 256,
              "type": "keyword"
            }
          }
        }
      }
    }
  }
}
```



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

### 15.1 match query

match query 会对查询语句进行分词，分词后，如果查询语句中的任何一个词项被匹配，则文档就会被索引到。

```
GET books/_search
{
  "query": {
    "match": {
      "name": "美术计算机"
    }
  }
}
```

这个查询首先会对 `美术计算机` 进行分词，分词之后，再去查询，只要文档中包含一个分词结果，就回返回文档。换句话说，默认词项之间是 OR 的关系，如果想要修改，也可以改为 AND。

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

### 15.2 match_phrase query

match_phrase query 也会对查询的关键字进行分词，但是它分词后有两个特点：

- 分词后的词项顺序必须和文档中词项的顺序一致
- 所有的词都必须出现在文档中

示例如下：

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

slop 是指关键字之间的最小距离，但是注意不是关键之间间隔的字数。文档中的字段被分词器解析之后，解析出来的词项都包含一个 position 字段表示词项的位置，查询短语分词之后 的 position 之间的间隔要满足 slop 的要求。

### 15.3 match_phrase_prefix query

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

这个查询过程，会自动进行单词匹配，会自动查找以**计**开始的单词，默认是 50 个，可以自己控制：

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

match_phrase_prefix 是针对分片级别的查询，假设 max_expansions 为 1，可能返回多个文档，但是只有一个词，这是我们预期的结果。有的时候实际返回结果和我们预期结果并不一致，原因在于这个查询是分片级别的，不同的分片确实只返回了一个词，但是结果可能来自不同的分片，所以最终会看到多个词。

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

exists query 会返回指定字段中至少有一个非空值的文档：

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

**注意，空字符串也是有值。null 是空值。**

### 16.5 prefix query

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
- 转置字符（ajva--〉java）

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

### 17.4 function_score query【调整得分】

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

