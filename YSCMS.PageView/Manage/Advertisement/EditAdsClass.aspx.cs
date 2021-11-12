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

namespace YSCMS.PageView.Manage.Advertisement
{
    public partial class EditAdsClass : YSCMS.PageBasic.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "no-cache";                        //设置页面无缓存
            if (!IsPostBack)
            {
                getAdsClassInfo();
            }
        }

        /// <summary>
        /// 修改分类信息
        /// </summary>
        /// <returns>修改分类信息</returns>
        /// Code By DengXi

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                YSCMS.Model.AdsClassInfo aci = new YSCMS.Model.AdsClassInfo();
                aci.AcID =YSCMS.Common.Input.Filter(Request.Form["adsclassid"]);
                aci.Cname =YSCMS.Common.Input.Filter(Request.Form["AdsClassName"]);
                aci.ParentID = "";
                if (Request.Form["AdsPrice"].ToString() != null && Request.Form["AdsPrice"].ToString() != "")
                    aci.Adprice = int.Parse(Request.Form["AdsPrice"].ToString());
                else
                    aci.Adprice = 0;
                aci.creatTime = DateTime.Now;
                aci.SiteID = SiteID;

                YSCMS.CMS.Ads ac = new YSCMS.CMS.Ads();
                int result = ac.EditClass(aci);

                if (result == 1)
                   YSCMS.Common.MessageBox.ShowAndRedirect(this, "修改分类信息成功!", "AdList.aspx");
                else
                   YSCMS.Common.MessageBox.Show(this, "修改分类信息失败");
            }
        }

        /// <summary>
        /// 在前台显示分类信息
        /// </summary>
        /// <returns>在前台显示分类信息</returns>
        /// Code By DengXi

        protected void getAdsClassInfo()
        {
            string classid =YSCMS.Common.Input.Filter(Request.QueryString["AdsClassID"]);

            YSCMS.CMS.Ads ac = new YSCMS.CMS.Ads();
            DataTable dt = ac.getAdsClassInfo(classid);

            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    string price = dt.Rows[0][2].ToString();
                    AdsClassName.Text = dt.Rows[0][0].ToString();
                    AdsParentID.Text = dt.Rows[0][1].ToString();
                    AdsPrice.Text = price;
                    adsclassid.Value = classid;
                }
                else
                {
                   YSCMS.Common.MessageBox.Show(this, "参数传递错误!");
                }
                dt.Clear();
                dt.Dispose();
            }
            else
            {
               YSCMS.Common.MessageBox.Show(this, "参数传递错误!");
            }
        }
    }
}