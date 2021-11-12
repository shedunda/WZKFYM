using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using YSCMS.CMS;
using YSCMS.Config;
using YSCMS.Model;
using System.Xml;
using YSCMS.Base;

namespace YSCMS.PageBasic
{
	public class BasePage : System.Web.UI.Page {
        private string publicKey = "<RSAKeyValue><Modulus>jLYmyoJscz36IBbPuuM48c8ci67UdVD7up5Qhb3mel+Q3gCl9sIzGuPJAKieTjFL+S/MYnHQ0hRbqWviIfWFnJqzeG/mmfPeTWUexYpgmasnEIWmtHKhYuuJAFNb6Dxb0b0XmQ268gkWiOaz4oaPW0uwQkQoHQA6QxugdfPz2/s=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>";
		protected readonly int PAGESIZE = Config.UIConfig.GetPageSize();
		protected internal UserLogin _UserLogin;
        protected internal string CopyRight = "(c) 1993-2015 Yuesi Information Technology Co., Ltd. " + YSCMS.Config.verConfig.Productversion;
		protected void AddStyleSheet(Page page, string cssPath) {
			HtmlLink link = new HtmlLink();
			link.Href = cssPath;
			link.Attributes["rel"] = "stylesheet";
			link.Attributes["type"] = "text/css";
		}

		public BasePage() {
			_UserLogin = new UserLogin();
		}

		protected void PageRight(string rightMsg, string url) {
			PageRight(rightMsg, url, false, false);
		}

		protected void PageRight(string rightMsg, string url, bool noHistory) {
			PageRight(rightMsg, url, false, noHistory);
		}
		protected void PageRight(string errMsg, string url, bool retrunurl, bool noHistory) {
			WebHint.ShowRight(errMsg, url, retrunurl, noHistory);
		}

		protected void PageError(string errMsg, string url) {
			PageError(errMsg, url, false);
		}

