﻿using System;
using System.Data;
using System.Text.RegularExpressions;
using YSCMS.CMS;
using YSCMS.Model;
using YSCMS.Publish;

namespace YSCMS.PageView
{
    public partial class List : YSCMS.PageBasic.BasePage
    {
        protected static string dimm = YSCMS.Config.UIConfig.dirDumm;
        protected static string TempletDir = YSCMS.Config.UIConfig.dirTemplet;
        protected static string SiteRootPath = YSCMS.Common.ServerInfo.GetRootPath();
        public static string gInstallDir = "{$InstallDir}";
        public static string gTempletDir = "{$TempletDir}";
        protected void Page_Load(object sender, EventArgs e)
        {
            string ClassID = Request.QueryString["id"];
            string gPage = Request.QueryString["Page"];
            string gChID = Request.QueryString["ChID"];
            int ChID = 0;
            if (gChID != null && gChID != string.Empty)
            {
                if (YSCMS.Common.Input.IsInteger(gChID.ToString()))
                {
                    ChID = int.Parse(gChID.ToString());
                }
            }
            int strPage = 1;
            if (dimm.Trim() != string.Empty)
            {
                dimm = "/" + dimm;
            }
            if (gPage != string.Empty && gPage != null && YSCMS.Common.Input.IsInteger(gPage))
            {
                strPage = int.Parse(gPage);
            }
            CommonData.Initialize();
            string getContent = string.Empty;
            string TmpPath = string.Empty;
            string TMPSavePath = string.Empty;
            string saveClassPath = string.Empty;
            if (ChID != 0)
            {
                PubCHClassInfo chinfo = CommonData.GetCHClassById(int.Parse(ClassID));
                if (chinfo != null)
                {
                    string dirHTML = YSCMS.Common.Public.readCHparamConfig("htmldir", ChID);
                    dirHTML = dirHTML.Replace("{@dirHTML}", YSCMS.Config.UIConfig.dirHtml);
                    TMPSavePath = chinfo.SavePath.Trim();
                    if (TMPSavePath.Substring(0, 1) != "/") { TMPSavePath = "\\" + TMPSavePath; }
                    saveClassPath = (dirHTML + TMPSavePath + "\\" + chinfo.FileName.Trim()).Replace("/", @"\\");
                    TmpPath = SiteRootPath + saveClassPath;
                    if (chinfo.isDelPoint == 0)
                    {
                        getContent = getContentRuslt(ChID, chinfo.Templet, ClassID, strPage, TmpPath, 0);
                    }
                    else
                    {
                        GetPop(ChID, chinfo.isDelPoint, chinfo.iPoint, chinfo.Gpoint, chinfo.GroupNumber, chinfo.Templet, ClassID, strPage, TmpPath);
                    }
                }
            }
            else
            {
                PubClassInfo info = CommonData.GetClassById(ClassID);
                if (info != null)
                {
                    TMPSavePath = info.SavePath.Trim();
                    if (TMPSavePath.Substring(0, 1) != "/") { TMPSavePath = "\\" + TMPSavePath; }
                    saveClassPath = (TMPSavePath + "\\" + info.SaveClassframe + '\\' + info.ClassSaveRule.Trim()).Replace("/", @"\\");
                    TmpPath = SiteRootPath + saveClassPath;
                    if (info.isDelPoint == 0)
                    {
                        getContent = getContentRuslt(ChID, info.ClassTemplet, ClassID, strPage, TmpPath, 0);
                    }
                    else
                    {
                        getContent = GetPop(ChID, info.isDelPoint, info.iPoint, info.Gpoint, info.GroupNumber, info.ClassTemplet, ClassID, strPage, TmpPath);
                    }
                }
            }
            if (Regex.Match(getContent, @"\</head\>[\s\S]*\<body", RegexOptions.IgnoreCase | RegexOptions.Compiled).Success)
            {
                getContent = Regex.Replace(getContent, "<body", getjs() + "<body", RegexOptions.IgnoreCase | RegexOptions.Compiled);
            }
            else
            {
                getContent = getjs() + getContent;
            }
            getContent = (getContent.Replace(gInstallDir, YSCMS.Common.Public.GetSiteDomain())).Replace(gTempletDir, TempletDir);
            Response.Write(getContent);
        }

