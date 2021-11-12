using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using YSCMS.CMS.Collect;

namespace YSCMS.PageView.Manage.Collect
{
    public partial class Store : YSCMS.PageBasic.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["id"] == null || Request.QueryString["id"].Trim().Equals(""))
                {
                    YSCMS.Common.MessageBox.Show(this, "参数无效!");
                }
                YSCMS.CMS.Collect.Collect cl = new YSCMS.CMS.Collect.Collect();
                cl.StorageNews(Request.QueryString["id"].Trim());
                Response.End();
            }
        }
    }
}