using System;
using YSCMS.CMS;

namespace YSCMS.PageView.Configuration.system
{
    public partial class GetClassCname : YSCMS.PageBasic.DialogPage
    {
        public GetClassCname()
        {
            BrowserAuthor = EnumDialogAuthority.ForAdmin;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            YSCMS.CMS.NewsClass NewsClassCMS = new NewsClass();
            string Type = Request.QueryString["Type"];
            string ClassID = Request.QueryString["ClassID"];
            string TCID = "";
            if (Type == "Class")
            {
                //add
                TCID = NewsClassCMS.GetNewsClassCName(ClassID.ToString());
                if (TCID == "没选择栏目")
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["add"]))
                    {
                        TCID = "根目录";
                    }
                }
            }
            else if (Type == "special")
            {
                //TCID = rd.getspecialCName(ClassID.ToString());
            }
            Response.Write(TCID);
        }
    }
}