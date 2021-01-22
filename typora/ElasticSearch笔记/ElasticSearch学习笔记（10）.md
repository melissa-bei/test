# ElasticSearch学习笔记（十）

## 25.ElasticSearch Java API 概览

Java 操作 Es 的方案：

1. 直接使用 HTTP 请求

直接使用 HTTP 请求，去操作 Es。HTTP 请求工具，可以使用 Java 自带的 HttpUrlConnection，也可以使用一些 HTTP 请求库，例如 HttpClient、OKHttp、Spring 中的 RestTemplate 都可以。

这种方式有一个弊端，就是要自己组装请求参数，自己去解析响应的 JSON。

1. Low Level REST Client

用于 Es 的官方的低级客户端。这种方式允许通过 HTTP 与 Es 集群进行通信，但是请求时候的 JSON 参数和响应的 JSON 参数交给用户去处理。这种方式好处就是兼容所有的 Es 版本。但是就是数据处理比较麻烦。

1. High Level REST Client

用户 Es 的官方的高级客户端。这种方式允许通过 HTTP 与 Es 集群进行通信，它是基于 Low Level REST Client，但是提供了很多 API，开发者不需要自己去组装参数，也不需要自己去解析响应 JSON 。这种方式使用起来更加直接。但是需要注意，这种方式，所使用的依赖库的版本要和 Es 对应。

1. TransportClient

TransportClient 在 Es7 中已经被弃用，在 Es8 中将被完全删除。

## 26.ElasticSearch 普通 HTTP 请求

新建一个普通的 JavaSE 工程，添加如下代码：

```
public class HttpRequestTest {
    public static void main(String[] args) throws IOException {
        URL url = new URL("http://localhost:9200/books/_search?pretty=true");
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        if (con.getResponseCode() == 200) {
            BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String str = null;
            while ((str = br.readLine()) != null) {
                System.out.println(str);
            }
        }
    }
}
```

这里使用到的请求工具是 HttpURLConnection，开发者也可以使用 HttpClient、OkHttp、或者 Spring 中的 RestTemplate。

## 27.ElasticSearch Java Low Level REST Client

首先创建一个普通的 Maven 工程，添加如下依赖：

```
<dependencies>
    <dependency>
        <groupId>org.elasticsearch.client</groupId>
        <artifactId>elasticsearch-rest-client</artifactId>
        <version>7.10.0</version>
    </dependency>
</dependencies>
```

然后添加如下代码，发起一个简单的查询请求：

```
public class LowLevelTest {
    public static void main(String[] args) throws IOException {
        //1.构建一个 RestClient 对象
        RestClientBuilder builder = RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        );
        //2.如果需要在请求头中设置认证信息等，可以通过 builder 来设置
//        builder.setDefaultHeaders(new Header[]{new BasicHeader("key","value")});
        RestClient restClient = builder.build();
        //3.构建请求
        Request request = new Request("GET", "/books/_search");
        //添加请求参数
        request.addParameter("pretty","true");
        //4.发起请求，发起请求有两种方式，可以同步，可以异步
        //这种请求发起方式，会阻塞后面的代码
        Response response = restClient.performRequest(request);
        //5.解析 response，获取响应结果
        BufferedReader br = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
        String str = null;
        while ((str = br.readLine()) != null) {
            System.out.println(str);
        }
        br.close();
        //最后记得关闭 RestClient
        restClient.close();
    }
}
```

这个查询请求，是一个同步请求，在请求的过程中，后面的代码会被阻塞，如果不希望后面的代码被阻塞，可以使用异步请求。

