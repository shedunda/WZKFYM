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

namespace YSCMS.PageView.User.Photo
{
    public partial class Photo_Add : YSCMS.PageBasic.UserPage
    {
        YSCMS.CMS.Photo pho = new YSCMS.CMS.Photo();
        public string dirDumm = YSCMS.Config.UIConfig.dirDumm;
        public string UdirDumm = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "no-cache";
            if (!IsPostBack)
            {
                if (dirDumm.Trim() != "") { UdirDumm = dirDumm + "/"; }
                string UserNum = YSCMS.Global.Current.UserNum;
                DataTable dts1 = pho.sel_2(UserNum);
                this.Photoalbum.DataSource = dts1;
                this.Photoalbum.DataTextField = "PhotoalbumName";
                this.Photoalbum.DataValueField = "PhotoalbumID";
                this.Photoalbum.DataBind();
                if (Request.QueryString["PhotoalbumID"] != null && Request.QueryString["PhotoalbumID"] != string.Empty)
                {
                    if (dts1 != null && dts1.Rows.Count > 0)
                    {
                        for (int k = 0; k < this.Photoalbum.Items.Count; k++)
                        {
                            if (this.Photoalbum.Items[k].Value == Request.QueryString["PhotoalbumID"].ToString())
                            {
                                this.Photoalbum.Items[k].Selected = true;
                            }
                        }
                        dts1.Clear(); dts1.Dispose();
                    }
                }
            }
        }
        protected void server_Click(object sender, EventArgs e)
        {
            string PhotoUrl1 = YSCMS.Common.Input.Htmls(this.pic_p_1url.Text);
            string PhotoUrl2 = YSCMS.Common.Input.Htmls(this.pic_p_1ur2.Text);
            string PhotoUrl3 = YSCMS.Common.Input.Htmls(this.pic_p_1ur3.Text);
            bool flg = false;

            if (PhotoUrl1 != String.Empty && PhotoUrl1 != null)
            {
                flg = add_phtoto(PhotoUrl1);
            }

            if (PhotoUrl2 != String.Empty && PhotoUrl2 != null)
            {
                flg = add_phtoto(PhotoUrl2);
            }

            if (PhotoUrl3 != String.Empty && PhotoUrl3 != null)
            {
                flg = add_phtoto(PhotoUrl3);
            }

            if (!flg)
            {
                PageError("添加图片错误<br>", "Photoalbumlist.aspx");
            }
            else
            {
                PageRight("添加图片成功<br>", "Photoalbumlist.aspx");
            }

        }

        protected bool add_phtoto(string PValue)
        {
            string PhotoName = YSCMS.Common.Input.Htmls(Request.Form["PhotoName"].ToString());

            string PhotoalbumID = this.Photoalbum.SelectedValue;

            string PhotoContent = YSCMS.Common.Input.Htmls(Request.Form["PhotoContent"].ToString());

            string PhotoID = YSCMS.Common.Rand.Number(12);

            string UserNum = YSCMS.Global.Current.UserNum;

            YSCMS.Model.STPhoto ph = new YSCMS.Model.STPhoto();
            ph.PhotoContent = PhotoContent;
            ph.PhotoName = PhotoName;

            DataTable dID = pho.sel_3();
            int cut = dID.Rows.Count;
            string pID = "";
            if (cut > 0)
            {
                pID = dID.Rows[0]["PhotoID"].ToString();
            }
            if (Photoalbum.SelectedValue != "")
            {
                if (pID != PhotoID)
                {
                    if (pho.Add(ph, UserNum, PhotoalbumID, PValue, PhotoID) == 0)
                        return false;
                    return true;
                }
                return false;
            }
            return false;
        }
    }
}