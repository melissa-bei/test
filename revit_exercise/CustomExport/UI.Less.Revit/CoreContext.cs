using Autodesk.Revit;
using Autodesk.Revit.ApplicationServices;
using Autodesk.Revit.DB;
using Autodesk.Revit.DB.Events;
using CustomExport;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;

namespace UI.Less.Revit
{
    public class RevitContext
    {
        #region fields

        private Product _revitProduct;
        
        private static bool isLoadEnv = false;  //是否已添加过环境变量

        const string RevitAssemblyConfigName = "revit_folders.txt";  // 默认根目录下

        /// <summary>
        /// revit程序目录
        /// </summary>
        public static string RevitAssemblyDirPath;

        public event EventHandler<Product> InitRevitFinished;

        /// <summary>
        /// 打开REVIT文件时的设置
        /// </summary>
        public OpenOptions OpenOptions { get; set; }

        /// <summary>
        /// Revit Application
        /// </summary>
        public Application Application
        {
            get
            {
                return this._revitProduct?.Application;
            }
        }
        public Product RvtProduct
        {
            get { return this._revitProduct; }
        }

        #endregion


        #region constructors

        /// <summary>
        /// 
        /// </summary>
        /// <param name="revitPath">revit安装目录</param>
        public RevitContext(string revitPath = "")
        {
            if (string.IsNullOrEmpty(revitPath))
            {
                if (File.Exists(RevitAssemblyConfigName))
                {
                    RevitAssemblyDirPath = File.ReadAllLines(RevitAssemblyConfigName).First();
                }
                else
                {
                    RevitAssemblyDirPath = @"D:\Program Files\Autodesk\Revit 2020";
                }
            }
            else
            {
                RevitAssemblyDirPath = revitPath;
            }

            AddEnv();
        }

        #endregion


        #region methods

        /// <summary>
        /// 初始化一个revit
        /// </summary>
        public void InitRevit()
        {
            _revitProduct = Product.GetInstalledProduct();
            var clientApplicationId = new ClientApplicationId(Guid.NewGuid(), "RevitContext", "BIM");
            _revitProduct.SetPreferredLanguage(LanguageType.Chinese_Simplified);
            _revitProduct.Init(clientApplicationId, "I am authorized by Autodesk to use this UI-less functionality.");
            Console.WriteLine($"{ utils.GetTimeStamp()}Successfully init Revit.");

            ///Initial the OpenOptions
            this.OpenOptions = new OpenOptions
            {
                Audit = true,
                AllowOpeningLocalByWrongUser = false,
                DetachFromCentralOption = DetachFromCentralOption.DetachAndDiscardWorksets  ///Detached from the central model
            };
            OnInitRevitFinished();
        }

        /// <summary>
        /// 关闭revit
        /// </summary>
        public void CloseRevit()
        {
            this._revitProduct.Exit();
        }
                
        private void OnInitRevitFinished()
        {
            this.InitRevitFinished?.Invoke(this, this._revitProduct);
        }


        /// <summary>
        /// 打开revit文件
        /// </summary>
        /// <param name="filename"></param>
        /// <param name="options"></param>
        /// <returns></returns>
        public Document OpenFile(string filename, OpenOptions options = null)
        {
            if (options == null)
            {
                options = this.OpenOptions;
            }
            ModelPath model = new FilePath(filename);
            IOpenFromCloudCallback openFromCloudCallback = new DefaultOpenFromCloudCallback();

            _revitProduct.Application.FailuresProcessing += new EventHandler<FailuresProcessingEventArgs>(utils.FailuresProcessing);
            Document doc = this._revitProduct.Application.OpenDocumentFile(model, options, openFromCloudCallback);
            _revitProduct.Application.FailuresProcessing -= new EventHandler<FailuresProcessingEventArgs>(utils.FailuresProcessing);
            return doc;
        }



        /// <summary>
        /// 添加revit安装路径到环境变量以便加载相应的DLL
        /// </summary>
        /// <param name="revitPath">添加revit安装路径</param>
        public static void AddEnv(string revitPath = null)
        {
            if (isLoadEnv)
            {
                return;
            }

            if (revitPath != null)
            {
                RevitAssemblyDirPath = revitPath;
            }
            AddEnvironmentPaths(RevitAssemblyDirPath);
            AppDomain.CurrentDomain.AssemblyResolve += CurrentDomain_AssemblyResolve;
        }

        /// <summary>
        /// 添加环境变量
        /// </summary>
        /// <param name="paths">revit安装路径</param>
        static void AddEnvironmentPaths(params string[] paths)
        {
            string[] first = {
                Environment.GetEnvironmentVariable("PATH") ?? string.Empty
            };
            string value = string.Join(Path.PathSeparator.ToString(), first.Concat(paths));
            Environment.SetEnvironmentVariable("PATH", value);
        }

