﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using YSCMS.Model;
using YSCMS.PageView.Controls;

namespace YSCMS.PageView.Manage.Sys
{
    public partial class CustomForm_Item : YSCMS.PageBasic.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.PageNavigator1.OnPageChange += new PageChangeHandler(PageNavigator1_PageChage);
            if (!Page.IsPostBack)
            {
                YSCMS.CMS.CustomForm cf = new YSCMS.CMS.CustomForm();
                if (Request.QueryString["Option"] != null && Request.QueryString["ID"] != null
                    && Request.QueryString["Option"] == "DeleteItem")
                {
                    try
                    {
                        int itid = int.Parse(Request.QueryString["ID"]);
                        cf.DeleteFormItem(itid);
                        Response.Write("1%操作成功!");
                    }
                    catch (Exception ex)
                    {
                        Response.Write("0%" + ex.Message);
                    }
                    Response.End();
                }
                if (Request.QueryString["id"] == null || Request.QueryString["id"].Trim() == string.Empty)
                {
                    PageError("参数不完整!", "CustomForm.aspx");
                }
                int id = int.Parse(Request.QueryString["id"]);
                this.HlkCreate.NavigateUrl = "CustomForm_Item_Add.aspx?formid=" + id;
                this.LtrFormName.Text = cf.GetFormName(id);
                DataListBind(1);
            }
        }
        private void PageNavigator1_PageChage(object sender, int PageIndex)
        {
            DataListBind(PageIndex);
        }
        private void DataListBind(int PageIndex)
        {
            SQLConditionInfo si = new SQLConditionInfo("@formid", int.Parse(Request.QueryString["id"]));
            int nRCount, nPCount;
            DataTable tb = YSCMS.CMS.Pagination.GetPage(this.GetType().Name, PageIndex, 20, out nRCount, out nPCount, si);
            this.PageNavigator1.PageCount = nPCount;
            this.PageNavigator1.PageIndex = PageIndex;
            this.PageNavigator1.RecordCount = nRCount;
            this.RptData.DataSource = tb;
            this.RptData.DataBind();
        }
        protected string GetTypeName(object obj)
        {
            if (obj == null || obj == DBNull.Value)
                return "";
            else
            {
                try
                {
                    return CustomFormItemInfo.GetFieldTypeName((EnumCstmFrmItemType)Enum.Parse(typeof(EnumCstmFrmItemType), obj.ToString()));
                }
                catch
                {
                    return "未知";
                }
            }
        }
    }
}