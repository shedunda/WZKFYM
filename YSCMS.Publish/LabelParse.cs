namespace YSCMS.Publish
{
    using YSCMS.CMS;
    using YSCMS.CMS.Style;
    using YSCMS.Model;
    using System;
    using System.Collections.Generic;
    using System.Data;

    public class LabelParse
    {
        public static Dictionary<string, string> dicLabel = new Dictionary<string, string>();
        private YSCMS.CMS.Label LabelCMS = new YSCMS.CMS.Label();
        public YSCMS.Model.News NewModel = null;
        private YSCMS.CMS.Style.Style StyleCMS = new YSCMS.CMS.Style.Style();

        public void ParseAllLabel()
        {
            if (dicLabel.Count <= 0)
            {
                DataTable table = this.LabelCMS.outLabelALL(2);
                foreach (DataRow row in table.Rows)
                {
                    YSCMS.Publish.Label label = YSCMS.Publish.Label.GetLabel(row["Label_Name"].ToString());
                    label.LabelContent = row["Label_Content"].ToString();
                    label.MakeHtmlCode();
                    string finalHtmlCode = label.FinalHtmlCode;
                    if (!dicLabel.ContainsKey(row["Label_Name"].ToString()) && (finalHtmlCode != ""))
                    {
                        dicLabel.Add(row["Label_Name"].ToString(), finalHtmlCode);
                    }
                }
            }
        }

        public void ParseNewsLabel(int newsId, string labelName)
        {
            YSCMS.Publish.Label label = YSCMS.Publish.Label.GetLabel(labelName);
        }
    }
}

