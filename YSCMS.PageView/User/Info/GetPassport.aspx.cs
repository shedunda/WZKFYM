using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YSCMS.PageView.User.Info
{
    public partial class GetPassport : YSCMS.PageBasic.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string emailCode = Request["c"];
            string vType = Request["t"];
            string userNumber = Request["u"];
            string email = Request["e"];
            if (vType == "mail")
            {
                YSCMS.CMS.user userBll = new YSCMS.CMS.user();
                if (userBll.EmailActive(emailCode, userNumber, email))
                {
                    PageRight("你的帐号激活成功！", "../Login.aspx");
                }
                else
                {
                    PageError("激活失败！请联系管理员。", "");
                }
            }
        }
    }
}