using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using YSCMS.CMS;
using System.Text.RegularExpressions;

namespace YSCMS.PageView
{
    public partial class _Default : YSCMS.PageBasic.BasePage
    {
        protected string SiteRootPath = YSCMS.Common.ServerInfo.GetRootPath();
        protected string dimm = YSCMS.Config.UIConfig.dirDumm;
        protected string TempletDir = YSCMS.Config.UIConfig.dirTemplet;
        public static string gInstallDir = "{$InstallDir}";
        public static string gTempletDir = "{$TempletDir}";
        protected void Page_Load(object sender, EventArgs e)
        {
            string gChID = Request.QueryString["ChID"];
            int ChID = 0;
            if (gChID != null && gChID != string.Empty)
            {
                if (YSCMS.Common.Input.IsInteger(gChID.ToString()))
                {
                    ChID = int.Parse(gChID.ToString());
                }
            }
            YSCMS.Publish.CommonData.Initialize();
            string indexname = "index.html";
            string TempletPath = YSCMS.Common.Public.readparamConfig("IndexTemplet");
            if (ChID != 0)
            {
                TempletPath = "/" + YSCMS.Config.UIConfig.dirTemplet + "/" + YSCMS.Common.Public.readCHparamConfig("channeltemplet", ChID);
            }
            TempletPath = TempletPath.Replace("/", "\\");
            TempletPath = TempletPath.ToLower().Replace("{@dirtemplet}", TempletDir);
            indexname = YSCMS.Common.Public.readparamConfig("IndexFileName");
            YSCMS.Publish.Template indexTemp = null;
            if (ChID != 0)
            {
                indexname = YSCMS.Common.Public.readCHparamConfig("channelindexname", ChID);
                indexTemp = new YSCMS.Publish.Template(SiteRootPath.Trim('\\') + TempletPath, YSCMS.Publish.TempType.ChIndex);
            }
            else
            {
                indexTemp = new YSCMS.Publish.Template(SiteRootPath.Trim('\\') + TempletPath, YSCMS.Publish.TempType.Index);
            }
            indexTemp.GetHTML();
            indexTemp.ReplaceLabels();
            string getContent = indexTemp.FinallyContent;

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

        protected string getjs()
        {
            string siteDomain = YSCMS.Common.Public.GetSiteDomain();
            string getajaxJS = "<script language=\"javascript\" type=\"text/javascript\" src=\"" + siteDomain + "/Scripts/jquery.js\"></script>\r\n";
            getajaxJS += "<script language=\"javascript\" type=\"text/javascript\" src=\"" + siteDomain + "/Scripts/public.js\"></script>\r\n";
            getajaxJS += "<script language=\"javascript\" type=\"text/javascript\" src=\"" + siteDomain + "/Scripts/jspublick.js\"></script>\r\n";
            getajaxJS += "<script language=\"javascript\" type=\"text/javascript\" src=\"" + siteDomain + "/ckplayer/js/ckplayer.js\"></script>\r\n";
            getajaxJS += "<script language=\"javascript\" type=\"text/javascript\" src=\"" + siteDomain + "/ckplayer/js/load.js\"></script>\r\n";
            getajaxJS += "\r\n<!--Created by (c) 1993-2014 Yuesi Information Technology Co., Ltd. " + YSCMS.Config.verConfig.Productversion + " Published at " + DateTime.Now + "-->\r\n";
            return getajaxJS;
        }
    }
}