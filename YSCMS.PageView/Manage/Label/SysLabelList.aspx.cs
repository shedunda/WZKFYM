﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using YSCMS.Model;
using YSCMS.PageView.Controls;

namespace YSCMS.PageView.Manage.Label
{
    public partial class SysLabelList : YSCMS.PageBasic.ManagePage
    {
        public SysLabelList()
        {
            Authority_Code = "T010";
        }
        public string Cname = "";
        public string ReloadURL = "";
        YSCMS.CMS.Label ld = new YSCMS.CMS.Label();
        YSCMS.CMS.UserMisc rd = new YSCMS.CMS.UserMisc();
        protected void Page_Load(object sender, EventArgs e)
        {
            //清除标签缓存
            //lock (YSCMS.Publish.CustomLabel._lableTableInfo)
            //{
            //    YSCMS.Publish.CustomLabel._lableTableInfo.Clear();
            //}
            Response.CacheControl = "no-cache";                        //设置页面无缓存
            if (!IsPostBack)
            {

                ReloadURL = "http://passport.yscmssoft.com/libary/yscms/reloadlabel/label.aspx?type=reload";
                if (YSCMS.Global.Current.SiteID == "0")
                {
                    string getSiteID = Request.QueryString["SiteID"];
                    if (getSiteID != null && getSiteID != "") { channelList.InnerHtml = SiteList(getSiteID); }
                    else { channelList.InnerHtml = SiteList(YSCMS.Global.Current.SiteID); }
                }
            }
            Op();
            this.PageNavigator1.OnPageChange += new PageChangeHandler(PageNavigator1_PageChange);
            StartLoad(1);
        }

        /// <summary>
        /// 得到站点列表
        /// </summary>
        /// <param name="SessionSiteID"></param>
        /// <returns></returns>
        protected string SiteList(string SessionSiteID)
        {
            string siteStr = "<select name=\"SiteID\" id=\"SiteID\" onChange=\"getchanelInfo(this)\">\r";
            DataTable crs = rd.getSiteList();
            if (crs != null)
            {
                for (int i = 0; i < crs.Rows.Count; i++)
                {
                    string getSiteID = SessionSiteID;
                    string SiteID1 = crs.Rows[i]["ChannelID"].ToString();
                    if (getSiteID != SiteID1) { siteStr += "<option value=\"" + crs.Rows[i]["ChannelID"] + "\">==" + crs.Rows[i]["CName"] + "==</option>\r"; }
                    else { siteStr += "<option value=\"" + crs.Rows[i]["ChannelID"] + "\"  selected=\"selected\">==" + crs.Rows[i]["CName"] + "==</option>\r"; }
                }
                crs.Clear(); crs.Dispose();
            }
            siteStr += "</select>\r";
            return siteStr;
        }

        /// <summary>
        /// 分页
        /// </summary>
        /// <returns>分页</returns>
        protected void PageNavigator1_PageChange(object sender, int PageIndex)
        {
            StartLoad(PageIndex);
        }

