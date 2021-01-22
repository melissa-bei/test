**1.testAddinManager：简单测试AddinManager的demo**

| 接口             | 功能                                                         |
| ---------------- | ------------------------------------------------------------ |
| CmdDeleteElement | 删除选中对象                                                 |
| CmdExportToJson  | 将选中对象X的property和paramter的信息输出到json文件，文件名为info.json，文件被保存在桌面。 |
| CmdPrintInfo     | 弹窗打印选中对象的信息                                       |

**2.Export：自定义导出**

| 项目         | 功能                |
| ------------ | ------------------- |
| RunRevit     | 利用c#打开一个revit |
| CustomExport | 导出自定义json文件  |

**3.resource：资源存放路径**

| 文件夹         | 内容                |
| -------------- | ------------------- |
| unexportedfile | 存放为导出的rvt模型 |
| exportedjson   | 存放导出的json文件  |
| exportedfile   | 存放已导出的rvt模型 |

