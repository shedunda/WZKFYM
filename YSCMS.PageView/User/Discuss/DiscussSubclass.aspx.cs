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

namespace YSCMS.PageView.User.Discuss
{
    public partial class DiscussSubclass : YSCMS.PageBasic.UserPage
    {
        YSCMS.CMS.Discuss rd = new YSCMS.CMS.Discuss();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                sysClass.InnerHtml = showsysClass();
                string _ClassID = Request.QueryString["ClassID"];
                string _action = Request.QueryString["Action"];
                if (_ClassID != "" && _ClassID != null) { classLists.InnerHtml = getsClasslist(YSCMS.Common.Input.Filter(_ClassID.ToString())); }
                else { classLists.InnerHtml = getsClasslist(""); }
                if (_action != "" && _action != null)
                {
                    if (_action.ToString() == "del")
                    {
                        rd.getsClassDel(YSCMS.Common.Input.Filter(Request.QueryString["ID"].ToString()));
                        PageRight("删除成功", "discusssubclass.aspx");
                    }
                }
            }
        }

        protected string getsClasslist(string ClassID)
        {
            string _str = "";
            DataTable dt = rd.getsClasslist(ClassID);
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        _str += "<div class=\"dis_sub_c\"><a href=\"discusssubclass.aspx?ID=" + dt.Rows[i]["DcID"].ToString() + "&Action=del\" onclick=\"{if(confirm('确定要删除吗？')){return true;}return false;}\"><img src=\"../../sysImages/folder/dels.gif\" border=\"0\" title=\"删除\"></a>&nbsp;" + dt.Rows[i]["Cname"].ToString() + "</div>\r";
                    }
                }
                dt.Clear(); dt.Dispose();
            }

            return _str;
        }

        protected string showsysClass()
        {
            string _str = "";
            DataTable dt = rd.sel_5();
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        _str += "<a class=\"list_link\" href=\"discusssubclass.aspx?ClassID=" + dt.Rows[i]["DcID"].ToString() + "\">" + dt.Rows[i]["Cname"].ToString() + "</a>&nbsp;&nbsp;";
                    }
                }
                dt.Clear(); dt.Dispose();
            }

            return _str;
        }
    }
}

