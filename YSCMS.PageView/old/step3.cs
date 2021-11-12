namespace Foosun.PageView.Install
{
    using Common;
    using Foosun.Config;
    using Foosun.Install;
    using System;
    using System.IO;
    using System.Text.RegularExpressions;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;
    using System.Xml;

    public class step3 : Page
    {
        protected TextBox collectpath;
        protected TextBox datasource;
        protected DropDownList DbType;
        protected TextBox FoosunPath;
        protected HtmlForm form1;
        protected HtmlGenericControl getLoading;
        protected TextBox helpkeypath;
        protected TextBox initialcatalog;
        protected TextBox password;
        private string sitedir = null;
        protected TextBox SN;
        protected TextBox tableprefix;
        protected TextBox userid;

        protected string CreateDataBase(string server, string user, string pwd, string dbname, string tbpre)
        {
            string str = "0";
            string path = this.sitedir.TrimEnd(new char[] { '\\' }) + @"\Install\SQL\CreatData.sql";
            try
            {
                if (File.Exists(path))
                {
                    string connStr = string.Format("data source={0};user id={1};password={2};persist security info=false;packet size=4096", server, user, pwd);
                    Comm.ExecuteSql(connStr, "master", "IF Not EXISTS (select name from master.dbo.sysdatabases where name = N'" + dbname + "') CREATE DATABASE [" + dbname + "] COLLATE Chinese_PRC_CI_AS");
                    StreamReader reader = File.OpenText(path);
                    string sqlscript = reader.ReadToEnd();
                    reader.Close();
                    sqlscript = this.replaceTablePre(sqlscript, dbname, tbpre);
                    Comm.ExecuteSql(connStr, dbname, sqlscript);
                    Comm.ExecuteSql(connStr, dbname, "CREATE PROCEDURE [" + tbpre + "publish_CHupdateishtml] @tablename varchar(30),@filedname varchar(30),@idtype varchar(30),@id int AS begin declare @sql varchar(500) set @sql='update '+@tablename +' set '+@filedname+'=1 where '+@idtype+'='+'''+@id+''' exec (@sql) end");
                    Comm.ExecuteSql(connStr, dbname, "CREATE PROCEDURE [" + tbpre + "publish_updateishtml] @tablename varchar(30),@filedname varchar(30),@idtype varchar(30),@newsid varchar(12) AS begin declare @sql varchar(500) set @sql='update '+@tablename +' set '+@filedname+'=1 where '+@idtype+'='+''''+@newsid+'''' exec (@sql) end");
                    return str;
                }
                return "数据库脚本文件不存在!";
            }
            catch (Exception exception)
            {
                return (exception.Message ?? "");
            }
        }

        protected bool existFile(string path)
        {
            FileInfo info = new FileInfo(this.sitedir + path);
            return info.Exists;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            base.Response.CacheControl = "no-cache";
            this.sitedir = base.Server.MapPath("~");
            this.Page.Server.ScriptTimeout = 0x3e8;
            string str = base.Request.QueryString["set"];
            string codeStr = base.Request.QueryString["sn"];
            string str3 = base.Request.QueryString["foosunPath"];
            string str4 = base.Request.QueryString["helpkeypath"];
            string str5 = base.Request.QueryString["collectpath"];
            if ((!string.IsNullOrEmpty(str3) || !string.IsNullOrEmpty(str4)) || !string.IsNullOrEmpty(str5))
            {
                string errMSG = "";
                if (!this.existFile(str3))
                {
                    errMSG = errMSG + "<li>主数据库路径不正确</li>";
                }
                if (!this.existFile(str4))
                {
                    errMSG = errMSG + "<li>帮助数据库路径不正确</li>";
                }
                if (!this.existFile(str5))
                {
                    errMSG = errMSG + "<li>采集数据库路径不正确</li>";
                }
                if (errMSG == "")
                {
                    errMSG = errMSG + this.setWebConfig(str3, str4, str5);
                }
                this.StartInstall_Access(errMSG);
            }
            if ((str != null) && (str != string.Empty))
            {
                if (codeStr.Length != 0x1d)
                {
                    base.Response.Write("请正确填写序列号&nbsp; &nbsp; <a href=\"javascript:closediv();\"> <span style=\"color:Blue\">重新操作</span>");
                    base.Response.End();
                }
                string str7 = new UIConfig().snportpass();
                Series series = new Series();
                if (series.EnPas(codeStr).ToUpper() != str7)
                {
                    base.Response.Write("序列号错误&nbsp; &nbsp; <a href=\"javascript:closediv();\"> <span style=\"color:Blue\">重新操作</span>");
                    base.Response.End();
                }
                this.StartInstall_Click();
            }
        }

        protected string replaceTablePre(string sqlscript, string dbname, string tbpre)
        {
            return Regex.Replace(Regex.Replace(sqlscript, "[Ff][Ss]_", tbpre, RegexOptions.Compiled), "DO_NET_CMS", dbname, RegexOptions.Compiled);
        }

        protected string setWebConfig(string foosunPath, string helpkeyPath, string CollectPath)
        {
            string str = "";
            try
            {
                FileInfo info = new FileInfo(this.sitedir + "/web.config");
                XmlDocument document = new XmlDocument();
                document.Load(info.FullName);
                bool flag = false;
                foreach (XmlNode node in document["configuration"]["connectionStrings"])
                {
                    if (node.Name == "add")
                    {
                        if (node.Attributes.GetNamedItem("name").Value.ToLower() == "foosun")
                        {
                            node.Attributes.GetNamedItem("connectionString").Value = foosunPath;
                            flag = true;
                        }
                        if (node.Attributes.GetNamedItem("name").Value.ToLower() == "helpkey")
                        {
                            node.Attributes.GetNamedItem("connectionString").Value = helpkeyPath;
                            flag = true;
                        }
                        if (node.Attributes.GetNamedItem("name").Value.ToLower() == "collect")
                        {
                            node.Attributes.GetNamedItem("connectionString").Value = CollectPath;
                            flag = true;
                        }
                    }
                }
                foreach (XmlNode node in document["configuration"]["appSettings"])
                {
                    if (node.Name == "add")
                    {
                        if (node.Attributes.GetNamedItem("key").Value.ToLower() == "dataRe")
                        {
                            node.Attributes.GetNamedItem("value").Value = "FS_";
                            flag = true;
                        }
                        if (node.Attributes.GetNamedItem("key").Value.ToLower() == "webdal")
                        {
                            node.Attributes.GetNamedItem("value").Value = "Foosun.AccessDAL";
                            flag = true;
                        }
                        if (node.Attributes.GetNamedItem("key").Value.ToLower() == "mssql")
                        {
                            node.Attributes.GetNamedItem("value").Value = "0";
                            flag = true;
                        }
                    }
                }
                if (!flag)
                {
                    str = "配置Web.Config文件出错!";
                }
                document.Save(info.FullName);
            }
            catch (Exception exception)
            {
                str = exception.Message ?? "";
            }
            try
            {
                string strValue = base.Request.ServerVariables["SERVER_NAME"];
                string str3 = base.Request.ServerVariables["SERVER_PORT"];
                if ((str3 != string.Empty) && (str3 != "80"))
                {
                    strValue = strValue + ":" + str3;
                }
                Public.SaveXmlConfig("siteDomain", strValue, "xml/sys/base.config");
            }
            catch
            {
            }
            return str;
        }

        protected string setWebConfig(string server, string user, string pwd, string dbname, string tbpre)
        {
            string str = "0";
            try
            {
                FileInfo info = new FileInfo(this.sitedir + "/web.config");
                XmlDocument document = new XmlDocument();
                document.Load(info.FullName);
                bool flag = false;
                foreach (XmlNode node in document["configuration"]["connectionStrings"])
                {
                    if (node.Name == "add")
                    {
                        if (node.Attributes.GetNamedItem("name").Value.ToLower() == "foosun")
                        {
                            node.Attributes.GetNamedItem("connectionString").Value = string.Format("server={0};uid={1};pwd={2};database={3};", new object[] { server, user, pwd, dbname });
                            flag = true;
                        }
                        if (node.Attributes.GetNamedItem("name").Value.ToLower() == "helpkey")
                        {
                            node.Attributes.GetNamedItem("connectionString").Value = string.Format("server={0};uid={1};pwd={2};database={3};", new object[] { server, user, pwd, dbname });
                            flag = true;
                        }
                        if (node.Attributes.GetNamedItem("name").Value.ToLower() == "collect")
                        {
                            node.Attributes.GetNamedItem("connectionString").Value = string.Format("server={0};uid={1};pwd={2};database={3};", new object[] { server, user, pwd, dbname });
                            flag = true;
                        }
                    }
                }
                foreach (XmlNode node in document["configuration"]["appSettings"])
                {
                    if (node.Name == "add")
                    {
                        if (node.Attributes.GetNamedItem("key").Value.ToLower() == "dataRe")
                        {
                            node.Attributes.GetNamedItem("value").Value = "FS_";
                            flag = true;
                        }
                        if (node.Attributes.GetNamedItem("key").Value.ToLower() == "webdal")
                        {
                            node.Attributes.GetNamedItem("value").Value = "Foosun.SQLServerDAL";
                            flag = true;
                        }
                        if (node.Attributes.GetNamedItem("key").Value.ToLower() == "mssql")
                        {
                            node.Attributes.GetNamedItem("value").Value = "1";
                            flag = true;
                        }
                    }
                }
                if (!flag)
                {
                    str = "配置Web.Config文件出错!";
                }
                document.Save(info.FullName);
            }
            catch (Exception exception)
            {
                str = exception.Message ?? "";
            }
            try
            {
                string strValue = base.Request.ServerVariables["SERVER_NAME"];
                string str3 = base.Request.ServerVariables["SERVER_PORT"];
                Public.SaveXmlConfig("siteDomain", strValue, "xml/sys/base.config");
            }
            catch
            {
            }
            return str;
        }

        protected void showError(string errinfo)
        {
            base.Response.Write(errinfo);
            base.Response.End();
        }

        protected void StartInstall_Access(string errMSG)
        {
            string s = "";
            if (errMSG == "")
            {
                s = "<span style=\"font-weight:bold;font-size:16px;color:Green;\">恭喜！操作成功!</span><a href=\"step4.aspx\"> &nbsp; <span style=\"color:blue\">进行下一步操作</span>";
            }
            else
            {
                s = errMSG + "<a href=\"javascript:closediv();\"><span style=\"color:blue\">重新操作</span></a>";
            }
            base.Response.Write(s);
            base.Response.End();
        }

        protected void StartInstall_Click()
        {
            string str = base.Request.QueryString["DbType"];
            string server = base.Request.QueryString["datasource"];
            string dbname = base.Request.QueryString["initialcatalog"];
            string user = base.Request.QueryString["userid"];
            string pwd = base.Request.QueryString["password"];
            string tbpre = base.Request.QueryString["gtableprefix"];
            string s = this.CreateDataBase(server, user, pwd, dbname, tbpre);
            if (s != "0")
            {
                base.Response.Write(s + "&nbsp; &nbsp; <a href=\"javascript:closediv();\"> <span style=\"color:Blue\">重新操作</span>");
                base.Response.End();
            }
            s = this.setWebConfig(server, user, pwd, dbname, tbpre);
            if (s != "0")
            {
                base.Response.Write("创建数据库成功!但：" + s + " &nbsp; &nbsp; <a href=\"javascript:closediv();\"><span style=\"color:Blue\">重新操作</span>&nbsp; &nbsp; <a href=\"step4.aspx\"><span style=\"color:Blue\">下一步</span>");
                base.Response.End();
            }
            else
            {
                s = "<span style=\"font-weight:bold;font-size:16px;color:Green;\">恭喜！操作成功!</span><a href=\"step4.aspx\"> &nbsp; <span style=\"color:blue\">进行下一步操作</span>";
            }
            base.Response.Write(s);
            base.Response.End();
        }
    }
}

