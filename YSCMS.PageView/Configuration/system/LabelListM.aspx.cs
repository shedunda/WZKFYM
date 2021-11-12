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

namespace YSCMS.PageView.Configuration.system
{
    public partial class LabelListM : YSCMS.PageBasic.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LabelList.InnerHtml = getLabelList("0", "┝");
                LabelList1.InnerHtml = getLabelList1("0", "┝");
            }
        }

        protected string getLabelList(string ParentID, string Tmp)
        {
            YSCMS.CMS.Label lb = new YSCMS.CMS.Label();
            DataTable dt = lb.getLableListM(0, ParentID);
            string str_tempList = "<table class=\"jstable\" style=\"width:97%\" align=\"center\">";
            if (dt != null)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    str_tempList += "<tr class=\"off\" onmouseover=\"this.className='on'\"onmouseout=\"this.className='off'\"><td style=\"width:20%\"><span class=\"reshow\">" + Tmp + dt.Rows[i]["ClassCName"].ToString() + "</span></td><td><span class=\"reshow\">终极：</span><a href=\"javascript:selectLabel('{FS_DynClassLD}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[终极]</a><a title=\"选择此项，则标签将调用此栏目的子类新闻\" href=\"javascript:selectLabel('{FS_DynClassLDC}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[子类]</a>┊<span class=\"reshow\">列表：</span><a href=\"javascript:selectLabel('{FS_DynClassD_" + dt.Rows[i]["ClassID"].ToString() + "}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[列表]</a><a title=\"选择此项，则标签将调用此栏目的子类新闻\" href=\"javascript:selectLabel('{FS_DynClassDC_" + dt.Rows[i]["ClassID"].ToString() + "}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[子类]</a>┊<span class=\"reshow\">RSS:</span><a href=\"javascript:selectLabel('{FS_DynClassR_" + dt.Rows[i]["ClassID"].ToString() + "}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[RSS]</a><span class=\"reshow\">导读:</span><a href=\"javascript:selectLabel('{FS_DynClassC_" + dt.Rows[i]["ClassID"].ToString() + "}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[导读]</a></td></tr>";
                    str_tempList += getchildLabelList(dt.Rows[i]["ClassID"].ToString(), "┝┅");
                }
                dt.Clear();
                dt.Dispose();
            }
            else
            {
                str_tempList += "<tr><td>当前没有标签</td></tr>";
            }
            str_tempList += "</table>";
            return str_tempList;
        }

        protected string getchildLabelList(string ParentID, string Tmp)
        {
            YSCMS.CMS.Label lb = new YSCMS.CMS.Label();
            DataTable dt = lb.getLableListM(0, ParentID);
            string str_tempList = "";
            Tmp += "┉";
            if (dt != null)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    str_tempList += "<tr class=\"off\" onmouseover=\"this.className='on'\"onmouseout=\"this.className='off'\"><td style=\"width:20%\"><span class=\"reshow\">" + Tmp + dt.Rows[i]["ClassCName"].ToString() + "</span></td><td><span class=\"reshow\">终极：</span><a href=\"javascript:selectLabel('{FS_DynClassLD}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[终极]</a><a title=\"选择此项，则标签将调用此栏目的子类新闻\" href=\"javascript:selectLabel('{FS_DynClassLDC}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[子类]</a>┊<span class=\"reshow\">列表：</span><a href=\"javascript:selectLabel('{FS_DynClassD_" + dt.Rows[i]["ClassID"].ToString() + "}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[列表]</a><a title=\"选择此项，则标签将调用此栏目的子类新闻\" href=\"javascript:selectLabel('{FS_DynClassDC_" + dt.Rows[i]["ClassID"].ToString() + "}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[子类]</a>┊<span class=\"reshow\">RSS:</span><a href=\"javascript:selectLabel('{FS_DynClassR_" + dt.Rows[i]["ClassID"].ToString() + "}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[RSS]</a><span class=\"reshow\">导读:</span><a href=\"javascript:selectLabel('{FS_DynClassC_" + dt.Rows[i]["ClassID"].ToString() + "}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[导读]</a></td></tr>";
                    str_tempList += getchildLabelList(dt.Rows[i]["ClassID"].ToString(), Tmp);
                }
                dt.Clear();
                dt.Dispose();
            }
            else
            {
                str_tempList += "当前没有标签";
            }
            return str_tempList;
        }

        /// <summary>
        /// 专题
        /// </summary>
        /// <param name="ParentID"></param>
        /// <param name="Tmp"></param>
        /// <returns></returns>
        protected string getLabelList1(string ParentID, string Tmp)
        {
            YSCMS.CMS.Label lb = new YSCMS.CMS.Label();
            DataTable dt = lb.getLableListM(1, ParentID);
            string str_tempList = "<table class=\"jstable\" style=\"width:97%\" align=\"center\">";
            if (dt != null)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    str_tempList += "<tr class=\"off\" onmouseover=\"this.className='on'\"onmouseout=\"this.className='off'\"><td style=\"width:20%\"><span  class=\"reshow\">" + Tmp + dt.Rows[i]["SpecialCName"].ToString() + "</span></td><td><span class=\"reshow\">终极：</span><a href=\"javascript:selectLabel('{FS_DynSpecialLD}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[终极]</a><a href=\"javascript:selectLabel('{FS_DynSpecialLDC}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[子类]</a>┊<span class=\"reshow\">列表：</span><a href=\"javascript:selectLabel('{FS_DynSpecialD_" + dt.Rows[i]["SpecialID"].ToString() + "}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[列表]</a><a href=\"javascript:selectLabel('{FS_DynSpecialDC_" + dt.Rows[i]["SpecialID"].ToString() + "}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[子类]</a>┊<span class=\"reshow\">导读：</span><a href=\"javascript:selectLabel('{FS_DynSpecialC_" + dt.Rows[i]["SpecialID"].ToString() + "}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[导读]</a></td></tr>";
                    str_tempList += getchildLabelList1(dt.Rows[i]["SpecialID"].ToString(), "┝┅");
                }
                dt.Clear();
                dt.Dispose();
            }
            else
            {
                str_tempList += "当前没有标签";
            }
            str_tempList += "</table>";
            return str_tempList;
        }

        protected string getchildLabelList1(string ParentID, string Tmp)
        {
            YSCMS.CMS.Label lb = new YSCMS.CMS.Label();
            DataTable dt = lb.getLableListM(1, ParentID);
            string str_tempList = "";
            Tmp += "┉";
            if (dt != null)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    str_tempList += "<tr class=\"off\" onmouseover=\"this.className='on'\"onmouseout=\"this.className='off'\"><td style=\"width:20%\"><span class=\"reshow\">" + Tmp + dt.Rows[i]["SpecialCName"].ToString() + "</span></td><td><span class=\"reshow\">终极：</span><a href=\"javascript:selectLabel('{FS_DynSpecialLD_" + dt.Rows[i]["SpecialID"].ToString() + "}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[终极]</a><a href=\"javascript:selectLabel('{FS_DynSpecialLDC_" + dt.Rows[i]["SpecialID"].ToString() + "}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[终极子类]</a>┊<span class=\"reshow\">列表：</span><a href=\"javascript:selectLabel('{FS_DynSpecialD_" + dt.Rows[i]["SpecialID"].ToString() + "}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[列表]</a><a href=\"javascript:selectLabel('{FS_DynSpecialDC_" + dt.Rows[i]["SpecialID"].ToString() + "}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[子类]</a>┊<span class=\"reshow\">导读：</span><a href=\"javascript:selectLabel('{FS_DynSpecialC_" + dt.Rows[i]["SpecialID"].ToString() + "}');\"  class=\"xa3\" style=\"font-size:11.5px;font-family:Verdana;\">[导读]</a></td></tr>";
                    str_tempList += getchildLabelList1(dt.Rows[i]["SpecialID"].ToString(), Tmp);
                }
                dt.Clear();
                dt.Dispose();
            }
            else
            {
                str_tempList += "当前没有标签";
            }
            return str_tempList;
        }
    }
}
