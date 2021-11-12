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
    public partial class DiscussPhoto_Del : YSCMS.PageBasic.UserPage
    {
        YSCMS.CMS.Discuss dis = new YSCMS.CMS.Discuss();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "no-cache";
            if (!Page.IsPostBack)
            {
                string PhotoID = YSCMS.Common.Input.Filter(Request.QueryString["PhotoID"].ToString());
                string DisID = YSCMS.Common.Input.Filter(Request.QueryString["DisID"].ToString());
                if (dis.sel_62(PhotoID) == YSCMS.Global.Current.UserNum)
                {
                    if (dis.Delete_16(PhotoID) == 0)
                    {
                        PageError("删除失败!", "discussPhotoalbumlist.aspx?DisID=" + DisID + "");
                    }
                    else
                    {
                        PageRight("删除成功!", "discussPhotoalbumlist.aspx?DisID=" + DisID + "");
                    }
                }
                else
                {
                    PageError("删除失败!这个图片不是你的你无权删除", "");
                }
            }
        }

    }
}