using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;

namespace DataProvider
{
    public class ExcelDataProvider : IDataProvider, IDisposable
    {
        private NPOIClient npoiClient;
        private static ExcelDataProvider _instance = new ExcelDataProvider();
        private ExcelDataProvider()
        {
            npoiClient = NPOIClient.Instance;
        }
        public static ExcelDataProvider Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new ExcelDataProvider();
                }
                return _instance;
            }
        }

        public ExcelDataProvider SetPath(string path)
        {
            npoiClient.SetFilePath(path);
            return Instance;
        }

        public DataTable GetDatas()
        {
            return npoiClient.GetExcelDataTable();
        }

        public void Dispose()
        {
            npoiClient?.Dispose();
        }
    }

    public class NPOIClient : IDisposable
    {
        private string fileName;
        private bool disposed;
        private FileStream fs;

        private static NPOIClient _instance = new NPOIClient();
        private NPOIClient() { }
        public static NPOIClient Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new NPOIClient();
                }
                return _instance;
            }
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    if (fs != null)
                        fs.Close();
                }

                fs = null;
                disposed = true;
            }
        }


        public void SetFilePath(string fileName)
        {
            ValidateFilePath(fileName);
            this.fileName = fileName;
        }

        public DataTable GetExcelDataTable() => GetExcelDataTable(null);

        public DataTable GetExcelDataTable(string sheetName)
        {
            ValidateFilePath();

            // workbook
            IWorkbook workbook = null;
            fs = new FileStream(fileName, FileMode.Open, FileAccess.Read);
            if (fileName.IndexOf(validExtensions["2017"]) > 0) // 2017版本
                workbook = new XSSFWorkbook(fs);
            else if (fileName.IndexOf(validExtensions["2013"]) > 0) // 2013版本
                workbook = new HSSFWorkbook(fs);

            // sheel
            ISheet sheet = null;
            if (sheetName != null)
            {
                sheet = workbook.GetSheet(sheetName);
                //如果没有找到指定的sheetName对应的sheet，则尝试获取第一个sheet
                if (sheet == null)
                    sheet = workbook.GetSheetAt(0);
            }
            else
            {
                sheet = workbook.GetSheetAt(0);
            }

            if (sheet == null)
                return null;

            DataTable dataTable = new DataTable();

            //注：LastRowNum准确， LastCellNum多1个值
            int startRow = sheet.FirstRowNum;
            int endRow = sheet.LastRowNum;
            int startCol = 0;
            int endCol = 0;
            IRow firstRow = sheet.GetRow(startRow);
            if (firstRow != null)
            {
                startCol = firstRow.FirstCellNum;
                endCol = firstRow.LastCellNum;
            }
            CheckFirstLast(sheet, ref startRow, ref endRow, ref startCol, ref endCol);

            //定义列
            //for (int i = startRow; i < endCol - startCol; ++i)
            for (int i = startCol; i < endCol; ++i)
            {
                ICell cell = firstRow.GetCell(i);
                string cellValue = cell == null ? "" : cell.StringCellValue.Trim();
                DataColumn column = new DataColumn(cellValue == null ? "" : cellValue);
                dataTable.Columns.Add(column);
            }
            startRow = startRow + 1;
            //定义行
            for (int i = startRow; i <= endRow; ++i)
            {
                IRow row = sheet.GetRow(i);
                if (row == null) continue; //没有数据的行默认是null　　　　　　　

                DataRow dataRow = dataTable.NewRow();
                //for (int j = startCol; j < endCol; ++j)
                for (int j = 0; j < endCol - startCol; ++j)
                {
                    if (row.GetCell(j) != null) //同理，没有数据的单元格都默认是null
                        dataRow[j] = row.GetCell(j).ToString().Trim();
                }
                dataTable.Rows.Add(dataRow);
            }

            return dataTable;
        }

        /// <summary>
        /// 读取Excel范围优化，有时会多读取很多空白行
        /// </summary>
        /// <param name="sheet"></param>
        /// <param name="firstRow"></param>
        /// <param name="lastRow"></param>
        /// <param name="firstCol"></param>
        /// <param name="lastCol"></param>
        private void CheckFirstLast(ISheet sheet, ref int firstRow, ref int lastRow, ref int firstCol, ref int lastCol)
        {
            //注：LastRowNum准确， LastCellNum多1个值
            int r1 = sheet.FirstRowNum;
            int r2 = sheet.LastRowNum;
            int c1 = int.MaxValue;
            int c2 = 0;

            bool isFindLastRow = false;
            for (int i = r2; i > r1; i--)
            {
                IRow row = sheet.GetRow(i);
                if (row == null)
                    continue;

                int startCol = row.FirstCellNum;
                int endCol = row.LastCellNum;
                if (startCol < 0 || endCol < 0)
                    continue;

                if (startCol < c1)
                    c1 = startCol;
                if (endCol > c2)
                    c2 = endCol;

                if (!isFindLastRow)
                {
                    for (int j = startCol; j < endCol; j++)
                    {
                        ICell cell = row.GetCell(j);
                        if (cell == null)
                            continue;

                        string text = GetValue(cell);
                        if (!string.IsNullOrEmpty(text))
                        {
                            isFindLastRow = true;
                            r2 = i;
                            break;
                        }
                    }
                }
            }

            firstRow = r1;
            lastRow = r2;
            firstCol = c1;
            lastCol = c2;
        }

        /// <summary>
        /// 读取单元格内容
        /// </summary>
        /// <param name="cell"></param>
        /// <returns></returns>
        private string GetValue(ICell cell)
        {
            string text = "";
            try
            {
                CellType cellType = cell.CellType;
                if (cellType == CellType.Blank || cellType == CellType.Error || cellType == CellType.Unknown)
                {
                    return text;
                }

                if (cellType == CellType.Numeric)
                {
                    double num = cell.NumericCellValue;
                    text = num.ToString();
                }
                else if (cellType == CellType.String)
                {
                    text = cell.StringCellValue;
                }
                else if (cellType == CellType.Boolean)
                {
                    text = cell.BooleanCellValue.ToString();
                }
                else if (cellType == CellType.Formula)
                {
                    double num = cell.NumericCellValue;
                    text = Math.Round(num, 2).ToString();
                }
            }
            catch { }

            return text;
        }

        private void ValidateFilePath()
        {
            ValidateFilePath(fileName);
        }

        private void ValidateFilePath(string fileName)
        {
            if (string.IsNullOrEmpty(fileName))
            {
                throw new InvalidOperationException($"{fileName} is null.");
            }

            if (!File.Exists(fileName))
            {
                throw new InvalidOperationException($"{fileName} is not existing.");
            }

            if (!validExtensions.Values.Contains(Path.GetExtension(fileName)))
            {
                throw new InvalidOperationException($"{fileName}'s extnsion is not supported.");
            }
        }

        private Dictionary<string, string> validExtensions = new Dictionary<string, string>
        {
            { "2017" , ".xlsx" },
            { "2013" , ".xls" },
        };
    }
}
