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
using YSCMS.Model;
using YSCMS.PageView.Controls;

namespace YSCMS.PageView.User.Photo
{
    public partial class Photo : YSCMS.PageBasic.UserPage
    {
        YSCMS.CMS.Photo pho = new YSCMS.CMS.Photo();
        YSCMS.CMS.Discuss dis = new YSCMS.CMS.Discuss();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "no-cache";

            this.PageNavigator2.OnPageChange += new PageChangeHandler(PageNavigator2_PageChange);
            if (!Page.IsPostBack)
            {
                string PhotoID = Request.QueryString["PhotoID"];
                if (Request.QueryString["typeS"] != null && Request.QueryString["typeS"] != string.Empty)
                {
                    if (pho.Delete(PhotoID.ToString()) == 0)
                    {
                        PageError("删除失败!", "Photoalbumlist.aspx");
                    }
                    else
                    {
                        PageRight("删除成功!", "Photoalbumlist.aspx");
                    }
                }

                string PhotoalbumID = "";
                if (Request.QueryString["PhotoalbumID"] != null)
                {
                    PhotoalbumID = YSCMS.Common.Input.Filter(Request.QueryString["PhotoalbumID"]);
                }
                else
                {
                    PageError("参数传递错误", "Photoalbumlist.aspx");
                }
                DataTable dt_phopwd = pho.sel(PhotoalbumID);
                int cut_phopwd = dt_phopwd.Rows.Count;
                if (cut_phopwd == 0)
                {
                    PageError("参数传递错误", "Photoalbumlist.aspx");

                }
                if (dt_phopwd.Rows[0][0].ToString() != "" && YSCMS.Global.Current.UserNum != dt_phopwd.Rows[0][1].ToString())
                {

                    this.Panel1.Visible = true;
                    this.Panel2.Visible = false;
                }
                else
                {
                    this.Panel1.Visible = false;
                    this.Panel2.Visible = true;
                }
                Show_cjlist(1);
                if (this.Panel2.Visible == true)
                {
                    sc.InnerHtml = Show_scs(PhotoalbumID);
                }
            }

        }
        protected void PageNavigator2_PageChange(object sender, int PageIndex2)
        {
            Show_cjlist(PageIndex2);
        }
        protected void Show_cjlist(int PageIndex2)
        {
            string PhotoalbumID = YSCMS.Common.Input.Filter(Request.QueryString["PhotoalbumID"].ToString());

            int ib, jb;
            SQLConditionInfo st = new SQLConditionInfo("@PhotoalbumID", PhotoalbumID);
            DataTable cjlistdts = YSCMS.CMS.Pagination.GetPage(this.GetType().Name, PageIndex2, 18, out ib, out jb, st);

            this.PageNavigator2.PageCount = jb;
            this.PageNavigator2.PageIndex = PageIndex2;
            this.PageNavigator2.RecordCount = ib;

            if (cjlistdts.Rows.Count > 0)
            {
                cjlistdts.Columns.Add("UserNamess", typeof(string));
                cjlistdts.Columns.Add("PhotoalbumName", typeof(string));
                cjlistdts.Columns.Add("PhotoUrls", typeof(string));
                string dirDumm = YSCMS.Config.UIConfig.dirDumm;
                if (dirDumm.Trim() != "")
                {
                    dirDumm = dirDumm + "/";
                }
                else
                {
                    dirDumm = "";
                }
                foreach (DataRow r in cjlistdts.Rows)
                {
                    r["UserNamess"] = dis.sel_60(r["UserNum"].ToString());
                    r["PhotoalbumName"] = dis.sel_61(r["PhotoalbumID"].ToString());
                    r["PhotoUrls"] = r["PhotoUrl"].ToString().ToLower().Replace("{@userdirfile}", dirDumm + YSCMS.Config.UIConfig.UserdirFile);
                }
                DataList1.DataSource = cjlistdts;
                DataList1.DataBind();
            }
            else
            {
                no.InnerHtml = Show_no();
                this.PageNavigator2.Visible = false;
            }
        }
        protected void open_Click(object sender, EventArgs e)
        {
            string PhotoalbumIDs = YSCMS.Common.Input.Filter(Request.QueryString["PhotoalbumID"]);
            string pwd = YSCMS.Common.Input.Filter(Request.Form["pwd"]);
            DataTable dt = pho.sel(PhotoalbumIDs);
            if (dt.Rows[0][0].ToString() != YSCMS.Common.Input.MD5(pwd, true))
            {
                PageError("密码错误", "Photoalbumlist.aspx");
            }
            else
            {
                this.Panel1.Visible = false;
                this.Panel2.Visible = true;
            }
        }
        string Show_scs(string PhotoalbumIDs)
        {
            string scs = "<a href=\"photofilt.aspx?PhotoalbumID=" + PhotoalbumIDs + "\" class=\"menulist\">幻灯播放</a>";
            return scs;
        }
        string Show_no()
        {
            string nos = "<table border=0 width='98%' cellpadding=\"5\" cellspacing=\"1\" class=\"table\" align=\"center\">";
            nos = nos + "<tr class='TR_BG_list'>";
            nos = nos + "<td class='navi_link'>没有数据</td>";
            nos = nos + "</tr>";
            nos = nos + "</table>";
            return nos;
        } 
    }
}