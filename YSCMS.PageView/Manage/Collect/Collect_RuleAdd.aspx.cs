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
using System.Net;

namespace YSCMS.PageView.Manage.Collect
{
    public partial class Collect_RuleAdd : YSCMS.PageBasic.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "no-cache";
            this.BtnOK.Attributes.Add("onclick", "javascript:if(!window.confirm('您确定要修改规则吗？所有选中的采集站点将应用新的规则取代原来的规则！'))return false;");
            int n = 0;
            if (Request["RID"] == null || Request["RID"].Trim().Equals(""))
            {
                this.RID.Value = "";
                this.LblTitle.Text = "新建规则";
                this.ChbCase.Checked = true;
            }
            else
            {
                this.LblTitle.Text = "修改规则";
                try
                {
                    n = int.Parse(Request["RID"]);
                    this.RID.Value = n.ToString();
                }
                catch
                {
                    PageError("输入的参数无效!", "");
                    return;
                }
            }
            //this.EdtOldStr.SetTag = new string[] { "[过滤字符串]", "[变量]" };
            this.EdtOldStr.SetTag = new string[] { "[变量]" };
            YSCMS.CMS.Collect.Collect cl = new YSCMS.CMS.Collect.Collect();
            DataTable tb = cl.SiteList();
            if (tb != null)
            {
                foreach (DataRow r in tb.Rows)
                {
                    ListItem li = new ListItem();
                    if (!r.IsNull("RuleID"))
                    {
                        li.Value = "ChbON_" + r["id"].ToString();
                    }
                    else
                    {
                        li.Value = "ChbOF_" + r["id"].ToString();
                    }
                    if (!r.IsNull("RuleID") && r["RuleID"].ToString().Equals(n.ToString()))
                        li.Selected = true;
                    li.Text = r["SiteName"].ToString();
                    this.TabRuleApply.Items.Add(li);
                }
                tb.Dispose();
            }
            if (!Page.IsPostBack)
            {
                if (n > 0)
                {
                    tb = cl.GetRule(n);
                    if (tb != null && tb.Rows.Count > 0)
                    {
                        this.TxtRuleName.Text = tb.Rows[0]["RuleName"].ToString();
                        this.EdtOldStr.Text = tb.Rows[0]["OldContent"].ToString();
                        if (!tb.Rows[0].IsNull("ReContent")) this.TxtNewStr.Text = tb.Rows[0]["ReContent"].ToString();
                        if (bool.Parse(tb.Rows[0]["IgnoreCase"].ToString())) this.ChbCase.Checked = true; else this.ChbCase.Checked = false;
                    }
                    else
                    {
                        PageError("没有找到相关的规则记录!", "");
                    }
                }
                this.DataBind();
            }
        }
        protected void BtnOK_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (TxtRuleName.Text.Trim().Equals(""))
                {
                    PageError("规则名称请必须填写!", "");
                }
                if (EdtOldStr.Text.Trim().Equals(""))
                {
                    PageError("过滤字符串请必须填写!", "");
                }
                if (TxtNewStr.Text.Trim().Equals(""))
                {
                    PageError("请必须填写!", "");
                }
                YSCMS.CMS.Collect.Collect cl = new YSCMS.CMS.Collect.Collect();
                if (this.RID.Value.Trim().Equals("") || this.RID.Value.Trim().Equals("0"))
                {
                    int nid = cl.RuleAdd(TxtRuleName.Text.Trim(), EdtOldStr.Text.Trim(), TxtNewStr.Text.Trim(), GetSelectedSite(), ChbCase.Checked);
                    this.RID.Value = nid.ToString();
                    PageRight("新增规则成功!", "");
                }
                else
                {
                    int id = int.Parse(RID.Value);
                    cl.RuleUpdate(id, TxtRuleName.Text.Trim(), EdtOldStr.Text.Trim(), TxtNewStr.Text.Trim(), GetSelectedSite(), ChbCase.Checked);
                    PageRight("修改规则成功!", "");
                }
            }
        }

        private int[] GetSelectedSite()
        {
            ArrayList lstsite = new ArrayList();
            lstsite.Clear();
            foreach (ListItem li in this.TabRuleApply.Items)
            {
                if (li.Selected)
                {
                    string cid = li.Value;
                    int n = int.Parse(cid.Substring(6));
                    lstsite.Add(n);
                }
            }
            return (int[])lstsite.ToArray(typeof(int));
        }
    }
}
