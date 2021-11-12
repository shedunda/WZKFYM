using YSCMS.Config;
using YSCMS.Install;
using YSCMS.PageBasic;
using System;
using System.IO;
using System.Text.RegularExpressions;
using System.Web.UI.HtmlControls;

namespace YSCMS.PageView.Install
{
    public partial class Step_End : BasePage
    {
        //protected HtmlGenericControl getLoading;
        //protected HtmlHead Head1;
        private string sitedir = null;

        protected void deleteAllInstallFile()
        {
            //string[] strArray = new string[] { "Index.aspx", "Step1.aspx", "Step2.aspx", "Step3.aspx", "Finishinstall.aspx", "Step4.aspx", "Step_End.aspx" };
            //for (int i = 0; i < strArray.Length; i++)
            //{
            //    string path = this.sitedir + @"Install\" + strArray[i].ToString();
            //    if (File.Exists(path))
            //    {
            //        File.Delete(path);
            //    }
            //}
            //if (Directory.Exists(base.Server.MapPath("~/install/SQL")))
            //{
            //    Directory.Delete(base.Server.MapPath("~/install/SQL"), true);
            //}
            //if (Directory.Exists(base.Server.MapPath("~/Install/image")))
            //{
            //    Directory.Delete(base.Server.MapPath("~/Install/image"), true);
            //}
            //if (Directory.Exists(base.Server.MapPath("~/Install/css")))
            //{
            //    Directory.Delete(base.Server.MapPath("~/Install/css"), true);
            //}
        }

        protected void deleteInstallFile()
        {
            string[] strArray = new string[] { "Index.aspx", "step1.aspx", "step2.aspx", "step3.aspx", "db.sql", "db1.sql", "SQL/CreatData.sql" };
            for (int i = 0; i < strArray.Length; i++)
            {
                string path = this.sitedir + @"Install\" + strArray[i].ToString();
                if (File.Exists(path))
                {
                  // File.Delete(path);
                }
            }
        }

        protected string InsertValue(string par)
        {
            string ResultStr = string.Empty;
            string s_dbsqlpath1 = string.Empty;
            string RollBar = "0/10";
            par = par.ToLower();
            try
            {
                switch (par)
                {
                    case "site_param":
                        s_dbsqlpath1 = Server.MapPath("SQL/Value/site_param.sql");
                        RollBar = "1/10，参数设置导入成功。";
                        break;
                    case "group":
                        s_dbsqlpath1 = Server.MapPath("SQL/Value/group.sql");
                        RollBar = "2/10，会员组，管理员组设置导入成功。";
                        break;
                    case "label":
                        s_dbsqlpath1 = Server.MapPath("SQL/Value/label.sql");
                        RollBar = "3/10，内置标签导入成功。";
                        break;
                    case "menu":
                        s_dbsqlpath1 = Server.MapPath("SQL/Value/menu.sql");
                        RollBar = "4/10，功能菜单导入成功。";
                        break;
                    case "stat":
                        s_dbsqlpath1 = Server.MapPath("SQL/Value/stat.sql");
                        RollBar = "5/10，统计参数导入成功。";
                        break;
                    case "friend":
                        s_dbsqlpath1 = Server.MapPath("SQL/Value/friend.sql");
                        RollBar = "6/10，友情连接参数导入成功。";
                        break;
                    case "collect":
                        s_dbsqlpath1 = Server.MapPath("SQL/Value/collect.sql");
                        RollBar = "7/10，采集参数导入成功。";
                        break;
                    case "help":
                        s_dbsqlpath1 = Server.MapPath("SQL/Value/help.sql");
                        RollBar = "8/10，帮助导入成功。";
                        break;
                    case "classinfo":
                        s_dbsqlpath1 = Server.MapPath("SQL/Value/class.sql");
                        RollBar = "9/10，内置栏目导入成功。";
                        break;
                    case "newinfo":
                        s_dbsqlpath1 = Server.MapPath("SQL/Value/news.sql");
                        RollBar = "10/10，内置新闻导入成功。";
                        break;
                    case "domainName":
                        setDomainName();
                        return "";
                }
                if (s_dbsqlpath1 == string.Empty)
                {
                    ResultStr = "发生错误！参数传递错误。";
                }
                else
                {
                    StreamReader sr = File.OpenText(s_dbsqlpath1);
                    string s_sqldefault = sr.ReadToEnd();
                    string s_result = Regex.Replace(s_sqldefault, @"\[[Yy][Ss]_", "[" + YSCMS.Config.UIConfig.dataRe, RegexOptions.Compiled);
                    sr.Close();
                    string[] sqlarr = s_result.Split('\n');
                    for (int i = 0; i < sqlarr.Length; i++)
                    {
                        if (sqlarr[i] != "\r" && sqlarr[i] != "" && sqlarr[i] != null)
                        {
                            switch (par)
                            {
                                case "collect":
                                    YSCMS.Install.Comm.ExecuteSql(YSCMS.Config.DBConfig.CollectConString, sqlarr[i]);
                                    break;
                                case "help":
                                    YSCMS.Install.Comm.ExecuteSql(YSCMS.Config.DBConfig.HelpConString, sqlarr[i]);
                                    break;
                                default:
                                    YSCMS.Install.Comm.ExecuteSql(YSCMS.Config.DBConfig.CmsConString, sqlarr[i]);
                                    break;
                            }

                        }
                    }
                    if (par == "site_param")
                    {
                        string sql = "insert into [" + YSCMS.Config.UIConfig.dataRe + "sys_newsIndex] ([TableName],[CreatTime]) values ('" + YSCMS.Config.UIConfig.dataRe + "News','" + DateTime.Now + "');";
                        switch (par)
                        {
                            case "collect":
                                YSCMS.Install.Comm.ExecuteSql(YSCMS.Config.DBConfig.CollectConString, sql);
                                break;
                            case "help":
                                YSCMS.Install.Comm.ExecuteSql(YSCMS.Config.DBConfig.HelpConString, sql);
                                deleteAllInstallFile();
                                break;
                            default:
                                YSCMS.Install.Comm.ExecuteSql(YSCMS.Config.DBConfig.CmsConString, sql);
                                break;
                        }
                    }

                    ResultStr = RollBar;

                }
            }
            catch (Exception e)
            {
                ResultStr = "发生错误." + e.Message + "";
            }
            if (ResultStr == "10/10，帮助导入成功。")
            {
                deleteAllInstallFile();
            }
            return ResultStr;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            base.Response.CacheControl = "no-cache";
            string str = base.Request.QueryString["error"];
            if (str != "false")
            {
                base.PageError("请安装管理员，再进行此操作！", "step4.aspx", true);
            }
            string str2 = base.Request.QueryString["start"];
            if ((str2 != string.Empty) && (str2 != null))
            {
                base.Response.Write(this.InsertValue(base.Request.QueryString["set"]));
                base.Response.End();
            }
            this.sitedir = base.Server.MapPath("~");
            this.deleteInstallFile();
        }

        private void setDomainName()
        {
            string sql = "update ys_sys_param set SiteDomain='" + base.Request.Url.Host + "'";
            YSCMS.Install.Comm.ExecuteSql(DBConfig.CmsConString, sql);
        }
    }
}