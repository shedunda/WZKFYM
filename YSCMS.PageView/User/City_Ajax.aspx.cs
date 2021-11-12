﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using YSCMS.CMS;

namespace YSCMS.PageView.User
{
    public partial class City_Ajax : System.Web.UI.Page
    {
        YSCMS.CMS.News Cnews = new YSCMS.CMS.News();
        protected void Page_Load(object sender, EventArgs e)
        {
            string cityid = Request.QueryString["CityId"];
            string result = "";
            if (!string.IsNullOrEmpty(cityid))
            {
                result = getCityList(cityid);
            }
            Response.Write(result);
            Response.End();
        }

        protected string getCityList(string id)
        {
            DataTable dt = Cnews.GetProvinceOrCityList(id);
            string ctr = "<select id=\"City\" name=\"City\" class=\"inpm width\">";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ctr += "<option value=\"" + dt.Rows[i][1].ToString() + "\">" + dt.Rows[i][0].ToString() + "</option>";
            }
            ctr += "</select>";
            return ctr;
        }
    }
}