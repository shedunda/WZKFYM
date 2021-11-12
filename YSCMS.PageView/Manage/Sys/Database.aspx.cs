﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using YSCMS.CMS;
using YSCMS.Model;

namespace YSCMS.PageView.Manage.Sys
{
    public partial class Database : YSCMS.PageBasic.ManagePage
    {
        public Database()
        {
            Authority_Code = "Q024";
        }
        private string str_dirDumm = YSCMS.Config.UIConfig.dirDumm;
        public string TabList1 = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SiteID != "0") { YSCMS.Common.MessageBox.Show(this, "您没有数据库管理的权限"); }
            if (!IsPostBack)
            {
                //copyright.InnerHtml = CopyRight;            //获取版权信息
            }
            string Action = Request.QueryString["Action"]; //取得参数值
            switch (Action)                 //判断操作类型
            {
                case "Sql":                 //执行SQL语句
                    ExecuteSql();
                    break;
                case "Bak":                 //备份数据库
                    DbBak();
                    break;
                case "Rar":                 //压缩数据库
                    DbRar();
                    break;
                case "Del":                 //删除数据库备份
                    DelBakDb();
                    break;
                case "getFieldName":
                    getFieldName();
                    break;
                case "Replace":
                    ReplaceGo();
                    break;
            }
        }

        /// <summary>
        /// 执行SQL语句
        /// </summary>
        /// <returns>执行SQL语句</returns>


        protected void ExecuteSql()
        {
            Response.CacheControl = "no-cache";         //设置页面无缓存
            string ExecuteSql = Request.Form["SqlText"];

            if (ExecuteSql == "" || ExecuteSql == null) //判断是否为空,如果为空则输出提示
                ResultShow.InnerHtml = "请输入SQL语句";
            else
            {
                YSCMS.CMS.Database dbClass = new YSCMS.CMS.Database();
                DataTable dt = dbClass.ExecuteSql(ExecuteSql);
                string str_ExeSqlResult = "";
                str_ExeSqlResult = "<table class='jstable'>";

                if (dt == null)
                {
                    str_ExeSqlResult += "<tr><td>执行成功!</td></tr>";
                }
                else
                {
                    for (int j = 0; dt.Columns.Count > j; j++)      //循环读取数据表字段名
                    {
                        str_ExeSqlResult += "<th>" + dt.Columns[j].ToString() + "</th>";
                    }
                    for (int i = 0; dt.Rows.Count > i; i++)         //循环读取数据表行
                    {
                        str_ExeSqlResult += "<tr onmouseout=\"this.className='off'\" onmouseover=\"this.className='on'\" class=\"off\">";
                        for (int j = 0; dt.Columns.Count > j; j++)  //循环读取每一行每一列的内容
                        {
                            str_ExeSqlResult += "<td>" + dt.Rows[i][j].ToString() + "</td>";
                        }
                        str_ExeSqlResult += "</tr>";
                    }

                }
                str_ExeSqlResult += "</table>";
                ResultShow.InnerHtml = str_ExeSqlResult;        //输出执行结果
            }
        }

        /// <summary>
        /// 备份数据库
        /// </summary>
        /// <returns>备份数据库</returns>
        protected void DbBak()
        {
            string str_filename = YSCMS.Common.Rand.Number(15);
            if (str_dirDumm != "" && str_dirDumm != null && str_dirDumm != string.Empty)
                str_dirDumm = "//" + str_dirDumm;
            string sourcePath = Server.MapPath(ConfigurationManager.ConnectionStrings["yscms"].ConnectionString);    //数据库源地址
            string desPath = Server.MapPath(str_dirDumm + "\\YS_Data\\backup\\" + str_filename + ".bak");//数据库目的地址
            string downPath = str_dirDumm + "/YS_Data/backup/" + str_filename + ".bak";             //数据库备份下载地址
            string delPath = str_dirDumm + "/manage/Sys/database.aspx?Action=Del&Path=" + downPath;                                                               //数据库备份删除地址
            YSCMS.CMS.Database dbClass = new YSCMS.CMS.Database();
            int result = 0;
            if (YSCMS.Config.UIConfig.WebDAL == "YSCMS.SQLServerDAL")
            {
                string type = Request.QueryString["Type"];
                int i_type = 1;
                if (type == "" || type == null)
                    i_type = 1;
                else
                    i_type = Convert.ToInt32(type);
                result = dbClass.backSqlData(i_type, Server.MapPath(downPath));
                if (result == 1)
                {
                    if (i_type == 1)
                        PageRight("备份主数据库成功!\r请及时<a href='" + downPath + "'><font color='red'> 下载 </font></a> 下载后 <a href='" + delPath + "'><font color='red'> 删除 </font></a>此备份", "database.aspx?DivNum=2");
                    else if (i_type == 2)
                        PageRight("备份帮助库成功!\r请及时<a href='" + downPath + "'><font color='red'> 下载 </font></a> 下载后 <a href='" + delPath + "'><font color='red'> 删除 </font></a>此备份", "database.aspx?DivNum=2");
                    else
                        PageRight("备份采集库成功!\r请及时<a href='" + downPath + "'><font color='red'> 下载 </font></a> 下载后 <a href='" + delPath + "'><font color='red'> 删除 </font></a>此备份", "database.aspx?DivNum=2");

                }
            }
            else
            {
                result = dbClass.DbBak(sourcePath, desPath);
                switch (result)
                {
                    case 1:
                        PageRight("备份成功!\r请及时<a href='" + downPath + "'><font color='red'> 下载 </font></a> 下载后 <a href='" + delPath + "'><font color='red'> 删除 </font></a>此备份", "database.aspx?DivNum=2"); break;
                    case 2:
                        PageError("备份操作出错!", "database.aspx?DivNum=2");
                        break;
                    case 3:
                        PageError("原始数据库不存在!", "database.aspx?DivNum=2");
                        break;
                    default:
                        PageError("备份操作出错!", "database.aspx?DivNum=2");
                        break;
                }
            }
        }

        /// <summary>
        /// 删除数据库备份
        /// </summary>
        /// <returns>删除数据库备份</returns>


        protected void DelBakDb()
        {
            string str_bakPath = Request.QueryString["Path"];                           //取得参数传递过来的备份数据库路径
            if (str_bakPath != "" && str_bakPath != null && str_bakPath != string.Empty)//判断是否为空
            {
                str_bakPath = Server.MapPath(str_bakPath);                              //取得路径
                YSCMS.CMS.Database dbClass = new YSCMS.CMS.Database();
                int result = dbClass.DelBakDb(str_bakPath);
                if (result == 1)
                    Response.Write("<script language=\"javascript\">alert('删除备份数据库成功!');history.go(-2);</script>");
                else
                    PageError("删除备份数据库失败!", "database.aspx?DivNum=2");//显示错误信息
            }
            else
            {
                PageError("备份数据库路径错误!", "database.aspx?DivNum=2");    //显示错误信息
            }
        }

        /// <summary>
        /// 数据库压缩
        /// </summary>
        /// <returns>数据库压缩</returns>


        protected void DbRar()
        {
            if (str_dirDumm != "" && str_dirDumm != null && str_dirDumm != string.Empty)
                str_dirDumm = "//" + str_dirDumm;
            string rarSourcePath = Server.MapPath(ConfigurationManager.ConnectionStrings["yscms"].ConnectionString);    //数据库源地址
            string rarTempPath = Server.MapPath(str_dirDumm + "\\YS_Data\\YSCMSv3.0.mdb");   //临时数据库地址
            string rarStr_S = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + rarSourcePath;       //需要被压缩的文件  
            string rarStr_T = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + rarTempPath;         //压缩后生成的新文件 
            YSCMS.CMS.Database dbClass = new YSCMS.CMS.Database();

            int result = dbClass.DbRar(rarSourcePath, rarTempPath, rarStr_S, rarStr_T);
            switch (result)
            {
                case 1:
                    PageError("临时数据库已存在,但执行删除过程出错<br>原因:没有权限", "database.aspx?DivNum=3");
                    break;
                case 2:
                    PageError("压缩数据库失败!", "database.aspx?DivNum=3");
                    break;
                case 3:
                    PageRight("压缩数据库成功!", "database.aspx?DivNum=3");
                    break;
                case 4:
                    PageError("数据库不存在!", "database.aspx?DivNum=3");
                    break;
                default:
                    PageError("压缩数据库失败!", "database.aspx?DivNum=3");
                    break;
            }
        }

        /// <summary>
        /// 显示选项卡
        /// </summary>
        /// <returns>显示选项卡</returns>
        protected void Show()
        {
            string DivNum = Request.QueryString["DivNum"];//取得当前选项卡ID
            switch (DivNum)
            {
                case "1":
                    ExecuteJs("ChangeDiv(\"1\");");
                    break;
                case "2":
                    ExecuteJs("ChangeDiv(\"2\");");
                    break;
                case "3":
                    ExecuteJs("ChangeDiv(\"3\");");
                    break;
                case "4":
                    ExecuteJs("ChangeDiv(\"4\");");
                    break;
                default:
                    ExecuteJs("ChangeDiv(\"1\");");
                    break;
            }
        }

        protected void getFieldName()
        {
            string TableName = Request.QueryString["TableName"];
            YSCMS.CMS.Database dbClass = new YSCMS.CMS.Database();
            DataTable dt = dbClass.ExecuteSql("Select Top 1 * From " + TableName + "");
            string s_option = "<select id=\"fieldname\" name=\"fieldname\" class=\"form\" style=\"width:180px;\">";
            for (int j = 0; dt.Columns.Count > j; j++)      //循环读取数据表字段名
            {
                s_option += "<option";
                s_option += " value=\"" + dt.Columns[j].ToString() + "\">" + dt.Columns[j].ToString() + "</option>\r";
            }
            s_option += "</select>";
            Response.Write(s_option);
            Response.End();
        }

        protected void getTableList()
        {
            YSCMS.CMS.FreeLabel fb = new YSCMS.CMS.FreeLabel();
            IList<FreeLablelDBInfo> tbs = fb.GetTables();
            foreach (FreeLablelDBInfo info in tbs)
            {
                TabList1 += "<option";
                TabList1 += " value=\"" + info.Description + "\">" + info.Description + "</option>\r";
            }
            Response.Write(TabList1);
        }


        protected void ReplaceGo()
        {
            string TableName = Request.QueryString["TableName"];
            string FieldName = Request.QueryString["FieldName"];
            string NewTxt = Request.QueryString["NewTxt"];
            string OldTxt = Request.QueryString["OldTxt"];

            if (NewTxt == null)
                NewTxt = "";
            if (OldTxt == null)
                OldTxt = "";

            YSCMS.CMS.Database dbClass = new YSCMS.CMS.Database();
            DataTable dt = dbClass.ExecuteSql("Select " + FieldName + " From " + TableName + "");

            for (int j = 0; dt.Columns.Count > j; j++)      //循环读取数据表字段名
            {
                dbClass.Replace(OldTxt, NewTxt, TableName, FieldName);
            }
            PageRight("替换" + TableName + "表 " + FieldName + " 成功!", "database.aspx?DivNum=4");
        }
    }
}