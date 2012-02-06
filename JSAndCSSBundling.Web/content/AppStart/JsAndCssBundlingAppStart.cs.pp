using $rootnamespace$.AppStart;
using Microsoft.Web.Infrastructure.DynamicModuleHelper;
using Microsoft.Web.Optimization;

[assembly: WebActivator.PreApplicationStartMethod(typeof(JsAndCssBundlingAppStart), "Start")]
 
namespace $rootnamespace$.AppStart
{
    public static class JsAndCssBundlingAppStart
    {
        public static void Start()
        {
            DynamicModuleUtility.RegisterModule(typeof (BundleModule));
            InitializeDefaultSettings();
            RegisterFolders();
        }

        private static void InitializeDefaultSettings()
        {
            BundleTable.Bundles.AddDefaultFileExtensionReplacements();
            BundleTable.Bundles.AddDefaultFileOrderings();
            BundleTable.Bundles.AddDefaultIgnorePatterns();
        }

        /// <summary>
        /// Register your custom files here.
        /// In your layout, reference /Scripts/js for bundling all the files in /Scripts/.
        /// 
        /// The following line of code will add an Hash in the querystring
        /// Microsoft.Web.Optimization.BundleTable.Bundles.ResolveBundleUrl("~/Scripts/Framework/js", true)
        /// </summary>
        private static void RegisterFolders()
        {
            var js = new DynamicFolderBundle("js", typeof(JsMinify), "*.js", false);
            BundleTable.Bundles.Add(js);

            var css = new DynamicFolderBundle("css", typeof (CssMinify), "*.css", false);
            BundleTable.Bundles.Add(css);
        }
    }
}