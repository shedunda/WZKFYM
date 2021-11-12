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
    public partial class Url_Class : YSCMS.PageBasic.UserPage
    {
        YSCMS.CMS.UserMisc rd = new YSCMS.CMS.UserMisc();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Response.Expires = 0;
                Response.CacheControl = "no-cache";
                string ID = Request.QueryString["id"];
                if (ID != null && ID != string.Empty)
                {
                    DataTable dt = rd.getClassInfo(int.Parse(ID.ToString()));
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        this.ClassName.Text = dt.Rows[0]["ClassName"].ToString();
                    }
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string ClassName = this.ClassName.Text;
                string ID = Request.QueryString["id"];
                if (ClassName == string.Empty)
                {
                    PageError("带*必须填写", "");
                }
                else
                {
                    if (ID != null && ID != string.Empty)
                    {
                        rd.updateClass(ClassName, 1, int.Parse(ID));
                    }
                    else
                    {
                        rd.updateClass(ClassName, 0, 0);
                    }
                }
                PageRight("操作成功", "URL.aspx");
            }
        }
    }
}