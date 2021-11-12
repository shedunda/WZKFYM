﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace YSCMS.PageView.Configuration.system
{
    public partial class CreateLabelRoutine : YSCMS.PageBasic.ManagePage
    {
        public string APIID = "0";
        YSCMS.CMS.Label rd = new YSCMS.CMS.Label();
        protected void Page_Load(object sender, EventArgs e)
        {
            APIID = SiteID;
            if (!IsPostBack)
            {
                Response.CacheControl = "no-cache";                        //设置页面无缓存
                string _dirdumm = YSCMS.Config.UIConfig.dirDumm;
                if (_dirdumm.Trim() != "") { _dirdumm = "/" + _dirdumm; }
                style_base.InnerHtml = YSCMS.Common.Public.getxmlstylelist("styleContent", _dirdumm + "/xml/cuslabeStyle/cstylebase.xml");
                style_class.InnerHtml = YSCMS.Common.Public.getxmlstylelist("styleContent1", _dirdumm + "/xml/cuslabeStyle/cstyleclass.xml");
                style_special.InnerHtml = YSCMS.Common.Public.getxmlstylelist("DropDownList2", _dirdumm + "/xml/cuslabeStyle/cstylespecial.xml");
                getRuleID();
                getTodayPicID();
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
        ///  获取不规则新闻编号列表
        /// </summary>

        protected void getRuleID()
        {
            YSCMS.CMS.Label lc = new YSCMS.CMS.Label();
            DataTable dt = lc.getRuleID();
            if (dt != null)
            {
                RuleID.DataTextField = "UnName";
                RuleID.DataValueField = "UnID";
                RuleID.DataSource = dt;
                RuleID.DataBind();
                dt.Clear();
                dt.Dispose();
            }
            ListItem itm = new ListItem();
            itm.Selected = true;
            itm.Value = "";
            itm.Text = "请选择不规则新闻";
            RuleID.Items.Insert(0, itm);
            itm = null;
        }


        /// <summary>
        /// 获取今日图片头条编号列表
        /// </summary>

        protected void getTodayPicID()
        {
            YSCMS.CMS.Label lc = new YSCMS.CMS.Label();
            DataTable dt = lc.getTodayPicID();
            if (dt != null)
            {
                TodayPicID.DataTextField = "NewsTitle";
                TodayPicID.DataValueField = "NewsID";
                TodayPicID.DataSource = dt;
                TodayPicID.DataBind();
                dt.Clear();
                dt.Dispose();
            }
            ListItem itm = new ListItem();
            itm.Selected = true;
            itm.Value = "";
            itm.Text = "请选择图片头条新闻";
            TodayPicID.Items.Insert(0, itm);
            itm = null;
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
    }
}