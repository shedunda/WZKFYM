using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace YSCMS.PageView.Manage.Adapt
{
    public partial class Delete : YSCMS.PageBasic.ManagePage
    {
        public Delete()
        {
            Authority_Code = "Q030";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string appid = Request.QueryString["appid"];
            YSCMS.Config.API.APIConfig config = YSCMS.Config.API.APIConfigs.GetConfig();
            YSCMS.Config.API.ApplicationInfo _appInfo = null;
            if (config.ApplicationList != null)
            {
                foreach (YSCMS.Config.API.ApplicationInfo appInfo in config.ApplicationList)
                {
                    if (appInfo.AppID == appid)
                    {
                        _appInfo = appInfo;
                        break;
                    }
                }
                if (_appInfo != null)
                {
                    config.ApplicationList.Remove(_appInfo);
                    YSCMS.Config.API.APIConfigs.SaveConfig(config);
                }
            }
            Response.Redirect("Adapt.aspx");
        }
    }
}