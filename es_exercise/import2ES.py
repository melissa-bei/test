# coding=utf-8
from ESDataBase import ESDataBase
import requests
import os


def get_response(url, data):
    response = requests.post(url, data=data)
    result = response.json()
    return result


def import_one_pdf(index, pdf_file):
    _, tempfilename = os.path.split(pdf_file)
    filename, _ = os.path.splitext(tempfilename)
    # 获取解析结果
    url = "http://127.0.0.1:5001/extract"
    data = {"pdf_type": "公建", "is_detail": "True", "pdf_path": pdf_file, "use_file": "True"}
    result = get_response(url, data)
    # 导入es
    es = ESDataBase(url="localhost:9200")    
    body = {"settings": {"number_of_shards": 5, "number_of_replicas": 1}}
    es.setup(index, body)

    es.importjson(index, filename, result)


def import_all_pdf(index, pdf_dir="", pdf_list=[]):
    if pdf_dir:
        files = os.listdir(pdf_dir) + pdf_list
    else:
        files = pdf_list

    for filename in files:
        if filename.endswith("pdf"):
            pdf_file = os.path.join(pdf_dir, filename)

            import_one_pdf(index, pdf_file)


def import_one_xlsx(index, xlsx_file):
    es = ESDataBase(url="localhost:9200")
    body = {"settings": {"number_of_shards": 5, "number_of_replicas": 1}}
    es.setup(index, body)

    es.importxlsx(index, xlsx_file)


def import_all_xlsx(index, xlsx_dir="", xlsx_list=[]):
    if xlsx_dir:
        files = os.listdir(xlsx_dir) + xlsx_list
    else:
        files = xlsx_list
        
    for filename in files:
        if filename.endswith("xlsx"):
            xlsx_file = os.path.join(xlsx_dir, filename)

            import_one_xlsx(index, xlsx_file)


if __name__ == '__main__':
    # import_one_pdf("C:/Users/lib/Desktop/resource/pdf/txt_pdf/F建施-001 - 设计说明及图纸目录.pdf")
    import_all_pdf(index="pdf-parameter", pdf_dir="C:/Users/lib/Desktop/resource/pdf/txt_pdf")

