﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using YSCMS.Model;
using YSCMS.DALFactory;
using YSCMS.DALProfile;
using YSCMS.Config;
using YSCMS.IDAL;

namespace YSCMS.SQLServerDAL
{
    public class Label : DbBase, ILabel
    {
        public int LabelAdd(LabelInfo lbc)
        {
            int result = 0;
            SqlConnection Conn = new SqlConnection(DBConfig.CmsConString);
            Conn.Open();
            try
            {
                string checkSql = string.Empty;
                int recordCount = 0;
                string LabelID = Common.Rand.Number(12);
                while (true)
                {
                    checkSql = "select count(*) from " + Pre + "sys_Label where LabelID='" + LabelID + "'";
                    recordCount = (int)DbHelper.ExecuteScalar(Conn, CommandType.Text, checkSql, null);
                    if (recordCount < 1)
                        break;
                    else
                        LabelID = Common.Rand.Number(12, true);
                }
                checkSql = "select count(*) from " + Pre + "sys_Label where Label_Name='" + lbc.Label_Name + "'";
                recordCount = (int)DbHelper.ExecuteScalar(Conn, CommandType.Text, checkSql, null);
                if (recordCount > 0)
                {
                    return -1;
                }
                string Sql = "insert into " + Pre + "sys_Label (";
                Sql += "LabelID,ClassID,Label_Name,Label_Content,Description,CreatTime,isBack,isRecyle,isSys,SiteID";
                Sql += ") values ('" + LabelID + "',";
                Sql += "@ClassID,@Label_Name,@Label_Content,@Description,@CreatTime,@isBack,@isRecyle,@isSys,@SiteID)";
                SqlParameter[] param = GetLabelParameters(lbc);
                result = Convert.ToInt32(DbHelper.ExecuteNonQuery(Conn, CommandType.Text, Sql, param));
            }
            finally
            {
                if (Conn != null && Conn.State == ConnectionState.Open)
                    Conn.Close();
            }

            return result;
        }

