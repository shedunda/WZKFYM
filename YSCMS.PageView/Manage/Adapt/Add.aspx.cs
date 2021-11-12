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
    public partial class Add : YSCMS.PageBasic.ManagePage
    {
        public Add()
        {
            Authority_Code = "Q030";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
                return;
            //YSCMS.Config.API.APIConfig config = YSCMS.Config.API.APIConfigs.GetConfig();

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if (!this.IsValid)
                return;
            YSCMS.Config.API.APIConfig config = YSCMS.Config.API.APIConfigs.GetConfig();
            if (config.ApplicationList == null)
                config.ApplicationList = new YSCMS.Config.API.ApplicaitonCollection();

            YSCMS.Config.API.ApplicationInfo appInfo = new YSCMS.Config.API.ApplicationInfo();
            appInfo.AppID = this.TextBoxAppID.Text;
            appInfo.AppUrl = this.Api_Url.Text;
            config.ApplicationList.Add(appInfo);
            YSCMS.Config.API.APIConfigs.SaveConfig(config);
            Response.Redirect("Adapt.aspx");
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            YSCMS.Config.API.APIConfig config = YSCMS.Config.API.APIConfigs.GetConfig();
            if (config.ApplicationList == null)
                config.ApplicationList = new YSCMS.Config.API.ApplicaitonCollection();
            foreach (YSCMS.Config.API.ApplicationInfo _appInfo in config.ApplicationList)
            {
                if (_appInfo.AppID.ToLower() == this.TextBoxAppID.Text.ToLower())
                {
                    args.IsValid = false;
                    break;
                }

            }
        }
    }
}