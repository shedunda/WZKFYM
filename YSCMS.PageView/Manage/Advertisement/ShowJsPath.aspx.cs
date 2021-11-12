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

namespace YSCMS.PageView.Manage.Advertisement
{
    public partial class ShowJsPath : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string adsID = Request.QueryString["adsID"];
            string str_JsCode = "<script language=\"javascript\" src=\"" + YSCMS.Common.Public.GetSiteDomain() + "/jsfiles/ads/show.aspx?adsID=" + adsID + "\"></script>";
            CodePath.Value = str_JsCode;
        }
    }
}