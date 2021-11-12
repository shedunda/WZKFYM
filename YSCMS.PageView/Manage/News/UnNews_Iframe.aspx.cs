﻿using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using YSCMS.CMS;
using YSCMS.Common;
using YSCMS.PageView.Controls;

namespace YSCMS.PageView.Manage.News
{
    public partial class UnNews_Iframe : YSCMS.PageBasic.ManagePage
    {
        YSCMS.CMS.News cNews = new YSCMS.CMS.News();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["Option"] != null && !Request.Form["Option"].Trim().Equals("")
                && Request.Form["NewsID"] != null && !Request.Form["NewsID"].Trim().Equals(""))
            {
                string id = Input.Filter(Request.Form["NewsID"].Trim());

                Response.End();
                return;
            }

            this.PageNavigator1.OnPageChange += new PageChangeHandler(PageNavigator1_OnPageChange);

            if (!Page.IsPostBack)
            {
                ListDataBind(1);
            }
        }


        protected void PageNavigator1_OnPageChange(object sender, int PageIndex)
        {
            ListDataBind(PageIndex);
        }

        private void ListDataBind(int PageIndex)
        {
            string DdlClass = this.ClassID.Value;
            if (DdlClass.ToString() == string.Empty || DdlClass == "0")
            {
                DdlClass = "0";
            }
            string sKeywrds = Input.Filter(this.TxtKeywords.Text.Trim());
            string sChoose = this.LblChoose.Text.Trim();
            string TablePrefix = YSCMS.Config.UIConfig.dataRe;
            string DdlKwdType = this.DdlKwdType.SelectedValue;
            int nRCount, nPCount;
            DataTable tb = cNews.GetPageiframe(DdlClass, sKeywrds, sChoose, DdlKwdType, PageIndex, 50, out nRCount, out nPCount);
            this.PageNavigator1.PageCount = nPCount;
            this.PageNavigator1.RecordCount = nRCount;
            this.PageNavigator1.PageIndex = PageIndex;
            this.RptNews.DataSource = tb;
            this.RptNews.DataBind();
        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            ListDataBind(1);
        }
        protected void LnkBtnAll_Click(object sender, EventArgs e)
        {
            if (!this.LblChoose.Text.Trim().Equals(""))
            {
                LinkButton lb = (LinkButton)this.FindControl("LnkBtn" + this.LblChoose.Text);
                if (lb != null)
                    lb.ForeColor = System.Drawing.Color.Empty;
            }
            this.LblChoose.Text = "";
            this.ClassID.Value = "0";
            this.TxtKeywords.Text = "";
            ListDataBind(1);
        }
        protected void LnkBtnContribute_Click(object sender, EventArgs e)
        {
            ChooseState("Contribute");
            ListDataBind(1);
        }
        protected void LnkBtnCommend_Click(object sender, EventArgs e)
        {
            ChooseState("Commend");
            ListDataBind(1);
        }
        protected void LnkBtnTop_Click(object sender, EventArgs e)
        {
            ChooseState("Top");
            ListDataBind(1);
        }
        protected void LnkBtnHot_Click(object sender, EventArgs e)
        {
            ChooseState("Hot");
            ListDataBind(1);
        }
        protected void LnkBtnSplendid_Click(object sender, EventArgs e)
        {
            ChooseState("Splendid");
            ListDataBind(1);
        }
        protected void LnkBtnHeadline_Click(object sender, EventArgs e)
        {
            ChooseState("Headline");
            ListDataBind(1);
        }
        protected void LnkBtnSlide_Click(object sender, EventArgs e)
        {
            ChooseState("Slide");
            ListDataBind(1);
        }
        protected void LnkBtnPic_Click(object sender, EventArgs e)
        {
            ChooseState("Pic");
            ListDataBind(1);
        }
        private void ChooseState(string flag)
        {
            LinkButton bt = (LinkButton)this.FindControl("LnkBtn" + flag);
            if (bt != null)
                bt.ForeColor = System.Drawing.Color.Red;
            if (!this.LblChoose.Text.Trim().Equals(""))
            {
                LinkButton lb = (LinkButton)this.FindControl("LnkBtn" + this.LblChoose.Text);
                if (lb != null)
                    lb.ForeColor = System.Drawing.Color.Empty;
            }
            this.LblChoose.Text = flag;
        }
        protected void DdlNewsTable_SelectedIndexChanged(object sender, EventArgs e)
        {
            LnkBtnAll_Click(sender, e);
        }

        //private void Option_Delete(string sid) {
        //    Response.Clear();
        //    string[] id = sid.Split(',');
        //    int ln = id.Length;
        //    for (int i = 0; i < id.Length; i++) {
        //        if (!id[i].Trim().Equals("")) {
        //            if (nws.del_Table(id[i]) == 0) {
        //                Response.Write("0%操作失败:");
        //            }
        //            System.IO.File.Delete(nws.sel_paths(id[i]));
        //        }
        //    }
        //    Response.Write("成功删除");
        //}

        //private void Option_Recyle(string sid) {
        //    string id = "'" + sid.Replace(",", "','") + "'";
        //    int n = nws.Update2(id);
        //    Response.Clear();
        //    Response.Write(n + "%成功将" + n + "条新闻放入回收站中！");
        //}

        //private void Option_Lock(string sid) {
        //    string id = "'" + sid.Replace(",", "','") + "'";
        //    int n = nws.Update1(id);
        //    Response.Clear();
        //    Response.Write(n + "%成功锁定" + n + "条新闻！");
        //}

        //private void Option_ToOld(string sid) {
        //    Response.Clear();
        //    string id = "'" + sid.Replace(",", "','") + "'";
        //    DataTable tb = nws.sel_old();
        //    if (tb != null) {
        //        string fieldnm = "";
        //        int i = 0;
        //        foreach (DataColumn c in tb.Columns) {
        //            if (c.ColumnName.ToLower().Equals("id") || c.ColumnName.ToLower().Equals("oldtime") || c.ColumnName.ToLower().Equals("datalib"))
        //                continue;
        //            if (i > 0)
        //                fieldnm += ",";
        //            fieldnm += c.ColumnName;
        //            i++;
        //        }
        //        DateTime oldtime = DateTime.Now;
        //        if (nws.Add_fieldnm(fieldnm, id, oldtime) != 0 && nws.Del_fieldnm(id) != 0)
        //            Response.Write("1%操作成功!");
        //        else
        //            Response.Write("0%");
        //    }
        //    else {
        //        Response.Write("0%");
        //    }
        //}
        protected string replacechar(object oldchar)
        {
            string newchar = oldchar.ToString().Replace("\"", "").Replace("'", "");
            return newchar;

        }

    }
}