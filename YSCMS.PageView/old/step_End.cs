namespace Foosun.PageView.Install
{
    using Foosun.Config;
    using Foosun.Install;
    using Foosun.PageBasic;
    using System;
    using System.IO;
    using System.Text.RegularExpressions;
    using System.Web.UI.HtmlControls;

    public class step_End : BasePage
    {
        protected HtmlGenericControl getLoading;
        protected HtmlHead Head1;
        private string sitedir = null;

        protected void deleteAllInstallFile()
        {
            string[] strArray = new string[] { "Index.aspx", "step1.aspx", "step2.aspx", "step3.aspx", "finishinstall.aspx", "step4.aspx", "step_End.aspx" };
            for (int i = 0; i < strArray.Length; i++)
            {
                string path = this.sitedir + @"Install\" + strArray[i].ToString();
                if (File.Exists(path))
                {
                    File.Delete(path);
                }
            }
            if (Directory.Exists(base.Server.MapPath("~/install/SQL")))
            {
                Directory.Delete(base.Server.MapPath("~/install/SQL"), true);
            }
            if (Directory.Exists(base.Server.MapPath("~/Install/image")))
            {
                Directory.Delete(base.Server.MapPath("~/Install/image"), true);
            }
            if (Directory.Exists(base.Server.MapPath("~/Install/css")))
            {
                Directory.Delete(base.Server.MapPath("~/Install/css"), true);
            }
        }

        protected void deleteInstallFile()
        {
            string[] strArray = new string[] { "Index.aspx", "step1.aspx", "step2.aspx", "step3.aspx", "db.sql", "db1.sql", "SQL/CreatData.sql" };
            for (int i = 0; i < strArray.Length; i++)
            {
                string path = this.sitedir + @"Install\" + strArray[i].ToString();
                if (File.Exists(path))
                {
                    File.Delete(path);
                }
            }
        }

        protected string InsertValue(string par)
        {
            string str = string.Empty;
            string path = string.Empty;
            string str3 = "0/10";
            try
            {
                string str6;
                string str8 = par;
                switch (str8)
                {
                    case "site_param":
                        path = base.Server.MapPath("SQL/Value/site_param.sql");
                        str3 = "1/10，参数设置导入成功。";
                        break;

                    case "group":
                        path = base.Server.MapPath("SQL/Value/group.sql");
                        str3 = "2/10，会员组，管理员组设置导入成功。";
                        break;

                    case "label":
                        path = base.Server.MapPath("SQL/Value/label.sql");
                        str3 = "3/10，内置标签导入成功。";
                        break;

                    case "menu":
                        path = base.Server.MapPath("SQL/Value/menu.sql");
                        str3 = "4/10，功能菜单导入成功。";
                        break;

                    case "stat":
                        path = base.Server.MapPath("SQL/Value/stat.sql");
                        str3 = "5/10，统计参数导入成功。";
                        break;

                    case "friend":
                        path = base.Server.MapPath("SQL/Value/friend.sql");
                        str3 = "6/10，友情连接参数导入成功。";
                        break;

                    case "collect":
                        path = base.Server.MapPath("SQL/Value/collect.sql");
                        str3 = "7/10，采集参数导入成功。";
                        break;

                    case "help":
                        path = base.Server.MapPath("SQL/Value/help.sql");
                        str3 = "8/10，帮助导入成功。";
                        break;

                    case "classinfo":
                        path = base.Server.MapPath("SQL/Value/class.sql");
                        str3 = "9/10，内置栏目导入成功。";
                        break;

                    case "newinfo":
                        path = base.Server.MapPath("SQL/Value/news.sql");
                        str3 = "10/10，内置新闻导入成功。";
                        break;

                    case "domainName":
                        this.setDomainName();
                        return "";
                }
                if (path == string.Empty)
                {
                    str = "发生错误！参数传递错误。";
                    goto Label_042C;
                }
                StreamReader reader = File.OpenText(path);
                string str5 = Regex.Replace(reader.ReadToEnd(), @"\[[Ff][Ss]_", "[" + UIConfig.dataRe, RegexOptions.Compiled);
                reader.Close();
                string[] strArray = str5.Split(new char[] { '\n' });
                for (int i = 0; i < strArray.Length; i++)
                {
                    if (((strArray[i] != "\r") && (strArray[i] != "")) && (strArray[i] != null))
                    {
                        str8 = par;
                        if (str8 == null)
                        {
                            goto Label_031C;
                        }
                        if (!(str8 == "collect"))
                        {
                            if (str8 == "help")
                            {
                                goto Label_030A;
                            }
                            goto Label_031C;
                        }
                        Comm.ExecuteSql(DBConfig.CollectConString, strArray[i]);
                    }
                    continue;
                Label_030A:
                    Comm.ExecuteSql(DBConfig.HelpConString, strArray[i]);
                    continue;
                Label_031C:
                    Comm.ExecuteSql(DBConfig.CmsConString, strArray[i]);
                }
                if (par == "site_param")
                {
                    str6 = string.Concat(new object[] { "insert into [", UIConfig.dataRe, "sys_newsIndex] ([TableName],[CreatTime]) values ('", UIConfig.dataRe, "News','", DateTime.Now, "');" });
                    str8 = par;
                    if (str8 == null)
                    {
                        goto Label_03FE;
                    }
                    if (!(str8 == "collect"))
                    {
                        if (str8 == "help")
                        {
                            goto Label_03E8;
                        }
                        goto Label_03FE;
                    }
                    Comm.ExecuteSql(DBConfig.CollectConString, str6);
                }
                goto Label_040E;
            Label_03E8:
                Comm.ExecuteSql(DBConfig.HelpConString, str6);
                this.deleteAllInstallFile();
                goto Label_040E;
            Label_03FE:
                Comm.ExecuteSql(DBConfig.CmsConString, str6);
            Label_040E:
                str = str3;
            }
            catch (Exception exception)
            {
                str = "发生错误." + exception.Message;
            }
        Label_042C:
            if (str == "10/10，帮助导入成功。")
            {
                this.deleteAllInstallFile();
            }
            return str;
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
            string sql = "update fs_sys_param set SiteDomain='" + base.Request.Url.Host + "'";
            Comm.ExecuteSql(DBConfig.CmsConString, sql);
        }
    }
}

