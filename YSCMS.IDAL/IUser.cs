﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Reflection;
using YSCMS.Model;

namespace YSCMS.IDAL {
	public interface IUser {
		DataTable CheckUser(string strUserName, string strPWD);
		DataTable CheckManage(string UserNum);
		int Managestate(string UserNum);
		void UserLogsDels(int LId);
		DataTable getUserLogsValue(int LId);
		DataTable getUserLogsRecord(string LogID);
		DataTable getCountselt(string UserName);
		DataTable getIschick(string UserName);
		DataTable isAdminUser(string UserNum);
		void InsertUserLogs(YSCMS.Model.UserLog1 uc);
		void UpdateUserLogs(YSCMS.Model.UserLog1 uc);
		DataTable sel_isAdmin(string UserNum);
		#region 登录限制开始
		//DataTable CheckUserTF(string strUserName);
		//DataTable readAdminlimit(string UserNum);
		//int loginNumTF(string UserNum);
		//void insertLoginNum(string UserNum);
		//int getLoginNum(string UserNum);
		#endregion 登录限制结束
		string sel_pwd(string UserNum);
		int sel_Rtime(string GroupName);
		string sel_UserGroupNumber(string UserNum);
		int GetUncheckFriendsCount(string UserNum);
		/// <summary>
		/// 前台会员注册
		/// </summary>
		/// 
		int sel_ChannelID(string SiteID);
		DataTable sel_RegContent(string SiteID);
		int sel_username(string ID);
		int sel_email(string email);
		string sel_um();
		string sel_UserGroupNumbers(string SiteID);
		bool sel_getUserMobileCode(string UserName, out string mobile, out string mobilecode);
		int sel_updateUserMobileStat(string UserName);
		int sel_getUserMobileBindTF(string Moblie);
		void sel_updateMobileBindTF(string UserName);
		int Add_User(YSCMS.Model.User ui);
		int Add_userfields(YSCMS.Model.UserFields ufi);
		int Add_Ghistory(YSCMS.Model.UserGhistory ugi);
		string sel_setPoint(string SiteID);
		DataTable sel_reg(string SiteID);
		string getuserUpFile(string groupNumber);
		string getRegTime(string UserNum);
		DataTable getContent(string UserNum);
		DataTable getGroup(string UserName);
		DataTable getWapParam();
		IDataReader getWapContent(string SiteID);

		YSCMS.Model.User UserInfo(string UserNum, int ID);
		YSCMS.Model.UserFields UserFields(string UserNum);
		YSCMS.Model.UserGroup UserGroup(string GroupNumber);
		YSCMS.Model.UserParam UserParam(string SiteID);

		bool EmailActive(string emailCode, string userNumber, string email);
	}
}
