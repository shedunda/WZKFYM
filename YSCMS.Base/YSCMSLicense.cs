using System;
using System.Collections.Generic;
using System.Text;

namespace YSCMS.Base
{
    [Serializable]
    public class YSCMSLicense : ICloneable
    {
        private DateTime _CreatedTime;//创建时间
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreatedTime
        {
            get 
            { 
                return _CreatedTime; 
            }
            set 
            { 
                _CreatedTime = value; 
            }
        }
        private DateTime _ExpireTime;//授权失效时间
        /// <summary>
        /// 授权失效日期
        /// </summary>
        public DateTime ExpireTime
        {
            get 
            { 
                return _ExpireTime; 
            }
            set 
            { 
                _ExpireTime = value; 
            }
        }
        private string _OrgName;//网站创办人
        /// <summary>
        /// 网站创办人
        /// </summary>
        public string OrgName
        {
            get
            {
                return _OrgName;
            }
            set
            {
                _OrgName = value;
            }
        }
        private string _Telephone;//网站联系电话
        /// <summary>
        /// 网站联系电话
        /// </summary>
        public string Telephone
        {
            get 
            { 
                return _Telephone; 
            }
            set 
            { 
                _Telephone = value; 
            }
        }

        private string _Support;//技术支持
        /// <summary>
        /// 技术支持
        /// </summary>
        public string Support
        {
            get 
            { 
                return _Support; 
            }
            set 
            { 
                _Support = value; 
            }
        }
        private string _Domain;//授权域名
        /// <summary>
        /// 授权域名
        /// </summary>
        public string Domain
        {
            get 
            { 
                return _Domain; 
            }
            set 
            { 
                _Domain = value; 
            }
        }



        public object Clone()
        {
            return Convertor.ByteArrayToObject(Convertor.ObjectToByteArray(this, false), false);
        }
    }
}
