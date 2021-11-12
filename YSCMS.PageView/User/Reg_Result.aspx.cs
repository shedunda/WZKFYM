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
using YSCMS.Common;
using YSCMS.CMS;

namespace YSCMS.PageView.User
{
    public partial class Reg_Result : YSCMS.PageBasic.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            YSCMS.CMS.RootPublic rd = new YSCMS.CMS.RootPublic();
            this.username.Text = rd.GetUserName(YSCMS.Global.Current.UserNum);
        }
    }
}