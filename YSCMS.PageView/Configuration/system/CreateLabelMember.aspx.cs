﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace YSCMS.PageView.Configuration.system
{
    public partial class CreateLabelMember : YSCMS.PageBasic.ManagePage
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
                style_base.InnerHtml = YSCMS.Common.Public.getxmlstylelist("styleContent", _dirdumm + "/xml/cuslabeStyle/cstylebase.xml");
                style_class.InnerHtml = YSCMS.Common.Public.getxmlstylelist("styleContent1", _dirdumm + "/xml/cuslabeStyle/cstyleclass.xml");
                style_special.InnerHtml = YSCMS.Common.Public.getxmlstylelist("DropDownList2", _dirdumm + "/xml/cuslabeStyle/cstylespecial.xml");
                getDiscussInfo();
                getDefine();
                GetStyleList(this.StyleClassID);
            }
        }

        protected void GetStyleList(DropDownList lst)
        {
            IDataReader dr = rd.GetStyleList(SiteID);
            while (dr.Read())
            {
                ListItem it = new ListItem();
                it.Value = dr["ClassID"].ToString();
                it.Text = dr["Sname"].ToString();
                lst.Items.Add(it);
            }
            dr.Close();
        }
        /// <summary>
        /// 获得自定义字段列表
        /// </summary>

        protected void getDefine()
        {
            YSCMS.CMS.Style.Style stClass = new YSCMS.CMS.Style.Style();
            DataTable dt = stClass.Styledefine();

            if (dt != null)
            {
                define.DataTextField = "defineCname";
                define.DataValueField = "defineColumns";
                define.DataSource = dt;
                define.DataBind();
                dt.Clear();
                dt.Dispose();
            }
            ListItem itm = new ListItem();
            itm.Value = "";
            itm.Text = "自定义字段";
            define.Items.Insert(0, itm);
            itm = null;
        }
        /// <summary>
        /// 取得讨论组列表
        /// </summary>

        protected void getDiscussInfo()
        {
            YSCMS.CMS.Label lc = new YSCMS.CMS.Label();
            DataTable dt = lc.getDiscussInfo();
            if (dt != null)
            {
                GroupClassID.DataTextField = "Cname";
                GroupClassID.DataValueField = "DisID";
                GroupClassID.DataSource = dt;
                GroupClassID.DataBind();
                dt.Clear();
                dt.Dispose();
            }
            ListItem itm = new ListItem();
            itm.Value = "";
            itm.Text = "请选择讨论组";
            itm.Selected = true;
            GroupClassID.Items.Insert(0, itm);
            itm = null;
        }
    }
}