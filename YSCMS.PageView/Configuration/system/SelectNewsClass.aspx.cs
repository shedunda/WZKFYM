using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YSCMS.CMS;

namespace YSCMS.PageView.Configuration.system
{
    public partial class SelectNewsClass : YSCMS.PageBasic.DialogPage
    {
        public SelectNewsClass()
        {
            BrowserAuthor = EnumDialogAuthority.ForPerson;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
            }
        }
    }
}