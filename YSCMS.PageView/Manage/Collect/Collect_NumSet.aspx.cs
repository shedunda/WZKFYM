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

namespace YSCMS.PageView.Manage.Collect
{
    public partial class Collect_NumSet : YSCMS.PageBasic.ManagePage
    {
        public Collect_NumSet()
        {
            Authority_Code = "S011";
        }
        protected int nid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                nid = int.Parse(Request.QueryString["id"]);
            }
            else
            {
                YSCMS.Common.MessageBox.Show(this, "参数不正确!");
            }
        }
    }
}
