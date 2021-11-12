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
using System.Xml;
using YSCMS.CMS;
using YSCMS.Common;

namespace YSCMS.PageView.Manage.Adapt
{
    public partial class Adapt : YSCMS.PageBasic.ManagePage
    {
        public Adapt()
        {
            Authority_Code = "Q030";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
                return;
            YSCMS.Config.API.APIConfig config = YSCMS.Config.API.APIConfigs.GetConfig();
            this.Api_Key.Text = config.AppKey;
            this.Api_Enable.Checked = config.Enable;
            this.TextBoxAppID.Text = config.AppID;

            this.RepeaterApplist.DataSource = config.ApplicationList;
            this.RepeaterApplist.DataBind();
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if (!this.IsValid)
                return;
            YSCMS.Config.API.APIConfig config = YSCMS.Config.API.APIConfigs.GetConfig();
            config.Enable = this.Api_Enable.Checked;
            config.AppID = this.TextBoxAppID.Text;
            config.AppKey = this.Api_Key.Text;
            YSCMS.Config.API.APIConfigs.SaveConfig(config);
            Response.Redirect(Request.Url.ToString());
        }

        protected void RepeaterApplist_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem ||
                e.Item.ItemType == ListItemType.Item)
            {
                YSCMS.Config.API.ApplicationInfo appInfo = e.Item.DataItem as YSCMS.Config.API.ApplicationInfo;
                Literal LiteralAppID = e.Item.FindControl("LiteralAppID") as Literal;
                Literal LiteralAppUrl = e.Item.FindControl("LiteralAppUrl") as Literal;

                HyperLink hpedit = e.Item.FindControl("hpedit") as HyperLink;
                HyperLink hpdelete = e.Item.FindControl("hpdelete") as HyperLink;

                LiteralAppID.Text = appInfo.AppID;
                LiteralAppUrl.Text = appInfo.AppUrl;

                hpedit.NavigateUrl = string.Format("Edit.aspx?appid={0}", Server.UrlEncode(appInfo.AppID));
                hpdelete.NavigateUrl = string.Format("Delete.aspx?appid={0}", Server.UrlEncode(appInfo.AppID));
            }
        }
    }
}