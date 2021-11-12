
using System;
using System.Data;
using YSCMS.CMS.Collect;

namespace YSCMS.PageView.Manage.Collect
{
    public partial class Collect : YSCMS.PageBasic.ManagePage
    {
        public Collect()
        {
            Authority_Code = "S011";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            int num = 0, id = 0;
            if (Request.QueryString["id"] == null || Request.QueryString["num"] == null
                || Request.QueryString["id"].Trim().Equals("") || Request.QueryString["num"].Trim().Equals("")
                || Request.QueryString["norepeat"] == null)
            {
                YSCMS.Common.MessageBox.Show(this, "参数无效!");
            }
            id = int.Parse(Request.QueryString["id"]);
            num = int.Parse(Request.QueryString["num"]);
            //判断采集规则中栏目是否合法（wxh 2008-6-24）
            if (!IsExistClassID(id))
            {
                YSCMS.Common.MessageBox.Show(this, "栏目不存在，请检查!");
            }
            bool norepeat = false;
            if (Request.QueryString["norepeat"] == "1")
                norepeat = true;
            if (id < 1 || num < 1)
                YSCMS.Common.MessageBox.Show(this, "输入了无效的参数!");
            YSCMS.CMS.Collect.Collect cl = new YSCMS.CMS.Collect.Collect();
            cl.Collecting(id, num, norepeat);
            Response.Write("<br />釆集结束  <a href=\"Collect_List.aspx\">返回管理</a>");
            Response.End();
        }

        /// <summary>
        /// 判断采集规则中栏目是否合法（wxh 2008-6-24）
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        private bool IsExistClassID(int id)
        {
            bool result = false;
            string classID = "";
            YSCMS.CMS.Collect.Collect collect = new YSCMS.CMS.Collect.Collect();
            DataTable dt = collect.GetSite(id);
            if (dt.Rows.Count > 0) //获取栏目ID
            {
                classID = dt.Rows[0]["ClassID"].ToString();
            }
            if (!string.IsNullOrEmpty(classID))　//栏目ID是否在栏目中存在
            {
                //YSCMS.AccessDAL.News news = new YSCMS.AccessDAL.News();
                YSCMS.CMS.NewsClass news = new YSCMS.CMS.NewsClass();
                int rows = news.ExistsByClassId(classID);
                if (rows > 0)
                {
                    result = true;
                }
            }
            return result;
        }
    }
}
