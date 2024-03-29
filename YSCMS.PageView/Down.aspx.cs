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

namespace YSCMS.PageView
{
    public partial class Down : YSCMS.PageBasic.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                getDownInfo();
        }

        /// <summary>
        /// 获取新闻附件下载信息
        /// </summary>
        protected void getDownInfo()
        {
            string id = YSCMS.Common.Input.Filter(Request.QueryString["id"]);
            if (id != null && id != "")
            {
                YSCMS.CMS.News news = new YSCMS.CMS.News();
                string DownAdress = news.GetNewsAccessory(int.Parse(id));
                DownAdress = DownAdress.ToLower().Replace("{@dirfile}", YSCMS.Config.UIConfig.dirFile);
                DownAdress = DownAdress.ToLower().Replace("{@dirtemplet}", YSCMS.Config.UIConfig.dirTemplet);
                DownAdress = DownAdress.ToLower().Replace("{@dirdumm}", YSCMS.Config.UIConfig.dirDumm);
                DownAdress = DownAdress.ToLower().Replace("{@dirfile}", YSCMS.Config.UIConfig.dirFile);
                DownAdress = DownAdress.ToLower().Replace("{@dirhtml}", YSCMS.Config.UIConfig.dirHtml);
                DownAdress = DownAdress.ToLower().Replace("{@dirsite}", YSCMS.Config.UIConfig.dirSite);
                DownAdress = DownAdress.ToLower().Replace("{@diruser}", YSCMS.Config.UIConfig.dirUser);
                Response.Write("<script langauge=\"javascript\">self.location='" + DownAdress + "';</script>");
                Response.End();
            }
            else
            {
                Err();
            }
        }

        protected void Err()
        {
            Response.Write("<script language=\"javascript\">alert('参数传递错误!');history.back();</script>");
            Response.End();
        }
    }
}

