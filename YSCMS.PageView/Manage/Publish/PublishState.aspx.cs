using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YSCMS.PageView.Manage.Publish
{
    public partial class PublishState : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string state = Request.QueryString["state"];
                if (YSCMS.Publish.UltiPublish.ths.ThreadState == System.Threading.ThreadState.Running && state == "suspen")
                {
                    YSCMS.Publish.UltiPublish.ths.Suspend();
                    Response.Write("0|OK");
                }
                else if (YSCMS.Publish.UltiPublish.ths.ThreadState == System.Threading.ThreadState.Suspended && state == "resume")
                {
                    YSCMS.Publish.UltiPublish.ths.Resume();
                    Response.Write("1|OK");
                }
            }
        }
    }
}