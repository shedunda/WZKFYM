﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using YSCMS.DALFactory;
using YSCMS.Model;
using YSCMS.IDAL;

namespace YSCMS.CMS
{
    public class Stat
    {
        private IStat dal;
        public Stat()
        {
            dal = YSCMS.DALFactory.DataAccess.CreateStat();
        }
        public DataTable sel()
        {
            return dal.sel(); 
        }
        public string Str_ClassSql(string id) 
        {
            return dal.Str_ClassSql(id); 
        }
        public bool Str_classSql(string ID) 
        {
            return dal.Str_classSql(ID); 
        }
        public bool Str_statInfo_Sql(string ID) 
        {
            return dal.Str_statInfo_Sql(ID); 
        }
        public bool Str_statContent_Sql(string ID) 
        {
            return dal.Str_statContent_Sql(ID); 
        }
        public void Str_InSql(stat_Param sp) 
        {
            dal.Str_InSql(sp); 
        }
        public int Stat_Sql() 
        {
            return dal.Stat_Sql(); 
        }
        public void Vote_Sql(string CheckboxArray) 
        {
            dal.Vote_Sql(CheckboxArray);
        }
        public void Str_statInfo_Sql_1(string CheckboxArray) 
        {
            dal.Str_statInfo_Sql_1(CheckboxArray); 
        }
        public void Str_statContent_Sql_1(string CheckboxArray) 
        {
            dal.Str_statContent_Sql_1(CheckboxArray); 
        }
        public bool Str_StatSql() 
        {
            return dal.Str_StatSql(); 
        }
        public bool Str_DelAllinfo_Sql() 
        {
            return dal.Str_DelAllinfo_Sql(); 
        }
        public bool Str_DelContent_Sql() 
        {
            return dal.Str_DelContent_Sql(); 
        }
        public int sel_1(string Str_statid) 
        {
            return dal.sel_1(Str_statid); 
        }
        public int Str_CheckSql(string Str_Classname) 
        {
            return dal.Str_CheckSql(Str_Classname); 
        }
        public int Str_InSql_1(string Str_statid, string Str_Classname, string SiteID) 
        {
            return dal.Str_InSql_1(Str_statid, Str_Classname, SiteID); 
        }
        public int Str_UpdateSql(string Str_ClassnameE, string id) 
        {
            return dal.Str_UpdateSql(Str_ClassnameE, id); 
        }
        public int Str_StatSql_1() 
        {
            return dal.Str_StatSql_1(); 
        }
        public int Str_StatSqlZ() 
        {
            return dal.Str_StatSqlZ(); 
        }
        public DataTable sel_2(string viewid, string SiteID) 
        {
            return dal.sel_2(viewid, SiteID); 
        }
        public DataTable sel_3(DateTime newtime, string viewid, string SiteID) 
        {
            return dal.sel_3(newtime, viewid, SiteID); 
        }
        public DataTable sel_New(string viewid, string SiteID) 
        {
            return dal.sel_New(viewid, SiteID); 
        }
        public DataTable sel_Year(int vyear, string viewid, string SiteID) 
        {
            return dal.sel_Year(vyear, viewid, SiteID); 
        }
        public DataTable sel_Month(int vmonth, string viewid, string SiteID) 
        {
            return dal.sel_Month(vmonth, viewid, SiteID); 
        }
        public DataTable sel_return(string viewid, string SiteID) 
        {
            return dal.sel_return(viewid, SiteID); 
        }
        public DataTable sel_4(int thehour, string vtime, string viewid, string SiteID) 
        {
            return dal.sel_4(thehour, vtime, viewid, SiteID);
        }
        public DataTable sel_5(int vhour, int vday, int vmonth, int vyear, string viewid, string SiteID) 
        {
            return dal.sel_5(vhour, vday, vmonth, vyear, viewid, SiteID); 
        }
        public DataTable sel_day(string viewid, string SiteID) 
        {
            return dal.sel_day(viewid, SiteID); 
        }
        public DataTable sel_6(string viewid, string SiteID) 
        {
            return dal.sel_6(viewid, SiteID); 
        }
        public DataTable sel_7(string viewid, string SiteID) 
        {
            return dal.sel_7(viewid, SiteID); 
        }
        public DataTable sel_8(string viewid, string SiteID) 
        {
            return dal.sel_8(viewid, SiteID); 
        }
        public DataTable sel_9(string strtheday, string strthetday, string viewid, string SiteID) 
        {
            return dal.sel_9(strtheday, strthetday, viewid, SiteID); 
        }
        public DataTable sel_10(string strdatetwelve, string viewid, string SiteID) 
        {
            return dal.sel_10(strdatetwelve,viewid, SiteID); 
        }
        public DataTable sel_vmonth(string viewid, string SiteID) 
        {
            return dal.sel_vmonth(viewid, SiteID); 
        }
        public DataTable sel_vyear(string viewid, string SiteID) 
        {
            return dal.sel_vyear(viewid, SiteID); 
        }
        public DataTable sel_vpage(string viewid, string SiteID) 
        {
            return dal.sel_vpage(viewid, SiteID); 
        }
        public DataTable sel_vip(string viewid, string SiteID) 
        {
            return dal.sel_vip(viewid, SiteID); 
        }
        public DataTable sel_vwidth(string viewid, string SiteID) 
        {
            return dal.sel_vwidth(viewid, SiteID); 
        }
        public DataTable sel_vsoft(string vsoft, string viewid, string SiteID) 
        {
            return dal.sel_vsoft(vsoft,viewid, SiteID);
        }
        public DataTable sel_vOS(string vOS, string viewid, string SiteID) 
        {
            return dal.sel_vOS(vOS,viewid, SiteID); 
        }
        public DataTable sel_vwhere(string viewid, string SiteID) 
        {
            return dal.sel_vwhere(viewid, SiteID); 
        }
        public DataTable sel_vcome(string viewid, string SiteID) 
        {
            return dal.sel_vcome(viewid, SiteID); 
        }

		public DataTable sel_taday(string viewid, string ip, DateTime taday)
		{
			return dal.sel_taday(viewid,ip,taday);
		}

		public DataTable sel_7DESC(string classid, string ip)
		{
			return dal.sel_7DESC(classid, ip);
		}

        #region 前台调用
        public DataTable sel_stat_Param() 
        {
            return dal.sel_stat_Param(); 
        }
        public DataTable sel_vip_1(DateTime newtime) 
        {
            return dal.sel_vip_1(newtime); 
        }
        public void Add(stat_Info info) 
        {
            dal.Add(info); 
        }
        public DataTable sel_stat_content(string statidz) 
        {
            return dal.sel_stat_content(statidz); 
        }
        public void Add_1(string vdatee, string starttimee, string highttimee, string statidz, string SiteID) 
        {
            dal.Add_1(vdatee, starttimee, highttimee, statidz, SiteID); 
        }
        public void Update(int str_ys_today, int str_ys_yesterday, string str_ys_content_data, int str_ys_all, int str_ys_heigh, string str_ys_heightime, string strclassid, string siteID, string strclassids) 
        {
            dal.Update(str_ys_today, str_ys_yesterday, str_ys_content_data, str_ys_all, str_ys_heigh, str_ys_heightime, strclassid, siteID, strclassids); 
        }
        #endregion

		public DataTable getParam()
		{
			return dal.getParam();
		}
	}
}