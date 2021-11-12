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

namespace YSCMS.PageView.User.Constr
{
    public partial class ConstrAccount_UP : YSCMS.PageBasic.UserPage
    {
        //连接数据库
        YSCMS.CMS.Constr con = new YSCMS.CMS.Constr();
        /// <summary>
        /// 初始化
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// 
        #region 初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            string ConID = YSCMS.Common.Input.Filter(Request.QueryString["ConID"].ToString());
            DataTable dt = con.Sel4(ConID);
            int cut = dt.Rows.Count;
            if (cut == 0)
            {
                PageError("对不起参数错误", "");
            }
            addressBox.Text = dt.Rows[0]["address"].ToString();
            postcodeBox.Text = dt.Rows[0]["postcode"].ToString();
            RealNameBox.Text = dt.Rows[0]["RealName"].ToString();
            bankNameBox.Text = dt.Rows[0]["bankName"].ToString();
            bankaccountBox.Text = dt.Rows[0]["bankaccount"].ToString();
            bankcardBox.Text = dt.Rows[0]["bankcard"].ToString();
            bankRealNameBox.Text = dt.Rows[0]["bankRealName"].ToString();
        }
        #endregion
        /// <summary>
        /// 添加数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// 
        #region 添加数据
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string ConIDs = YSCMS.Common.Input.Filter(Request.QueryString["ConID"].ToString());
                string address = YSCMS.Common.Input.Htmls(Request.Form["addressBox"].ToString());
                string postcode = YSCMS.Common.Input.Htmls(Request.Form["postcodeBox"].ToString());
                string RealName = YSCMS.Common.Input.Htmls(Request.Form["RealNameBox"].ToString());
                string bankName = YSCMS.Common.Input.Htmls(Request.Form["bankNameBox"].ToString());
                string bankaccount = YSCMS.Common.Input.Htmls(Request.Form["bankaccountBox"].ToString());
                string bankcard = YSCMS.Common.Input.Htmls(Request.Form["bankcardBox"].ToString());
                string bankRealName = YSCMS.Common.Input.Htmls(Request.Form["bankRealNameBox"].ToString());
                YSCMS.Model.STuserother stcn;
                stcn.address = address;
                stcn.postcode = postcode;
                stcn.RealName = RealName;
                stcn.bankName = bankName;
                stcn.bankaccount = bankaccount;
                stcn.bankcard = bankcard;
                stcn.bankRealName = bankRealName;
                if (con.Update1(stcn, ConIDs) == 0)
                {
                    PageError("修改失败<br>", "Constraccount.aspx");
                }
                else
                {
                    PageRight("修改成功", "Constraccount.aspx");
                }
            }
        }
        #endregion
    }
}
