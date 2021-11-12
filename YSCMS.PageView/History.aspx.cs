﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YSCMS.Common;

namespace YSCMS.PageView
{
    public partial class History : System.Web.UI.Page
    {
        /// <summary>
        /// 归档新闻转向页面
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            string historyId = Request["id"];
            if (string.IsNullOrEmpty(historyId))
            {
                string year = Request.QueryString["year"];
                string month = Request.QueryString["month"];
                string day = Request.QueryString["day"];
                DateTime startDate;
                string Strday = year + "-" + month + "-" + day;
                if (DateTime.TryParse(Strday, out startDate))
                {
                    YSCMS.CMS.Info inf = new YSCMS.CMS.Info();
                    int histornum = inf.historyCount(Strday);
                    if (histornum <= 0)
                    {
                        Response.Write("<script type=\"text/javascript\">alert(\"今天没有归档新闻！\");</script>");
                        Response.Write("<script type=\"text/javascript\">location.replace(\"/\");</script>");
                        Response.End();
                    }
                    string urls = "";
                    string content = "{@year04}-{@month}/{@day}";
                    content = content.Replace("{@year04}", year);
                    content = content.Replace("{@year02}", year.Substring(2, 2));
                    content = content.Replace("{@month}", month);
                    content = content.Replace("{@day}", day);
                    string serverPort = Request.ServerVariables["Server_Port"].ToString();
                    string sitedomain = YSCMS.Common.Public.GetSiteDomain();
                    //判断端口重置sitedomain
                    if (sitedomain.IndexOf(":") == -1)
                    {
                        if (serverPort != "80")
                        {
                            sitedomain = sitedomain + ":" + serverPort;
                        }
                    }
                    urls = sitedomain + "/" + YSCMS.Config.UIConfig.dirPige + "/" + content + "/index.html";
                    Response.Redirect(urls);
                }
                else
                {
                    Response.Write("<script type=\"text/javascript\">alert(\"参数错误！\");</script>");
                    Response.Write("<script type=\"text/javascript\">location.replace(\"/\");</script>");
                    Response.End();
                }
            }
            else
            {
                string pageContent = YSCMS.Publish.General.GetHistoryContent(historyId);
                Response.Write(pageContent);
                Response.End();
            }
        }
    }
}
