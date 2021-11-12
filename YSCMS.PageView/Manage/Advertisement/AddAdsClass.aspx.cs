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
    public partial class AddAdsClass : YSCMS.PageBasic.ManagePage
    {
        public AddAdsClass()
        {
            Authority_Code = "S007";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "no-cache";                        //设置页面无缓存
            if (!IsPostBack)
            {
                //获取版权信息
                GetParentValue();
            }
        }

        /// <summary>
        /// 添加分类信息
        /// </summary>
        /// <returns>添加分类信息</returns>
        /// Code By DengXi

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                YSCMS.Model.AdsClassInfo aci = new YSCMS.Model.AdsClassInfo();
                aci.AcID = "";
                aci.Cname = YSCMS.Common.Input.Filter(AdsClassName.Text.ToString());
                aci.ParentID = YSCMS.Common.Input.Filter(AdsParentID.Text.ToString());
                if (AdsPrice.Text.ToString() != null && AdsPrice.Text.ToString() != "")
                    aci.Adprice = int.Parse(AdsPrice.Text.ToString());
                else
                    aci.Adprice = 0;
                aci.creatTime = DateTime.Now;
                aci.SiteID = SiteID;

                int result = 0;
                YSCMS.CMS.Ads ac = new YSCMS.CMS.Ads();
                result = ac.AddClass(aci);
                if (result == 1)
                    YSCMS.Common.MessageBox.ShowAndRedirect(this, "添加广告分类成功!", "AdList.aspx");
                else
                    YSCMS.Common.MessageBox.Show(this, "添加广告分类成功!");
            }
        }


        /// <summary>
        /// 获取父类ID
        /// </summary>
        /// <returns>返回父类ID</returns>
        /// Code By DengXi

        protected void GetParentValue()
        {
            string str_parentID = Request.QueryString["ParentID"];
            if (str_parentID == "" || str_parentID == null || str_parentID == string.Empty)
                AdsParentID.Text = "0";
            else
                AdsParentID.Text = YSCMS.Common.Input.Filter(str_parentID);
        }
    }
}
