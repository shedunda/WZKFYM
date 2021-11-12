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
            //У����Ȩ�ļ�
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
                    PageError("����ȷ��ȡ��Ȩ�ļ�����ȷ����վ����ʹ�ã�", "http://www.yuesisoft.com/yscms/reg.aspx");
                    return;
                }
            }
            else
            {
                //���License�Ƿ�Ϸ�
                if (lic.ExpireTime < DateTime.Now)
                {
                    PageError("��Ȩ�ļ����ڣ�����Ӧ�����Ѹ�������Ȩ�ļ���", "http://www.yuesisoft.com/yscms/pay.aspx");
                    return;
                }
                //string[] strDomain = lic.Domain.Split('%');
                string strDomain=lic.Domain.ToLower();
                string curDomain = HttpContext.Current.Request.Url.Host.ToLower();
                if (strDomain.Length<=0 || strDomain.Contains(curDomain)==false)
                {
                    PageError(string.Format("��Ȩ�ļ��в���������{0}������Ӧ�̹�������{0}����Ȩ�ļ���",curDomain), "http://www.yuesisoft.com/yscms/pay.aspx");
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
		/// �˳�
		/// </summary>
		protected virtual void Logout() {
			//�õ��û�����
			HttpCookie cook = HttpContext.Current.Request.Cookies["SITEINFO"];
			if (cook != null) {
				//�����û���cookieΪ����
				cook.Expires = DateTime.Now.AddDays(-1);
				cook.Value = null;
				Response.Cookies.Add(cook);
			}
		}
		/// <summary>
		/// ִ��һ��JS���
		/// </summary>
		/// <param name="sentence">Ҫִ�е����</param>
		protected void ExecuteJs(string sentence) {
			Context.Response.Write("<script language=\"javascript\" type=\"text/javascript\">");
			Context.Response.Write(sentence);
			Context.Response.Write("</script>");
		}
		/// <summary>
		/// ����û���Ϣ�Ự�Ƿ�ʱ
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
					ErrorMsg = "��IP[" + Common.Computer.GetIP() + "]�����ƣ����ܵ�½!";
					isAdminReturn = 2;
					break;
				case EnumLoginState.Err_Locked:
					ErrorMsg = "���Ѿ�������!";
					isAdminReturn = 2;
					break;
				case EnumLoginState.Err_AdminLogined:
                    Response.Write("<script language=\"javascript\">window.parent.location.href=\"" + dimm + "/" + YSCMS.Config.UIConfig.dirMana + "/login.aspx?urls=" + Request.Url + "\";</script>");
					Response.End();
					break;
				case EnumLoginState.Err_UnEmail:
					ErrorMsg = "����ûͨ�������ʼ�������ܵ�½��ϵͳ!";
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
					ErrorMsg = "����ûͨ���ֻ���֤�����ܵ�½��ϵͳ!<li><a href=\"" + dimm + "/" + UIConfig.dirUser + "info/MobileValidate.aspx?uid=" + Global.Current.UserName + "\"><font color=\"Blue\">����˴���֤�����ֻ�</font></li>";
					isAdminReturn = 0;
					break;
				case EnumLoginState.Err_UnCert:
					ErrorMsg = "<script language=\"javascript\" type=\"text/javascript\">alert('����û��֤���ϣ�\\n�� [ȷ��] ����ʵ����֤��');top.location.href='" + dimm + "/" + UIConfig.dirUser + "/info/userinfo_idcard.aspx?type=CreatCert\';</script>";
					isAdminReturn = 0;
					break;
				case EnumLoginState.Err_NoAuthority:
					ErrorMsg = "��û�д���Ĳ���Ȩ��!";
					isAdminReturn = 1;
					break;
				case EnumLoginState.Err_AdminLocked:
					ErrorMsg = "���ѱ�����";
					isAdminReturn = 1;
					break;
				case EnumLoginState.Err_DbException:
					ErrorMsg = "ϵͳ����<li><span style=\"color:red\">����ԭ��</span></li><li>�����ݿ��������ͨ��ʧ�ܡ�</li><li>���ݿ������ַ�������ȷ��</li><li>���ݿⷢ���쳣��</li>";
					isAdminReturn = 2;
					break;
				case EnumLoginState.Err_UserNumInexistent:
					ErrorMsg = "�û�������";
					isAdminReturn = 2;
					break;
				case EnumLoginState.Err_AdminNumInexistent:
					ErrorMsg = "Ȩ�޲��㣡";
					isAdminReturn = 1;
					break;
				case EnumLoginState.Err_DurativeLogError:
					ErrorMsg = "���������½�����Ѿ�������,��" + _UserLogin.GetLoginSpan() + "���Ӻ��ٵ�¼!";
					isAdminReturn = 0;
					break;
				case EnumLoginState.Err_NameOrPwdError:
					ErrorMsg = "�û��������ڻ����������";
					isAdminReturn = 2;
					break;
				case EnumLoginState.Err_GroupExpire:
					ErrorMsg = "�����ʺ��ѹ���";
					isAdminReturn = 0;
					break;
				case EnumLoginState.Err_NotAdmin:
					ErrorMsg = "��Ǹ�������ǹ���Ա�����Ĳ����Ѿ���¼��<li>����IP��[" + Common.Computer.GetIP() + "]�ѱ���¼</li>";
					isAdminReturn = 1;
					break;
				case EnumLoginState.Succeed:
					return;
				default:
					ErrorMsg = "�쳣����" + state.ToString();
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
                Common.MessageBox.Show(this, ErrorMsg, "����", "");
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
		/// �����ͨ��Ա��¼״̬
		/// </summary>
		/// <param name="UserNum"></param>
		/// <param name="IsCert"></param>
		/// <param name="LimitedIP"></param>
		/// <returns></returns>
		private EnumLoginState CheckUserLogin(string UserNum, bool IsCert) {
			return _UserLogin.CheckUserLogin(UserNum, IsCert);
		}
		/// <summary>
		/// ������Ա��¼״̬
		/// </summary>
		/// <param name="UserNum"></param>
		/// <param name="LimitedIP"></param>
		/// <returns></returns>
		private EnumLoginState CheckAdminLogin(string UserNum) {
			return _UserLogin.CheckAdminLogin(UserNum);
		}
		/// <summary>
		/// �û���¼
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
		/// �����û���¼
		/// </summary>
		/// <param name="UserName"></param>
		/// <param name="Password"></param>
		/// <param name="info"></param>
		/// <returns></returns>
		protected EnumLoginState Login(string UserName, string Password, out GlobalUserInfo info) {
			return _UserLogin.PersonLogin(UserName, Password, out info);
		}
		/// <summary>
		/// �����û���¼
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