```
public class LowLevelTest2 {
    public static void main(String[] args) throws IOException {
        //1.构建一个 RestClient 对象
        RestClientBuilder builder = RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        );
        //2.如果需要在请求头中设置认证信息等，可以通过 builder 来设置
//        builder.setDefaultHeaders(new Header[]{new BasicHeader("key","value")});
        RestClient restClient = builder.build();
        //3.构建请求
        Request request = new Request("GET", "/books/_search");
        //添加请求参数
        request.addParameter("pretty","true");
        //4.发起请求，发起请求有两种方式，可以同步，可以异步
        //异步请求
        restClient.performRequestAsync(request, new ResponseListener() {
            //请求成功的回调
            @Override
            public void onSuccess(Response response) {
                //5.解析 response，获取响应结果
                try {
                    BufferedReader br = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
                    String str = null;
                    while ((str = br.readLine()) != null) {
                        System.out.println(str);
                    }
                    br.close();
                    //最后记得关闭 RestClient
                    restClient.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            //请求失败的回调
            @Override
            public void onFailure(Exception e) {

            }
        });
    }
}
```

开发者在请求时，也可以携带 JSON 参数。

```
public class LowLevelTest3 {
    public static void main(String[] args) throws IOException {
        //1.构建一个 RestClient 对象
        RestClientBuilder builder = RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        );
        //2.如果需要在请求头中设置认证信息等，可以通过 builder 来设置
//        builder.setDefaultHeaders(new Header[]{new BasicHeader("key","value")});
        RestClient restClient = builder.build();
        //3.构建请求
        Request request = new Request("GET", "/books/_search");
        //添加请求参数
        request.addParameter("pretty","true");
        //添加请求体
        request.setEntity(new NStringEntity("{\"query\": {\"term\": {\"name\": {\"value\": \"java\"}}}}", ContentType.APPLICATION_JSON));
        //4.发起请求，发起请求有两种方式，可以同步，可以异步
        //异步请求
        restClient.performRequestAsync(request, new ResponseListener() {
            //请求成功的回调
            @Override
            public void onSuccess(Response response) {
                //5.解析 response，获取响应结果
                try {
                    BufferedReader br = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
                    String str = null;
                    while ((str = br.readLine()) != null) {
                        System.out.println(str);
                    }
                    br.close();
                    //最后记得关闭 RestClient
                    restClient.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            //请求失败的回调
            @Override
            public void onFailure(Exception e) {

            }
        });
    }
}
```



## 28.1 索引管理

### 28.1.1 创建索引

首先创建一个普通的 Maven 项目，然后引入 high level rest client 依赖：

```
<dependencies>
    <dependency>
        <groupId>org.elasticsearch.client</groupId>
        <artifactId>elasticsearch-rest-high-level-client</artifactId>
        <version>7.10.0</version>
    </dependency>
</dependencies>
```

需要注意，依赖的版本和 Es 的版本要对应。

创建一个索引：

```
public class HighLevelTest {
    public static void main(String[] args) throws IOException {
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        ));
        //删除已经存在的索引
        DeleteIndexRequest deleteIndexRequest = new DeleteIndexRequest("blog");
        client.indices().delete(deleteIndexRequest, RequestOptions.DEFAULT);
        //创建一个索引
        CreateIndexRequest blog1 = new CreateIndexRequest("blog");
        //配置 settings，分片、副本等信息
        blog1.settings(Settings.builder().put("index.number_of_shards", 3).put("index.number_of_replicas", 2));
        //配置字段类型，字段类型可以通过 JSON 字符串、Map 以及 XContentBuilder 三种方式来构建
        //json 字符串的方式
        blog1.mapping("{\"properties\": {\"title\": {\"type\": \"text\"}}}", XContentType.JSON);
        //执行请求，创建索引
        client.indices().create(blog1, RequestOptions.DEFAULT);
        //关闭 client
        client.close();
    }
}
```

mapping 的配置，还有另外两种方式：

第一种，通过 map 构建 mapping：