		protected void PageError(string errMsg, string url, bool retrunurl) {
			WebHint.ShowError(errMsg, url, retrunurl);
		}
        private static void SetXml(string key, string text)
        {
            string name = key;
            key = "/root/data/" + key;
            string lFile = AppDomain.CurrentDomain.BaseDirectory + @"License.Xml";
            XmlDocument xmlDocument = new XmlDocument();
            if (System.IO.File.Exists(lFile) == false)
            {
                xmlDocument.LoadXml("<?xml version=\"1.0\" encoding=\"utf-8\"?><root>  <data>    <License></License>    <Sign></Sign>   </data></root>");
                xmlDocument.Save(lFile);
            }
            xmlDocument.Load(lFile);
            XmlNode xmlNode = xmlDocument.SelectSingleNode(key);
            if (xmlNode == null)
            {
                xmlNode = xmlDocument.CreateNode(XmlNodeType.Element, name, string.Empty);
                xmlNode.InnerText = text;
                xmlDocument.SelectSingleNode("/root/data").AppendChild(xmlNode);
            }
            else
            {
                xmlNode.InnerText = text;
            }
            xmlDocument.Save(lFile);
        }
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            string mLicense = "AAEAAAD/////AQAAAAAAAAAMAgAAAEFZU0NNUy5CYXNlLCBWZXYsaW9uPTEuMC4wLjAsIEN1bHR1cmU9bmV1dHJhbCwgUHVibGljS2V5VG9rZW49bnVsbAUBAAAAF1lTQ01TLkJhc2UuWVNDTVNMaWNlbnNlBgAAAAxfQ3JlYXRlZFRpbWULX0V4cGlyZVRpbWUIX09yZ05hbWUKX1RlbGVwaG9uZQhfU3VwcG9ydAdfRG9tYWluAAABAQEBDQ0CAAAAx4otZkUD0oiAffQF9XohDQYDAAAAEue9keermeivleeUqOWNleS9jQYEAAAACzE4MTcwNTUyMzk4BgUAAAAe5pyI5oCd5L+h5oGv56eR5oqA5pyJ6ZmQ5YWs5Y+4BgYAAAATbG9jYWxob3N0JTEyNy4wLjAuMQs=";
            string mSign = "S6+Wy3qtJYKTZcc8XIaueSVRhNKnTCVC8KsbaPLoglSjPdDk/gzJSb/c6uyS5GDKGTuqGM4xPqUPfSmGO3whAoCgpiDt5dgeDj70ERabbDdiCnJKw8mmxTFipuJkfNYYChWfrDYYYa2oQeF0rRIaqXsVjQKENCKAr12MBzR3ItU=";
            string lFile = AppDomain.CurrentDomain.BaseDirectory + @"License.Xml";
            if (HttpContext.Current.Session["YSCMSLicense"] == null || HttpContext.Current.Session["YSCMSSign"] == null)
            {
                if (System.IO.File.Exists(lFile) == true)
                {
                    XmlDocument xmlDocument = new XmlDocument();
                    xmlDocument.Load(lFile);

                    XmlNode xmlNode = xmlDocument.SelectSingleNode("/root/data/License");
                    if (xmlNode != null)
                        mLicense = xmlNode.InnerText;
                    xmlNode = xmlDocument.SelectSingleNode("/root/data/Sign");
                    if (xmlNode != null)
                        mSign = xmlNode.InnerText;

                }
                else
                {
                    SetXml("License", mLicense);
                    SetXml("Sign", mSign);
                }
                HttpContext.Current.Session["YSCMSLicense"] = mLicense;
                HttpContext.Current.Session["YSCMSSign"] = mSign;
            }
            else
            {
                mLicense = HttpContext.Current.Session["YSCMSLicense"].ToString();
                mSign = HttpContext.Current.Session["YSCMSSign"].ToString();
            }
            //校验授权文件
            YSCMSLicense lic = (YSCMSLicense)Convertor.StringToObject(mLicense);
            bool b = SimpleEncryptor.RSAVerify(publicKey, mLicense, mSign);
            if (b == false || lic == null)
            {
                int LicenseCount = 0;
                if (HttpContext.Current.Session["LicenseCount"] != null)
                    LicenseCount = (int)HttpContext.Current.Session["LicenseCount"];
                else
                    HttpContext.Current.Session["LicenseCount"] = 20;
                LicenseCount -= 1;
                HttpContext.Current.Session["LicenseCount"] = LicenseCount;
                if (LicenseCount < 0)
                {
                    PageError("请正确获取授权文件，以确保网站正常使用！", "http://www.yuesisoft.com/yscms/reg.aspx");
                    return;
                }
            }
            else
            {
                //检查License是否合法
                if (lic.ExpireTime < DateTime.Now)
                {
                    PageError("授权文件过期，请向供应商续费更换新授权文件！", "http://www.yuesisoft.com/yscms/pay.aspx");
                    return;
                }
                //string[] strDomain = lic.Domain.Split('%');
                string strDomain=lic.Domain.ToLower();
                string curDomain = HttpContext.Current.Request.Url.Host.ToLower();
                if (strDomain.Length<=0 || strDomain.Contains(curDomain)==false)
                {
                    PageError(string.Format("授权文件中不包含域名{0}，请向供应商购买域名{0}的授权文件！",curDomain), "http://www.yuesisoft.com/yscms/pay.aspx");
                    return;
                }
                HttpContext.Current.Session["LicOrgName"] = lic.OrgName;
                HttpContext.Current.Session["LicTelephone"] = lic.Telephone;
                HttpContext.Current.Session["LicSupport"] = lic.Support;
                HttpContext.Current.Session["LicDomain"] = lic.Domain;
                HttpContext.Current.Session["LicExpireTime"] = lic.ExpireTime;
                HttpContext.Current.Session["LicCreatedTime"] = lic.CreatedTime;
                return;
            }
        }

		/// <summary>
		/// 退出
		/// </summary>
		protected virtual void Logout() {
			//得到用户数据
			HttpCookie cook = HttpContext.Current.Request.Cookies["SITEINFO"];
			if (cook != null) {
				//设置用户的cookie为过期
				cook.Expires = DateTime.Now.AddDays(-1);
				cook.Value = null;
				Response.Cookies.Add(cook);
			}
		}
		/// <summary>
		/// 执行一个JS语句
		/// </summary>
		/// <param name="sentence">要执行的语句</param>
		protected void ExecuteJs(string sentence) {
			Context.Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
			Context.Response.Write(sentence);
			Context.Response.Write("</script>");
		}
		/// <summary>
		/// 检查用户信息会话是否超时
		/// </summary>
		/// <returns></returns>
		protected bool Validate_Session() {
			return !YSCMS.Global.Current.IsTimeout();
		}

