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

namespace YSCMS.PageView.User.Photo
{
    public partial class PhotoClass_Add : YSCMS.PageBasic.UserPage
    {
        YSCMS.CMS.Photo pho = new YSCMS.CMS.Photo();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "no-cache";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int isDisclass = 0;
            string DisID = "";
            DateTime Creatime = DateTime.Now;
            string ClassID = YSCMS.Common.Rand.Number(12);
            string ClassName = YSCMS.Common.Input.Htmls(Request.Form["ClassName"].ToString());
            string UserNum = YSCMS.Global.Current.UserNum;

            if (Page.IsValid)
            {
                if (pho.Add_2(ClassName, ClassID, Creatime, UserNum, isDisclass, DisID) != 0)
                {
                    PageRight("添加分类成功", "photoclass.aspx");
                }
                else
                {
                    PageError("添加失败", "photoclass.aspx");
                }
            }
        }
    }
}