        protected string GetPop(int ChID, int isPop, int intgiPoint, int intGpoint, string strGroupNumber, string strClassTemplet, string ClassID, int strPage, string TmpPath)
        {
            #region 扣点
            string getContent = string.Empty;
            if (YSCMS.Global.Current.IsTimeout())
            {
                string Url = YSCMS.Common.Input.URLEncode(Request.Url.ToString());
                Response.Redirect(YSCMS.Config.UIConfig.dirUser + "/login.aspx?reurl=1&urls=" + Url + "", true);
            }
            else
            {
                string UserNum = YSCMS.Global.Current.UserNum;
                string IP = Request.ServerVariables["REMOTE_ADDR"];
                int PointType = isPop;
                //新闻的参数
                int iPoint = intgiPoint;
                int Gpoint = intGpoint;
                string GroupNumber = strGroupNumber;


                int iuserPoint = 0;
                int Guserpoint = 0;
                string userGroupNumber = string.Empty;
                DynamicTrans dyNews = new DynamicTrans();
                IDataReader rd = dyNews.getUserInfo(UserNum);
                if (rd.Read())
                {
                    iuserPoint = int.Parse(rd["iPoint"].ToString());
                    Guserpoint = int.Parse(rd["Gpoint"].ToString());
                    userGroupNumber = rd["UserGroupNumber"].ToString();
                }
                rd.Close();

                switch (PointType)
                {
                    case 1:
                        if (dyNews.getUserNote(UserNum, ClassID, 1))
                        {
                            getContent = getContentRuslt(ChID, strClassTemplet, ClassID, strPage, TmpPath, 1);
                        }
                        else
                        {
                            if (Guserpoint < Gpoint || getGroup(userGroupNumber, GroupNumber) == false)
                            {
                                PageError("G币不足,需要G币:" + Gpoint + "<li>或者您所在的组不能浏览</li>", "");
                            }
                            else
                            {
                                if (dyNews.UpdateHistory(1, ClassID, 0, Gpoint, UserNum, IP) == 1)
                                {
                                    getContent = getContentRuslt(ChID, strClassTemplet, ClassID, strPage, TmpPath, 1);
                                }
                            }
                        }
                        break;
                    case 2:
                        if (dyNews.getUserNote(UserNum, ClassID, 1))
                        {
                            getContent = getContentRuslt(ChID, strClassTemplet, ClassID, strPage, TmpPath, 1);
                        }
                        else
                        {
                            if (iuserPoint < iPoint || getGroup(userGroupNumber, GroupNumber) == false)
                            {
                                PageError("积分不足,需要积分:" + iPoint + "<li>或者您所在的组不能浏览</li>", "");
                            }
                            else
                            {
                                if (dyNews.UpdateHistory(1, ClassID, iPoint, 0, UserNum, IP) == 1)
                                {
                                    getContent = getContentRuslt(ChID, strClassTemplet, ClassID, strPage, TmpPath, 1);
                                }
                            }
                        }
                        break;
                    case 3:
                        if (dyNews.getUserNote(UserNum, ClassID, 1))
                        {
                            getContent = getContentRuslt(ChID, strClassTemplet, ClassID, strPage, TmpPath, 1);
                        }
                        else
                        {
                            if (iuserPoint < iPoint || Guserpoint < Gpoint || getGroup(userGroupNumber, GroupNumber) == false)
                            {
                                PageError("您的积分和G币不足,需要积分:" + iPoint + ",G币:" + Gpoint + "<li>或者您所在的组不能浏览</li>", "");
                            }
                            else
                            {
                                if (dyNews.UpdateHistory(1, ClassID, iPoint, Gpoint, UserNum, IP) == 1)
                                {
                                    getContent = getContentRuslt(ChID, strClassTemplet, ClassID, strPage, TmpPath, 1);
                                }
                            }
                        }
                        break;
                    case 4:
                        if (Guserpoint < Gpoint || getGroup(userGroupNumber, GroupNumber) == false)
                        {
                            PageError("您的G币没达到:" + Gpoint + "<li>或者您所在的组不能浏览</li>", "");
                        }
                        else
                        {
                            getContent = getContentRuslt(ChID, strClassTemplet, ClassID, strPage, TmpPath, 1);
                        }
                        break;
                    case 5:
                        if (iuserPoint < iPoint || getGroup(userGroupNumber, GroupNumber) == false)
                        {
                            PageError("您的G币没达到:" + iPoint + "<li>或者您所在的组不能浏览</li>", "");
                        }
                        else
                        {
                            getContent = getContentRuslt(ChID, strClassTemplet, ClassID, strPage, TmpPath, 1);
                        }
                        break;
                    case 6:
                        if (iuserPoint < iPoint || Guserpoint < Gpoint || getGroup(userGroupNumber, GroupNumber) == false)
                        {
                            PageError("您的积分或G币不足,需要达到积分:" + iPoint + ",G币:" + Gpoint + "<li>或者您所在的组不能浏览</li>", "");
                        }
                        else
                        {
                            getContent = getContentRuslt(ChID, strClassTemplet, ClassID, strPage, TmpPath, 1);
                        }
                        break;
                }
            }
            #endregion 扣点
            return getContent;
        }

