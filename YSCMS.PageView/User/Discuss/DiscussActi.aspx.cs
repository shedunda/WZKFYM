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
    public partial class DiscussActi : YSCMS.PageBasic.UserPage
    {
        YSCMS.CMS.Discuss dis = new YSCMS.CMS.Discuss();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "no-cache";
        }
        protected void inBox_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)//判断是否通过验证
            {
                string UserNum = YSCMS.Global.Current.UserNum;
                string Activesubject = Request.Form["ActivesubjectBox"].ToString();
                string ActivePlace = Request.Form["ActivePlaceBox"].ToString();
                int Anum = int.Parse(Request.Form["AnumBox"].ToString());
                string ActivePlan = Request.Form["ActivePlanBox"].ToString();
                string Contactmethod = Request.Form["ContactmethodBox"].ToString();
                DateTime Cutofftime = DateTime.Parse(Request.Form["CutofftimeBox"].ToString());
                int ALabel = this.ALabelList.SelectedIndex;
                string ActiveExpense = Request.Form["ActiveExpenseBox"].ToString();
                DateTime CreaTime = DateTime.Now;//获取当前系统时间
                string AId = YSCMS.Common.Rand.Number(12);//产生12位随机字符
                DataTable dt1 = dis.sel(UserNum);
                string UserName1 = dt1.Rows[0]["UserName"].ToString();
                string siteID = dt1.Rows[0]["SiteID"].ToString();
                YSCMS.Model.STDiscussActive DA = new YSCMS.Model.STDiscussActive();
                DA.ActiveExpense = ActiveExpense;
                DA.ActivePlace = ActivePlace;
                DA.ActivePlan = ActivePlan;
                DA.Activesubject = Activesubject;
                DA.AId = AId;
                DA.ALabel = ALabel;
                DA.Anum = Anum;
                DA.Contactmethod = Contactmethod;
                DA.CreaTime = CreaTime;
                DA.Cutofftime = Cutofftime;
                DA.siteID = siteID;
                DA.UserName = UserName1;
                if (dis.sel_1() != AId)
                {
                    if (dis.Add(DA) != 0)
                    {
                        PageRight("创建成功", "discussacti_list.aspx");
                    }
                    else
                    {
                        PageError("创建失败", "discussacti_list.aspx");
                    }
                }
                else
                {
                    PageError("创建失败可能编号重复", "discussacti_list.aspx");
                }
            }
        }

    }
}