        protected void StartLoad(int PageIndex)
        {
            int i = 0;
            int j = 0;
            string str_classid = Request.QueryString["ClassID"];
            string action_s = Request.QueryString["s"];
            bool tf = false;
            DataTable dt = null;
            string _SiteID = "0";
            string getSiteID = Request.QueryString["SiteID"];
            if (getSiteID != "" && getSiteID != null)
            {
                _SiteID = getSiteID.ToString(); ;
            }
            else
            {
                if (SiteID != "0")
                {
                    _SiteID = YSCMS.Global.Current.SiteID;
                }
            }
            if (action_s != null && action_s != string.Empty)
            {
                SQLConditionInfo[] st = new SQLConditionInfo[2];
                st[0] = new SQLConditionInfo("@SiteID", _SiteID);
                st[1] = new SQLConditionInfo("@Keyword", "%" + Request.QueryString["keyword"].ToString() + "%");
                dt = YSCMS.CMS.Pagination.GetPage("manage_label_SysLabel_List_3_aspx", PageIndex, 40, out i, out j, st);
                Cname = "标签名称";
                Back.InnerHtml = "";
            }
            else
            {
                if (str_classid == null || str_classid == "" || str_classid == string.Empty)
                {
                    SQLConditionInfo st = new SQLConditionInfo("@SiteID", _SiteID);
                    dt = YSCMS.CMS.Pagination.GetPage("manage_label_SysLabel_List_1_aspx", PageIndex, 30, out i, out j, st);
                    tf = true;

                    Cname = "分类名称";
                    Back.InnerHtml = "";
                }
                else
                {
                    SQLConditionInfo[] st = new SQLConditionInfo[2];
                    st[0] = new SQLConditionInfo("@SiteID", _SiteID);
                    st[1] = new SQLConditionInfo("@ClassID", YSCMS.Common.Input.Filter(str_classid));
                    dt = YSCMS.CMS.Pagination.GetPage("manage_label_SysLabel_List_2_aspx", PageIndex, 40, out i, out j, st);

                    Cname = "标签名称";
                    Back.InnerHtml = "&nbsp;┊&nbsp;<a href=\"syslabelList.aspx\" >返回上一级</a>";
                }
            }

            this.PageNavigator1.PageCount = j;
            this.PageNavigator1.PageIndex = PageIndex;
            this.PageNavigator1.RecordCount = i;
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    //----------------------------------------添加列------------------------------------------------
                    dt.Columns.Add("Op", typeof(string));
                    dt.Columns.Add("Type", typeof(string));
                    for (int k = 0; dt.Rows.Count > k; k++)
                    {
                        if (tf == false)
                        {
                            string tstr = "";
                            if (dt.Rows[k]["Description"].ToString() != null && dt.Rows[k]["Description"].ToString() != string.Empty)
                            {
                                tstr = "<div style=\"font-size:11.5px;color:#999999;\">" + dt.Rows[k]["Description"].ToString() + "</div>";
                            }

                            dt.Rows[k]["Type"] = "<span style=\"text-DECORATION:none;cursor:pointer;\" onclick=\"shdivlabel('" + dt.Rows[k]["LabelID"] + "');\" title=\"点击查看标签内容\">" + dt.Rows[k]["Label_Name"].ToString() + "</span>" + tstr + "";
                            if (str_classid == "99999999")
                            {
                                dt.Rows[k]["Op"] = "<a href=\"javascript:Update('Label','" + dt.Rows[k]["LabelID"].ToString() + "');\">[查看]</a>";
                            }
                            else
                            {
                                dt.Rows[k]["Op"] = "<a href=\"javascript:Update('Label','" + dt.Rows[k]["LabelID"].ToString() + "');\">[修改]</a><a href=\"syslabelout.aspx?LabelID=" + dt.Rows[k]["LabelID"].ToString() + "&LabelName=" + dt.Rows[k]["Label_Name"].ToString() + "&type=out\">[导出]</a><a href=\"javascript:Bak('" + dt.Rows[k]["LabelID"].ToString() + "');\">[备份]</a><a href=\"javascript:Del('Label','" + dt.Rows[k]["LabelID"].ToString() + "');\">[删除]</a><a href=\"javascript:Dels('Label','" + dt.Rows[k]["LabelID"].ToString() + "');\"><img src=\"../imges/lie_65.gif\" align=\"absmiddle\" alt=\"彻底删除\" /></a>";
                            }
                        }
                        else
                        {
                            int getCount = ld.getClassLabelCount(dt.Rows[k]["ClassID"].ToString(), 0);
                            if (dt.Rows[k]["ClassID"].ToString() == "99999999")
                            {
                                dt.Rows[k]["Type"] = "<a href=\"syslabelList.aspx?ClassID=" + dt.Rows[k]["ClassID"].ToString() + "&SiteID=" + Request.QueryString["SiteID"] + "\" title=\"点击查看此分类下的标签\"><img src=\"../imges/review.gif\" class=\"img\" align=\"absmiddle\"  /><font color=\"red\">" + dt.Rows[k]["ClassName"].ToString() + "</font></a><span class=\"reshow\" style=\"font-size:10px;\" title=\"此栏目下标签数\">(" + getCount + ")</span>";
                                dt.Rows[k]["Op"] = "<a href=\"javascript:Update('LabelClass','" + dt.Rows[k]["ClassID"].ToString() + "');\" >修改</a><a href=\"javascript:reload();\" ><img src=\"../imges/downlabel.gif\" border=\"0\" title=\"从月思(Yuesisoft.com)官方重新获取完整的系统标签\" /></a>";
                            }
                            else
                            {
                                dt.Rows[k]["Type"] = "<a  href=\"syslabelList.aspx?ClassID=" + dt.Rows[k]["ClassID"].ToString() + "&SiteID=" + Request.QueryString["SiteID"] + "\" title=\"点击查看此分类下的标签\"><img src=\"../imges/review.gif\" class=\"img\" align=\"absmiddle\"  />" + dt.Rows[k]["ClassName"].ToString() + "</a><span class=\"reshow\" style=\"font-size:10px;\" title=\"此栏目下标签数\">(" + getCount + ")</span>";
                                dt.Rows[k]["Op"] = "<a href=\"syslabeladd.aspx?ClassID=" + dt.Rows[k]["ClassID"].ToString() + "\">[添加]</a><a href=\"javascript:Update('LabelClass','" + dt.Rows[k]["ClassID"].ToString() + "');\" >[修改]</a><a href=\"javascript:Del('LabelClass','" + dt.Rows[k]["ClassID"].ToString() + "');\" >[删除]</a>&nbsp;<a href=\"javascript:Dels('LabelClass','" + dt.Rows[k]["ClassID"].ToString() + "');\" ><img src=\"../imges/lie_65.gif\" align=\"absmiddle\" alt=\"彻底删除\" /></a>";
                            }
                        }
                    }
                }
                DataList1.DataSource = dt;                              //设置datalist数据源
                DataList1.DataBind();                                   //绑定数据源
                dt.Clear();
                dt.Dispose();
            }
        }


        /// <summary>
        /// 执行操作
        /// </summary>
        /// <returns>执行操作</returns>
        protected void Op()
        {
            string str_Op = Request.QueryString["Op"];
            string str_Type = Request.QueryString["type"];
            string str_ID = Request.QueryString["ID"];
            switch (str_Op)
            {
                case "Del":
                    switch (str_Type)
                    {
                        case "Label":
                            delLabel(YSCMS.Common.Input.checkID(str_ID));
                            break;
                        case "LabelClass":
                            delLabelClass(YSCMS.Common.Input.checkID(str_ID));
                            break;
                        default:
                            break;
                    }
                    break;
                case "Dels":
                    switch (str_Type)
                    {
                        case "Label":
                            delsLabel(YSCMS.Common.Input.checkID(str_ID));
                            break;
                        case "LabelClass":
                            delsLabelClass(YSCMS.Common.Input.checkID(str_ID));
                            break;
                        default:
                            break;
                    }
                    break;
                case "Bak":
                    LabelBak(YSCMS.Common.Input.checkID(str_ID));
                    break;
                default:
                    break;
            }
        }

        /// <summary>
        /// 删除标签(放入回收站)
        /// </summary>
        /// <param name="ID">标签编号</param>
        /// <returns>删除标签(放入回收站)</returns>
        protected void delLabel(string ID)
        {
            this.Authority_Code = "T013";
            this.CheckAdminAuthority();
            YSCMS.CMS.Label lc = new YSCMS.CMS.Label();
            lc.LabelDel(ID);
            PageRight("将标签放入回收站成功!", "syslabelList.aspx?ClassID=" + Request.QueryString["ClassID"]);
        }

        /// <summary>
        /// 删除标签(彻底删除)
        /// </summary>
        /// <param name="ID">标签编号</param>
        /// <returns>删除标签(彻底删除)</returns>
        protected void delsLabel(string ID)
        {
            this.Authority_Code = "T014";
            this.CheckAdminAuthority();
            YSCMS.CMS.Label lc = new YSCMS.CMS.Label();
            lc.LabelDels(ID);
            PageRight("彻底删除标签成功!", "syslabelList.aspx?ClassID=" + Request.QueryString["ClassID"]);
        }

        /// <summary>
        /// 删除栏目(彻底删除)
        /// </summary>
        /// <param name="ID">栏目编号</param>
        /// <returns>删除栏目(彻底删除)</returns>
        protected void delsLabelClass(string ID)
        {
            YSCMS.CMS.Label lc = new YSCMS.CMS.Label();
            lc.LabelClassDels(ID);
            PageRight("彻底删除栏目成功!", "syslabelList.aspx");
        }

        /// <summary>
        /// 删除栏目(放入回收站)
        /// </summary>
        /// <param name="ID">栏目编号</param>
        /// <returns>删除栏目(放入回收站)</returns>
        protected void delLabelClass(string ID)
        {
            YSCMS.CMS.Label lc = new YSCMS.CMS.Label();
            lc.LabelClassDel(ID);
            PageRight("将栏目放入回收站成功!", "syslabelList.aspx");
        }

        /// <summary>
        /// 备份标签
        /// </summary>
        /// <param name="ID">标签编号</param>
        /// <returns>备份标签</returns>
        protected void LabelBak(string ID)
        {
            YSCMS.CMS.Label lc = new YSCMS.CMS.Label();
            lc.LabelBackUp(ID);
            PageRight("将标签放入备份库成功!", "syslabelList.aspx?ClassID=" + Request.QueryString["ClassID"]);
        }
    }
}