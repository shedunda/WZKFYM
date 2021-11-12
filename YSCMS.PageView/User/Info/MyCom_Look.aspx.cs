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
using YSCMS.CMS;

namespace YSCMS.PageView.User.Info
{
    public partial class MyCom_Look : YSCMS.PageBasic.UserPage
    {
        YSCMS.CMS.Info inf = new YSCMS.CMS.Info();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "no-cache";
            string Commid = YSCMS.Common.Input.Filter(Request.QueryString["Commid"]);
            DataTable dt = inf.sel_19(Commid);
            this.TitleBox.Text = dt.Rows[0]["Title"].ToString();
            this.ContentBox.Text = dt.Rows[0]["Content"].ToString();
        }
        protected void shortCutsubmit(object sender, EventArgs e)
        {
            Response.Redirect("mycom.aspx");
        }
    }
}