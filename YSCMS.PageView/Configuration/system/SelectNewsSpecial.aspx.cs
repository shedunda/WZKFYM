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
    public partial class SelectNewsSpecial : YSCMS.PageBasic.DialogPage
    {
        public SelectNewsSpecial()
        {
            BrowserAuthor = EnumDialogAuthority.ForAdmin;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Response.CacheControl = "no-cache";
                Response.Expires = 0;

            }
        }
    }
}