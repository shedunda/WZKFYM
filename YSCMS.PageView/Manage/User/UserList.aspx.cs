﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YSCMS.CMS;
using System.Data;
using YSCMS.PageView.Controls;

namespace YSCMS.PageView.Manage.User
{
    public partial class UserList : YSCMS.PageBasic.ManagePage
    {
        public UserList()
        {
            Authority_Code = "U001";
        }
        YSCMS.CMS.UserList UL = new YSCMS.CMS.UserList();
        YSCMS.CMS.UserMisc rd = new YSCMS.CMS.UserMisc();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.PageNavigator1.OnPageChange += new PageChangeHandler(PageNavigator1_PageChange);
            if (!IsPostBack)
            {
                Response.CacheControl = "no-cache";                        //设置页面无缓存
                #region 判断开始
                string getGroupNumber = Request.QueryString["GroupNumber"];
                if (getGroupNumber != null && getGroupNumber != "") { groupList.InnerHtml = groups(getGroupNumber); }
                else { groupList.InnerHtml = groups(""); }
                if (YSCMS.Global.Current.SiteID == "0")
                {
                    string getSiteID = Request.QueryString["SiteID"];
                    if (getSiteID != null && getSiteID != "") { channelList.InnerHtml = SiteList(getSiteID); }
                    else { channelList.InnerHtml = SiteList(SiteID); }
                }
                #endregion 判断结束
                string types = Request.QueryString["type"];
                if (types == "del")
                {
                    int id = int.Parse(Request.QueryString["id"]);
                    del(id);
                }
                string _userlock = "";
                string _group = "";
                string _iscerts = "";
                string _SiteID = "";
                string userlock = Request.QueryString["usertype"];
                string group = Request.QueryString["GroupNumber"];
                string iscerts = Request.QueryString["iscert"];
                string ReqSite = Request.QueryString["SiteID"];
                if (userlock != null && userlock != "") { _userlock = userlock.ToString(); }
                if (group != null && group != "") { _group = group.ToString(); }
                if (iscerts != null && iscerts != "") { _iscerts = iscerts.ToString(); }
                if (ReqSite != null && ReqSite != "") { _SiteID = SiteID.ToString(); }
                StartLoad(1, "", "", "", "", "", "", "", "", _userlock, _group, _iscerts, _SiteID);
            }
        }
        /// <summary>
        /// 得到站点列表
        /// </summary>
        /// <param name="SessionSiteID"></param>
        /// <returns></returns>
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
                    if (getSiteID != SiteID1) { siteStr += "<option value=\"" + crs.Rows[i]["ChannelID"] + "\">==" + crs.Rows[i]["CName"] + "==</option>\r"; }
                    else { siteStr += "<option value=\"" + crs.Rows[i]["ChannelID"] + "\"  selected=\"selected\">==" + crs.Rows[i]["CName"] + "==</option>\r"; }
                }
                crs.Clear(); crs.Dispose();
            }
            siteStr += "</select>\r";
            return siteStr;
        }

        /// <summary>
        /// 获取会员列表转向菜单
        /// </summary>
        /// <param name="getGroupNumber"></param>
        /// <returns></returns>
        string groups(string getGroupNumber)
        {
            string liststr = "<select class=\"xselect1\" name=\"grouplist\" id=\"grouplist\" onChange=\"getFormInfo(this)\">\r";
            liststr += "<option value=\"\">==所有会员组==</option>\r";
            DataTable rdr = UL.GroupList();
            if (rdr != null)
            {
                for (int i = 0; i < rdr.Rows.Count; i++)
                {
                    string GroupNumbers = getGroupNumber.ToString();
                    string GroupNumbers1 = rdr.Rows[i]["GroupNumber"].ToString();
                    if (GroupNumbers != GroupNumbers1) { liststr += "<option value=\"" + rdr.Rows[i]["GroupNumber"] + "\">==" + rdr.Rows[i]["GroupName"] + "==</option>\r"; }
                    else { liststr += "<option value=\"" + rdr.Rows[i]["GroupNumber"] + "\"  selected=\"selected\">==" + rdr.Rows[i]["GroupName"] + "==</option>\r"; }
                }
                rdr.Clear(); rdr.Dispose();
            }
            liststr += "</select>\r";
            return liststr;
        }

        //获得列表
        protected void PageNavigator1_PageChange(object sender, int PageIndex)
        {
            string _userlock = "";
            string _group = "";
            string _iscerts = "";
            string _SiteID = "";
            string userlock = Request.QueryString["usertype"];
            string group = Request.QueryString["GroupNumber"];
            string iscerts = Request.QueryString["iscert"];
            string ReqSite = Request.QueryString["SiteID"];
            if (userlock != null && userlock != "") { _userlock = userlock.ToString(); }
            if (group != null && group != "") { _group = group.ToString(); }
            if (iscerts != null && iscerts != "") { _iscerts = iscerts.ToString(); }
            if (ReqSite != null && ReqSite != "") { _SiteID = SiteID.ToString(); }
            if (iscerts == "1")
            {
                this.Authority_Code = "U009";
                this.CheckAdminAuthority();
            }
            StartLoad(PageIndex, null, null, null, null, null, null, null, null, _userlock, _group, _iscerts, _SiteID);
        }

        protected void StartLoad(int PageIndex, string UName, string RealName, string UserID, string Sex, string siPoint, string biPoint, string sgPoint, string bgPoint, string _userlock, string _group, string _iscerts, string _SiteID)
        {
            int i = 0;
            int j = 0;
            DataTable dt = UL.GetPage(UName, RealName, UserID, Sex, siPoint, biPoint, sgPoint, bgPoint, _userlock, _group, _iscerts, _SiteID, PageIndex, 20, out i, out j, null);
            this.PageNavigator1.PageCount = j;
            this.PageNavigator1.PageIndex = PageIndex;
            this.PageNavigator1.RecordCount = i;
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    dt.Columns.Add("userNames", typeof(string));
                    dt.Columns.Add("lock", typeof(string));
                    dt.Columns.Add("groupname", typeof(string));
                    dt.Columns.Add("op", typeof(string));
                    for (int k = 0; dt.Rows.Count > k; k++)
                    {
                        RootPublic rdr = new RootPublic();
                        if (dt.Rows[k]["username"].ToString().Equals(rdr.GetUserName(UserNum)))
                        {
                            continue;
                        }
                        dt.Rows[k]["op"] = "<a href=\"userinfo.aspx?UserNum=" + dt.Rows[k]["UserNum"] + "&id=" + dt.Rows[k]["id"].ToString() + "\">修改</a><a href=\"usermycom.aspx?UserNum=" + dt.Rows[k]["UserNum"] + "\">评论</a>";
                        if (!dt.Rows[k]["username"].ToString().Equals(rdr.GetUserName(UserNum)))
                        {
                            if (dt.Rows[k]["isAdmin"].ToString().Equals("0"))
                            {
                                dt.Rows[k]["op"] += "<a href=\"userlist.aspx?id=" + dt.Rows[k]["id"] + "&type=del\" onClick=\"{if(confirm('确定要删除吗？')){return true;}return false;}\">删除</a>";
                            }
                        }
                        dt.Rows[k]["op"] += "<input type=\"checkbox\" name=\"uid\" value=\"" + dt.Rows[k]["id"] + "\" /><a href=\"pointhistory.aspx?UserNum=" + dt.Rows[k]["UserNum"].ToString() + "\" title=\"查看此会员的冲值记录\">[冲值]</a>";
                        if (dt.Rows[k]["isLock"].ToString() == "1") { dt.Rows[k]["lock"] = "<span class=\"tbie\">锁定</span>"; }
                        else { dt.Rows[k]["lock"] = "正常"; }
                        string result = UL.getGroupName(dt.Rows[k]["UserGroupNumber"].ToString());
                        if (result != null && result != "") { dt.Rows[k]["groupname"] = result; }
                        else { dt.Rows[k]["groupname"] = "--"; }
                        string _TmpAdmin = "普通会员";
                        string _classTF = dt.Rows[k]["username"].ToString();
                        if (dt.Rows[k]["isAdmin"].ToString() == "1")
                        {
                            _TmpAdmin = "管理员";
                            _classTF = "<span class=\"reshow\">" + dt.Rows[k]["username"].ToString() + "</span>";
                        }
                        dt.Rows[k]["userNames"] = "<a href=\"../../" + YSCMS.Config.UIConfig.dirUser + "/showuser-" + dt.Rows[k]["username"].ToString() + ".aspx\" target=\"_blank\" title=\"" + _TmpAdmin + "&#13;点击查看[" + dt.Rows[k]["username"].ToString() + "]的信息.\">" + _classTF + "</a>";
                    }
                }
            }
            userlists.DataSource = dt;                              //设置datalist数据源
            userlists.DataBind();                                   //绑定数据源
        }

        protected void del(int id)
        {
            this.Authority_Code = "U002";
            this.CheckAdminAuthority();
            if (UL.Dels(id.ToString()) == 0) { PageError("删除失败", "UserList.aspx"); }
            else { PageRight("删除成功", "UserList.aspx"); }
        }

        protected void islock(object sender, EventArgs e)
        {
            this.Authority_Code = "U004";
            this.CheckAdminAuthority();
            string uid = Request.Form["uid"];
            if (uid == "" || uid == null)
            { PageError("请选择一个会员进行操作<br />", ""); }
            if (UL.Update(uid, "islock", "1") == 0) { PageError("锁定失败", "UserList.aspx"); }
            else { PageRight("锁定成功", "UserList.aspx"); }
        }

        protected void unlock(object sender, EventArgs e)
        {
            this.Authority_Code = "U004";
            this.CheckAdminAuthority();
            string uid = Request.Form["uid"];
            if (uid == "" || uid == null) { PageError("请选择一个会员进行操作<br />", ""); }
            if (UL.Update(uid, "islock", "0") == 0) { PageError("解锁失败", "UserList.aspx"); }
            else { PageRight("解锁成功", "UserList.aspx"); }
        }

        protected void dels(object sender, EventArgs e)
        {
            this.Authority_Code = "U002";
            this.CheckAdminAuthority();

            string uid = Request.Form["uid"];
            if (uid == "" || uid == null)
            {
                PageError("请选择一个会员进行操作<br />", "");
            }

            if (UL.Dels(uid) == 0)
            {
                PageError("批量删除失败", "UserList.aspx");
            }
            else
            {
                PageRight("批量删除成功", "UserList.aspx");
            }
        }

        protected void bIpoint(object sender, EventArgs e)
        {
            string uid = Request.Form["uid"];
            if (uid == "" || uid == null)
            {
                PageError("请选择一个会员进行操作<br />", "UserList.aspx");
            }
            else
            {
                Response.Redirect("useraction.aspx?PointType=bIpoint&uid=" + uid.Trim() + "");
            }
        }


        protected void sIpoint(object sender, EventArgs e)
        {
            string uid = Request.Form["uid"];
            if (uid == "" || uid == null)
            {
                PageError("请选择一个会员进行操作<br />", "UserList.aspx");
            }
            else
            {
                Response.Redirect("useraction.aspx?PointType=sIpoint&uid=" + uid.Trim() + "");
            }

        }

        protected void bGpoint(object sender, EventArgs e)
        {
            string uid = Request.Form["uid"];
            if (uid == "" || uid == null)
            {
                PageError("请选择一个会员进行操作<br />", "UserList.aspx");
            }
            else
            {
                Response.Redirect("useraction.aspx?PointType=bGpoint&uid=" + uid.Trim() + "");
            }
        }


        protected void sGpoint(object sender, EventArgs e)
        {
            string uid = Request.Form["uid"];
            if (uid == "" || uid == null)
            {
                PageError("请选择一个会员进行操作<br />", "UserList.aspx");
            }
            else
            {
                Response.Redirect("useraction.aspx?PointType=sGpoint&uid=" + uid.Trim() + "");
            }
        }
        protected void Button8_ServerClick(object sender, EventArgs e)
        {
            this.Authority_Code = "U010";
            this.CheckAdminAuthority();
            string ReqName = Request.Form["username"];
            string RealName = Request.Form["realname"];
            string ReqUNum = Request.Form["userNum"];
            string Sex = Request.Form["sex"];
            string siPoint = Request.Form["ipoint"];
            string biPoint = Request.Form["bipoint"];
            string sgPoint = Request.Form["gpoint"];
            string bgPoint = Request.Form["bgpoint"];
            string _userlock = Request.QueryString["userlock"];
            string _group = Request.QueryString["GroupNumber"];
            string _iscerts = Request.QueryString["iscert"];
            string _SiteID = Request.QueryString["SiteID"];
            StartLoad(1, ReqName, RealName, ReqUNum, Sex, siPoint, biPoint, sgPoint, bgPoint, _userlock, _group, _iscerts, _SiteID);
        }
    }
}