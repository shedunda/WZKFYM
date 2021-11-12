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
using YSCMS.Model;
using YSCMS.PageView.Controls;

namespace YSCMS.PageView.User.Discuss
{
    public partial class DiscussManageJoin_List : YSCMS.PageBasic.UserPage
    {
        //联接数据库
        YSCMS.CMS.Discuss dis = new YSCMS.CMS.Discuss();
        YSCMS.CMS.RootPublic pd = new YSCMS.CMS.RootPublic();
        /// <summary>
        /// 初始化
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// 
        #region 初始化
        protected void Page_Load(object sender, EventArgs e)
        {

            Response.CacheControl = "no-cache";
            this.PageNavigator2.OnPageChange += new PageChangeHandler(PageNavigator2_PageChange);
            if (!IsPostBack)
            {
                Show_jrlist(1);
            }
            string Type = Request.QueryString["Type"];  //取得操作类型
            string ID = "";
            if (Request.QueryString["ID"] != "" && Request.QueryString["ID"] != null)
            {
                ID = YSCMS.Common.Input.Filter(Request.QueryString["ID"]);  //取得需要操作的稿件ID
            }
            switch (Type)
            {
                case "del":          //删除
                    del(ID);
                    break;
                case "PDel":            //批量删除
                    PDel();
                    break;
                default:
                    break;
            }
        }
        #endregion
        /// <summary>
        /// 数据绑定分页
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="PageIndex"></param>
        /// 
        #region 数据绑定分页
        protected void PageNavigator2_PageChange(object sender, int PageIndex1)
        {
            Show_jrlist(PageIndex1);
        }
        protected void Show_jrlist(int PageIndex1)    //显示我加入的讨论组列表
        {
            int i, j;
            SQLConditionInfo sts = new SQLConditionInfo("@UserNum", YSCMS.Global.Current.UserNum);
            DataTable jrlistdts = YSCMS.CMS.Pagination.GetPage(this.GetType().Name, PageIndex1, 10, out i, out j, sts);
            this.PageNavigator2.PageCount = j;
            this.PageNavigator2.PageIndex = PageIndex1;
            this.PageNavigator2.RecordCount = i;
            if (jrlistdts != null && jrlistdts.Rows.Count != 0)
            {
                jrlistdts.Columns.Add("cutDisID1", typeof(string));
                jrlistdts.Columns.Add("idc1", typeof(string));
                jrlistdts.Columns.Add("Cnames", typeof(string));
                jrlistdts.Columns.Add("userNames", typeof(string));
                DataTable jrid = dis.sel_22();
                foreach (DataRow r in jrlistdts.Rows)
                {
                    int n = (int)jrid.Compute("Count(DisID)", "DisID='" + r["DisID"].ToString() + "'");
                    r["cutDisID1"] = n;
                    string delTF = "";
                    if (r["UserName"].ToString().ToUpper() == YSCMS.Global.Current.UserName.ToUpper())
                    {
                        delTF = "<a href=\"javascript:del('" + r["Member"].ToString() + "');\" class=\"list_link\">删除</a>┆";
                    }
                    //r["idc1"] = "<a class=\"list_link\" href=\"disFundwarehouse.aspx?DisID=" + r["DisID"].ToString() + "\">捐献</a>┆<a class=\"list_link\" href=\"discussPhotoalbumlist.aspx?DisID=" + r["DisID"].ToString() + "\">相册</a>┆" + delTF + "<input name=\"Checkbox1\" type=\"checkbox\" value=" + r["Member"].ToString() + "  runat=\"server\" />";
                    r["idc1"] = "<a class=\"list_link\" href=\"disFundwarehouse.aspx?DisID=" + r["DisID"].ToString() + "\">捐献</a>┆" + delTF + "<input name=\"Checkbox1\" type=\"checkbox\" value=" + r["Member"].ToString() + "  runat=\"server\" />";
                    r["Cnames"] = "<a title=\"点击进入.\" class=\"list_link\" href=\"discussTopi_list.aspx?DisID=" + r["DisID"].ToString() + "\">" + r["Cname"].ToString() + "</a>";
                    r["userNames"] = "<a title=\"点击查看此用户的资料。\" class=\"list_link\" target=\"_blank\" href=\"../../" + YSCMS.Config.UIConfig.dirUser + "/ShowUser.aspx?uid=" + r["UserName"].ToString() + "\">" + r["UserName"].ToString() + "</a>";
                }
                sc.InnerHtml = Show_sc();
                Repeater1.DataSource = jrlistdts;
                Repeater1.DataBind();
            }
            else
            {
                sc.InnerHtml = Show_scs();
                no.InnerHtml = Show_no();
                this.PageNavigator2.Visible = false;
            }

        }
        #endregion
        /// <summary>
        /// 批量删除
        /// </summary>
        /// 
        #region 批量删除
        protected void PDel()
        {
            string checkboxq = Request.Form["Checkbox1"];
            if (checkboxq == null || checkboxq == String.Empty)
            {
                PageError("请先选择要删除的讨论组!", "discussManagejoin_list.aspx");
            }
            else
            {
                string[] chSplit = checkboxq.Split(',');
                for (int i = 0; i < chSplit.Length; i++)
                {
                    if (chSplit[i] != "on")
                    {
                        if (dis.Delete_8(chSplit[i]) == 0)
                        {
                            PageError("批量删除失败", "discussManagejoin_list.aspx");
                            break;
                        }
                    }
                }
                PageRight("批量删除成功", "discussManagejoin_list.aspx");
            }

        }
        #endregion
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="ID"></param>
        /// 
        #region 删除
        protected void del(string ID)
        {
            if (dis.Delete_8(ID) == 0)
            {
                PageError("批量删除失败", "discussManagejoin_list.aspx");
            }
            else
            {
                PageRight("删除成功!", "discussManagejoin_list.aspx");
            }
        }
        #endregion
        /// <summary>
        /// 前台输出
        /// </summary>
        /// <returns></returns>
        /// 
        #region 前台输出
        string Show_sc()
        {
            string sc = "<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"toptable\">";
            sc += "<tr><td height=\"1\" colspan=\"2\"></td></tr>";
            sc += "<tr><td width=\"57%\"  class=\"sysmain_navi\"  style=\"PADDING-LEFT: 14px\" >讨论活动管理</td>";
            sc += "<td width=\"43%\"  class=\"topnavichar\"  style=\"PADDING-LEFT: 14px\" ><div align=\"left\">位置导航：<a href=\"../main.aspx\" target=\"sys_main\" class=\"list_link\">首页</a><img alt=\"\" src=\"../../sysImages/folder/navidot.gif\" border=\"0\" /><a href=\"discussManage_list.aspx\" class=\"menulist\">讨论组管理</a><img alt=\"\" src=\"../../sysImages/folder/navidot.gif\" border=\"0\" />我建立的讨论组</div></td></tr></table>";
            sc += "<table width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"3\" cellspacing=\"1\" class=\"Navitable\">";
            sc += "<tr><td><span class=\"topnavichar\" style=\"PADDING-LEFT: 14px\"><a href=\"discussManage_list.aspx\" class=\"menulist\">讨论组列表</a>　<a href=\"discussManagejoin_list.aspx\" class=\"menulist\">我加入的讨论组</a>&nbsp;&nbsp; <a href=\"discussManageestablish_list.aspx\" class=\"menulist\">我建立的讨论组</a>&nbsp;&nbsp; <a href=\"add_discussManage.aspx\" class=\"menulist\">添加讨论组</a>&nbsp;&nbsp;&nbsp; <a href=\"javascript:PDel();\" class=\"topnavichar\">批量删除</a></span></td></tr></table>";
            return sc;
        }
        string Show_scs()
        {
            string scs = "<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"toptable\">";
            scs += "<tr><td height=\"1\" colspan=\"2\"></td></tr>";
            scs += "<tr><td width=\"57%\"  class=\"sysmain_navi\"  style=\"PADDING-LEFT: 14px\" >讨论活动管理</td>";
            scs += "<td width=\"43%\"  class=\"topnavichar\"  style=\"PADDING-LEFT: 14px\" ><div align=\"left\">位置导航：<a href=\"../main.aspx\" target=\"sys_main\" class=\"list_link\">首页</a><img alt=\"\" src=\"../../sysImages/folder/navidot.gif\" border=\"0\" /><a href=\"discussManage_list.aspx\" class=\"menulist\">讨论组管理</a><img alt=\"\" src=\"../../sysImages/folder/navidot.gif\" border=\"0\" />我建立的讨论组</div></td></tr></table>";
            scs += "<table width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"3\" cellspacing=\"1\" class=\"Navitable\">";
            scs += "<tr><td><span class=\"topnavichar\" style=\"PADDING-LEFT: 14px\"><a href=\"discussManage_list.aspx\" class=\"menulist\">讨论组列表</a>　<a href=\"discussManagejoin_list.aspx\" class=\"menulist\">我加入的讨论组</a>&nbsp;&nbsp; <a href=\"discussManageestablish_list.aspx\" class=\"menulist\">我建立的讨论组</a>&nbsp;&nbsp; <a href=\"add_discussManage.aspx\" class=\"menulist\">添加讨论组</a></span></td></tr></table>";
            return scs;
        }
        string Show_no()
        {
            string nos = "<table border=0 width='98%' align=center cellpadding=5 cellspacing=1 class='table'>";
            nos = nos + "<tr class='TR_BG_list'>";
            nos = nos + "<td class='navi_link'>没有数据</td>";
            nos = nos + "</tr>";
            nos = nos + "</table>";
            return nos;
        }
        #endregion
    }
}