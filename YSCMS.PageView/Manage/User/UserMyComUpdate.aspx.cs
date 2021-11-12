using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YSCMS.CMS;
using System.Data;

namespace YSCMS.PageView.Manage.User
{
    public partial class UserMyComUpdate : YSCMS.PageBasic.ManagePage
    {
        public UserMyComUpdate()
        {
            Authority_Code = "U035";
        }
        Mycom myc = new Mycom();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Response.CacheControl = "no-cache";
                string Commid = YSCMS.Common.Input.Filter(Request.QueryString["Commid"]);
                DataTable dt = myc.sel(Commid);
                this.ContentBox.Text = dt.Rows[0]["Content"].ToString();
            }
        }
        protected void shortCutsubmit(object sender, EventArgs e)
        {
            if (Page.IsValid)//判断是否通过验证
            {
                string Title = string.Empty;//Request.Form["TitleBox"];
                string Contents = YSCMS.Common.Input.Filter(Request.Form["ContentBox"]);
                if (Contents.Length > 200)
                {
                    PageError("内容最多200个字符", "javascript:history()");
                }
                DateTime CreatTime = DateTime.Now;
                string Commid = YSCMS.Common.Input.Filter(Request.QueryString["Commid"]);
                if (myc.Update(Title, Contents, CreatTime, Commid) == 0)
                {
                    PageError("修改错误", "usermycom.aspx");
                }
                else
                {
                    PageRight("修改成功", "usermycom.aspx");
                }
            }
        }
    }
}