```
public class HighLevelTest {
    public static void main(String[] args) throws IOException {
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        ));
        //删除已经存在的索引
        DeleteIndexRequest deleteIndexRequest = new DeleteIndexRequest("blog");
        client.indices().delete(deleteIndexRequest, RequestOptions.DEFAULT);
        //创建一个索引
        CreateIndexRequest blog1 = new CreateIndexRequest("blog");
        //配置 settings，分片、副本等信息
        blog1.settings(Settings.builder().put("index.number_of_shards", 3).put("index.number_of_replicas", 2));
        //配置字段类型，字段类型可以通过 JSON 字符串、Map 以及 XContentBuilder 三种方式来构建
        //json 字符串的方式
//        blog1.mapping("{\"properties\": {\"title\": {\"type\": \"text\"}}}", XContentType.JSON);
        //map 的方式
        Map<String, String> title = new HashMap<>();
        title.put("type", "text");
        Map<String, Object> properties = new HashMap<>();
        properties.put("title", title);
        Map<String, Object> mappings = new HashMap<>();
        mappings.put("properties", properties);
        blog1.mapping(mappings);
        //执行请求，创建索引
        client.indices().create(blog1, RequestOptions.DEFAULT);
        //关闭 client
        client.close();
    }
}
```

第二种，通过 XContentBuilder 构建 mapping：

```
public class HighLevelTest {
    public static void main(String[] args) throws IOException {
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        ));
        //删除已经存在的索引
        DeleteIndexRequest deleteIndexRequest = new DeleteIndexRequest("blog");
        client.indices().delete(deleteIndexRequest, RequestOptions.DEFAULT);
        //创建一个索引
        CreateIndexRequest blog1 = new CreateIndexRequest("blog");
        //配置 settings，分片、副本等信息
        blog1.settings(Settings.builder().put("index.number_of_shards", 3).put("index.number_of_replicas", 2));
        //配置字段类型，字段类型可以通过 JSON 字符串、Map 以及 XContentBuilder 三种方式来构建
        //json 字符串的方式
//        blog1.mapping("{\"properties\": {\"title\": {\"type\": \"text\"}}}", XContentType.JSON);
        //map 的方式
//        Map<String, String> title = new HashMap<>();
//        title.put("type", "text");
//        Map<String, Object> properties = new HashMap<>();
//        properties.put("title", title);
//        Map<String, Object> mappings = new HashMap<>();
//        mappings.put("properties", properties);
//        blog1.mapping(mappings);
        //XContentBuilder 方式
        XContentBuilder builder = XContentFactory.jsonBuilder();
        builder.startObject();
        builder.startObject("properties");
        builder.startObject("title");
        builder.field("type", "text");
        builder.endObject();
        builder.endObject();
        builder.endObject();
        blog1.mapping(builder);
        //执行请求，创建索引
        client.indices().create(blog1, RequestOptions.DEFAULT);
        //关闭 client
        client.close();
    }
}
```

还可以给索引配置别名：

```
public class HighLevelTest {
    public static void main(String[] args) throws IOException {
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        ));
        //删除已经存在的索引
        DeleteIndexRequest deleteIndexRequest = new DeleteIndexRequest("blog");
        client.indices().delete(deleteIndexRequest, RequestOptions.DEFAULT);
        //创建一个索引
        CreateIndexRequest blog1 = new CreateIndexRequest("blog");
        //配置 settings，分片、副本等信息
        blog1.settings(Settings.builder().put("index.number_of_shards", 3).put("index.number_of_replicas", 2));
        //配置字段类型，字段类型可以通过 JSON 字符串、Map 以及 XContentBuilder 三种方式来构建
        //json 字符串的方式
//        blog1.mapping("{\"properties\": {\"title\": {\"type\": \"text\"}}}", XContentType.JSON);
        //map 的方式
//        Map<String, String> title = new HashMap<>();
//        title.put("type", "text");
//        Map<String, Object> properties = new HashMap<>();
//        properties.put("title", title);
//        Map<String, Object> mappings = new HashMap<>();
//        mappings.put("properties", properties);
//        blog1.mapping(mappings);
        //XContentBuilder 方式
        XContentBuilder builder = XContentFactory.jsonBuilder();
        builder.startObject();
        builder.startObject("properties");
        builder.startObject("title");
        builder.field("type", "text");
        builder.endObject();
        builder.endObject();
        builder.endObject();
        blog1.mapping(builder);
        //配置别名
        blog1.alias(new Alias("blog_alias"));
        //执行请求，创建索引
        client.indices().create(blog1, RequestOptions.DEFAULT);
        //关闭 client
        client.close();
    }
}
```