        public int LabelEdit(LabelInfo lbc)
        {
            int result = 0;
            SqlConnection Conn = new SqlConnection(DBConfig.CmsConString);
            Conn.Open();
            try
            {
                string checkSql = "";
                int recordCount = 0;
                checkSql = "select count(*) from " + Pre + "sys_Label Where LabelID!='" + lbc.LabelID + "' And Label_Name='" + lbc.Label_Name + "'";
                recordCount = (int)DbHelper.ExecuteScalar(Conn, CommandType.Text, checkSql, null);
                if (recordCount > 0)
                {
                    return -1;

                }
                string Sql = "Update " + Pre + "sys_Label Set ClassID=@ClassID,Label_Name=@Label_Name,Label_Content=@Label_Content";
                Sql += ",Description=@Description,isBack=@isBack ";
                Sql += "Where LabelID='" + lbc.LabelID + "' " + Common.Public.getSessionStr() + "";
                SqlParameter[] param = GetLabelParameters(lbc);
                result = Convert.ToInt32(DbHelper.ExecuteNonQuery(Conn, CommandType.Text, Sql, param));
            }
            finally
            {
                if (Conn != null && Conn.State == ConnectionState.Open)
                    Conn.Close();
            }
            return result;
        }
        public void LabelDel(string id)
        {
            string str_sql = "Update " + Pre + "sys_Label Set isRecyle=1 Where LabelID='" + id + "' " + Common.Public.getSessionStr() + "";
            DbHelper.ExecuteNonQuery(CommandType.Text, str_sql, null);
        }
        public void LabelDels(string id)
        {
            string str_sql = "Delete From " + Pre + "sys_Label Where LabelID='" + id + "'" + Common.Public.getSessionStr() + "";
            DbHelper.ExecuteNonQuery(CommandType.Text, str_sql, null);
        }
        public void LabelBackUp(string id)
        {
            string str_sql = "Update " + Pre + "sys_Label Set isBack=1 Where LabelID='" + id + "' " + Common.Public.getSessionStr() + "";
            DbHelper.ExecuteNonQuery(CommandType.Text, str_sql, null);
        }
        public DataTable GetLabelInfo(string id)
        {
            string str_Sql = "Select ClassID,Label_Name,Label_Content,Description,isBack From " + Pre + "sys_Label Where LabelID='" + id + "'" + Common.Public.getSessionStr() + "";
            DataTable dt = DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
            return dt;
        }
        public int LabelClassAdd(LabelClassInfo lbcc)
        {
            int result = 0;
            SqlConnection Conn = new SqlConnection(DBConfig.CmsConString);
            Conn.Open();
            try
            {
                string checkSql = "";
                int recordCount = 0;
                string ClassID = Common.Rand.Number(12);
                while (true)
                {
                    checkSql = "select count(*) from " + Pre + "sys_LabelClass where ClassID='" + ClassID + "'";
                    recordCount = (int)DbHelper.ExecuteScalar(Conn, CommandType.Text, checkSql, null);
                    if (recordCount < 1)
                        break;
                    else
                        ClassID = Common.Rand.Number(12, true);
                }
                checkSql = "select count(*) from " + Pre + "sys_LabelClass where ClassName='" + lbcc.ClassName + "'";
                recordCount = (int)DbHelper.ExecuteScalar(Conn, CommandType.Text, checkSql, null);
                if (recordCount > 0)
                {
                    return -2;
                }
                string Sql = "insert into " + Pre + "sys_LabelClass (";
                Sql += "ClassID,ClassName,Content,CreatTime,SiteID,isRecyle";
                Sql += ") values ('" + ClassID + "',";
                Sql += "@ClassName,@Content,@CreatTime,@SiteID,@isRecyle)";
                SqlParameter[] param = GetLabelClassParameters(lbcc);
                result = Convert.ToInt32(DbHelper.ExecuteNonQuery(Conn, CommandType.Text, Sql, param));
            }
            finally
            {
                if (Conn != null && Conn.State == ConnectionState.Open)
                    Conn.Close();
            }
            return result;
        }
        public int LabelClassEdit(LabelClassInfo lbcc)
        {
            int result = 0;
            SqlConnection Conn = new SqlConnection(DBConfig.CmsConString);
            Conn.Open();
            try
            {
                string checkSql = "";
                int recordCount = 0;
                checkSql = "select count(*) from " + Pre + "sys_LabelClass Where ClassID!='" + lbcc.ClassID + "' And ClassName='" + lbcc.ClassName + "'";
                recordCount = (int)DbHelper.ExecuteScalar(Conn, CommandType.Text, checkSql, null);
                if (recordCount > 0)
                {
                    throw new Exception("标签分类名称重复,请重新修改!");
                }
                string Sql = "Update " + Pre + "sys_LabelClass Set ClassName=@ClassName,Content=@Content ";
                Sql += "Where ClassID='" + lbcc.ClassID + "' " + Common.Public.getSessionStr() + "";
                SqlParameter[] param = GetLabelClassParameters(lbcc);
                result = Convert.ToInt32(DbHelper.ExecuteNonQuery(Conn, CommandType.Text, Sql, param));
            }
            finally
            {
                if (Conn != null && Conn.State == ConnectionState.Open)
                    Conn.Close();
            }
            return result;
        }
        public void LabelClassDel(string id)
        {
            SqlConnection Conn = new SqlConnection(DBConfig.CmsConString);
            Conn.Open();
            SqlTransaction tran = Conn.BeginTransaction();
            try
            {
                string str_Label = "Update " + Pre + "sys_Label Set isRecyle=1 Where ClassID='" + id + "' " + Common.Public.getSessionStr() + "";
                DbHelper.ExecuteNonQuery(tran, CommandType.Text, str_Label, null);
                string str_LabelClass = "Update " + Pre + "sys_LabelClass Set isRecyle=1 Where ClassID='" + id + "' " + Common.Public.getSessionStr() + "";
                DbHelper.ExecuteNonQuery(tran, CommandType.Text, str_LabelClass, null);
                tran.Commit();
                Conn.Close();
            }
            catch (SqlException e)
            {
                tran.Rollback();
                Conn.Close();
                throw e;
            }
        }
        public void LabelClassDels(string id)
        {
            SqlConnection Conn = new SqlConnection(DBConfig.CmsConString);
            Conn.Open();
            SqlTransaction tran = Conn.BeginTransaction();
            try
            {
                string str_Label = "Delete From " + Pre + "sys_Label Where ClassID='" + id + "' " + Common.Public.getSessionStr() + "";
                DbHelper.ExecuteNonQuery(tran, CommandType.Text, str_Label, null);
                string str_LabelClass = "Delete From " + Pre + "sys_LabelClass Where ClassID='" + id + "'" + Common.Public.getSessionStr() + "";
                DbHelper.ExecuteNonQuery(tran, CommandType.Text, str_LabelClass, null);
                tran.Commit();
                Conn.Close();
            }
            catch (SqlException e)
            {
                tran.Rollback();
                Conn.Close();
                throw e;
            }
        }
        public DataTable GetLabelClassInfo(string id)
        {
            string str_Sql = "Select ClassName,Content From " + Pre + "sys_LabelClass Where ClassID='" + id + "' " + Common.Public.getSessionStr() + "";
            DataTable dt = DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
            return dt;
        }

