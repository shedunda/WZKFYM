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
using YSCMS.Common;

namespace YSCMS.PageView.User.Info
{
    public partial class UserInfo_Safe : YSCMS.PageBasic.UserPage
    {
        YSCMS.CMS.UserMisc rd = new YSCMS.CMS.UserMisc();
        YSCMS.CMS.RootPublic pd = new YSCMS.CMS.RootPublic();

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Expires = 0;
            Response.CacheControl = "no-cache";
            if (!IsPostBack)
            {

                copyright.InnerHtml = CopyRight;
                DataTable dt = rd.getPassWord(pd.GetUserNameByUId(YSCMS.Global.Current.UserNum));
                if (dt != null)
                {
                    if (dt.Rows.Count > 0)
                    {
                        PassQuestion.Text = dt.Rows[0]["PassQuestion"].ToString();
                        //PassKey.Text = dt.Rows[0]["PassKey"].ToString();
                    }
                }
            }
        }

        protected void submitSave(object sender, EventArgs e)
        {
            if (Page.IsValid == true)                       //判断是否验证成功
            {
                string PassQuestion = this.PassQuestion.Text;
                string newpassword = this.newpassword.Text; ;
                string PassKey = this.PassKey.Text;
                string password = this.password.Text;
                string oldPassword = this.oldPassword.Text;

                if ((PassQuestion != null && PassQuestion != "") && (PassKey != null && PassKey != "") && (password != null && password != ""))
                {
                    if (rd.getPasswordTF(oldPassword.ToString()) == 0)
                    {

                        if (password.ToString() != newpassword.ToString())
                        {
                            PageError("二次密码不一致", "userinfo_safe.aspx");
                        }
                        else
                        {

                            //同步更新用户信息
                            YSCMS.PlugIn.Passport.DPO_Request request = new YSCMS.PlugIn.Passport.DPO_Request(Context);
                            request.PassWord = newpassword;
                            request.UserName = YSCMS.Global.Current.UserName;
                            request.ProcessMultiPing("update");

                            if (request.FoundErr)
                            {
                                PageError("同步更新用户信息失败", "userinfo_safe.aspx");
                            }


                            rd.UpdateUserSafe(pd.GetUserNameByUId(YSCMS.Global.Current.UserNum), PassQuestion, PassKey, newpassword);
                            PageRight("安全资料成功！", "userinfo_safe.aspx");
                        }
                    }
                    else
                    {
                        PageError("原始密码不正确", "");
                    }
                }
                else
                {
                    PageError("所有项目必须填写", "");
                }
            }
        }
    }
}