如果觉得调 API 太麻烦，也可以直接上 JSON：

```
public class HighLevelTest2 {
    public static void main(String[] args) throws IOException {
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        ));
        //删除已经存在的索引
        DeleteIndexRequest deleteIndexRequest = new DeleteIndexRequest("blog");
        client.indices().delete(deleteIndexRequest, RequestOptions.DEFAULT);
        //创建一个索引
        CreateIndexRequest blog1 = new CreateIndexRequest("blog");
        //直接同构 JSON 配置索引
        blog1.source("{\"settings\": {\"number_of_shards\": 3,\"number_of_replicas\": 2},\"mappings\": {\"properties\": {\"title\": {\"type\": \"keyword\"}}},\"aliases\": {\"blog_alias_javaboy\": {}}}", XContentType.JSON);
        //执行请求，创建索引
        client.indices().create(blog1, RequestOptions.DEFAULT);
        //关闭 client
        client.close();
    }
}
```

另外还有一些其他的可选配置：

```
public class HighLevelTest2 {
    public static void main(String[] args) throws IOException {
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        ));
        //删除已经存在的索引
        DeleteIndexRequest deleteIndexRequest = new DeleteIndexRequest("blog");
        client.indices().delete(deleteIndexRequest, RequestOptions.DEFAULT);
        //创建一个索引
        CreateIndexRequest blog1 = new CreateIndexRequest("blog");
        //直接同构 JSON 配置索引
        blog1.source("{\"settings\": {\"number_of_shards\": 3,\"number_of_replicas\": 2},\"mappings\": {\"properties\": {\"title\": {\"type\": \"keyword\"}}},\"aliases\": {\"blog_alias_javaboy\": {}}}", XContentType.JSON);
        //请求超时时间，连接所有节点的超时时间
        blog1.setTimeout(TimeValue.timeValueMinutes(2));
        //连接 master 节点的超时时间
        blog1.setMasterTimeout(TimeValue.timeValueMinutes(1));
        //执行请求，创建索引
        client.indices().create(blog1, RequestOptions.DEFAULT);
        //关闭 client
        client.close();
    }
}
```

前面所有的请求都是同步的，会阻塞的，也可以异步：

```
public class HighLevelTest2 {
    public static void main(String[] args) throws IOException {
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        ));
        //删除已经存在的索引
        DeleteIndexRequest deleteIndexRequest = new DeleteIndexRequest("blog");
        client.indices().delete(deleteIndexRequest, RequestOptions.DEFAULT);
        //创建一个索引
        CreateIndexRequest blog1 = new CreateIndexRequest("blog");
        //直接同构 JSON 配置索引
        blog1.source("{\"settings\": {\"number_of_shards\": 3,\"number_of_replicas\": 2},\"mappings\": {\"properties\": {\"title\": {\"type\": \"keyword\"}}},\"aliases\": {\"blog_alias_javaboy\": {}}}", XContentType.JSON);
        //请求超时时间，连接所有节点的超时时间
        blog1.setTimeout(TimeValue.timeValueMinutes(2));
        //连接 master 节点的超时时间
        blog1.setMasterTimeout(TimeValue.timeValueMinutes(1));
        //执行请求，创建索引
//        client.indices().create(blog1, RequestOptions.DEFAULT);
        //异步创建索引
        client.indices().createAsync(blog1, RequestOptions.DEFAULT, new ActionListener<CreateIndexResponse>() {
            //请求成功
            @Override
            public void onResponse(CreateIndexResponse createIndexResponse) {
                //关闭 client
                try {
                    client.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            //请求失败
            @Override
            public void onFailure(Exception e) {

            }
        });
        //关闭 client
//        client.close();
    }
}
```

### 28.1.2 查询索引是否存在

