using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;

namespace YSCMS.Config
{
    public class AdaptConfig
    {
        private bool ys_isAdapt;
        /// <summary>
        /// 是否开启整合
        /// </summary>
        public bool isAdapt
        {
            set { ys_isAdapt = value; }
            get { return ys_isAdapt; }
        }       
        private string ys_adaptKey;
        /// <summary>
        /// 整合密码key
        /// </summary>
        public string adaptKey
        {
            set { ys_adaptKey = value; }
            get { return ys_adaptKey; }
        }        
        private string ys_adaptPath;
        /// <summary>
        /// 请求页面地址
        /// </summary>
        public string adaptPath
        {
            set { ys_adaptPath = value; }
            get { return ys_adaptPath; }
        }
        /// <summary>
        /// 构造函数，为字段赋初值
        /// </summary>
        public AdaptConfig(string xmlName)
        {
            try
            {
                XmlDocument xmlDoc = new XmlDocument();                
                xmlDoc.Load(xmlName);
                XmlNode xn = xmlDoc.SelectSingleNode("adapt");
                XmlElement xeIsAdapt = (XmlElement)xn.SelectSingleNode("isAdapt");
                XmlElement xeAdaptKey = (XmlElement)xn.SelectSingleNode("adaptKey");
                XmlElement xePagePath = (XmlElement)xn.SelectSingleNode("adaptPath");
                if (xeIsAdapt.InnerText.ToUpper() == "TRUE")
                {
                    ys_isAdapt = true;
                }
                else
                {
                    ys_isAdapt = false;
                }
                ys_adaptKey = xeAdaptKey.InnerText;
                ys_adaptPath = xePagePath.InnerText;                    
            }
            catch
            {
                //
            }
        }
        /// <summary>
        /// 更新AdaptConfig
        /// </summary>
        /// <returns></returns>
        public bool saveAdaptConfig(string xmlName)
        {
            try
            {
                XmlDocument xmlDoc = new XmlDocument();                
                xmlDoc.Load(xmlName);
                XmlNode xn = xmlDoc.SelectSingleNode("adapt");
                XmlElement xeIsAdapt = (XmlElement)xn.SelectSingleNode("isAdapt");
                XmlElement xeAdaptKey = (XmlElement)xn.SelectSingleNode("adaptKey");
                XmlElement xePagePath = (XmlElement)xn.SelectSingleNode("adaptPath");
                if (ys_isAdapt)
                {
                    xeIsAdapt.InnerText = "true";
                }
                else
                {
                    xeIsAdapt.InnerText = "false";
                }
                xeAdaptKey.InnerText = ys_adaptKey;
                xePagePath.InnerText = ys_adaptPath;
                xmlDoc.Save(xmlName);
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
