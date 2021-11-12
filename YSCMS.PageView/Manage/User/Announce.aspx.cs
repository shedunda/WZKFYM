﻿
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YSCMS.CMS;
using YSCMS.Model;
using System.Data;
using YSCMS.PageView.Controls;

namespace YSCMS.PageView.Manage.User
{
    public partial class Announce : YSCMS.PageBasic.ManagePage
    {
        public Announce()
        {
            Authority_Code = "U019";
        }
        UserMisc rd = new UserMisc();
        UserList UL = new UserList();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.PageNavigator1.OnPageChange += new PageChangeHandler(PageNavigator1_PageChange);
            if (!IsPostBack)
            {

                //copyright.InnerHtml = CopyRight;            //获取版权信息
                Response.CacheControl = "no-cache";                        //设置页面无缓存
                if (SiteID == "0")
                {
                    string getSiteID = Request.QueryString["SiteID"];
                    if (getSiteID != null && getSiteID != "")
                    {
                        channelList.InnerHtml = SiteList(getSiteID);
                    }
                    else
                    {
                        channelList.InnerHtml = SiteList(YSCMS.Global.Current.SiteID);
                    }
                }

                string sType = Request.QueryString["Type"];
                if (sType == "Del")
                {
                    string aId = "";
                    try
                    {
                        aId = YSCMS.Common.Input.Filter(Request.QueryString["ID"]);
                    }
                    catch (Exception AX)
                    {
                        PageError("错误的参数" + AX.ToString() + "", "");
                    }
                    dels(aId);
                }
                StartLoad(1);
            }
        }
        protected string SiteList(string SessionSiteID)
        {
            string siteStr = "<select class=\"xselect1\" name=\"SiteID\" id=\"SiteID\" onChange=\"getchanelInfo(this)\">\r";
            DataTable crs = rd.getSiteList();
            if (crs != null)
            {
                for (int i = 0; i < crs.Rows.Count; i++)
                {
                    string getSiteID = SessionSiteID;
                    string SiteID1 = crs.Rows[i]["ChannelID"].ToString();
                    if (getSiteID != SiteID1)
                    {
                        siteStr += "<option value=\"" + crs.Rows[i]["ChannelID"] + "\">==" + crs.Rows[i]["CName"] + "==</option>\r";
                    }
                    else
                    {
                        siteStr += "<option value=\"" + crs.Rows[i]["ChannelID"] + "\"  selected=\"selected\">==" + crs.Rows[i]["CName"] + "==</option>\r";
                    }
                }
            }
            //}
            siteStr += "</select>\r";
            return siteStr;
        }

        /// <summary>
        /// dels 的摘要说明
        /// 删除公告
        /// </summary>
        protected void dels(string aId)
        {
            this.Authority_Code = "U021";
            this.CheckAdminAuthority();
            if (aId != null && aId != "")
            {
                rd.Announcedels(aId);
                PageRight("删除公告成功。", "announce.aspx");
            }
            else
            {
                PageError("请选择一个公告<br />", "announce.aspx");
            }
        }

        /// <summary>
        /// delmul 的摘要说明
        /// 删除多个公告传递中间函数
        /// </summary>
        protected void delmul(object sender, EventArgs e)
        {
            string ids = Request.Form["aid"];
            dels(ids);
        }

        /// <summary>
        /// islock 的摘要说明
        /// 锁定多个公告传递中间函数
        /// </summary>
        protected void islock(object sender, EventArgs e)
        {

            string ids = Request.Form["aid"];
            lockActions(ids, 1);
        }

        /// <summary>
        /// unlock 的摘要说明
        /// 取消锁定多个公告传递中间函数
        /// </summary>
        protected void unlock(object sender, EventArgs e)
        {

            string ids = Request.Form["aid"];
            lockActions(ids, 0);
        }

        /// <summary>
        /// lockActions 的摘要说明
        /// 锁定/解锁动作函数
        /// </summary>
        protected void lockActions(string aId, int intlock)
        {
            this.Authority_Code = "U023";
            this.CheckAdminAuthority();
            if (aId != null && aId != "")
            {
                string lockstr = "";
                if (intlock == 1)
                {
                    lockstr = " set islock=1";
                }
                else
                {
                    lockstr = " set islock=0";
                }
                rd.AnnounceLockAction(aId, lockstr);
                PageRight("更新公告成功。", "announce.aspx");
            }
            else
            {
                PageError("请选择一个公告<br />", "announce.aspx");
            }
        }

        /// <summary>
        /// PageNavigator1_PageChange 的摘要说明
        /// 分页加载函数
        /// </summary>
        protected void PageNavigator1_PageChange(object sender, int PageIndex)
        {
            StartLoad(PageIndex);
        }

        /// <summary>
        /// PageNavigator1_PageChange 的摘要说明
        /// 分页加载列表函数
        /// </summary>
        protected void StartLoad(int PageIndex)
        {
            string siteID1 = "";
            if (Request.QueryString["SiteID"] != "" && Request.QueryString["SiteID"] != "0" && Request.QueryString["SiteID"] != null)
            {
                siteID1 = YSCMS.Common.Input.Filter(Request.QueryString["SiteID"].ToString());
            }
            int i, j;
            DataTable dt = null;
            if (siteID1 != null && siteID1 != "")
            {
                if (SiteID == "0")
                {
                    SQLConditionInfo st = new SQLConditionInfo("@SiteID", siteID1);
                    dt = YSCMS.CMS.Pagination.GetPage("manage_user_announce_1_aspx", PageIndex, 20, out i, out j, st);
                }
                else
                {
                    dt = YSCMS.CMS.Pagination.GetPage(this.GetType().Name, PageIndex, 20, out i, out j, null);
                }
            }
            else
            {
                dt = YSCMS.CMS.Pagination.GetPage(this.GetType().Name, PageIndex, 20, out i, out j, null);
            }
            this.PageNavigator1.PageCount = j;
            this.PageNavigator1.PageIndex = PageIndex;
            this.PageNavigator1.RecordCount = i;
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    //----------------------------------------添加列------------------------------------------------
                    dt.Columns.Add("op", typeof(string));
                    dt.Columns.Add("islocks", typeof(string));
                    //----------------------------------------添加列结束--------------------------------------------
                    for (int k = 0; dt.Rows.Count > k; k++)
                    {
                        dt.Rows[k]["op"] = "<a href=\"Announceadd.aspx?Id=" + dt.Rows[k]["id"] + "\">修改</a><a href=\"Announce.aspx?Type=Del&id=" + dt.Rows[k]["id"] + "\"  onClick=\"{if(confirm('确定要删除吗？')){return true;}return false;}\">删除</a><input type=\"checkbox\" name=\"aid\" value=\"" + dt.Rows[k]["id"] + "\" />";
                        if (dt.Rows[k]["islock"].ToString() == "1")
                        {
                            dt.Rows[k]["islocks"] = "<span class=\"tbie\">锁定</span>";
                        }
                        else
                        {
                            dt.Rows[k]["islocks"] = "正常";
                        }
                    }


                }
            }
            announcelists.DataSource = dt;                              //设置datalist数据源
            announcelists.DataBind();                                   //绑定数据源
        }
    }
}