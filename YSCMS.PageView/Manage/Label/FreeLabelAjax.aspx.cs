using System;
using System.Collections.Generic;
using YSCMS.Model;

namespace YSCMS.PageView.Manage.Label
{
    public partial class FreeLabelAjax : YSCMS.PageBasic.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.Form["Option"] != null)
                {
                    YSCMS.CMS.FreeLabel fb = new YSCMS.CMS.FreeLabel();
                    if (Request.Form["Option"].Equals("GetFields"))
                    {
                        if (Request.Form["TableName"] != null && !Request.Form["TableName"].Equals(""))
                        {
                            IList<FreeLablelDBInfo> fds = fb.GetFields(Request.Form["TableName"]);
                            int i = 0;
                            foreach (FreeLablelDBInfo info in fds)
                            {
                                if (i > 0)
                                    Response.Write(",");
                                Response.Write(info.Name);
                                i++;
                            }
                        }

                    }
                    else if (Request.Form["Option"].Equals("TestSQL"))
                    {

                    }
                }
            }
            Response.End();
        }
    }
}