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
    public partial class Constr : YSCMS.PageBasic.UserPage
    {
        YSCMS.CMS.Constr con = new YSCMS.CMS.Constr();
        protected string getSiteRoot = "";
        private string dimmdir = YSCMS.Config.UIConfig.dirDumm;
        private string localSavedir = YSCMS.Config.UIConfig.dirFile;
        public string UDir = "\\Content";
        public int _SetTime = 180;
        public string loadTime = "";
        private DateTime getDateTime = System.DateTime.Now;
        //子新闻
        protected String UnNewsJsArray = "";
        //以下为以后预留
        protected String TopLineArray = "new Array()";
        protected String unNewsid = "";
        protected String FamilyArray = "['Agency FB','Arial','仿宋_GB2312','华文中宋','华文仿宋','华文彩云','华文新魏','华文细黑','华文行楷','宋体','宋体-方正超大字符集','幼圆','新宋体','方正姚体','方正舒体','楷体_GB2312','隶书','黑体']";
        protected String FontStyleArray = "{Regular:0,Bold:1,Italic:2,Underline:4,Strikeout:8}";
        protected String ys_PicInfo = "";
        protected string siteDomain = YSCMS.Common.Public.readparamConfig("siteDomain");
        protected string ConstrTF = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            getSiteRoot = siteDomain + dimmdir;
            photo.Attributes["readonly"] = "true";
            txtFile.Attributes["readonly"] = "true";
            if (!IsPostBack)
            {
                Response.CacheControl = "no-cache";
                ConstrTF = con.ConstrTF();
                string UM = YSCMS.Global.Current.UserNum;
                if (con.SelGroupNumber(UM) == 1)
                {
                    PageRight("对不起.你所投稿的数目已经大于你所能投稿的数目!<li>请联系管理员</li>", "");
                }
                this.Author.Text = YSCMS.Global.Current.UserName;
                YSCMS.CMS.UserMisc rd = new YSCMS.CMS.UserMisc();
                DataTable SiteTB = rd.getSiteList();
                if (SiteTB != null)
                {
                    this.site.DataSource = SiteTB;
                    this.site.DataTextField = "CName";
                    this.site.DataValueField = "ChannelID";
                    this.site.DataBind();
                }

                DataTable tb1 = con.SelConstrClass(UM);
                this.ConstrClass.DataSource = tb1;
                this.ConstrClass.DataTextField = "cName";
                this.ConstrClass.DataValueField = "Ccid";
                this.ConstrClass.DataBind();

            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string UserNum = YSCMS.Global.Current.UserNum;
                string Contents = YSCMS.Common.Input.Htmls(ContentBox.Value);
                string ClassID = this.ConstrClass.SelectedValue.ToString();
                string Title = YSCMS.Common.Input.Htmls(Request.Form["Title"].ToString());
                string Author = "";
                if (Request.Form["Author"].ToString() == "")
                {
                    Author = YSCMS.Global.Current.UserName;
                }
                else
                {
                    Author = YSCMS.Common.Input.Htmls(Request.Form["Author"].ToString());
                }
                string SiteID = this.site.SelectedValue.ToString();
                string Source = this.lxList1.SelectedValue.ToString();
                string Contrflg = "";
                Contrflg = this.inList1.SelectedValue.ToString() + "|" + fbList1.SelectedValue.ToString() + "|" + Locking.SelectedValue.ToString() + "|" + Recommendation.SelectedValue.ToString();
                string Tags = this.Tags.Text;
                string PicURL = YSCMS.Common.Input.Htmls(Request.Form["photo"].ToString());
                PicURL = photo.Text.Trim();
                YSCMS.Model.STConstr stcn;
                stcn.Content = Contents;
                stcn.ClassID = ClassID;
                stcn.Title = Title;
                stcn.Source = Source;
                stcn.Tags = Tags;
                stcn.Contrflg = Contrflg;
                stcn.Author = Author;
                stcn.PicURL = PicURL.Replace("{@dirfile}", YSCMS.Config.UIConfig.dirFile).Replace("{@userdirfile}", YSCMS.Config.UIConfig.UserdirFile);
                stcn.SiteID = YSCMS.Global.Current.SiteID;
                stcn.UserNum = UserNum;
                //栏目Id
                //附件文件的地址
                stcn.fileURL = this.txtFile.Text.Replace("{@dirfile}", YSCMS.Config.UIConfig.dirFile).Replace("{@userdirfile}", YSCMS.Config.UIConfig.UserdirFile);

                if (con.Add(stcn) != 0)
                {
                    PageRight("添加成功", "Constrlist.aspx");
                }
                else
                {
                    PageError("添加失败", "Constrlist.aspx");
                }
            }
        }

    }
}