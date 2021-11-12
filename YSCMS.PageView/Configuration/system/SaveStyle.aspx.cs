using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YSCMS.PageView.Configuration.system
{
    public partial class SaveStyle : YSCMS.PageBasic.ManagePage
    {
        public SaveStyle()
        {
            Authority_Code = "T018";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            int result = 0;
            YSCMS.Model.StyleInfo stClass = new YSCMS.Model.StyleInfo();
            string StyleName = Request.Form["StyleName"];
            string ClassID = Request.Form["ClassID"];
            string Content = Request.Form["Content"] + "";
            YSCMS.CMS.Style.Style style_Class = new YSCMS.CMS.Style.Style();
            if (style_Class.StyleNametf(StyleName.ToString()) > 0)
            {
                Response.Write("名称已经存在!");
                Response.End();
            }
            stClass.StyleName = StyleName.ToString();
            stClass.ClassID = ClassID.ToString();
            stClass.Content = YSCMS.Common.Input.HtmlDecode(Content);
            stClass.Description = "";
            stClass.CreatTime = DateTime.Now;
            stClass.isRecyle = 0;
            result = style_Class.StyleAdd(stClass);
            if (result == 1)
            {
                Response.Write("保存样式成功!");
                Response.End();
            }
            else
            {
                Response.Write("保存样式失败!");
                Response.End();
            }
        }
    }
}