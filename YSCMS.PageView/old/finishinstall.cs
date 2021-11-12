namespace Foosun.PageView.Install
{
    using Foosun.Config;
    using Foosun.PageBasic;
    using System;
    using System.IO;
    using System.Web.UI.HtmlControls;

    public class finishinstall : BasePage
    {
        protected HtmlForm form1;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string[] strArray = new string[] { "Index.aspx", "step1.aspx", "step2.aspx", "step3.aspx", "step4.aspx", "step_End.aspx" };
                for (int i = 0; i < strArray.Length; i++)
                {
                    string path = base.Server.MapPath(strArray[i].ToString());
                    if (File.Exists(path))
                    {
                        File.Delete(path);
                    }
                    if (Directory.Exists(base.Server.MapPath("~/install/SQL")))
                    {
                        Directory.Delete(base.Server.MapPath("~/install/SQL"));
                    }
                }
            }
            catch
            {
                base.Response.Redirect("../" + UIConfig.dirMana + "/login.aspx?");
            }
            base.Response.Redirect("../" + UIConfig.dirMana + "/login.aspx?");
        }
    }
}

