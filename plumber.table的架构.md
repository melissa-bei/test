# plumber.table模块的架构

### 1.plumber是如何抽取表格的

pdfplumber抽取表格主要包含以下几步：

##### （1）找到可见的或猜测出不可见的候选表格线。

​        **1）先找出定义表格的边**

​        a. 看得见的边：当用`pdfplumber.open`打开pdf文档后，会通过pdfminer对打开的文档进行解析，每一页解析的结果会保存在`pdfplumber.page.Page`类的实例对象中。`Page`类是`pdfplumber.container.Container`子类，`Container`类定义了访问chars、rects、**edges**等基本对象的property。

​              TableFinder类中的get_edges方法通过utils模块中的filter_edges函数对每一个Page实例对象中的解析出的edges对象进行筛选和过滤，过滤条件包括：方向、最小长度等。

​        b. 看不见的边：由文本块对其找到的边。`TableFinder`类的`get_edges`方法通过调用同模块中的`words_to_edges_v`和`words_to_edges_h`，根据每一页中解析出的words（word指的应该是由每一行上彼此间距较小的字符合成的连续字符串）的对齐情况，猜测出竖直方向和水平方向上可能存在的线。

​        c. 额外指定的边

​        **2）合并找到的边**

​        通过上面的方法，可能会找到很多线段，其中存在不少的冗余：

​        a. 某些平行线之间的垂直距离非常小，需要对它们进行对齐，让他们位于同一条直线上，pdfplumer使用平均位置进行对齐。

​        b. 对于同一直线上的某些线段，相互之间邻近端点的距离非常小，这种情况，pdfplumber会把它们合并成一个线段。

​         `pdfplumber.table.TableFinder`类的`get_edges`方法会调用同一模块下的`merge_edges`函数实现上述功能。

##### （2）确定交点

​        `pdfplumber.table`模块中`edges_to__intersections`函数就是用于找到水平线与竖直线之间的交点，最终的返回的结果是一个字典，以交点坐标作为key，value中保存的是相交于该交点的线。

##### （3）围成的最小的单元格

​        `pdfplumber.table.TableFinder`类调用同一模块下的`intersections_to_cells`函数，根据前面找到的线和交点找出可能存在的单元格。生成单元格主要包含以下几步：

​        a.首先对所有交点按照自左向右、自上向下的方式排序。

​        b.找到以每个交点作为左上角的最小的单元格。因为对输入的交点进行了排序，所以返回的单元格应该也是相同的顺序排序的。

##### （4）把连通的单元格整合到一起

​        `pdfplumber.table.TableFinder`类调用同一模块下的`cells_to_tables`函数，根据前面找到的单元格，把连通的单元格合并到一起生成对应的表格。生成表格主要包含以下几步：

​        a.对单元格的bbox进行处理，生成四个角的坐标

​        b.根据可用单元格四个角的坐标判断单元是否属于当前正在生成的表格。

​                     当单元格与当前正在生成的表格相交时，把该单元格加入到当前表格中，以后该单元格就不再可用了。

​                     当没有单元格可以加入到当前生成的表格的时候，保存该表格，并把当前正在生成的表格设成空表格，判断剩下可用的单元能够加入到当前表格中。

​                     当所有单元格都加入到某一表格之后，停止这一过程。

​        c. 按照表格的左上角坐标进行排序。

​        d. 过滤掉那些过小的表格。

​        e. 把剩下的表格封装到`pdfplumber.table.Table`类的实例对象，`Table`类中的`extract`方法可以根据表格、单元格以及字符的位置，抽取出位于表格及其各个单元格内部的文本，最后以行的形式返回出来。



下面介绍了一下table模块的参数、方法和类

### 2.参数常量

```python
（1）DEFAULT_SNAP_TOLERANCE = 3                                    默认对齐误差
```

```python
（2）DEFAULT_JOIN_TOLERANCE = 3                                    默认连接误差
```

```python
（3）DEFAULT_MIN_WORDS_VERTICAL = 3                                默认垂直方向最少的词
```

```python
（4）DEFAULT_MIN_WORDS_HORIZONTAL = 1                              默认水平方向最少的词
```

