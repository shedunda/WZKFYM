﻿using System;
using System.Data;
using System.Text.RegularExpressions;
using YSCMS.CMS;
using YSCMS.Model;
using YSCMS.Publish;

namespace YSCMS.PageView
{
    public partial class Page : YSCMS.PageBasic.BasePage
    {
        protected string dimm = YSCMS.Config.UIConfig.dirDumm;
        protected string TempletDir = YSCMS.Config.UIConfig.dirTemplet;
        public static string gInstallDir = "{$InstallDir}";
        public static string gTempletDir = "{$TempletDir}";
        protected void Page_Load(object sender, EventArgs e)
        {
            string ClassID = Request.QueryString["id"];
            string gChID = Request.QueryString["ChID"];
            int ChID = 0;
            if (gChID != null && gChID != string.Empty)
            {
                if (YSCMS.Common.Input.IsInteger(gChID.ToString()))
                {
                    ChID = int.Parse(gChID.ToString());
                }
            }
            string TempletPath = string.Empty;
            string SiteRootPath = YSCMS.Common.ServerInfo.GetRootPath() + "\\";
            string strTempletDir = TempletDir;
            string finallyContent = string.Empty;
            if (dimm.Trim() != string.Empty) { dimm = "/" + dimm; }
            CommonData.Initialize();
            if (ChID != 0)
            {
                PubCHClassInfo CHinfo = CommonData.GetCHClassById(int.Parse(ClassID));
                if (CHinfo != null)
                {
                    TempletPath = CHinfo.Templet;
                    TempletPath = TempletPath.Replace("/", "\\").ToLower();
                    TempletPath = TempletPath.ToLower().Replace("{@dirtemplet}", strTempletDir);
                    TempletPath = SiteRootPath.Trim('\\') + TempletPath;
                    Template newschTemplate = new Template(TempletPath, TempType.ChClass);
                    newschTemplate.CHNewsID = 0;
                    newschTemplate.ChID = ChID;
                    newschTemplate.CHClassID = int.Parse(ClassID);
                    newschTemplate.GetHTML();
                    newschTemplate.ReplaceLabels();
                    finallyContent = newschTemplate.FinallyContent;
                    finallyContent = finallyContent.Replace("{#Page_Title}", CHinfo.classCName);
                    finallyContent = finallyContent.Replace("{#Page_MetaKey}", CHinfo.MetaKeywords);
                    finallyContent = finallyContent.Replace("{#Page_MetaDesc}", CHinfo.MetaDescript);
                    finallyContent = finallyContent.Replace("{#Page_Content}", CHinfo.PageContent);
                }
            }
            else
            {
                PubClassInfo info = CommonData.GetClassById(ClassID);
                if (info != null)
                {
                    TempletPath = info.ClassTemplet;
                    TempletPath = TempletPath.Replace("/", "\\").ToLower();
                    TempletPath = TempletPath.ToLower().Replace("{@dirtemplet}", strTempletDir);
                    TempletPath = SiteRootPath.Trim('\\') + TempletPath;
                    Template newsTemplate = new Template(TempletPath, TempType.Class);
                    newsTemplate.NewsID = null;
                    newsTemplate.ClassID = ClassID;
                    newsTemplate.GetHTML();
                    newsTemplate.ReplaceLabels();
                    finallyContent = newsTemplate.FinallyContent;
                    finallyContent = finallyContent.Replace("{#Page_Title}", info.ClassCName);
                    finallyContent = finallyContent.Replace("{#Page_MetaKey}", info.MetaKeywords);
                    finallyContent = finallyContent.Replace("{#Page_MetaDesc}", info.MetaDescript);
                    finallyContent = finallyContent.Replace("{#Page_Content}", info.PageContent);
                    finallyContent = finallyContent.Replace("{#Page_Navi}", "<a href=\"" + dimm + "/\">首页</a> >> " + info.ClassCName);
                    string PageStyles = YSCMS.Common.Public.readparamConfig("PageStyle");
                    if (PageStyles == "4") PageStyles = "0";
                    int pageIndex = 1;
                    if (Request.QueryString["Page"] != null && Request.QueryString["Page"] != "")
                    {
                        pageIndex = Convert.ToInt32(Request.QueryString["Page"]);
                    }
                    string PageMid = info.PageContent;
                    string[] ArrayCon = Regex.Split(PageMid, @"\[YS:PAGE\]", RegexOptions.IgnoreCase);
                    int n = 0;
                    if (ArrayCon != null)
                    {
                        n = ArrayCon.Length;
                    }
                    string PageLinkCount = YSCMS.Common.Public.readparamConfig("PageLinkCount");
                    if (string.IsNullOrEmpty(PageLinkCount)) PageLinkCount = "10";
                    finallyContent = finallyContent.Replace("{#Page_Split}", General.GetPageLinkTextStrPage(PageStyles, pageIndex, n, Convert.ToInt32(PageLinkCount), "page-" + ClassID, YSCMS.Config.UIConfig.extensions));

                }
            }
            if (Regex.Match(finallyContent, @"\</head\>[\s\S]*\<body", RegexOptions.IgnoreCase | RegexOptions.Compiled).Success)
            {
                finallyContent = Regex.Replace(finallyContent, "<body", getjs() + "<body", RegexOptions.IgnoreCase | RegexOptions.Compiled);
            }
            else
            {
                finallyContent = getjs() + finallyContent;
            }
            finallyContent = (finallyContent.Replace(gInstallDir, YSCMS.Common.Public.GetSiteDomain())).Replace(gTempletDir, TempletDir);
            Response.Write(finallyContent);
        }

        protected string getjs()
        {
            string siteDomain = YSCMS.Common.Public.GetSiteDomain();
            string getajaxJS = "<script language=\"javascript\" type=\"text/javascript\" src=\"" + siteDomain + "/Scripts/jquery.js\"></script>\r\n";
            getajaxJS += "<script language=\"javascript\" type=\"text/javascript\" src=\"" + siteDomain + "/Scripts/public.js\"></script>\r\n";
            getajaxJS += "<script language=\"javascript\" type=\"text/javascript\" src=\"" + siteDomain + "/Scripts/jspublick.js\"></script>\r\n";
            getajaxJS += "<script language=\"javascript\" type=\"text/javascript\" src=\"" + siteDomain + "/ckplayer/js/ckplayer.js\"></script>\r\n";
            getajaxJS += "<script language=\"javascript\" type=\"text/javascript\" src=\"" + siteDomain + "/ckplayer/js/load.js\"></script>\r\n";
            getajaxJS += "<link href=\"/sysImages/css/PagesCSS.css\" rel=\"stylesheet\" type=\"text/css\" />";
            getajaxJS += "\r\n<!--Created by (c) 1993-2014 Yuesi Information Technology Co., Ltd. " + YSCMS.Config.verConfig.Productversion + " Published at " + DateTime.Now + "-->\r\n";
            return getajaxJS;
        }
    }
}