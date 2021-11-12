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

namespace YSCMS.PageView.User.Discuss
{
    public partial class DiscussTopi_Del : YSCMS.PageBasic.UserPage
    {
        YSCMS.CMS.Discuss dis = new YSCMS.CMS.Discuss();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "no-cache";
            if (!IsPostBack)
            {
                string ID = YSCMS.Common.Input.Filter(Request.QueryString["DtID"].ToString());
                int vote = dis.sel_59(ID);
                if (vote == 0)
                {
                    if (dis.Delete_13(ID) == 0 || dis.Delete_14(ID) == 0)
                    {
                        PageError("主题删除成功", "");
                    }
                    else
                    {
                        PageRight("主题删除失败", "");
                    }
                }
                else
                {
                    if (dis.Delete_13(ID) == 0 || dis.Delete_14(ID) == 0 || dis.Delete_15(ID) == 0)
                    {
                        PageError("投票删除成功", "");
                    }
                    else
                    {
                        PageRight("投票删除失败", "");
                    }
                }
            }
        }    

    }
}