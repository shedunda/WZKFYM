﻿using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.IO;
using YSCMS.Common;

namespace YSCMS.PageView.Manage.Sys
{
    public partial class Const : YSCMS.PageBasic.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "no-cache";         //设置页面无缓存
            string str = YSCMS.Config.UIConfig.constPass;
            string Idinfo = "";
            if (Session["tb_"] == null)
            {
                Idinfo = "";
            }
            else
            {
                Idinfo = Session["tb_"].ToString();
            }
            Session["tb_"] = null;
            if (!IsPostBack)
            {
                if (SiteID != "0") { PageError("您没有配置文件的权限", ""); }
                if (Idinfo != "" && Idinfo != String.Empty && Idinfo != null)
                {
                    if (str == Idinfo)
                    {
                        StartPage();
                    }
                    else
                    {
                        PageError("密码错误,请重新输入!", "windlogin.aspx");
                    }
                }
                else
                {
                    Response.Redirect("windlogin.aspx");
                }
            }
        }

        /// <summary>
        /// 初始化页面
        /// </summary>
        void StartPage()
        {
            dirMana.Text = YSCMS.Config.UIConfig.dirMana;
            dirTemplet.Text = YSCMS.Config.UIConfig.dirTemplet;
            dirDumm.Text = YSCMS.Config.UIConfig.dirDumm;
            dirFile.Text = YSCMS.Config.UIConfig.dirFile;
            filePass.Text = YSCMS.CMS.YSSecurity.FDESEncrypt(YSCMS.Config.UIConfig.filePass, 0);
            constPass.Text = YSCMS.CMS.YSSecurity.FDESEncrypt(YSCMS.Config.UIConfig.constPass, 0);
            protRand.Text = YSCMS.Config.UIConfig.protRand;
            filePath.Text = YSCMS.Config.UIConfig.filePath;
            dirPige.Text = YSCMS.Config.UIConfig.dirPige;
            sqlConnData.Text = YSCMS.Config.UIConfig.sqlConnData;
            manner.Text = YSCMS.Config.UIConfig.CssPath();
            //检测是否开启密码保护功能
            protPass.Text = YSCMS.Config.UIConfig.protPass;
            //检测统计是否采用独立数据库
            CheckStat(int.Parse(YSCMS.Config.UIConfig.indeData));
        }

        /// <summary>
        /// 设置RadioButtonList属性
        /// </summary>
        /// <param name="pram">Xml文件字节</param>
        /// <param name="sChar">控件类型</param>
        void CheckValue(int pram, RadioButtonList sChar)
        {
            switch (pram)
            {
                case 0:
                    sChar.Items[1].Selected = true;
                    break;
                case 1:
                    sChar.Items[0].Selected = true;
                    break;
                default:
                    sChar.Items[1].Selected = true;
                    break;
            }
        }

        /// <summary>
        /// 提交数据处理
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_const_Click(object sender, EventArgs e)
        {
            #region 检测web.config是否只读
            if (Public.constReadOnly(0, "xml/sys/yscms.config"))
                Public.constReadOnly(2, "xml/sys/yscms.config");
            #endregion

            //文件上传目录是否被修改
            string fileForderPath = Server.MapPath("../../files/" + this.dirFile.Text.Trim());

            DirectoryInfo dir = new DirectoryInfo(fileForderPath);
            if (!dir.Exists)
            {
                dir.Create();
            }

            #region 更新配置文件
            foreach (Control ctl in this.Controls[0].Controls)
            {
                switch (ctl.GetType().Name)
                {
                    case "TextBox":
                        {
                            TextBox tb = new TextBox();
                            tb = (TextBox)this.FindControl(ctl.ID);
                            if (tb.ID == "filePass")
                            {
                                tb.Text = YSCMS.CMS.YSSecurity.FDESEncrypt(tb.Text, 1);
                            }

                            if (tb.ID == "constPass")
                            {
                                tb.Text = YSCMS.CMS.YSSecurity.FDESEncrypt(tb.Text, 1);
                            }
                            Public.SaveXmlConfig(tb.ID, tb.Text.ToString().Trim(), "xml/sys/yscms.config");
                            break;
                        }
                    case "RadioButtonList":
                        {
                            RadioButtonList rbl = new RadioButtonList();
                            rbl = (RadioButtonList)this.FindControl(ctl.ID);
                            Public.SaveXmlConfig(rbl.ID, rbl.Text.ToString().Trim(), "xml/sys/yscms.config");
                            break;
                        }
                    default:
                        break;
                }
            }
            #endregion
            //Public.constReadOnly(1, "xml/sys/yscms.config");
            StartPage();
            //刷新
            YSCMS.Config.UIConfig.RefurbishCatch();
            PageRight("配置文件更新成功！", "const.aspx?ID=" + YSCMS.CMS.YSSecurity.FDESEncrypt(this.constPass.Text, 1) + "");

        }

        /// <summary>
        /// 判断统计是否是独立数据库选中状态
        /// </summary>
        /// <param name="pram"></param>
        void CheckStat(int pram)
        {
            switch (pram)
            {
                case 1:
                    stat1.Checked = true;
                    stat0.Checked = false;
                    break;
                case 0:
                    stat1.Checked = false;
                    stat0.Checked = true;
                    break;
            }
        }

        /// <summary>
        /// 回调参数
        /// </summary>
        protected void showjs()
        {
            int stat_pram = int.Parse(YSCMS.Config.UIConfig.indeData);
            Response.Write("<script language=\"javascript\">Change(" + stat_pram + ");</script>");
        }
    }
}