namespace YSCMS.Install
{
    using YSCMS.Config;
    using System;
    using System.IO;
    using System.Text;
    using System.Web;
    using System.Xml;

    public class Config
    {
        public static string corpRight = null;
        public static string logo = null;
        public static string producename = null;
        public static string regprotocol = null;
        public static string style = null;
        public static string title = null;

        static Config()
        {
            title = "月思内容管理系统 " + verConfig.Productversion + " 安装程序";
            corpRight = "<div align=\"center\" style=\"position:relative ; font-size:12px; font-family: Arial\">" + verConfig.Productversion + " (Microsoft .NET Framework 4.0) <br />\x00a9 1993-2014 <a href=\"http://www.yuesisoft.com\" target=\"_blank\"><b>Yuesi Information Technology Co., Ltd.</b></a></div>";
            style = "<LINK rev=\"stylesheet\" media=\"all\" href=\"css/styles.css\" type=\"text/css\" rel=\"stylesheet\">";
            logo = "<img border=\"0\" src=\"image/logo.jpg\">";
            producename = "月思内容管理系统 " + verConfig.Productversion;
            regprotocol = "<p>版权所有 (c) 1993-2014，靖安县致远信息科技有限公司<br />保留所有权利。<p>感谢您选择YSCMS 产品。希望我们的努力能为您提供一个高效快速和功能强大的大型门户网站解决方案。<p>公司网址为 http://www.yuesisoft.com 官方讨论区为 http://bbs.yuesisoft.com。<p>YSCMS 著作权已在中华人民共和国国家版权局注册，著作权受到法律和国际公约保护。使用者：无论个人或组织、盈利与否、用途如何（包括以学习和研究为目的），均需仔细阅读本协议，在理解、同意、并遵守本协议的全部条款后，方可开始使用 YSCMS 软件。<p>本授权协议适用且仅适用于 YSCMS 3.x 版本，靖安县致远信息科技有限公司拥有对本授权协议的最终解释权。<ul type=\"I\"><p><li><b>协议许可的权利</b><ul type=\"1\"><li>您可以在完全遵守本最终用户授权协议的基础上，将本软件应用于非商业用途，而不必支付软件版权授权费用。<li>您可以在协议规定的约束和限制范围内修改 YSCMS 源代码(如果被提供的话)或界面风格以适应您的网站要求。<li>您拥有使用本软件构建的论坛中全部会员资料、文章及相关信息的所有权，并独立承担与文章内容的相关法律义务。<li>获得商业授权之后，您可以将本软件应用于商业用途，同时依据所购买的授权类型中确定的技术支持期限、技术支持方式和技术支持内容，自购买时刻起，在技术支持期限内拥有通过指定的方式获得指定范围内的技术支持服务。商业授权用户享有反映和提出意见的权力，相关意见将被作为首要考虑，但没有一定被采纳的承诺或保证。</ul><p><p><li><b>协议规定的约束和限制</b><ul type=\"1\"><li>未获商业授权之前，不得将本软件用于商业用途（包括但不限于企业网站、经营性网站、以营利为目或实现盈利的网站）。购买商业授权请登陆http://www.yuesisoft.com参考相关说明，也可以致电(+86)0795-4651864了解详情。<li>不得对本软件或与之关联的商业授权进行出租、出售、抵押或发放子许可证。<li>无论如何，即无论用途如何、是否经过修改或美化、修改程度如何，只要使用 YSCMS 的整体或任何部分，未经书面许可，网站页面内的 YSCMS 和靖安县致远信息科技有限公司下属网站（http://www.yuesisoft.com） 的链接都必须保留，而不能清除或修改。<li>禁止在 YSCMS 的整体或任何部分基础上以发展任何派生版本、修改版本或第三方版本用于重新分发。<li>如果您未能遵守本协议的条款，您的授权将被终止，所被许可的权利将被收回，并承担相应法律责任。</ul><p><li><b>有限担保和免责声明</b><ul type=\"1\"><li>本软件及所附带的文件是作为不提供任何明确的或隐含的赔偿或担保的形式提供的。<li>用户出于自愿而使用本软件，您必须了解使用本软件的风险，在尚未购买产品技术服务之前，我们不承诺提供任何形式的技术支持、使用担保，也不承担任何因使用本软件而产生问题的相关责任。<li>靖安县致远信息科技有限公司不对使用本软件构建的网站中的文章或信息承担责任。</ul></ul><p>有关 YSCMS 最终用户授权协议、商业授权与技术服务的详细内容，均由 YSCMS 官方网站独家提供。靖安县致远信息科技有限公司拥有在不事先通知的情况下，修改授权协议和服务价目表的权力，修改后的协议或价目表对自改变之日起的新授权用户生效。<p>电子文本形式的授权协议如同双方书面签署的协议一样，具有完全的和等同的法律效力。您一旦开始安装 YSCMS，即被视为完全理解并接受本协议的各项条款，在享有上述条款授予的权力的同时，受到相关的约束和限制。协议许可范围以外的行为，将直接违反本授权协议并构成侵权，我们有权随时终止授权，责令停止损害，并保留追究相关责任的权力。";
        }

