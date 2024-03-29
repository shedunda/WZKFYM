﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.IO;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using YSCMS.CMS;

namespace YSCMS.PageView.Configuration.system
{
    public partial class Upload_User : YSCMS.PageBasic.DialogPage
    {
        public Upload_User()
        {
            BrowserAuthor = EnumDialogAuthority.ForAdmin | EnumDialogAuthority.ForPerson;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "no-cache";

            string Type = Request.QueryString["Type"];                      //取得参数以判断是否上传文件
            if (Type == "Upload")
            {
                string Path = Server.UrlDecode(Request.QueryString["Path"]);                  //取得上传文件所要保存的路径
                user rd = new user();
                string str_dirMana = YSCMS.Config.UIConfig.dirDumm;
                string str_dirSite = YSCMS.Config.UIConfig.dirSite;
                string str_dirUserFile = YSCMS.Config.UIConfig.UserdirFile;
                string str_dirFile = "";
                if (Request.QueryString["FileType"] == "user_discuss")
                {
                    str_dirFile = str_dirUserFile + "\\discuss\\" + YSCMS.Global.Current.UserNum;
                }
                else
                {
                    str_dirFile = str_dirUserFile + "\\" + YSCMS.Global.Current.UserNum;
                }

                if (str_dirMana != "" && str_dirMana != null && str_dirMana != string.Empty)
                    str_dirMana = "//" + str_dirMana;

                if (YSCMS.Global.Current.SiteID == "0")
                {
                    Path = Server.MapPath(str_dirMana + "\\" + str_dirFile + Path);
                }
                else
                {
                    Path = Server.MapPath(str_dirMana + "\\" + str_dirSite + "\\" + str_dirFile + Path);
                }

                YSCMS.CMS.RootPublic pd = new YSCMS.CMS.RootPublic();
                string _UserGroupNumber = pd.GetUserGroupNumber(YSCMS.Global.Current.UserNum);
                string[] getTypes = rd.getuserUpFile(_UserGroupNumber).Split('|');
                YSCMS.CMS.UpLoad tt = new YSCMS.CMS.UpLoad(); //实例化上传类
                tt.FileLength = int.Parse(getTypes[1]);                 //为类参数赋值,此为上传文件允许的大小值,单位kb
                tt.Extension = getTypes[0];                             //为类参数赋值,此为上传文件允许上传的类型,以","号分隔
                tt.SavePath = Path;                                     //为类参数赋值,此为上传文件保存的路径
                tt.PostedFile = file.PostedFile;                        //为类参数赋值,此为上传文件所读取的上传控件值
                string[] ReturnStr = tt.Upload(0, 0, radFileType.SelectedValue, 500).Split('$');
                if (ReturnStr[1] == "1")
                {
                    string s_rpath = Server.UrlDecode(Request.QueryString["Path"]);
                    string s_rppath = Server.UrlDecode(Request.QueryString["ParentPath"]);
                    s_rpath = s_rpath.Replace("\\", "\\\\");
                    s_rppath = s_rppath.Replace("\\", "\\\\");
                    Response.Write("<script language=\"javascript\">window.opener.ListGo('" + s_rpath + "','" + s_rppath + "');alert('" + ReturnStr[0] + "文件上传成功!');window.close();</script>");
                    Response.End();
                }
                else
                {
                    PageError("" + ReturnStr[0] + "<br/><a href=\"javascript:history.back()\"><font color=\"red\">返回</font></a>&nbsp;&nbsp;&nbsp;<a href=\"javascript:window.close()\"><font color=\"red\">关闭窗口</font></a>", "");
                }
            }
        }
    }
}