        /// <summary>
        /// 动态加载revit相关的dll
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="args"></param>
        /// <returns></returns>
        static Assembly CurrentDomain_AssemblyResolve(object sender, ResolveEventArgs args)
        {
            var assemblyName = new AssemblyName(args.Name);
            var text = $"{Path.Combine(RevitAssemblyDirPath, assemblyName.Name)}.dll";
            Assembly result;
            if (File.Exists(text))
            {
                Console.WriteLine($"{utils.GetTimeStamp()}Load Revit Dll Path:{text}");
                result = Assembly.LoadFrom(text);
            }
            else
            {
                result = null;
            }
            return result;
        }

        #endregion



        #region Auto export revit model


        

        #endregion



        #region Test UI-less Revit
        //public void _InitRevit()
        //{
        //    this.OpenOptions = new OpenOptions
        //    {
        //        Audit = true,
        //        AllowOpeningLocalByWrongUser = false,
        //        DetachFromCentralOption = DetachFromCentralOption.DetachAndDiscardWorksets //从中心模型分离
        //    };
        //    _revitProduct = Product.GetInstalledProduct();
        //    var clientApplicationId = new ClientApplicationId(Guid.NewGuid(), "RevitContext", "BIM");
        //    _revitProduct.SetPreferredLanguage(Autodesk.Revit.ApplicationServices.LanguageType.Chinese_Simplified);
        //    _revitProduct.Init(clientApplicationId, "I am authorized by Autodesk to use this UI-less functionality.");

        //    InitRevitFinished += RevitContext_InitRevitFinished;
        //    OnInitRevitFinished();
        //}

        //public static void RevitContext_InitRevitFinished(object sender, Product e)
        //{
        //    var app = e.Application;
        //    var projectrTemplate = app.DefaultProjectTemplate;

        //    if (String.IsNullOrEmpty(projectrTemplate))
        //    {
        //        projectrTemplate = @"C:\App\UI-Less Revit\Construction-DefaultCHSCHS.rte";
        //    }

        //    if (!File.Exists(projectrTemplate))
        //    {
        //        throw new FileNotFoundException("默认项目路径不存在 , 请指定 !");
        //    }

        //    var document = app.NewProjectDocument(projectrTemplate);
        //    if (document == null)
        //    {
        //        throw new InvalidOperationException();
        //    }

        //    /// create wall demo ...
        //    var p1 = XYZ.Zero;
        //    var p2 = new XYZ(0, 10, 0);
        //    var p3 = new XYZ(10, 10, 0);
        //    var p4 = new XYZ(10, 0, 0);

        //    var points = new XYZ[] { p1, p2, p3, p4 };

        //    document.Invoke(m =>
        //    {
        //        var level0 = document.QueryByType<Level>().OfType<Level>().FirstOrDefault(x => Math.Abs(x.Elevation - 0.0) <= 1e-7);
        //        if (level0 == null)
        //        {
        //            level0 = Level.Create(document, 0);

        //            document.Regenerate();
        //        }

        //        var ids = new List<String>();
        //        var loop = new CurveLoop();
        //        for (int i = 0; i < points.Length; i++)
        //        {
        //            var a = points[i];
        //            var b = i == points.Length - 1 ? points[0] : points[i + 1];
        //            var line = Line.CreateBound(a, b);
        //            loop.Append(line);

        //            var wall = Wall.Create(document, Line.CreateBound(a, b), level0.Id, false);
        //            ids.Add(wall.Id.ToString());
        //            if (wall.HasPhases())
        //            {
        //                wall.CreatedPhaseId = document.Phases.get_Item(0).Id;
        //            }
        //        }

        //        Console.WriteLine($"New Wall Ids: {String.Join(", ", ids)}");

        //        loop.Transform(Transform.CreateTranslation(new XYZ(-11, 0, 0)));
        //        var colt = new FilteredElementCollector(document).OfClass(typeof(FilledRegionType));
        //        var colt1 = new FilteredElementCollector(document).OfClass(typeof(ViewPlan)).WhereElementIsNotElementType();
        //        var view = colt1.FirstElement() as ViewPlan;
        //        Console.WriteLine(view.Name);
        //        FilledRegion.Create(document, colt.FirstElementId(),
        //                            view.Id, new List<CurveLoop> { loop });
        //    });

        //    document.SaveAs(Path.Combine("revit_new_file.rvt"), new SaveAsOptions() { OverwriteExistingFile = true });
        //    System.Diagnostics.Process.Start(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location));

        //    e.Exit();
        //}

        #endregion
    }
}