        protected static string getContentRuslt(int ChID, string ClassTemplet, string ClassID, int strPage, string TmpPath, int isPop)
        {
            string TempletPath = string.Empty;
            string strTempletDir = TempletDir;
            string gConenent = string.Empty;
            TempletPath = ClassTemplet;
            TempletPath = TempletPath.Replace("/", "\\");
            TempletPath = TempletPath.ToLower().Replace("{@dirtemplet}", strTempletDir);
            TempletPath = SiteRootPath.Trim('\\') + TempletPath;
            Template classTemplate = null;
            if (ChID != 0)
            {
                classTemplate = new Template(TempletPath, TempType.ChClass);
                classTemplate.CHClassID = int.Parse(ClassID);
                classTemplate.ChID = ChID;
            }
            else
            {
                classTemplate = new Template(TempletPath, TempType.Class);
                classTemplate.ClassID = ClassID;
            }
            classTemplate.GetHTML();
            gConenent = replaceTemplate(classTemplate, ClassID, strPage, TmpPath, isPop);
            return gConenent;
        }

        protected bool getGroup(string uGroup, string nGroup)
        {
            return YSCMS.Common.Public.CommgetGroup(uGroup, nGroup);
        }


        /// <summary>
        /// 处理模板
        /// </summary>
        /// <param name="tempRe">模板实例</param>
        public static string replaceTemplate(Template tempRe, string ClassID, int strPage, string sTmpPath, int isPop)
        {
            tempRe.ReplaceLabels();
            string getPageContent = string.Empty;
            string getPageStr = string.Empty;
            bool getRight = false;
            string FinlContent = string.Empty;
            if (tempRe.MyTempType == TempType.Class || tempRe.MyTempType == TempType.ChClass)
            {
                FinlContent = tempRe.FinallyContent;
                int pos1 = FinlContent.IndexOf("{YSCMS:NewsLIST}");
                int pos2 = FinlContent.IndexOf("{/YSCMS:NewsLIST}");
                if (pos2 > pos1 && pos1 > -1)
                {
                    #region 处理分页
                    int getFiledot = sTmpPath.LastIndexOf(".");
                    int getFileg = sTmpPath.LastIndexOf("\\");
                    string getFileName = sTmpPath.Substring((getFileg + 1), ((getFiledot - getFileg) - 1));
                    string getFileEXName = sTmpPath.Substring(getFiledot);
                    string PageHead = FinlContent.Substring(0, pos1);
                    string PageEnd = FinlContent.Substring(pos2 + 18);
                    string PageMid = FinlContent.Substring(pos1 + 17, pos2 - pos1 - 17);
                    string pattern = @"\{\$YS\:P[01]\}\{Page\:\d\${1}[^\$]{0,6}\${1}.*\}";
                    Regex reg = new Regex(pattern, RegexOptions.Compiled);
                    Match match = reg.Match(PageMid);
                    if (match.Success)
                    {
                        if (YSCMS.Config.verConfig.PublicType == "0" || tempRe.MyTempType == TempType.ChClass)
                        {
                            string PageStr = match.Value;
                            int posPage = PageStr.IndexOf("}{Page:");

                            string postResult = PageStr.Substring(posPage + 7);
                            postResult = postResult.TrimEnd('}');
                            string[] postResultARR = postResult.Split('$');
                            string postResult_style = postResultARR[0];
                            string postResult_color = postResultARR[1];
                            string postResult_css = postResultARR[2];
                            string postResult_css1 = "";
                            if (postResult_css.Trim() != string.Empty)
                            {
                                postResult_css1 = " class=\"" + postResult_css + "\"";
                            }
                            string currentPageStyle = "";//当前页样式
                            string otherPageStyle = "";//其他页样式
                            string _styleRegex = @"\{YS\:PageLinksStyle=\w+\|\w+\}";
                            Regex _regStyle = new Regex(_styleRegex, RegexOptions.Compiled);
                            Match _maStyle = _regStyle.Match(FinlContent);
                            string _macthContent = _maStyle.Value;
                            int sfsd = FinlContent.IndexOf(_macthContent);
                            FinlContent = FinlContent.Substring(0, sfsd) + FinlContent.Substring(sfsd + _macthContent.Length, FinlContent.Length - (FinlContent.IndexOf(_macthContent) + _macthContent.Length));
                            _styleRegex = @"[^=]\w+\|\w+[^\}]";
                            _regStyle = new Regex(_styleRegex, RegexOptions.Compiled);
                            _maStyle = _regStyle.Match(_macthContent);
                            _macthContent = _maStyle.Value;
                            string[] strPageCSSName = null;
                            if (!string.IsNullOrEmpty(_macthContent))
                            {
                                strPageCSSName = _macthContent.Split('|');
                                currentPageStyle = strPageCSSName[0];
                                otherPageStyle = strPageCSSName[1];
                            }

                            string[] ArrayCon = reg.Split(PageMid);
                            int n = ArrayCon.Length;
                            if (ArrayCon[n - 1] == null || ArrayCon[n - 1].Trim() == string.Empty)
                                n--;
                            for (int i = 0; i < n; i++)
                            {
                                if (i == (strPage - 1))
                                {
                                    UltiPublish gpl = new UltiPublish(true);
                                    getPageStr = gpl.GetPagelist(postResult_style, i, getFileName, getFileEXName, postResult_color, postResult_css1, n, ClassID, "class", isPop, currentPageStyle, otherPageStyle);
                                    getPageContent = PageHead + ArrayCon[i] + getPageStr + PageEnd;
                                    if (getPageContent.IndexOf("{PageLists}") > 0)
                                    {
                                        getPageContent = PageHead + ArrayCon[i] + PageEnd;
                                        getPageContent = getPageContent.Replace("{PageLists}", getPageStr);
                                    }
                                    getRight = true;
                                }
                                if (getRight)
                                {
                                    break;
                                }
                            }
                        }
                        FinlContent = getPageContent;
                    }
                    else
                    {
                        string p1js = "<span style=\"text-align:center;\" id=\"gPtypenowdiv" + DateTime.Now.ToShortDateString() + "\">加载中...</span>";
                        p1js += "<script language=\"javascript\" type=\"text/javascript\">";
                        p1js += "pubajax('" + CommonData.SiteDomain + "/configuration/system/public.aspx','NowStr=" + DateTime.Now.ToShortDateString() + "&ruleStr=1','gPtypenowdiv" + DateTime.Now.ToShortDateString() + "');";
                        p1js += "</script>";
                        FinlContent = tempRe.FinallyContent.Replace("{YSCMS:NewsLIST}", "").Replace("{/YSCMS:NewsLIST}", "").Replace("{PageLists}", "").Replace("{$YS:P1}", p1js);
                    }
                    #endregion
                }
                else
                {
                    FinlContent = FinlContent.Replace("{PageLists}", "");
                }
            }

            return FinlContent;
        }

        protected static string getjs()
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



namespace YSCMS.PageView
{
    public partial class list : YSCMS.PageBasic.BasePage
    {
    }
}
