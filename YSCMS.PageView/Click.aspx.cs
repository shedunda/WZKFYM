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

namespace YSCMS.PageView
{
    public partial class Click : YSCMS.PageBasic.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string NewsID = Request.QueryString["id"];
            YSCMS.CMS.News news = new YSCMS.CMS.News();
            Response.Write(news.AddNewsClick(NewsID));
        }
    }
}
