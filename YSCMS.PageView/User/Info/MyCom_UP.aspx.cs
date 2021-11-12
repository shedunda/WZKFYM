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
    public partial class MyCom_UP : YSCMS.PageBasic.UserPage
    {
        YSCMS.CMS.Info inf = new YSCMS.CMS.Info();
        YSCMS.CMS.sys sd = new YSCMS.CMS.sys();
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
            if (Page.IsValid)//判断是否通过验证
            {
                string Title = YSCMS.Common.Input.Filter(Request.Form["TitleBox"]);
                string Contents = YSCMS.Common.Input.Filter(Request.Form["ContentBox"]);
                if (Contents.Length > 200)
                {
                    PageError("评论内容最多200个字符。", "mycom.aspx");
                }
                DateTime CreatTime = DateTime.Now;
                string Commid = YSCMS.Common.Input.Filter(Request.QueryString["Commid"]);
                int islocks = 0;
                DataTable isl = sd.UserPram();
                if (isl != null && isl.Rows.Count > 0)
                {
                    if (YSCMS.Common.Input.IsInteger(isl.Rows[0]["CommCheck"].ToString()))
                    {
                        islocks = int.Parse(isl.Rows[0]["CommCheck"].ToString());
                    }
                    isl.Clear(); isl.Dispose();
                }
                if (islocks != 1)
                {
                    islocks = 2;
                }

                if (inf.Update6(Title, Contents, CreatTime, Commid, islocks) == 0)
                {
                    PageError("修改错误", "mycom.aspx");
                }
                else
                {
                    PageRight("修改成功,可能需要重新审核！", "mycom.aspx");
                }
            }
        }
    }
}