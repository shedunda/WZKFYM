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

namespace YSCMS.PageView.User.Constr
{
    public partial class ConstrListPass_DC : YSCMS.PageBasic.UserPage
    {
        YSCMS.CMS.Constr con = new YSCMS.CMS.Constr();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "no-cache";
            if (!IsPostBack)
            {
                string ConID = YSCMS.Common.Input.Filter(Request.QueryString["ConID"].ToString());
                DataTable da = con.Sel8(ConID);
                int cut = da.Rows.Count;
                if (cut == 0)
                {
                    PageError("对不起数据错误", "ConstrList.aspx");
                }
                this.Title.Text = da.Rows[0]["Title"].ToString();
                this.creatTime.Text = da.Rows[0]["creatTime"].ToString();
                this.passcontent.Text = da.Rows[0]["passcontent"].ToString();
                this.Class.Text = con.Sel9(da.Rows[0]["ClassID"].ToString());
            }
        }
    }
}