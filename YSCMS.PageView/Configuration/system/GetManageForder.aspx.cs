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

namespace YSCMS.PageView.Configuration.system
{
    public partial class GetManageForder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string dirName = YSCMS.Config.UIConfig.dirMana;
            if (string.IsNullOrEmpty(dirName))
            {
                dirName = "manage";
            }
            dirName.Trim();
            Response.Clear();
            Response.ContentType = "text/xml";
            Response.Write(dirName);
            Response.End();
        }
    }
}