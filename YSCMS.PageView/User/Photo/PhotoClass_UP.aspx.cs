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

namespace YSCMS.PageView.User.Photo
{
    public partial class PhotoClass_UP : YSCMS.PageBasic.UserPage
    {
        YSCMS.CMS.Photo pho = new YSCMS.CMS.Photo();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "no-cache";
            if (!IsPostBack)
            {
                string ClassID = YSCMS.Common.Input.Filter(Request.QueryString["ClassID"].ToString());
                this.ClassName.Text = pho.sel_17(ClassID);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime Creatime = DateTime.Now;
            string ClassName = YSCMS.Common.Input.Filter(Request.Form["ClassName"].ToString());
            string ClassIDs = YSCMS.Common.Input.Filter(Request.QueryString["ClassID"].ToString());
            if (pho.Update_3(ClassName, Creatime, ClassIDs) != 0)
            {
                PageRight("修改分类成功", "photoclass.aspx");
            }
            else
            {
                PageError("修改失败", "photoclass.aspx");
            }
        }
    }
}


