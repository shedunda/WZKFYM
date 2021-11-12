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
using YSCMS.CMS;

namespace YSCMS.PageView.User.Discuss
{
    public partial class DiscussManage_DC : YSCMS.PageBasic.UserPage
    {
        YSCMS.CMS.Discuss dis = new YSCMS.CMS.Discuss();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                string DisID = YSCMS.Common.Input.Filter(Request.QueryString["DisID"].ToString());
                dis.Update_3(DisID);
                DataTable sel_DC = dis.sel_19(DisID);
                if (sel_DC != null)
                {
                    if (sel_DC.Rows.Count > 0)
                    {
                        this.Cnamelabel.Text = sel_DC.Rows[0]["Cname"].ToString();
                        this.UserNameLabel.Text = "<a href=\"../ShowUser.aspx?uid=" + sel_DC.Rows[0]["UserName"].ToString() + "\" class=\"list_link\" target=\"_blank\">" + sel_DC.Rows[0]["UserName"].ToString() + "</a>";
                        this.BrowsenumberLabel.Text = sel_DC.Rows[0]["Browsenumber"].ToString();
                        this.D_ContentLabel.Text = sel_DC.Rows[0]["D_Content"].ToString();
                        this.CreatimeLabel.Text = sel_DC.Rows[0]["Creatime"].ToString();
                        string[] Authoritymoney = sel_DC.Rows[0]["Authoritymoney"].ToString().Split('|');
                        this.gPionLabel.Text = Authoritymoney[2].ToString();
                        this.iPionLabel.Text = Authoritymoney[1].ToString();
                        string[] ClassID_1 = sel_DC.Rows[0]["ClassID"].ToString().Split('|');
                        string c1 = ClassID_1[0];
                        string c2 = ClassID_1[1];
                        ClassID1.InnerHtml = dis.sel_20(c1);
                        ClassID2.InnerHtml = dis.sel_21(c2, c1);
                    }
                    else
                    {
                        PageError("错误的参数", "");
                    }
                    sel_DC.Clear(); sel_DC.Dispose();
                }
                else
                {
                    PageError("错误的参数", "");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("discussManage_list.aspx");
        }
    }
}