```
public class HighLevelTest3 {
    public static void main(String[] args) throws IOException {
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        ));
        GetIndexRequest blog = new GetIndexRequest("blog2");
        boolean exists = client.indices().exists(blog, RequestOptions.DEFAULT);
        System.out.println("exists = " + exists);
        //关闭 client
        client.close();
    }
}
```

### 28.1.3 关闭/打开索引

关闭：

```
public class HighLevelTest4 {
    public static void main(String[] args) throws IOException {
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        ));
        CloseIndexRequest blog = new CloseIndexRequest("blog");
        CloseIndexResponse close = client.indices().close(blog, RequestOptions.DEFAULT);
        List<CloseIndexResponse.IndexResult> indices = close.getIndices();
        for (CloseIndexResponse.IndexResult index : indices) {
            System.out.println("index.getIndex() = " + index.getIndex());
        }
        //关闭 client
        client.close();
    }
}
```

打开：

```
public class HighLevelTest4 {
    public static void main(String[] args) throws IOException {
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        ));
        OpenIndexRequest blog = new OpenIndexRequest("blog");
        client.indices().open(blog, RequestOptions.DEFAULT);
        //关闭 client
        client.close();
    }
}
```

### 28.1.4 索引修改

```
public class HighLevelTest5 {
    public static void main(String[] args) throws IOException {
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        ));
        UpdateSettingsRequest request = new UpdateSettingsRequest("blog");
        request.settings(Settings.builder().put("index.blocks.write", true).build());
        client.indices().putSettings(request, RequestOptions.DEFAULT);
        //关闭 client
        client.close();
    }
}
```

### 28.1.5 克隆索引

被克隆的索引需要是只读索引，可以通过 28.1.4 小节中的方式设置索引为只读。

```
public class HighLevelTest6 {
    public static void main(String[] args) throws IOException {
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        ));
        ResizeRequest request = new ResizeRequest("blog2", "blog");
        client.indices().clone(request, RequestOptions.DEFAULT);
        //关闭 client
        client.close();
    }
}
```

### 28.1.6 查看索引

```
public class HighLevelTest7 {
    public static void main(String[] args) throws IOException {
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        ));
        GetSettingsRequest request = new GetSettingsRequest().indices("blog");
        //设置需要互殴去的具体的参数，不设置则返回所有参数
        request.names("index.blocks.write");
        GetSettingsResponse response = client.indices().getSettings(request, RequestOptions.DEFAULT);
        ImmutableOpenMap<String, Settings> indexToSettings = response.getIndexToSettings();
        System.out.println(indexToSettings);
        String s = response.getSetting("blog", "index.number_of_replicas");
        System.out.println(s);
        //关闭 client
        client.close();
    }
}
```

### 28.1.7 Refresh & Flush

Es 底层依赖 Lucene，而 Lucene 中有 reopen 和 commit 两种操作，还有一个特殊的概念叫做 segment。

Es 中，基本的存储单元是 shard，对应到 Lucene 上，就是一个索引，Lucene 中的索引由 segment 组成，每个 segment 相当于 es 中的倒排索引。每个 es 文档创建时，都会写入到一个新的 segment 中，删除文档时，只是从属于它的 segment 处标记为删除，并没有从磁盘中删除。

Lucene 中：

reopen 可以让数据搜索到，但是不保证数据被持久化到磁盘中。

commit 可以让数据持久化。

Es 中：

默认是每秒 refresh 一次（Es 中文档被索引之后，首先添加到内存缓冲区，refresh 操作将内存缓冲区中的数据拷贝到新创建的 segment 中，这里是在内存中操作的）。

flush 将内存中的数据持久化到磁盘中。一般来说，flush 的时间间隔比较久，默认 30 分钟。

```
public class HighLevelTest8 {
    public static void main(String[] args) throws IOException {
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        ));
        RefreshRequest request = new RefreshRequest("blog");
        client.indices().refresh(request, RequestOptions.DEFAULT);
        FlushRequest flushRequest = new FlushRequest("blog");
        client.indices().flush(flushRequest, RequestOptions.DEFAULT);
        //关闭 client
        client.close();
    }
}
```