        public DataTable GetLabelClassList()
        {
            string str_Sql = "Select ClassID,ClassName From " + Pre + "sys_LabelClass Where isRecyle=0 And ClassID!='99999999' and ClassID!='88888888' and SiteID ='" + YSCMS.Global.Current.SiteID + "' order by id desc";
            DataTable dt = DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
            return dt;
        }

        public DataTable GetLabelinClassList()
        {
            string str_Sql = "Select ClassID,ClassName From " + Pre + "sys_LabelClass Where isRecyle=0 " + Common.Public.getSessionStr() + " order by id desc";
            DataTable dt = DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
            return dt;
        }

        public void LabelToResume(string id)
        {
            string str_sql = "Update " + Pre + "sys_Label Set isBack=0 Where LabelID='" + id + "' " + Common.Public.getSessionStr() + "";
            DbHelper.ExecuteNonQuery(CommandType.Text, str_sql, null);
        }

        public DataTable getRuleID()
        {
            string str_Sql = "Select DISTINCT UnID,(Select top 1 UnName from [" + Pre + "News_unNews] where unid=a.unid order by [rows],id desc) as UnName From " + Pre + "News_unNews a Where 1=1 " + Common.Public.getSessionStr() + "";
            DataTable dt = DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
            return dt;
        }

        public DataTable getTodayPicID()
        {
            string str_Sql = "Select NewsID,NewsTitle From " + Pre + "News Where isRecyle=0 And isLock=0 And substring(NewsProperty,9,1)='1' " + Common.Public.getSessionStr() + "";
            DataTable dt = DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
            return dt;
        }

        public DataTable getfreeJSInfo()
        {
            string str_Sql = "Select JsID,JSName From " + Pre + "News_JS Where jsType=1 " + Common.Public.getSessionStr() + "";
            DataTable dt = DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
            return dt;
        }

        public DataTable getsysJSInfo()
        {
            string str_Sql = "Select JsID,JSName From " + Pre + "News_JS Where jsType=0 " + Common.Public.getSessionStr() + "";
            DataTable dt = DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
            return dt;
        }

        public DataTable getadsJsInfo()
        {
            string str_Sql = "Select AdID,adName From " + Pre + "ads Where isLock=0 " + Common.Public.getSessionStr() + "";
            DataTable dt = DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
            return dt;
        }

        public DataTable getsurveyJSInfo()
        {
            string str_Sql = "Select TID,Title From " + Pre + "vote_Title Where isSteps=0 " + Common.Public.getSessionStr() + "";
            DataTable dt = DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
            return dt;
        }
        public DataTable getsurveyJSInfos()
        {
            string str_Sql = "Select TID,Title From " + Pre + "vote_Title," + Pre + "vote_Steps Where isSteps=1 and Steps=1 and TIDU=TID " + Common.Public.getSessionStr() + "";
            DataTable dt = DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
            return dt;
        }
        public DataTable getstatJSInfo()
        {
            string str_Sql = "Select Statid,classname From " + Pre + "stat_class Where 1=1 " + Common.Public.getSessionStr() + "";
            DataTable dt = DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
            return dt;
        }

