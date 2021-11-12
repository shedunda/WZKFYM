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

namespace YSCMS.PageView.User.Discuss
{
    public partial class DiscussActi_Add : YSCMS.PageBasic.UserPage
    {
        YSCMS.CMS.Discuss dis = new YSCMS.CMS.Discuss();
        DateTime CreaTime = DateTime.Now;//获取当前系统时间    
        /// <summary>
        /// 初始化
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// 
        #region 初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                string AId = YSCMS.Common.Input.Filter(Request.QueryString["AId"].ToString());
                DataTable dt = dis.sel_12(AId);
                DateTime Cutofftime1 = DateTime.Parse(dt.Rows[0]["Cutofftime"].ToString());
                int An = int.Parse(dt.Rows[0]["Anum"].ToString());
                int Pn = 0;
                if (dis.sel_13(AId) != 0)
                {
                    Pn = dis.sel_13(AId);
                }
                if (CreaTime > Cutofftime1)
                {
                    PageError("对不起不能参加活动时间已经过期", "discussacti_list.aspx");

                }
                else
                {
                    if (Pn >= An)
                    {
                        PageError("对不起参加人数超出不能参加次活动", "discussacti_list.aspx");
                    }
                }
            }
        }
        #endregion

        protected void inBox_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)//判断是否通过验证
            {
                string UserNum = YSCMS.Global.Current.UserNum;
                string AIds = YSCMS.Common.Input.Filter(Request.QueryString["AId"].ToString());
                string Telephone = YSCMS.Common.Input.Htmls(Request.Form["TelephoneBox"].ToString());
                int ParticipationNum = int.Parse(YSCMS.Common.Input.Filter(Request.Form["ParticipationNumBox"].ToString()));
                int isCompanion = this.isCompanionList.SelectedIndex;
                string PId = YSCMS.Common.Rand.Number(12);//产生12位随机字符
                DataTable dta = dis.sel_14();
                int cutb = dta.Rows.Count;
                string PIda = "";
                if (cutb > 0)
                {
                    PIda = dta.Rows[0]["PId"].ToString();
                }
                if (PIda != PId)
                {
                    if (dis.Add_4(Telephone, ParticipationNum, isCompanion, UserNum, AIds, PId, CreaTime) != 0)
                    {
                        PageRight("加入成功", "discussacti_list.aspx");
                    }
                    else
                    {
                        PageError("加入失败", "discussacti_list.aspx");
                    }
                }
                else
                {
                    PageError("加入失败可能编号重复请重新加入", "discussacti_list.aspx");
                }
            }
        }

    }
}