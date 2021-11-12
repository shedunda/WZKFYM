using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YSCMS.Model;
using YSCMS.PageBasic;

namespace YSCMS.PageView.Manage
{
    public partial class Login : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Logout();
                string[] _protPass = YSCMS.Config.UIConfig.protPass.Split(',');
                if (_protPass[0] == "1")
                {
                    safeCodeVerify_1.Visible = true;
                }
                else
                {
                    safeCodeVerify_1.Visible = false;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string Account = this.txtUserName.Text;
            string PassWord = this.txtPassword.Text;
            string VerifyCode = this.txtVerify.Text.Trim();
            string SafeCode = this.txtSafeCode.Text;
            if (Session["CheckCode"] == null)
            {
                lblinfo.InnerText = "验证码过期，请返回重新登录";
                return;
            }
            string CheckCode = Session["CheckCode"].ToString().ToUpper();
            Session.Remove("CheckCode");
            if (VerifyCode.ToUpper() != CheckCode)
            {
                lblinfo.InnerText = "输入验证码错误!";
                return;
            }
            #region 安全码验证
            string[] protPass = YSCMS.Config.UIConfig.protPass.Split(',');
            if (protPass[0] == "1")
            {
                if (protPass[1] == "1")
                {
                    if (protPass[2] == "0")
                    {
                        if ((VerifyCode + YSCMS.Config.UIConfig.protRand) != SafeCode)
                        {
                            lblinfo.InnerText = "输入的安全码错误!";
                            return;
                        }
                    }
                    else
                    {
                        if ((YSCMS.Config.UIConfig.protRand + VerifyCode) != SafeCode)
                        {
                            lblinfo.InnerText = "输入的安全码错误!";
                            return;
                        }
                    }
                }
                else
                {
                    if (YSCMS.Config.UIConfig.protRand != SafeCode)
                    {
                        lblinfo.InnerText = "输入的安全码错误!";
                        return;
                    }
                }
            }
            #endregion 安全码验证

            GlobalUserInfo info;
            EnumLoginState state = Login(Account, PassWord, out info, true);
            if (state == EnumLoginState.Succeed)
            {
                YSCMS.Global.Current.Set(info);
                Session["islogin"] = "1";
                Response.Write("<script language=\"javascript\">window.top.location.href=\"Index.aspx\";</script>");
                Response.End();
            }
            else
            {
                LoginResultShow(state);
            }
        }
        /// <summary>
        /// 退出
        /// </summary>
        protected virtual void Logout()
        {
            //Context.Session.Remove("SITEINFO");
            //得到用户数据
            HttpCookie cook = HttpContext.Current.Request.Cookies["SITEINFO"];
            if (cook != null)
            {
                //设置用户的cookie为过期
                cook.Expires = DateTime.Now.AddDays(-1);
                cook.Value = null;
                Response.Cookies.Add(cook);
            }
        }
    }
}