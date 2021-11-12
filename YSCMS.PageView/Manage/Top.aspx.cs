using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace YSCMS.PageView.Manage
{
    public partial class Top : YSCMS.PageBasic.ManagePage
    {
        public string dayofnow = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dayofnow = DateTime.Now.ToString("yyyy年MM月dd日") + "    " + System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.GetDayName(DateTime.Now.DayOfWeek);
            }
        }
    }
}