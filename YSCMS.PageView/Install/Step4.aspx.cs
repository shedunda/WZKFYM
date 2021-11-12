using YSCMS.Common;
using YSCMS.CMS;
using YSCMS.Model;
using YSCMS.PageBasic;
using System;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace YSCMS.PageView.Install
{
    public partial class Step4 : BasePage
    {
        private Admin cadmin = new Admin();
        protected HtmlForm form1;
        public string gError = string.Empty;
        protected HtmlGenericControl getLoading;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.btnCreate.Attributes.Add("onclick", "return showLoading();");
            this.gError = base.Request.QueryString["error"];
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string text = this.UserName.Text;
            string input = this.Password.Text;
            string str3 = this.confimPassword.Text;
            if (text.Length < 1)
            {
                base.Response.Redirect("step4.aspx?error=\"请输入管理员用户名\"");
            }
            if (input.Length < 3)
            {
                base.Response.Redirect("step4.aspx?error=\"密码不能小于3位\"");
            }
            if (input != str3)
            {
                base.Response.Redirect("step4.aspx?error=\"2次密码不一致！\"");
            }
            AdminInfo aci = new AdminInfo
            {
                UserName = text,
                UserPassword = Input.MD5(input, true),
                RealName = "admin",
                isAdmin = 1,
                Email = "",
                UserFace = "/sysImages/user/noHeadpic.gif",
                userFacesize = "50|50",
                RegTime = DateTime.Now,
                SiteID = "0",
                LoginNumber = 0,
                OnlineTF = 0,
                OnlineTime = 0,
                isLock = 0,
                aPoint = 0,
                ePoint = 0,
                cPoint = 0,
                gPoint = 0,
                iPoint = 0,
                UserGroupNumber = "00000000001",
                adminGroupNumber = "00000001",
                isSuper = 1,
                OnlyLogin = 1,
                isChannel = 1,
                isChSupper = 0,
                Iplimited = ""
            };
            if (this.cadmin.Add(aci) > 0)
            {
                base.Response.Redirect("step_End.aspx?error=false");
            }
            else
            {
                base.Response.Redirect("step4.aspx?error=\"安装失败，可能已经有管理员存在！\"");
            }
        }
    }
}