        public static bool GetRootWebconfigPath()
        {
            try
            {
                if (!Comm.FileExists(Path.Combine(HttpContext.Current.Request.PhysicalApplicationPath, "web.config")))
                {
                    return false;
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static string IISSystemBINCheck(ref bool error)
        {
            string binDirectory = HttpRuntime.BinDirectory;
            string str2 = "";
            try
            {
                string[] strArray = new string[] { "YSCMS.CMS.dll", "YSCMS.Common.dll", "YSCMS.Config.dll", "YSCMS.DALFactory.dll", "YSCMS.DALProfile.dll", "YSCMS.Global.dll", "YSCMS.Model.dll", "YSCMS.Publish.dll", "YSCMS.SQLServerDAL.dll", "YSCMS.PageView.dll", "YSCMS.PageBasic.dll", "Interop.JRO.dll" };
                foreach (string str3 in strArray)
                {
                    if (!File.Exists(binDirectory + str3))
                    {
                        string str5 = str2;
                        str2 = str5 + "<tr><td bgcolor='#ffffff' width='5%'><img src='image/error.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>" + str3 + " 文件放置不正确<br/>请将所有的dll文件复制到目录 " + binDirectory + " 中.</td></tr>";
                        error = true;
                    }
                    else
                    {
                        str2 = str2 + "<tr><td bgcolor='#ffffff' width='5%'><img src='image/ok.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>" + str3 + " 文件放置正确.</td></tr>";
                    }
                }
            }
            catch
            {
                str2 = str2 + "<tr><td bgcolor='#ffffff' width='5%'><img src='image/error.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>请将所有的dll文件复制到目录 " + binDirectory + " 中.</td></tr>";
                error = true;
            }
            return str2;
        }

        public static string InitialSystemValidCheck(ref bool error)
        {
            error = false;
            StringBuilder builder = new StringBuilder();
            builder.Append("<table cellSpacing='0' cellPadding='0' width='90%' align='center' border='0' bgcolor='#666666' style='font-size:12px'>");
            HttpContext current = HttpContext.Current;
            string filename = null;
            if (current != null)
            {
                filename = current.Server.MapPath("/Web.config");
            }
            else
            {
                filename = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Web.config");
            }
            builder.Append(IISSystemBINCheck(ref error));
            if (!(Comm.FileExists(filename) || GetRootWebconfigPath()))
            {
                builder.Append("<tr style=\"height:15px\"><td bgcolor='#ffffff' width='5%'><img src='image/error.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>系统配置文件 Web.config 没有放置正确, 相关问题详见安装文档!</td></tr>");
                error = true;
            }
            else
            {
                builder.Append("<tr style=\"height:15px\"><td bgcolor='#ffffff' width='5%'><img src='image/ok.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>系统配置文件 Web.config 验证通过!</td></tr>");
            }
            string str2 = HttpContext.Current.Server.MapPath("~/xml/sys/yscms.config");
            XmlDocument document = new XmlDocument();
            document.Load(str2);
            XmlElement documentElement = document.DocumentElement;
            string innerText = null;
            string str4 = null;
            XmlNodeList elementsByTagName = documentElement.GetElementsByTagName("dirMana");
            if (elementsByTagName[0] != null)
            {
                innerText = elementsByTagName[0].InnerText;
            }
            else
            {
                innerText = "manage";
            }
            elementsByTagName = documentElement.GetElementsByTagName("dirTemplet");
            if (elementsByTagName[0] != null)
            {
                str4 = elementsByTagName[0].InnerText;
            }
            else
            {
                str4 = "Templets";
            }
            string str5 = "comm,configuration,controls,YS_Data,files,Install,jsfiles,logs," + innerText + ",stat,survey,sysImages," + str4 + ",user,userfiles,xml";
            foreach (string str6 in str5.Split(new char[] { ',' }))
            {
                if (!SystemFolderCheck(str6))
                {
                    builder.Append("<tr><td bgcolor='#ffffff' width='5%'><img src='image/error.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>对 " + str6 + " 目录没有写入和删除权限!</td></tr>");
                    error = true;
                }
                else
                {
                    builder.Append("<tr><td bgcolor='#ffffff' width='5%'><img src='image/ok.gif' width='16' height='16'></td><td bgcolor='#ffffff' width='95%'>对 " + str6 + " 目录权限验证通过!</td></tr>");
                }
            }
            builder.Append("</table>");
            return builder.ToString();
        }

        public static bool SystemFolderCheck(string foldername)
        {
            string mapPath = Comm.GetMapPath(@"..\" + foldername);
            try
            {
                using (FileStream stream = new FileStream(mapPath + @"\a.txt", FileMode.Create, FileAccess.ReadWrite, FileShare.ReadWrite))
                {
                    stream.Close();
                }
                File.Delete(mapPath + @"\a.txt");
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}

