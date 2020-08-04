import pdfplumber
import pandas as pd

with pdfplumber.open("E:\\newbie\\PDF Process\\pdf_process_exercise\\1.pdf") as pdf:
    page = pdf.pages[0]   # 第一页的信息
    text = page.extract_text()
    # print(text)
    table = page.extract_tables()
    for t in table:
        # 得到的table是嵌套list类型，转化成DataFrame更加方便查看和分析
        df = pd.DataFrame(t[1:], columns=t[0])
        print(df)