        public DataTable getDiscussInfo()
        {
            string str_Sql = "Select DisID,Cname From " + Pre + "user_Discuss Where 1=1 " + Common.Public.getSessionStr() + "";
            DataTable dt = DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
            return dt;
        }

        public DataTable getLableList(string SiteID, int intsys)
        {
            string siteWhere = "";
            string topstr = "";
            string stringintsys = "";
            if (intsys != 1)
            {
                siteWhere = " and SiteID='" + SiteID + "'";
                stringintsys = " and isSys=" + intsys + "";
                if (intsys == 2)
                {
                    topstr = "top 20";
                    stringintsys = " and isSys=0";
                }
            }
            else
            {
                stringintsys = " and isSys=1";
            }
            string str_Sql = "Select " + topstr + " Label_Name,Label_Content,Description From " + Pre + "sys_Label Where 1=1 " + siteWhere + " " +
                             "And isBack=0 And isRecyle=0 " + stringintsys + " Order By CreatTime Desc,id desc";
            DataTable dt = DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
            return dt;
        }

        public DataTable getfreeLableList()
        {
            string str_Sql = "Select LabelName,StyleContent,LabelSQL From " + Pre + "sys_LabelFree Where SiteID='" + YSCMS.Global.Current.SiteID + "' Order By CreatTime Desc,id desc";
            DataTable dt = DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
            return dt;
        }

        public DataTable getFreeLabelInfo()
        {
            string str_Sql = "Select LabelName From " + Pre + "sys_LabelFree Where 1=1 " + Common.Public.getSessionStr() + "";
            DataTable dt = DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
            return dt;
        }

        private SqlParameter[] GetLabelClassParameters(YSCMS.Model.LabelClassInfo lbcc)
        {
            SqlParameter[] param = new SqlParameter[5];
            param[0] = new SqlParameter("@ClassName", SqlDbType.NVarChar, 30);
            param[0].Value = lbcc.ClassName;
            param[1] = new SqlParameter("@Content", SqlDbType.NVarChar, 200);
            param[1].Value = lbcc.Content;
            param[2] = new SqlParameter("@CreatTime", SqlDbType.DateTime, 8);
            param[2].Value = lbcc.CreatTime;
            param[3] = new SqlParameter("@SiteID", SqlDbType.NVarChar, 12);
            param[3].Value = lbcc.SiteID;
            param[4] = new SqlParameter("@isRecyle", SqlDbType.TinyInt, 1);
            param[4].Value = lbcc.isRecyle;
            return param;
        }

        private SqlParameter[] GetLabelParameters(YSCMS.Model.LabelInfo lbc)
        {
            SqlParameter[] param = new SqlParameter[9];
            param[0] = new SqlParameter("@ClassID", SqlDbType.NVarChar, 12);
            param[0].Value = lbc.ClassID;
            param[1] = new SqlParameter("@Label_Name", SqlDbType.NVarChar, 30);
            param[1].Value = lbc.Label_Name;
            param[2] = new SqlParameter("@Label_Content", SqlDbType.NText);
            param[2].Value = lbc.Label_Content;
            param[3] = new SqlParameter("@Description", SqlDbType.NVarChar, 200);
            param[3].Value = lbc.Description;
            param[4] = new SqlParameter("@CreatTime", SqlDbType.DateTime, 8);
            param[4].Value = lbc.CreatTime;
            param[5] = new SqlParameter("@isBack", SqlDbType.TinyInt, 1);
            param[5].Value = lbc.isBack;
            param[6] = new SqlParameter("@isRecyle", SqlDbType.TinyInt, 1);
            param[6].Value = lbc.isRecyle;
            param[7] = new SqlParameter("@isSys", SqlDbType.TinyInt, 1);
            param[7].Value = lbc.isSys;
            param[8] = new SqlParameter("@SiteID", SqlDbType.NVarChar, 12);
            param[8].Value = lbc.SiteID;
            return param;
        }
        /// <summary>
        /// 导出标签获得所有
        /// </summary>
        /// <returns></returns>
        public DataTable outLabelALL(int Num)
        {
            string sysTF = "";
            if (Num != 2) { sysTF = " and isSys=" + Num + ""; }
            // else { sysTF = " and isSys=0"; }
            string str_Sql = "Select LabelID,ClassID,Label_Name,Label_Content,Description,CreatTime,isSys,SiteID From " + Pre + "sys_Label Where 1=1 " + Common.Public.getSessionStr() + sysTF + "";
            DataTable dt = DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
            return dt;
        }

