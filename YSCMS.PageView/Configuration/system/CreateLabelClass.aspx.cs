using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace YSCMS.PageView.Configuration.system
{
    public partial class CreateLabelClass : YSCMS.PageBasic.ManagePage 
    {
        public string APIID = "0";
        YSCMS.CMS.Label rd = new YSCMS.CMS.Label();
        protected void Page_Load(object sender, EventArgs e)
        {
            APIID = SiteID;
            if (!IsPostBack)
            {
                string _dirdumm = YSCMS.Config.UIConfig.dirDumm;
                if (_dirdumm.Trim() != "") { _dirdumm = "/" + _dirdumm; }
                style_class.InnerHtml = YSCMS.Common.Public.getxmlstylelist("styleContent2", _dirdumm + "/xml/cuslabeStyle/cstyleClassInfo.xml");
            }
        }
    }
}