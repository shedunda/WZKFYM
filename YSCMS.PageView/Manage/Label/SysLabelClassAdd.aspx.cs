using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace YSCMS.PageView.Manage.Label
{
    public partial class SysLabelClassAdd : YSCMS.PageBasic.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "no-cache";
            if (!IsPostBack)
            {
                if (Request.QueryString["ClassID"] != null && Request.QueryString["ClassID"].ToString() != "")
                {
                    this.Authority_Code = "T012";
                    this.CheckAdminAuthority();
                    GetLabelClassInfo();
                }
                else
                {
                    this.Authority_Code = "T016";
                    this.CheckAdminAuthority();
                }
            }
        }
        /// <summary>
        /// 获得分类信息
        /// </summary>
        /// <returns>在前台显示分类信息</returns>
        protected void GetLabelClassInfo()
        {
            string str_ClassID = YSCMS.Common.Input.checkID(Request.QueryString["ClassID"]);
            LabelClassID.Value = str_ClassID;
            string str_ClassName = "";
            string str_ClassContent = "";

            YSCMS.CMS.Label lbcc = new YSCMS.CMS.Label();
            DataTable dt = lbcc.GetLabelClassInfo(str_ClassID);
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    str_ClassName = dt.Rows[0][0].ToString();
                    str_ClassContent = dt.Rows[0][1].ToString();
                }
                else
                    PageError("参数错误!", "");
                dt.Clear();
                dt.Dispose();
            }
            LabelClassName.Text = str_ClassName;
            ClassContent.Value = str_ClassContent;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string str_Cname = LabelClassName.Text;
                string str_Content = ClassContent.Value;
                YSCMS.Model.LabelClassInfo lbcc = new YSCMS.Model.LabelClassInfo();
                lbcc.ClassName = str_Cname;
                lbcc.Content = str_Content;
                lbcc.CreatTime = DateTime.Now;
                lbcc.SiteID = SiteID;
                lbcc.isRecyle = 0;
                int result = 0;
                YSCMS.CMS.Label lbc = new YSCMS.CMS.Label();
                if (Request.QueryString["ClassID"] != null && Request.QueryString["ClassID"].ToString() != "")
                {
                    lbcc.ClassID = Request.QueryString["ClassID"].ToString();
                    result = lbc.LabelClassEdit(lbcc);
                    if (result == 1)
                        PageRight("修改分类成功!", "SysLabelList.aspx");
                    else
                        PageError("修改分类失败!", "");
                }
                else
                {
                    result = lbc.LabelClassAdd(lbcc);
                    if (result == 1)
                        PageRight("添加分类成功!", "syslabelList.aspx");
                    else if (result == -2)
                        YSCMS.Common.MessageBox.Show(this, "分类名称重复，请重新填写!");
                    else
                        PageError("添加分类失败!", "");

                }

            }
        }
    }
}