```python
（5）TABLE_STRATEGIES（搜索表格的策略）
	"lines",                       按照真实检测到的线来搜索表格
    "lines_strict",                严格按照真实检测到的线来搜索表格，edge_type必须为"lines"，不能为"rect"、"rect_edge"、"curve"
    "text",                        按照文本假象出的线来搜索表格
    "explicit"                     明确的
```

```python
(6)DEFAULT_TABLE_SETTINGS = { (默认表格设置)
    "vertical_strategy": "lines",                               垂直方向策略
    "horizontal_strategy": "lines",                             水平方向策略
    "explicit_vertical_lines": [],                              明确的垂直线（手动指定）
    "explicit_horizontal_lines": [],                            明确的水平线
    "snap_tolerance": DEFAULT_SNAP_TOLERANCE,                   对齐误差，在误差之内的平行线会被对齐到相同的水平或垂直位置。
    "join_tolerance": DEFAULT_JOIN_TOLERANCE,                   连接误差，在同一条无限直线上的线段且彼此端点在误差之内的线段将被拼接成一条线段
    "edge_min_length": 3,                                       线的最小长度，在构建表格的时候抛弃小于该阈值的线段
    "min_words_vertical": DEFAULT_MIN_WORDS_VERTICAL,           垂直方向最少的词，当使用“text”的垂直策略时，至少有多少词采用相同的对齐方式
    "min_words_horizontal": DEFAULT_MIN_WORDS_HORIZONTAL,       水平方向最少的词，当使用“text”的水平策略时，至少有多少词采用相同的对齐方式
    "keep_blank_chars": False,                                  是否保留空字符，在使用“text”策略时，“ ”看作词的组成部分，而不是词分隔符。
    "text_tolerance": 3,                                        文本之间的误差（x方向和y方向共用），当文本策略搜索词时，它期望每个词中的单个字                                                                 符之间的距离不超过text_tolerance像素。
    "text_x_tolerance": None,                                   文本x方向之间的误差
    "text_y_tolerance": None,                                   文本y方向之间的误差
    "intersection_tolerance": 3,                                由edges生成intersections时的误差（x方向和y方向共用），当把edge组合成cell                                                                 时，正交的边必须在intersection_tolerance像素内才能被认为是相交的。
    "intersection_x_tolerance": None,                           由edges生成intersections时的x方向误差
    "intersection_y_tolerance": None,                           由edges生成intersections时的y方向误差
}
```

### 3.方法

```python
（1）move_to_avg(objs, orientation)	    
```

​        将objs垂直/水平移动到他们的平均x/y位置。

​        orientation： “h”， “v”

```python
（2）snap_edges(edges, tolerance)
```

​        给定一个边缘列表，将任意一个宽容范围内像素对齐到它们的位置平均值。

​        tolerance： 默认为DEFAULT_SNAP_TOLERANCE

​        按照tolerance分别将水平线和垂直线聚在一起，一个cluster内的所有直线，要么”x0“差距在tolerance内，要么”top“差距在tolerance内，利用move_to_avg把所有线的对应坐标移动到他们的平均值上。

```python
（3）join_edge_group(edges, orientation, tolerance)
```

​        给定同一条无限线的边列表，将那些在“tolerance”像素范围内的边连接起来。

​        tolerance： 默认为DEFAULT_JOIN_TOLERANCE。

​        按照拼接方向先进行排序，保留第一条线，然后遍历剩下的线，如果当前线条的起始点小于上一条线的终点加上tolerance，则认为两条线属于同一条线，把上一条线的终点改写为当前线条的终点。

```python
（4）merge_edges(edges, snap_tolerance, join_tolerance)
```

​        使用上面的' snap_edges '和' join_edge_group '方法，将一个edge列表中断开的edge合并起来。

```python
（5）words_to_edges_h(words, word_threshold=DEFAULT_MIN_WORDS_HORIZONTAL)
```

​        找到(假象的)至少连接“word_threshold”单词顶部的水平线。

​        先按照相同的top对所有的文本块生成簇，然后只保留元素个数超过threshold的簇，之后得到生成包含簇中所有元素的最小的矩形；

​        返回rect的top和bottom两条线。

