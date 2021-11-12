
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YSCMS.PageView.Manage.User
{
    public partial class Message : YSCMS.PageBasic.ManagePage
    {
        public Message()
        {
            Authority_Code = "U033";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                YSCMS.CMS.Message rd = new YSCMS.CMS.Message();
                int delNum = rd.clearmessage();
                if (this.CheckBox22.Checked)
                {
                    rd.clearmessagerecyle();
                }
                PageRight("消息清除成功。共删除了" + delNum + "条信息!", "");
            }
        }
    }
}