        /// <summary>
        /// 批量获得导出标签
        /// </summary>
        /// <param name="LabelID"></param>
        /// <returns></returns>
        public DataTable outLabelmutile(string LabelID)
        {
            string _LabelID = LabelID;
            if (LabelID.IndexOf(",") > 0) { _LabelID = LabelID.Replace(",", ""); }
            string str_Sql = "Select LabelID,ClassID,Label_Name,Label_Content,Description,CreatTime,isSys,SiteID From " + Pre + "sys_Label Where LabelID in ('" + _LabelID + "') " + Common.Public.getSessionStr() + "";
            DataTable dt = DbHelper.ExecuteTable(CommandType.Text, str_Sql, null);
            return dt;
        }

        /// <summary>
        /// 导入标签
        /// </summary>
        /// <param name="Classid"></param>
        /// <param name="Label_Name"></param>
        /// <param name="Label_Content"></param>
        /// <param name="Description"></param>
        /// <param name="isSys"></param>
        public void inserLabelLocal(string LabelID, string Classid, string Label_Name, string Label_Content, string Description, string isSystem)
        {
            string _Label_Name = Label_Name;
            string SQLTF = "select ID from " + Pre + "sys_Label where Label_Name ='" + Label_Name.Trim() + "'";
            DataTable dt = DbHelper.ExecuteTable(CommandType.Text, SQLTF, null);
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    _Label_Name = Label_Name.Replace("}", "_导入的重名标签}");
                }
                dt.Clear(); dt.Dispose();
            }
            string _LabelID = LabelID;
            string SQLTF1 = "select ID from " + Pre + "sys_Label where LabelID ='" + LabelID + "'";
            DataTable dt1 = DbHelper.ExecuteTable(CommandType.Text, SQLTF1, null);
            if (dt1 != null && dt1.Rows.Count > 0)
            {
                _LabelID = Common.Rand.Number(12, true);
                dt1.Clear(); dt1.Dispose();
            }
            if (isSystem == "1") { Classid = "99999999"; }
            string Sql = "insert into " + Pre + "sys_Label (";
            Sql += "LabelID,ClassID,Label_Name,Label_Content,Description,CreatTime,isBack,isRecyle,isSys,SiteID";
            Sql += ") values (";
            Sql += "'" + _LabelID + "','" + Classid + "','" + _Label_Name + "','" + Label_Content + "','" + Description + "','" + DateTime.Now + "',0,0," + int.Parse(isSystem) + ",'" + YSCMS.Global.Current.SiteID + "')";
            DbHelper.ExecuteNonQuery(CommandType.Text, Sql, null);
        }

        public DataTable getLableListM(int Num, string ParentID)
        {
            string Sql = "";
            if (Num == 0)
            {
                Sql = "select ClassID,ClassCName,ClassEName from " + Pre + "news_class where ParentID='" + ParentID + "' and isLock=0 and isRecyle=0 and isURL=0 and isPage=0 order by OrderID desc,id desc";
            }
            else
            {
                Sql = "select SpecialID,specialEName,SpecialCName from " + Pre + "news_special where ParentID='" + ParentID + "' and isLock=0 and isRecyle=0";
            }
            DataTable dt = DbHelper.ExecuteTable(CommandType.Text, Sql, null);
            return dt;
        }

        public int getClassLabelCount(string ClassID, int num)
        {
            SqlParameter param = new SqlParameter("@ClassID", ClassID);
            string Sql = "";
            if (num == 0)
            {
                Sql = "Select count(id) From " + Pre + "sys_Label Where ClassID=@ClassID and isBack=0 and isRecyle=0 and SiteID='" + YSCMS.Global.Current.SiteID + "'";
            }
            else
            {
                Sql = "Select count(id) From " + Pre + "sys_LabelStyle Where ClassID=@ClassID and isRecyle=0 and SiteID='" + YSCMS.Global.Current.SiteID + "'";
            }
            return Convert.ToInt32(DbHelper.ExecuteScalar(CommandType.Text, Sql, param));
        }

        public IDataReader GetStyleList(string SiteID)
        {
            SqlParameter param = new SqlParameter("@SiteID", SiteID);
            string sql = "select ClassID,Sname from " + Pre + "sys_styleclass where SiteID=@SiteID and isRecyle=0";
            return DbHelper.ExecuteReader(CommandType.Text, sql, param);
        }


        /// <summary>
        /// 获取表单的中文名
        /// </summary>
        /// <param name="fieldname">表单列名</param>
        /// <param name="formid">表单编号</param>
        /// <returns>表单的中文名</returns>
        public string searchiteminfo(string fieldname, string formid)
        {
            SqlParameter param = new SqlParameter("@fieldname", SqlDbType.NVarChar, 50);
            param.Value = fieldname;
            SqlParameter pformid = new SqlParameter("@formid", SqlDbType.Int);
            pformid.Value = formid;
            string sql = "select itemname from " + Pre + "customform_item where fieldname = @fieldname and formid = @formid";
            SqlDataReader sdr = (SqlDataReader)DbHelper.ExecuteReader(CommandType.Text, sql, new SqlParameter[]{
			pformid,
			param
			});
            string value = string.Empty;
            if (sdr.Read())
            {
                value = sdr["itemname"].ToString();
            }
            return value;
        }

        /// <summary>
        /// 获取表单对应控件
        /// </summary>
        /// <param name="fieldname">表单列名</param>
        /// <param name="formid">表单编号</param>
        /// <returns>表单对应控件</returns>
        public string[] searchControlinfo(string fieldname, string formid)
        {
            SqlParameter param = new SqlParameter("@fieldname", SqlDbType.NVarChar, 50);
            param.Value = fieldname;
            SqlParameter pformid = new SqlParameter("@formid", SqlDbType.Int);
            pformid.Value = formid;
            string sql = "select itemtype,itemsize,selectitem,defaultvalue from " + Pre + "customform_item where fieldname = @fieldname and formid = @formid";
            SqlDataReader sdr = (SqlDataReader)DbHelper.ExecuteReader(CommandType.Text, sql, new SqlParameter[]{
				param,pformid
			});
            string[] infos = new string[4];
            if (sdr.Read())
            {
                infos[0] = sdr["itemtype"].ToString();
                infos[1] = sdr["itemsize"].ToString();
                infos[2] = sdr["selectitem"].ToString();
                infos[3] = sdr["defaultvalue"].ToString();
            }
            return infos;
        }

        /// <summary>
        /// 分页获取表单值
        /// </summary>
        /// <param name="tablename">表名</param>
        /// <param name="pageindex">页码</param>
        /// <param name="pagesize">每页数量</param>
        /// <param name="recordCount">总记录数</param>
        /// <param name="pageCount">当前页记录数</param>
        /// <returns>表单值</returns>
        public DataTable searchValues(string tablename, int pageindex, int pagesize, out int recordCount, out int pageCount)
        {
            return DbHelper.ExecutePage("*", tablename + " where isshow = 1", "id", "order by submit_time desc", pageindex, pagesize, out recordCount, out pageCount, null);
        }



        /// <summary>
        /// 判断是否有验证码
        /// </summary>
        /// <param name="formid">表单编号</param>
        /// <returns></returns>
        public bool hasValidate(int formid)
        {
            SqlParameter param = new SqlParameter("@id", SqlDbType.Int, 0);
            param.Value = formid;
            return Convert.ToBoolean(DbHelper.ExecuteScalar(CommandType.Text, "select showvalidatecode from ys_customform where id=@id", param));
        }

    }
}
