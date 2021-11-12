using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YSCMS.CMS;

namespace YSCMS.PageView.Manage.Sys
{
    public partial class StatisticsAdd : YSCMS.PageBasic.ManagePage
    {
        YSCMS.CMS.Stat sta = new YSCMS.CMS.Stat();
        RootPublic rd = new RootPublic();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "no-cache";//设置页面无缓存
            string act = Request.QueryString["act"];
            if (!IsPostBack)
            {
                if (act == "edit")
                {
                    this.Authority_Code = "S003";
                    this.CheckAdminAuthority();
                    EditClass();//修改
                }
            }
        }

        protected void stataddclass_ServerClick(object sender, EventArgs e)
        {
            string str = base.Request.QueryString["act"];
            base.Authority_Code = "S003";
            base.CheckAdminAuthority();
            if (this.Page.IsValid)//判断页面是否通过验证
            {
                string str3;
                string str2 = YSCMS.Common.Input.Filter(this.ClassName.Text.Trim());
                do
                {
                    str3 = YSCMS.Common.Rand.Number(12);
                }
                while (this.sta.sel_1(str3) != 0);
                if (this.sta.Str_CheckSql(str2) != 0)
                {
                    base.PageError("对不起，该类别已经存在", "StatisticsAdd.aspx?act=add");
                }
                if ((str2 == null) || (str2 == string.Empty))
                {
                    base.PageError("对不起，类别名称不能为空，请返回继续添加", "StatisticsAdd.aspx?act=add");
                }
                switch (str)
                {
                    case "edit":
                        {
                            string id = base.Request.QueryString["id"];
                            if (this.sta.Str_UpdateSql(str2, id) != 0)
                            {
                                this.rd.SaveUserAdminLogs(1, 1, base.UserNum, "修改统计系统分类", "修改成功");
                                base.PageRight("修改类别成功", "Statistics.aspx");
                            }
                            return;
                        }
                    case "add":
                        if (this.sta.Str_InSql_1(str3, str2, base.SiteID) != 0)
                        {
                            this.rd.SaveUserAdminLogs(1, 1, base.UserNum, "新增统计类别", "新增类别成功");
                            base.PageRight("新增类别成功", "Statistics.aspx");
                        }
                        return;
                }
                this.rd.SaveUserAdminLogs(1, 1, base.UserNum, "新增统计类别", "意外错误");
                base.PageError("意外错误：未知错误", "shortcut_list.aspx");
            }
        }

        void EditClass()
        {
            string id = Request.QueryString["id"].ToString();
            #region 从统计分类设置表中读出数据并初始化赋值
            ClassName.Text = sta.Str_ClassSql(id);
            #endregion
        }

    }
}
