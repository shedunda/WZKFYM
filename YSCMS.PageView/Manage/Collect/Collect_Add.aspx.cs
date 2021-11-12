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
    public partial class Collect_Add : YSCMS.PageBasic.ManagePage
    {
        public Collect_Add()
        {
            Authority_Code = "S009";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "no-cache";
            if (!Page.IsPostBack)
            {
                this.TxtClassName.Attributes.Add("readonly", "true");
                if (Request.QueryString["Type"] == null)
                {
                    YSCMS.Common.MessageBox.Show(this, "参数不正确或无效!");
                }
                YSCMS.CMS.Collect.Collect cl = new YSCMS.CMS.Collect.Collect();
                int n = 0;
                if (Request.QueryString["ID"] == null || Request.QueryString["ID"].Trim().Equals(""))
                {
                    this.LblTitle.Text = "新建";
                }
                else
                {
                    try
                    {
                        n = int.Parse(Request.QueryString["ID"]);
                    }
                    catch
                    {
                        n = 0;
                    }
                    this.Authority_Code = "S010";
                    this.CheckAdminAuthority();
                    this.LblTitle.Text = "修改";
                }
                if (Request.QueryString["Type"] != null && Request.QueryString["Type"].Equals("Folder"))
                {
                    this.Authority_Code = "S013";
                    this.CheckAdminAuthority();
                    if (n > 0)
                    {
                        DataTable tb = cl.GetFolder(n);
                        if (tb != null)
                        {
                            this.HddFolderID.Value = n.ToString();
                            if (!tb.Rows[0].IsNull("SiteFolder"))
                                this.TxtFolderName.Text = tb.Rows[0]["SiteFolder"].ToString();
                            if (!tb.Rows[0].IsNull("SiteFolderDetail"))
                                this.TxtFolderMemo.Text = tb.Rows[0]["SiteFolderDetail"].ToString();
                            tb.Dispose();
                        }
                    }
                    else
                    {
                        this.HddFolderID.Value = "";
                    }
                    this.LblTitle.Text += "栏目";
                    this.PnlSite.Visible = false;
                }
                else if (Request.QueryString["Type"] != null && Request.QueryString["Type"].Equals("Site"))
                {
                    this.LblTitle.Text += "站点";
                    this.PnlFolder.Visible = false;
                    this.DdlSiteFolder.Items.Clear();
                    this.DdlSiteFolder.Items.Add(new ListItem("根栏目", ""));
                    DataTable tb = cl.GetFolder();
                    if (tb != null)
                    {
                        foreach (DataRow r in tb.Rows)
                        {
                            this.DdlSiteFolder.Items.Add(new ListItem("├─" + r["SiteFolder"].ToString(), r["ID"].ToString()));
                        }
                        tb.Dispose();
                    }
                    if (n > 0)
                    {
                        this.LblTitle.Text = "站点设置向导";
                        this.BtnSiteOK.Visible = false;
                        tb = cl.GetSite(n);
                        if (tb != null)
                        {
                            this.HidSiteID.Value = n.ToString();
                            this.TxtSiteName.Text = tb.Rows[0]["SiteName"].ToString();
                            this.TxtSiteURL.Text = tb.Rows[0]["objURL"].ToString();
                            this.HidClassID.Value = tb.Rows[0]["ClassID"].ToString();
                            YSCMS.CMS.NewsClass cm = new YSCMS.CMS.NewsClass();
                            string ClassName = cm.GetNewsClassCName(this.HidClassID.Value);
                            this.TxtClassName.Text = ClassName;
                            if (!tb.Rows[0].IsNull("Encode")) this.TxtEncode.Text = tb.Rows[0]["Encode"].ToString();
                            if (!tb.Rows[0].IsNull("Folder"))
                                this.DdlSiteFolder.SelectedValue = tb.Rows[0]["Folder"].ToString();
                            if (bool.Parse(tb.Rows[0]["SaveRemotePic"].ToString())) this.ChbSavePic.Checked = true;
                            this.DdlAudit.SelectedValue = tb.Rows[0]["Audit"].ToString();
                            if (bool.Parse(tb.Rows[0]["IsReverse"].ToString())) this.ChbReverse.Checked = true;
                            if (bool.Parse(tb.Rows[0]["IsAutoPicNews"].ToString())) this.ChbPicNews.Checked = true;
                            if (bool.Parse(tb.Rows[0]["TextTF"].ToString())) this.ChbHTML.Checked = true;
                            if (bool.Parse(tb.Rows[0]["IsStyle"].ToString())) this.ChbSTYLE.Checked = true;
                            if (bool.Parse(tb.Rows[0]["IsDIV"].ToString())) this.ChbDIV.Checked = true;
                            if (bool.Parse(tb.Rows[0]["IsA"].ToString())) this.ChbA.Checked = true;
                            if (bool.Parse(tb.Rows[0]["IsClass"].ToString())) this.ChbCLASS.Checked = true;
                            if (bool.Parse(tb.Rows[0]["IsFont"].ToString())) this.ChbFONT.Checked = true;
                            if (bool.Parse(tb.Rows[0]["IsSpan"].ToString())) this.ChbSPAN.Checked = true;
                            if (bool.Parse(tb.Rows[0]["IsObject"].ToString())) this.ChbOBJECT.Checked = true;
                            if (bool.Parse(tb.Rows[0]["IsIFrame"].ToString())) this.ChbIFRAME.Checked = true;
                            if (bool.Parse(tb.Rows[0]["IsScript"].ToString())) this.ChbSCRIPT.Checked = true;
                            tb.Dispose();
                        }
                    }
                    else
                    {
                        this.BtnNext.Text = "继续设置";
                    }

                }
                else
                {
                    YSCMS.Common.MessageBox.ShowAndRedirect(this, "参数不正确或无效!", "Collect_List.aspx");
                }
            }
        }
        protected void BtnFolderOK_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string sName = TxtFolderName.Text.Trim();
                string sMemo = TxtFolderMemo.Text.Trim();
                if (sName.Equals(""))
                    YSCMS.Common.MessageBox.ShowAndRedirect(this, "栏目名称请必须填写!", "Collect_List.aspx");
                YSCMS.CMS.Collect.Collect cl = new YSCMS.CMS.Collect.Collect();
                if (this.HddFolderID.Value.Trim().Equals("") || this.HddFolderID.Value.Trim().Equals("0"))
                {
                    this.HddFolderID.Value = cl.FolderAdd(sName, sMemo).ToString();
                    YSCMS.Common.MessageBox.ShowAndRedirect(this, "新增栏目成功!", "Collect_List.aspx");
                }
                else
                {
                    int id = int.Parse(HddFolderID.Value);
                    cl.FolderUpdate(id, sName, sMemo);
                    YSCMS.Common.MessageBox.ShowAndRedirect(this, "修改栏目成功!", "Collect_List.aspx");
                }
            }
        }

        protected void BtnSiteOK_Click(object sender, EventArgs e)
        {
            SaveSite(false);
        }
        protected void BtnNext_Click(object sender, EventArgs e)
        {
            SaveSite(true);
        }
        private void SaveSite(bool bGotoNext)
        {
            if (Page.IsValid)
            {
                if (TxtSiteName.Text.Trim().Equals(""))
                    YSCMS.Common.MessageBox.Show(this, "采集站点名称请必须填写!");
                if (TxtSiteURL.Text.Trim().Equals(""))
                    YSCMS.Common.MessageBox.Show(this, "采集对象页请必须填写!");
                if (TxtEncode.Text.Trim().Equals(""))
                    YSCMS.Common.MessageBox.Show(this, "编码方式请必须填写!");
                if (this.HidClassID.Value.Trim().Equals(""))
                    YSCMS.Common.MessageBox.Show(this, "新闻所属栏目请必须选择!");

                string sUrl = this.TxtSiteURL.Text.Trim();

                sUrl = sUrl.Replace("'", "''");
                sUrl = sUrl.Replace("\\", "/");

                YSCMS.Model.CollectSiteInfo nf = new YSCMS.Model.CollectSiteInfo();
                nf.SiteName = TxtSiteName.Text.Trim();
                nf.objURL = sUrl;
                if (DdlSiteFolder.SelectedValue.Equals(""))
                    nf.Folder = 0;
                else
                    nf.Folder = int.Parse(DdlSiteFolder.SelectedValue);
                nf.Encode = TxtEncode.Text.Trim();
                nf.SaveRemotePic = ChbSavePic.Checked;
                int CheckStat = int.Parse(this.DdlAudit.SelectedValue);
                nf.Audit = CheckStat;
                nf.IsReverse = ChbReverse.Checked;
                nf.IsAutoPicNews = ChbPicNews.Checked;
                nf.TextTF = ChbHTML.Checked;
                nf.IsStyle = ChbSTYLE.Checked;
                nf.IsDIV = ChbDIV.Checked;
                nf.IsA = ChbA.Checked;
                nf.IsClass = ChbCLASS.Checked;
                nf.IsFont = ChbFONT.Checked;
                nf.IsSpan = ChbSPAN.Checked;
                nf.IsObject = ChbOBJECT.Checked;
                nf.IsIFrame = ChbIFRAME.Checked;
                nf.IsScript = ChbSCRIPT.Checked;
                nf.ClassID = this.HidClassID.Value;
                YSCMS.CMS.Collect.Collect cl = new YSCMS.CMS.Collect.Collect();
                if (this.HidSiteID.Value.Trim().Equals("") || this.HidSiteID.Value.Trim().Equals("0"))
                {
                    int collectID = cl.SiteAdd(nf);
                    if (collectID == 0)//采集站点名重复
                    {
                        PageError("采集站点名重复!", "Collect_Add.aspx?Type=Site");
                    }
                    else
                    {
                        this.HidSiteID.Value = collectID.ToString();
                        if (bGotoNext)
                        {
                            Response.Redirect("Collect_StepTwo.aspx?ID=" + this.HidSiteID.Value);
                        }
                        else
                        {
                            PageRight("新增采集站点成功!", "Collect_List.aspx");
                        }
                    }
                }
                else
                {
                    nf.ID = int.Parse(HidSiteID.Value);
                    cl.SiteUpdate(nf, 1);
                    Response.Redirect("Collect_StepTwo.aspx?ID=" + this.HidSiteID.Value);
                }
            }
        }
    }
}