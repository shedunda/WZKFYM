using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace YSCMS.PageView.Manage.Label
{
    public partial class StyleClassAdd : YSCMS.PageBasic.ManagePage
    {
        public StyleClassAdd()
        {
            Authority_Code = "T019";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "no-cache";
            if (!IsPostBack)
            {
                if (Request.QueryString["ClassID"] != null)
                {
                    getClassInfo();
                }

            }
        }
        protected void getClassInfo()
        {
            string str_ClassID = YSCMS.Common.Input.checkID(Request.QueryString["ClassID"]);
            ClassID.Value = str_ClassID;
            string str_ClassName = "";

            YSCMS.CMS.Style.Style stClass = new YSCMS.CMS.Style.Style();
            DataTable dt = stClass.GetstyleClassInfo(str_ClassID);

            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                    str_ClassName = dt.Rows[0][0].ToString();
                else
                    PageError("参数错误!", "");
                dt.Clear();
                dt.Dispose();
            }
            styleClassName.Text = str_ClassName;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int result = 0;
                YSCMS.Model.StyleClassInfo stClass = new YSCMS.Model.StyleClassInfo();
                stClass.Sname = styleClassName.Text;
                stClass.CreatTime = DateTime.Now;
                stClass.isRecyle = 0;
                YSCMS.CMS.Style.Style stcClass = new YSCMS.CMS.Style.Style();
                if (ClassID.Value != "")
                {
                    stClass.ClassID = ClassID.Value;
                    try
                    {
                        result = stcClass.StyleClassEdit(stClass);
                    }
                    catch (Exception ex)
                    {

                        PageError(ex.Message, "styleclassadd.aspx");
                    }
                }
                else
                {
                    try
                    {
                        result = stcClass.SytleClassAdd(stClass);
                    }
                    catch (Exception ex)
                    {

                        PageError(ex.Message, "styleclassadd.aspx");
                    }
                }

                if (result == 1)
                    PageRight("添加分类成功!", "style.aspx");
                else
                    PageError("添加分类失败!", "");
            }
        }
    }
}