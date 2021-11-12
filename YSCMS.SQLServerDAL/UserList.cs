﻿using System;
using System.Data;
using System.Data.SqlClient;
using YSCMS.DALFactory;
using YSCMS.Model;
using System.Text.RegularExpressions;
using System.Text;
using System.Reflection;
using YSCMS.DALProfile;
using YSCMS.Config;
using YSCMS.IDAL;

namespace YSCMS.SQLServerDAL
{
    public class UserList : DbBase, IUserList
    {
        public string GetGroupName(string strGroupNumber)
        {
            SqlParameter param = new SqlParameter("@GroupNumber", strGroupNumber);
            string RStr = "";
            string Sql = "select GroupName from " + Pre + "user_Group where GroupNumber=@GroupNumber";
            IDataReader rdr = DbHelper.ExecuteReader(CommandType.Text, Sql, param);
            if (rdr.Read())
            {
                RStr = rdr["GroupName"].ToString();
            }
            rdr.Close();
            return RStr;
        }
        public int Dels(string id)
        {
            RootPublic pd = new RootPublic();
            string _user = "";
            if (id.IndexOf(",") == -1)
            {
                _user = pd.GetUidUserNum(int.Parse(id));
                pd.DelUserAllInfo(_user);
            }
            else
            {
                for (int m = 0; m < id.Split(',').Length; m++)
                {
                    _user = pd.GetUidUserNum(int.Parse(id.Split(',')[m]));
                    pd.DelUserAllInfo(_user);
                }
            }
            string Sql = "delete from " + Pre + "sys_user where id in (" + id + ") " + Common.Public.getSessionStr() + "";
            object result = DbHelper.ExecuteNonQuery(CommandType.Text, Sql, null);
            return (int)result;
        }
        public DataTable GroupList()
        {
            string Sql = "select ID,GroupNumber,GroupName from " + Pre + "user_group where SiteID='" + YSCMS.Global.Current.SiteID + "' order by id desc";
            DataTable rdr = DbHelper.ExecuteTable(CommandType.Text, Sql, null);
            return rdr;
        }
        /// <summary>
        /// 通用更新方法
        /// </summary>
        /// <param name="id">id</param>
        /// <param name="field">要更新的字段名</param>
        /// <param name="value">值</param>
        /// <returns></returns>
        public int Update(string id, string field, string value)
        {
            string Sql = "update " + Pre + "sys_user set " + field + " =" + value + " where id in(" + id + ")" + Common.Public.getSessionStr() + "";
            return DbHelper.ExecuteNonQuery(CommandType.Text, Sql, null);
        }
        /// <summary>
        /// 会员分页
        /// </summary>
        public DataTable GetPage(string UserName, string RealName, string UserNum, string Sex, string siPoint, string biPoint, string sgPoint, string bgPoint, string _userlock, string _group, string _iscerts, string _SiteID, int PageIndex, int PageSize, out int RecordCount, out int PageCount, params SQLConditionInfo[] SqlCondition)
        {

            string QSQL = "";
            if (UserName != "" && UserName != null) { QSQL = " and UserName like '%" + UserName + "%'"; }
            if (RealName != "" && RealName != null) { QSQL = " and RealName like '%" + RealName + "%'"; }
            if (UserNum != "" && UserNum != null) { QSQL = " and UserNum = '" + UserNum + "'"; }
            if (Sex != "" && Sex != null)
            {
                int _Sex = int.Parse(Sex.ToString());
                QSQL += " and Sex = " + _Sex + "";
            }
            if (siPoint != "" && siPoint != null)
            {
                int _siPoint = int.Parse(siPoint.ToString());
                QSQL += " and iPoint >= " + _siPoint + "";
            }

            if (biPoint != "" && biPoint != null)
            {
                int _biPoint = int.Parse(biPoint.ToString());
                QSQL += " and iPoint <= " + _biPoint + "";
            }

            if (sgPoint != "" && sgPoint != null)
            {
                int _sgPoint = int.Parse(sgPoint.ToString());
                QSQL += " and gPoint >= " + _sgPoint + "";
            }

            if (bgPoint != "" && bgPoint != null)
            {
                int _bgPoint = int.Parse(bgPoint.ToString());
                QSQL += " and gPoint <= " + _bgPoint + "";
            }

            if (_userlock != null && _userlock != "")
            {
                QSQL += " and islock=" + int.Parse(_userlock) + "";
            }

            if (_group != "" && _group != null)
            {
                QSQL += " and UserGroupNumber='" + _group + "'";
            }

            if (_iscerts != "" && _iscerts != null)
            {
                if (_iscerts == "1")
                {
                    QSQL += " and isIDcard=" + int.Parse(_iscerts) + "";
                }
                else
                {
                    QSQL += "and isIDcard<>1 and len(IDcardFiles)>2";
                }
            }

            if (_SiteID != "" && _SiteID != null) { QSQL += " and SiteID='" + _SiteID + "'"; }
            else { QSQL += " and SiteID='" + YSCMS.Global.Current.SiteID + "'"; }
            string AllFields = "id,userNum,username,RealName,UserGroupNumber,islock,RegTime,ipoint,gPoint,LastLoginTime,LastIP,isIDcard,isAdmin";
            string Condition = "" + Pre + "sys_user where  1=1 " + QSQL + "";
            string IndexField = "ID";
            string OrderFields = "order by Id Desc";
            return DbHelper.ExecutePage(AllFields, Condition, IndexField, OrderFields, PageIndex, PageSize, out RecordCount, out PageCount, null);
        }
    }
}
