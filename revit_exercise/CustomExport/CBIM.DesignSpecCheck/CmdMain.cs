using Autodesk.Revit.DB;
using Autodesk.Revit.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Interop;
using UIFrameworkServices;

namespace CBIM.DesignSpecCheck
{
    /// <summary>
    /// 
    /// </summary>
    [Autodesk.Revit.Attributes.Transaction(Autodesk.Revit.Attributes.TransactionMode.Manual)]
    class CmdMain : IExternalCommand
    {
        public Result Execute(ExternalCommandData commandData, ref string message, ElementSet elements)
        {
            try
            {
                uidoc = commandData.Application.ActiveUIDocument;
                doc = uidoc.Document;

                // TestFileNavOpenDialog();
                // TestGetRevitCategory();
                // _ =new SpecModelCheck(doc);
                ModelCheck();
            }
            catch (Exception ex)
            {
                message += ex.ToString();
                return Result.Failed;
            }

            return Result.Succeeded;
        }

        private void ModelCheck()
        {
            var vm = new SpecModelCheck(uidoc);
            var win = new CheckView()
            {
                DataContext = vm,
            };
            _ = new WindowInteropHelper(win)
            {
                Owner = Autodesk.Windows.ComponentManager.ApplicationWindow
            };

            win.ShowDialog();
        }

        private void TestFileNavOpenDialog()
        {
            //AFileNavOpenDialog fileNavOpenDialog = new AFileNavOpenDialog()
            //{
            //    FileName = @"F:\RevitCategoryService.json",
            //    NeedJournal = false,
            //    NeedPreview = false,
            //    Title = "llx",
            //    Filter = "*.*",
            //    Parent = Autodesk.Windows.ComponentManager.ApplicationWindow
            //};
            //fileNavOpenDialog.ShowDialog();

            FileOpenDialog fileOpenDialog = new FileOpenDialog("Excel files|*.xlsx");
            fileOpenDialog.Title = "请选择清洗后的设计说明参数 Excel 文件";
            var relt = fileOpenDialog.Show();

            if (relt == ItemSelectionDialogResult.Confirmed)
            {
                var modelPath = fileOpenDialog.GetSelectedModelPath();
                var localPath = ModelPathUtils.ConvertModelPathToUserVisiblePath(modelPath);
                TaskDialog.Show("CBIM", $"Selected File Path: \n{localPath}");
            }

        }

        private void TestGetRevitCategory()
        {
            CategoryService categoryService = new CategoryService();
            var modelCategories = categoryService.getBuiltInCategories(modelCategories: true,
                                                 annotationCategories: false,
                                                 analyticalModelCategories: false);
            var annotationCategories = categoryService.getBuiltInCategories(modelCategories: false,
                                                 annotationCategories: true,
                                                 analyticalModelCategories: false);
            var analyticalModelCategories = categoryService.getBuiltInCategories(modelCategories: false,
                                                 annotationCategories: false,
                                                 analyticalModelCategories: true);

            var categoryDict = new Dictionary<String, List<RevitCategories>>();
            categoryDict.Add("ModelCategories", new List<RevitCategories>());
            foreach (var item in modelCategories)
            {
                RevitCategories cate = new RevitCategories()
                {
                    MainCategory = item,
                    SubCategories = categoryService.getBuiltInSubcategories(item.Id).ToList()
                };
                categoryDict["ModelCategories"].Add(cate);
            }

            categoryDict.Add("AnnotationCategories", new List<RevitCategories>());
            foreach (var item in annotationCategories)
            {
                RevitCategories cate = new RevitCategories()
                {
                    MainCategory = item,
                    SubCategories = categoryService.getBuiltInSubcategories(item.Id).ToList()
                };
                categoryDict["AnnotationCategories"].Add(cate);
            }

            categoryDict.Add("AnalyticalModelCategories", new List<RevitCategories>());
            foreach (var item in analyticalModelCategories)
            {
                RevitCategories cate = new RevitCategories()
                {
                    MainCategory = item,
                    SubCategories = categoryService.getBuiltInSubcategories(item.Id).ToList()
                };
                categoryDict["AnalyticalModelCategories"].Add(cate);
            }

            var cateList = new List<IEnumerable<CategoryData>>
            {
                modelCategories,annotationCategories,analyticalModelCategories
            };
            System.IO.File.WriteAllText(@"F:\RevitCategoryService.json",
                                        Newtonsoft.Json.JsonConvert.SerializeObject(categoryDict,
                                        Newtonsoft.Json.Formatting.Indented));

            /// record nums
            String subNums = "";
            foreach (var cates in cateList)
            {
                var n = 0;
                foreach (var item in cates)
                {
                    var subCates = categoryService.getBuiltInSubcategories(item.Id);
                    if (null != subCates)
                    {
                        n += subCates.Count();
                    }
                }

                subNums += $"{n}, ";
            }

            TaskDialog.Show("tip", $"modelCategories: {modelCategories.Count()}\n" +
                $"modelSubCategories: {subNums}\n" +
                $"analyticalModelCategories: {analyticalModelCategories.Count()}\n" +
                $"annotationCategories: {annotationCategories.Count()}\n");
        }

        private UIDocument uidoc;
        private Document doc;
    }

    class RevitCategories
    {
        public CategoryData MainCategory { get; set; }

        public List<CategoryData> SubCategories { get; set; }

    }
}
