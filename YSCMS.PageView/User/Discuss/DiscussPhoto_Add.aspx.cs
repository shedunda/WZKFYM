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
    public partial class DiscussPhoto_Add : YSCMS.PageBasic.UserPage
    {
        YSCMS.CMS.Discuss dis = new YSCMS.CMS.Discuss();
        YSCMS.CMS.Photo pho = new YSCMS.CMS.Photo();
        public string dimm = YSCMS.Config.UIConfig.dirDumm;
        public string UserdirFile = YSCMS.Config.UIConfig.UserdirFile;
        protected void Page_Load(object sender, EventArgs e)
        {

            Response.CacheControl = "no-cache";
            if (!IsPostBack)
            {
                if (dimm.Trim() != string.Empty)
                {
                    dimm = dimm + "/";
                }
                string DisIDs = YSCMS.Common.Input.Filter(Request.QueryString["DisID"]);
                DataTable dts1 = dis.sel_23(DisIDs);
                this.DropDownList1.DataSource = dts1;
                this.DropDownList1.DataTextField = "PhotoalbumName";
                this.DropDownList1.DataValueField = "PhotoalbumID";
                this.DropDownList1.DataBind();
                sc.InnerHtml = Show_scs(DisIDs);
            }
        }
        protected void server_Click(object sender, EventArgs e)
        {
            string DisIDs = YSCMS.Common.Input.Filter(Request.QueryString["DisID"]);

            string PhotoUrl1 = YSCMS.Common.Input.Htmls(this.pic_p_1url.Text);
            string PhotoUrl2 = YSCMS.Common.Input.Htmls(this.pic_p_1ur2.Text);
            string PhotoUrl3 = YSCMS.Common.Input.Htmls(this.pic_p_1ur3.Text);
            bool flg = false;
            if (PhotoUrl1 != String.Empty && PhotoUrl1 != null)
            {
                flg = add_phtoto(PhotoUrl1);
            }

            if (PhotoUrl2 != String.Empty && PhotoUrl2 != null)
            {
                flg = add_phtoto(PhotoUrl2);
            }

            if (PhotoUrl3 != String.Empty && PhotoUrl3 != null)
            {
                flg = add_phtoto(PhotoUrl3);
            }

            if (!flg)
            {
                PageError("添加图片错误", "discussPhotoalbumlist.aspx?DisID=" + DisIDs + "");
            }
            else
            {
                PageRight("添加图片成功", "discussPhotoalbumlist.aspx?DisID=" + DisIDs + "");
            }
        }
        protected bool add_phtoto(string PValue)
        {
            string PhotoName = Request.Form["TextBox1"].ToString();

            string PhotoalbumID = this.DropDownList1.SelectedValue;

            string PhotoContent = Request.Form["TextBox2"].ToString();

            System.Threading.Thread.Sleep(10);
            string PhotoID = YSCMS.Common.Rand.Number(12);
            string UserNum = YSCMS.Global.Current.UserNum;

            YSCMS.Model.STPhoto ph = new YSCMS.Model.STPhoto();
            ph.PhotoContent = PhotoContent;
            ph.PhotoName = PhotoName;

            DataTable dID = pho.sel_3();
            int cut = dID.Rows.Count;
            string pID = "";
            if (cut > 0)
            {
                pID = dID.Rows[0]["PhotoID"].ToString();
            }
            if (DropDownList1.SelectedValue != "")
            {
                if (pID != PhotoID)
                {
                    if (pho.Add(ph, UserNum, PhotoalbumID, PValue, PhotoID) == 0)
                        return false;
                    return true;
                }
                return false;
            }
            return false;
        }

        string Show_scs(string DisID)
        {
            string scs = "<table width=\"100%\"  border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"toptable\">";
            scs += "<tr><td height=\"1\" colspan=\"2\"></td></tr>";
            scs +=
            scs += "<tr><td width=\"57%\"  class=\"sysmain_navi\"  style=\"PADDING-LEFT: 14px\" >相册管理</td>";
            scs += "<td width=\"43%\"  class=\"topnavichar\"  style=\"PADDING-LEFT: 14px\" ><div align=\"left\">位置导航：<a href=\"../main.aspx\" target=\"sys_main\" class=\"list_link\">首页</a><img alt=\"\" src=\"../../sysImages/folder/navidot.gif\" border=\"0\" />添加图片</div></td></tr></table>";
            scs += "<table width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"3\" cellspacing=\"1\" class=\"Navitable\">";
            scs += "<tr> <td><span class=\"topnavichar\" style=\"PADDING-LEFT: 14px\"><a href=\"discussPhotoalbumlist.aspx?DisID=" + DisID + "\" class=\"menulist\">相册首页</a>　<a href=\"discussphoto_add.aspx?DisID=" + DisID + "\" class=\"menulist\">添加图片</a> &nbsp;&nbsp;<a href=\"discussphotoclass.aspx?DisID=" + DisID + "\" class=\"menulist\">相册分类</a> &nbsp;&nbsp; <a href=\"discussPhotoalbum.aspx?DisID=" + DisID + "\" class=\"menulist\">添加相册</a></td></tr></table>";
            return scs;
        }
    }
}