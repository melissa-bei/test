# coding=utf-8
import xlrd
import json
import os
from elasticsearch import Elasticsearch


class ESDataBase:
    def __init__(self, url="localhost:9200"):
        self.es = Elasticsearch(url)

    def setup(self, index, body={"settings": {"number_of_shards": 5, "number_of_replicas": 1}}):
        if not self.es.indices.exists(index=index):
            self.es.indices.create(index, body=body)

    def importxlsx(self, index, path):
        # 打开文件
        data = xlrd.open_workbook(path)
        # # 查看工作表
        # print("sheets：" + str(data.sheet_names()))
        table = data.sheet_by_index(0)
        # 获取表头
        header = table.row_values(0)
        _, tempfilename = os.path.split(path)
        filename, _ = os.path.splitext(tempfilename)
        dd = {"belongs": filename}
        for r in range(1, table.nrows - 1):
            for c in range(len(header)):
                dd[header[c]] = table.cell(r, c).value
            action = json.dumps(dd)
            self.es.index(index=index, doc_type="_doc", body=action)

    def importjson(self, index, belongs, data):
        if isinstance(data, str):
            data = eval(data)
        if isinstance(data, list):
            # 多条数据分开的形式
            for item in data:
                # 获取表头
                header = item.keys()
                dd = {"belongs": belongs}
                for k in header:
                    dd[k] = str(item[k])
                action = json.dumps(dd)
                self.es.index(index=index, doc_type="_doc", body=action)
        elif isinstance(data, dict):
            # 获取表头
            header = data.keys()
            dd = {"belongs": belongs}
            for k in header:
                dd[k] = data[k]
            action = json.dumps(dd)
            self.es.index(index=index, doc_type="_doc", body=action)


if __name__ == '__main__':
    es = ESDataBase(url="10.80.253.135:9200")
    with open('mappings.json', 'r') as f:
        data = json.load(f)
    es.setup("test", data)
