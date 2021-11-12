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

namespace YSCMS.PageView.User.Friend
{
    public partial class Friend_Establishment : YSCMS.PageBasic.UserPage
    {
        YSCMS.CMS.Friend fri = new YSCMS.CMS.Friend();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string UserNum = YSCMS.Global.Current.UserNum;
                int fE = 0;
                if (fri.sel_6(UserNum) != null && fri.sel_6(UserNum) != "")
                {
                    fE = int.Parse(fri.sel_6(UserNum));
                    switch (fE)
                    {
                        case 0:
                            this.RadioButtonList1.Items[2].Selected = true;
                            break;
                        case 1:
                            this.RadioButtonList1.Items[1].Selected = true;
                            break;
                        case 2:
                            this.RadioButtonList1.Items[0].Selected = true;
                            break;
                    }
                }
            }
        }

        protected void addfriend_Click(object sender, EventArgs e)
        {
            string UserNum = YSCMS.Global.Current.UserNum;
            int FE = int.Parse(this.RadioButtonList1.SelectedValue);
            if (fri.Update(FE, UserNum) == 0)
            {
                PageError("设置失败", "friendList.aspx");
            }
            else
            {
                PageRight("设置成功", "friendList.aspx");
            }
        }
    }
}
