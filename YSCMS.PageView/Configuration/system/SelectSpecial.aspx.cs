using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using YSCMS.Model;

namespace YSCMS.PageView.Configuration.system
{
    public partial class SelectSpecial : YSCMS.PageBasic.ManagePage
    {
        YSCMS.CMS.UserLogin _UL = new YSCMS.CMS.UserLogin();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                YSCMS.CMS.AdminGroup agc = new YSCMS.CMS.AdminGroup();
                DataTable dc = agc.getClassList("SpecialID,SpecialCName,ParentID", "news_special", " Where isLock=0 And isRecyle=0 And SiteID='" + SiteID + "' ");
                string SpecialList = _UL.GetAdminGroupSpecialList();
                for (int i = 0; i < dc.Rows.Count; i++)
                {
                    this.SpecailID = dc.Rows[i]["SpecialID"].ToString();
                    if (!this.CheckAuthority() && SpecialList.IndexOf(dc.Rows[i]["SpecialID"].ToString()) < 0)
                    {
                        dc.Rows[i].Delete();
                    }
                }
                listShow(dc, "0", 0, Special);
                dc.Clear(); dc.Dispose();
            }
        }

        /// <summary>
        /// 在ListBox中呈现出来
        /// </summary>
        /// <param name="tempdt">DataTable</param>
        /// <param name="PID">父类编号</param>
        /// <param name="Layer">层次</param>
        /// <param name="list">ListBox控件名称</param>

        protected void listShow(DataTable tempdt, string PID, int Layer, HtmlSelect list)
        {
            DataRow[] row = null;
            row = tempdt.Select("ParentID='" + PID + "'");
            if (row.Length < 1)
                return;
            else
            {
                foreach (DataRow r in row)
                {
                    string strText = "┝";
                    for (int j = 0; j < Layer; j++)
                    {
                        strText += "┉";
                    }
                    this.SpecailID = r[0].ToString();
                    if (this.CheckAuthority())
                    {
                        ListItem itm = new ListItem();
                        itm.Value = r[0].ToString() + "|" + r[1].ToString();
                        itm.Text = strText + r[1].ToString();
                        list.Items.Add(itm);
                    }
                    if (r[0].ToString() != "0")
                        listShow(tempdt, r[0].ToString(), Layer + 1, list);
                }
            }
        }
    }
}