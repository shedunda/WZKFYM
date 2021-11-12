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
    public partial class DiscussSubclass_Add : YSCMS.PageBasic.UserPage
    {
        YSCMS.CMS.Discuss dis = new YSCMS.CMS.Discuss();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Response.CacheControl = "no-cache";
                DataTable dts1 = dis.sel_33();
                this.ClassIDList1.DataSource = dts1;
                this.ClassIDList1.DataTextField = "Cname";
                this.ClassIDList1.DataValueField = "DcID";
                this.ClassIDList1.DataBind();
            }
        }
        protected void but1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string Cname = YSCMS.Common.Input.Filter(Request.Form["Cname"].ToString());
                string Content = YSCMS.Common.Input.ToHtml(Request.Form["Content"].ToString());

                string DcID = YSCMS.Common.Rand.Number(12);
                string indexnumber = this.ClassIDList1.SelectedValue;

                //创建讨论组

                DataTable dt = dis.sel_4();
                int cutb = dt.Rows.Count;
                string DcIDs = "";
                if (cutb > 0)
                {
                    DcIDs = dt.Rows[0]["DcID"].ToString();
                }

                if (DcIDs != DcID)
                {
                    if (dis.Add_5(DcID, Cname, Content, indexnumber) == 0)
                    {
                        PageError("添加错误", "");
                    }
                    else
                    {
                        PageRight("添加成功", "");
                    }
                }
                else
                {
                    PageError("对不起建立失败有可能是编号重复", "");
                }

            }
        }

    }
}
