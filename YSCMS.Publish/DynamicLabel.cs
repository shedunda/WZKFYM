namespace YSCMS.Publish
{
    using System;
    using System.Text.RegularExpressions;

    public class DynamicLabel : Label
    {
        private string LabelContent;

        public DynamicLabel(string labelname, LabelType labeltype) : base(labelname, labeltype)
        {
            this.LabelContent = string.Empty;
        }

        public override void GetContentFromDB()
        {
            string str = base._LabelName;
            string str2 = "";
            if (base._LabelName.Trim() == "{YS_DynClassLD}")
            {
                str2 = "[YS:Loop,YS:SiteID=0,YS:LabelType=ClassList,YS:ListType=News,YS:PageStyle=0$$30$]\x00b7<a href=\"{#URL}\"><a href=\"{#URL}\">{#Title}</a></a>  <span style=\"color:#999999;font-size:10px\">({#Date:Month}-{#Date:Day})</span>[/YS:Loop]";
            }
            else if (base._LabelName.Trim() == "{YS_DynClassLDC}")
            {
                str2 = "[YS:Loop,YS:SiteID=0,YS:LabelType=ClassList,YS:ListType=News,YS:PageStyle=0$$30$,YS:SubNews=true]\x00b7<a href=\"{#URL}\">{#Title}</a>  <span style=\"color:#999999;font-size:10px\">({#Date:Month}-{#Date:Day})</span>[/YS:Loop]";
            }
            else if (base._LabelName.IndexOf("{YS_DynClassD_") > -1)
            {
                str2 = "[YS:Loop,YS:SiteID=0,YS:LabelType=List,YS:Number=10,YS:NewsType=Last,YS:ClassID=" + base._LabelName.Replace("{YS_DynClassD_", "").TrimEnd(new char[] { '}' }) + "]\x00b7<a href=\"{#URL}\">{#Title}</a>  <span style=\"color:#999999;font-size:10px\">({#Date:Month}-{#Date:Day})</span>[/YS:Loop]";
            }
            else if (base._LabelName.IndexOf("{YS_DynClassDC_") > -1)
            {
                str2 = "[YS:Loop,YS:SiteID=0,YS:LabelType=List,YS:Number=10,YS:NewsType=Last,YS:SubNews=true,YS:ClassID=" + base._LabelName.Replace("{YS_DynClassDC_", "").TrimEnd(new char[] { '}' }) + "]\x00b7<a href=\"{#URL}\">{#Title}</a>  <span style=\"color:#999999;font-size:10px\">({#Date:Month}-{#Date:Day})</span>[/YS:Loop]";
            }
            else if (base._LabelName.IndexOf("{YS_DynClassR_") > -1)
            {
                str2 = "[YS:unLoop,YS:SiteID=0,YS:LabelType=RSS,YS:ClassID=" + base._LabelName.Replace("{YS_DynClassR_", "").TrimEnd(new char[] { '}' }) + "][/YS:unLoop]";
            }
            else if (base._LabelName.IndexOf("{YS_DynClassC_") > -1)
            {
                str2 = "[YS:unLoop,YS:SiteID=0,YS:LabelType=ClassNaviRead,YS:ClassID=" + base._LabelName.Replace("{YS_DynClassC_", "").TrimEnd(new char[] { '}' }) + ",YS:ClassTitleNumber=30,YS:ClassNaviTitleNumber=150][/YS:unLoop]";
            }
            else if (base._LabelName.IndexOf("{YS_DynClassC_") > -1)
            {
                str2 = "[YS:unLoop,YS:SiteID=0,YS:LabelType=ClassNaviRead,YS:ClassID=" + base._LabelName.Replace("{YS_DynClassC_", "").TrimEnd(new char[] { '}' }) + ",YS:ClassTitleNumber=30,YS:ClassNaviTitleNumber=150][/YS:unLoop]";
            }
            else if (base._LabelName.Trim() == "{YS_DynSpecialLD}")
            {
                str2 = "[YS:Loop,YS:SiteID=0,YS:LabelType=ClassList,YS:ListType=Special,YS:PageStyle=0$$30$]\x00b7<a href=\"{#URL}\">{#Title}</a>  <span style=\"color:#999999;font-size:10px\">({#Date:Month}-{#Date:Day})</span>[/YS:Loop]";
            }
            else if (base._LabelName.Trim() == "{YS_DynSpecialLDC}")
            {
                str2 = "[YS:Loop,YS:SiteID=0,YS:LabelType=ClassList,YS:ListType=Special,YS:PageStyle=0$$30$,YS:SubNews=true]\x00b7<a href=\"{#URL}\">{#Title}</a>  <span style=\"color:#999999;font-size:10px\">({#Date:Month}-{#Date:Day})</span>[/YS:Loop]";
            }
            else if (base._LabelName.IndexOf("{YS_DynSpecialD_") > -1)
            {
                str2 = "[YS:Loop,YS:SiteID=0,YS:LabelType=List,YS:Number=10,YS:NewsType=Special,YS:SpecialID=" + base._LabelName.Replace("{YS_DynSpecialD_", "").TrimEnd(new char[] { '}' }) + "]\x00b7<a href=\"{#URL}\">{#Title}</a>  <span style=\"color:#999999;font-size:10px\">({#Date:Month}-{#Date:Day})</span>[/YS:Loop]";
            }
            else if (base._LabelName.IndexOf("{YS_DynSpecialDC_") > -1)
            {
                str2 = "[YS:Loop,YS:SiteID=0,YS:LabelType=List,YS:Number=10,YS:NewsType=Special,YS:SubNews=true,YS:SpecialID=" + base._LabelName.Replace("{YS_DynSpecialDC_", "").TrimEnd(new char[] { '}' }) + "]\x00b7<a href=\"{#URL}\">{#Title}</a>  <span style=\"color:#999999;font-size:10px\">({#Date:Month}-{#Date:Day})</span>[/YS:Loop]";
            }
            else if (base._LabelName.IndexOf("{YS_DynSpecialC_") > -1)
            {
                str2 = "[YS:unLoop,YS:SiteID=0,YS:LabelType=SpeicalNaviRead,YS:SpecialID=" + base._LabelName.Replace("{YS_DynSpecialC_", "").TrimEnd(new char[] { '}' }) + ",YS:SpecialTitleNumber=30,YS:SpecialNaviTitleNumber=150][/YS:unLoop]";
            }
            this.LabelContent = str2;
        }

        public override void MakeHtmlCode()
        {
            this.ParseLabelConetent();
        }

        protected void ParseLabelConetent()
        {
            string pattern = @"\[YS:unLoop,[^\]]+\][\s\S]*?\[/YS:unLoop\]|\[YS:Loop,[^\]]+\][\s\S]*?\[/YS:Loop\]";
            Regex regex = new Regex(pattern, RegexOptions.Compiled);
            string labelContent = this.LabelContent;
            for (Match match = regex.Match(labelContent); match.Success; match = regex.Match(labelContent))
            {
                string masscontent = match.Value.Trim();
                LabelMass mass = new LabelMass(masscontent, base._CurrentClassID, base._CurrentSpecialID, base._CurrentNewsID, base._CurrentChID, base._CurrentCHClassID, base._CurrentCHSpecialID, base._CurrentCHNewsID) {
                    TemplateType = base._TemplateType
                };
                mass.ParseContent();
                string newValue = mass.Parse();
                labelContent = labelContent.Replace(masscontent, newValue);
            }
            base._FinalHtmlCode = labelContent;
        }
    }
}