### 28.1.9 索引别名

索引的别名类似于 MySQL 中的视图。

#### 28.1.9.1 添加别名

添加一个普通的别名：

```
public class HighLevelTest9 {
    public static void main(String[] args) throws IOException {
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        ));
        IndicesAliasesRequest indicesAliasesRequest = new IndicesAliasesRequest();
        IndicesAliasesRequest.AliasActions aliasAction = new IndicesAliasesRequest.AliasActions(IndicesAliasesRequest.AliasActions.Type.ADD);
        aliasAction.index("books").alias("books_alias");
        indicesAliasesRequest.addAliasAction(aliasAction);
        client.indices().updateAliases(indicesAliasesRequest, RequestOptions.DEFAULT);
        //关闭 client
        client.close();
    }
}
```

添加一个带 filter 的别名：

```
public class HighLevelTest9 {
    public static void main(String[] args) throws IOException {
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        ));
        IndicesAliasesRequest indicesAliasesRequest = new IndicesAliasesRequest();
        IndicesAliasesRequest.AliasActions aliasAction = new IndicesAliasesRequest.AliasActions(IndicesAliasesRequest.AliasActions.Type.ADD);
        aliasAction.index("books").alias("books_alias2").filter("{\"term\": {\"name\": \"java\"}}");
        indicesAliasesRequest.addAliasAction(aliasAction);
        client.indices().updateAliases(indicesAliasesRequest, RequestOptions.DEFAULT);
        //关闭 client
        client.close();
    }
}
```

现在，books 索引将存在两个别名，其中，books_alias2 自动过滤 name 中含有 java 的文档。

#### 28.1.9.2 删除别名

```
public class HighLevelTest9 {
    public static void main(String[] args) throws IOException {
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        ));
        IndicesAliasesRequest indicesAliasesRequest = new IndicesAliasesRequest();
        IndicesAliasesRequest.AliasActions aliasAction = new IndicesAliasesRequest.AliasActions(IndicesAliasesRequest.AliasActions.Type.REMOVE);
        aliasAction.index("books").alias("books_alias");
        indicesAliasesRequest.addAliasAction(aliasAction);
        client.indices().updateAliases(indicesAliasesRequest, RequestOptions.DEFAULT);
        //关闭 client
        client.close();
    }
}
```

第二种移除方式：

```
public class HighLevelTest9 {
    public static void main(String[] args) throws IOException {
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        ));
        DeleteAliasRequest deleteAliasRequest = new DeleteAliasRequest("books", "books_alias2");
        client.indices().deleteAlias(deleteAliasRequest, RequestOptions.DEFAULT);
        //关闭 client
        client.close();
    }
}
```

#### 28.1.9.3 判断别名是否存在

```
public class HighLevelTest9 {
    public static void main(String[] args) throws IOException {
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        ));
        GetAliasesRequest books_alias = new GetAliasesRequest("books_alias");
        //指定查看某一个索引的别名，不指定，则会搜索所有的别名
        books_alias.indices("books");
        boolean b = client.indices().existsAlias(books_alias, RequestOptions.DEFAULT);
        System.out.println(b);
        //关闭 client
        client.close();
    }
}
```

### 28.1.9.4 获取别名

```
public class HighLevelTest9 {
    public static void main(String[] args) throws IOException {
        RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(
                new HttpHost("localhost", 9200, "http"),
                new HttpHost("localhost", 9201, "http"),
                new HttpHost("localhost", 9202, "http")
        ));
        GetAliasesRequest books_alias = new GetAliasesRequest("books_alias");
        //指定查看某一个索引的别名，不指定，则会搜索所有的别名
        books_alias.indices("books");
        GetAliasesResponse response = client.indices().getAlias(books_alias, RequestOptions.DEFAULT);
        Map<String, Set<AliasMetadata>> aliases = response.getAliases();
        System.out.println("aliases = " + aliases);
        //关闭 client
        client.close();
    }
}
```

