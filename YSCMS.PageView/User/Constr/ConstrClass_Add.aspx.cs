using System;
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

namespace YSCMS.PageView.User.Constr
{
    public partial class ConstrClass_Add : YSCMS.PageBasic.UserPage
    {
        //连接数据库
        YSCMS.CMS.Constr con = new YSCMS.CMS.Constr();
        /// <summary>
        /// 初始化
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// 
        #region 初始化
        protected void Page_Load(object sender, EventArgs e)
        {

            Response.CacheControl = "no-cache";
        }
        #endregion
        /// <summary>
        /// 添加分类
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// 
        #region 添加分类
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string cName = YSCMS.Common.Input.Htmls(Request.Form["cNameBox"].ToString());
                string Content = YSCMS.Common.Input.Htmls(Request.Form["ContentBox"].ToString());
                string Ccid = YSCMS.Common.Rand.Number(12);
                DataTable dt = con.Sel6();
                int cut = dt.Rows.Count;
                string Ccids = "";
                if (cut > 0)
                {
                    Ccids = dt.Rows[0]["Ccid"].ToString();
                }
                string UserNum = YSCMS.Global.Current.UserNum;
                YSCMS.Model.STConstrClass stcn;
                stcn.cName = cName;
                stcn.Content = Content;

                if (Ccids != Ccid)
                {
                    if (con.Add2(stcn, Ccid, UserNum) != 0)
                    {
                        PageRight("创建成功", "ConstrClass.aspx");
                    }
                    else
                    {
                        PageError("添加失败<br>", "ConstrClass.aspx");
                    }
                }
                else
                {
                    PageError("添加失败可能编号重复<br>", "");
                }
            }
        }
        #endregion
    }
}