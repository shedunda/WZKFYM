﻿using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Drawing;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using YSCMS.Model;

namespace YSCMS.PageView.Manage.JsModel
{
    public partial class Js_Publish : YSCMS.PageBasic.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ids = Request.QueryString["ids"];
            if (string.IsNullOrEmpty(ids))
            {
                Response.Write("没有任何要更新的js");
                Response.End();
            }
            int sucNum = 0;
            int errNum = 0;
            string[] ida = ids.Split(',');
            for (int i = 0; i < ida.Length; i++)
            {
                try
                {
                    int tid = Convert.ToInt32(ida[i]);
                    YSCMS.Publish.UltiPublish.PublishSingleJsFile(tid);
                    sucNum++;
                }
                catch
                {
                    errNum++;
                }
            }
            Response.Write(String.Format("成功更新{0}条，失败{1}条", sucNum, errNum));
            Response.End();
        }
    }
}