		protected void LoginResultShow(EnumLoginState state) {
			string dimm = YSCMS.Config.UIConfig.dirDumm.Trim();
			if (dimm != string.Empty) {
				dimm = "/" + dimm;
			}
			string ErrorMsg = string.Empty;
			int isAdminReturn = 0;
			switch (state) {
				case EnumLoginState.Err_IPLimited:
					ErrorMsg = "您IP[" + Common.Computer.GetIP() + "]被限制，不能登陆!";
					isAdminReturn = 2;
					break;
				case EnumLoginState.Err_Locked:
					ErrorMsg = "您已经被锁定!";
					isAdminReturn = 2;
					break;
				case EnumLoginState.Err_AdminLogined:
                    Response.Write("<script language=\"javascript\">window.parent.location.href=\"" + dimm + "/" + YSCMS.Config.UIConfig.dirMana + "/login.aspx?urls=" + Request.Url + "\";</script>");
					Response.End();
					break;
				case EnumLoginState.Err_UnEmail:
					ErrorMsg = "您还没通过电子邮件激活，不能登陆本系统!";
					isAdminReturn = 0;
					break;
				case EnumLoginState.Err_TimeOut:
                    Response.Write("<script language=\"javascript\">window.parent.location.href=\"" + dimm + "/" + YSCMS.Config.UIConfig.dirUser + "/login.aspx?urls=" + Request.Url + "\";</script>");
					Response.End();
					break;
				case EnumLoginState.Err_AdminTimeOut:
                    Response.Write("<script language=\"javascript\">window.parent.location.href=\"" + dimm + "/" + YSCMS.Config.UIConfig.dirMana + "/login.aspx?urls=" + Request.Url + "\";</script>");
					Response.End();
					break;
				case EnumLoginState.Err_UnMobile:
					ErrorMsg = "您还没通过手机验证，不能登陆本系统!<li><a href=\"" + dimm + "/" + UIConfig.dirUser + "info/MobileValidate.aspx?uid=" + Global.Current.UserName + "\"><font color=\"Blue\">点击此处验证您的手机</font></li>";
					isAdminReturn = 0;
					break;
				case EnumLoginState.Err_UnCert:
					ErrorMsg = "<script language=\"javascript\" type=\"text/javascript\">alert('您还没认证资料！\\n点 [确定] 进行实名认证。');top.location.href='" + dimm + "/" + UIConfig.dirUser + "/info/userinfo_idcard.aspx?type=CreatCert\';</script>";
					isAdminReturn = 0;
					break;
				case EnumLoginState.Err_NoAuthority:
					ErrorMsg = "您没有此项的操作权限!";
					isAdminReturn = 1;
					break;
				case EnumLoginState.Err_AdminLocked:
					ErrorMsg = "您已被锁定";
					isAdminReturn = 1;
					break;
				case EnumLoginState.Err_DbException:
					ErrorMsg = "系统错误。<li><span style=\"color:red\">出错原因：</span></li><li>与数据库服务器的通信失败。</li><li>数据库连接字符串不正确。</li><li>数据库发生异常。</li>";
					isAdminReturn = 2;
					break;
				case EnumLoginState.Err_UserNumInexistent:
					ErrorMsg = "用户不存在";
					isAdminReturn = 2;
					break;
				case EnumLoginState.Err_AdminNumInexistent:
					ErrorMsg = "权限不足！";
					isAdminReturn = 1;
					break;
				case EnumLoginState.Err_DurativeLogError:
					ErrorMsg = "连续错误登陆，您已经被锁定,请" + _UserLogin.GetLoginSpan() + "分钟后再登录!";
					isAdminReturn = 0;
					break;
				case EnumLoginState.Err_NameOrPwdError:
					ErrorMsg = "用户名不存在或者密码错误";
					isAdminReturn = 2;
					break;
				case EnumLoginState.Err_GroupExpire:
					ErrorMsg = "您的帐号已过期";
					isAdminReturn = 0;
					break;
				case EnumLoginState.Err_NotAdmin:
					ErrorMsg = "抱歉，您不是管理员。您的操作已经记录！<li>您的IP：[" + Common.Computer.GetIP() + "]已被记录</li>";
					isAdminReturn = 1;
					break;
				case EnumLoginState.Succeed:
					return;
				default:
					ErrorMsg = "异常错误：" + state.ToString();
					isAdminReturn = 2;
					break;
			}
			string Returnurl = string.Empty;
			switch (isAdminReturn) {
				case 0:
					Returnurl = dimm + "/" + YSCMS.Config.UIConfig.dirUser + "/login.aspx?urls=" + Request.Url;
					break;
				case 1:
					if (state == EnumLoginState.Err_NoAuthority) {
						Returnurl = dimm + "/" + YSCMS.Config.UIConfig.dirMana + "/main.aspx";
					}
					else {
                        Returnurl = dimm + "/" + YSCMS.Config.UIConfig.dirMana + "/login.aspx?urls=" + Request.Url;
					}
					break;
				default:
					Returnurl = dimm + "/";
					break;
			}
            if (state == EnumLoginState.Err_NameOrPwdError ||state== EnumLoginState.Err_DbException)
            {
                Common.MessageBox.Show(this, ErrorMsg, "错误", "");
            }
            else
            {                
                PageError(ErrorMsg, Returnurl, true);
            }
		}
		protected void CheckUserLogin() {
			if (!Validate_Session())
				LoginResultShow(EnumLoginState.Err_TimeOut);
			else
				LoginResultShow(CheckUserLogin(YSCMS.Global.Current.UserNum, false));
		}
		protected void CheckUserLoginCert() {
			if (!Validate_Session())
				LoginResultShow(EnumLoginState.Err_TimeOut);
			else
				LoginResultShow(CheckUserLogin(YSCMS.Global.Current.UserNum, true));
		}
		protected void CheckAdminLogin() {
			if (!Validate_Session())
				LoginResultShow(EnumLoginState.Err_AdminTimeOut);
			else
				LoginResultShow(CheckAdminLogin(YSCMS.Global.Current.UserNum));
		}
		/// <summary>
		/// 检查普通会员登录状态
		/// </summary>
		/// <param name="UserNum"></param>
		/// <param name="IsCert"></param>
		/// <param name="LimitedIP"></param>
		/// <returns></returns>
		private EnumLoginState CheckUserLogin(string UserNum, bool IsCert) {
			return _UserLogin.CheckUserLogin(UserNum, IsCert);
		}
		/// <summary>
		/// 检查管理员登录状态
		/// </summary>
		/// <param name="UserNum"></param>
		/// <param name="LimitedIP"></param>
		/// <returns></returns>
		private EnumLoginState CheckAdminLogin(string UserNum) {
			return _UserLogin.CheckAdminLogin(UserNum);
		}
		/// <summary>
		/// 用户登录
		/// </summary>
		/// <param name="UserName"></param>
		/// <param name="Password"></param>
		/// <param name="info"></param>
		/// <param name="IsAdmin"></param>
		/// <returns></returns>
		protected EnumLoginState Login(string UserName, string Password, out GlobalUserInfo info, bool IsAdmin) {
			if (IsAdmin)
				return _UserLogin.AdminLogin(UserName, Password, out info);
			else
				return _UserLogin.PersonLogin(UserName, Password, out info);

		}
		/// <summary>
		/// 个人用户登录
		/// </summary>
		/// <param name="UserName"></param>
		/// <param name="Password"></param>
		/// <param name="info"></param>
		/// <returns></returns>
		protected EnumLoginState Login(string UserName, string Password, out GlobalUserInfo info) {
			return _UserLogin.PersonLogin(UserName, Password, out info);
		}
		/// <summary>
		/// 个人用户登录
		/// </summary>
		/// <param name="UserName"></param>
		/// <param name="Password"></param>
		protected void Login(string UserName, string Password) {
			GlobalUserInfo info;
			EnumLoginState state = _UserLogin.PersonLogin(UserName, Password, out info);
			if (state == EnumLoginState.Succeed)
				Global.Current.Set(info);
			else
				LoginResultShow(state);
		}
	}
}