```python
（6）words_to_edges_v(words, word_threshold=DEFAULT_MIN_WORDS_VERTICAL)
```

​        找出(想象的)连接至少“word_threshold”单词的左、右或中间的竖线。

​        先按照相同的x0、x1以及center分别对所有的文本块生成簇，然后只保留元素个数超过threshold的簇，之后得到生成包含簇中所有元素的最小的矩形；

​        迭代这些bbox，压缩重叠的bbox；（可能是对于一些文本x0、x1以及center中有多个对齐了，生成的bboxes中会有重叠的）

​        把bbox（tuple类型）转为rect（dict类型）；

​        找到最右边矩形的最右边的线；

​        返回所有rect的左边线，以及最右边矩形的右边线。

```python
（7）edges_to_intersections(edges, x_tolerance=1, y_tolerance=1)
```

​        给定一个边缘列表，返回它们在“tolerance”范围内相交的点。

​        intersections '应该是一个以(x0, top)元组作为键的字典，以及作为值的边缘对象列表。边缘对象应该对应到交点的边缘。

​        intersections[（'垂直线的x0'，‘水平线的top’）]。按照x0和top去找交点，也就是会得到cells的左上角的交点。

```python
（8）intersections_to_cells(intersections)
```

​        给定一个点列表(“交叉点”)，返回这些点描述的所有矩形“单元格”。

​        只向右边和下边去找点，如果右边的点和下边的点都在intersections里，且点对应的水平线或垂直线是共用的（即找到当前点和对应下边或者右边的点，对他们的边求交集，如果交集不为空则说明有共用的线），则当前交点和右下交点构成一个cell。

返回一个cell的list，每个元素包含（左，上，右，下）四个元素的元祖

```python
（9）cells_to_tables(cells)
```

​        给定一列边框(' cells ')，返回一个表格的list，这些表格以最简单的方式保存这些单元格。

​        先生成新的表格，表格为空时取一个cell，遍历剩下cell，如果新的cell与已有表格有交点，则对表格进行分配，并标记为已分配。

​        遍历所有的cell，直至它们全部被分配。

​        按表格中最小交点进行排序，之后返回所有表格。

### 4.类

```python
（1）CellGroup(object)
```

​        定义了一个cell类型，初始化cellls和bbox（x0, y0, x1, y1）两个属性。

```python
（2）Row(CellGroup)
```



```python
（3）Table(object)
```

​        定义一个表格类型，初始化page、cells和bbox（x0, y0, x1, y1）三个属性。

​        定义了rows属性：按行存储所有表格。每一行为一个table.Row类，包含bbox和cells两个属性。

```python
（4）extract(self,
    x_tolerance=utils.DEFAULT_X_TOLERANCE,
    y_tolerance=utils.DEFAULT_Y_TOLERANCE)
```

​        DEFAULT_X_TOLERANCE = 3，DEFAULT_Y_TOLERANCE = 3

​        定义了extract的类方法，首先取出页面中所有的chars；然后遍历所有的rows，分别找出每行的字符，之后遍历行中的所有cells，如果cell为空则cells的内容为None，否则找出cell中的字符，根据y_tolerance生成行的cluster，整理每一行文本，把多行文本按“/n”拼接起来得到cell_text；最后返回一个二维的list其中按行存储了表格的内容。

```python
（4）TableFinder(object)
```

​        给定一个PDF页面，找到合理的表结构。

​        page：定义TableFinder时输入。

​        settings：定义TableFinder时输入，初始化为DEFAULT_TABLE_SETTINGS，需要更新。

​        edges：通过get_edges类内函数获得，先指定策略获得的edges加上explicit lines，然后拼接线，返回长度大于edge_min_length的线。

```python
        	get_edges(self)
```

​        intersections：通过edges_to_intersections函数得到。

​        cells：通过intersections_to_cells函数得到。

​        tables：通过cells_to_tables函数和Table类得到。

### 5.总结

​        目前来说，通过定义DEFAULT_TABLE_SETTINGS中的参数可以调整表格的提取效果。

​        针对表格提取不完整的问题，需要首先查证是否提取到相应的edge，如果提取到了则调整构成cell和table的相应参数，否则先调整edge的参数。