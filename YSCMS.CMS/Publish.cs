
using System;
using System.Text;
using System.Data;
using YSCMS.DALFactory;
using YSCMS.Model;

namespace YSCMS.CMS
{
    public class Publish
    {
        YSCMS.IDAL.IPublish DalPublish = DataAccess.CreatePublish();
        public Publish()
        { }

        public IDataReader GetPublishNewsAll(out int nNewsCount)
        {
            return DalPublish.GetPublishNewsAll(out nNewsCount);
        }

        public IDataReader GetPublishNewsLast(int lastNum, bool unpublish, out int nNewsCount)
        {
            return DalPublish.GetPublishNewsLast(lastNum, unpublish, out nNewsCount);
        }

        public IDataReader GetNewsByCreateTime(DateTime beginTime, DateTime endTime, out int nNewsCount)
        {
            return DalPublish.GetPublishNewsByTime(beginTime, endTime, out nNewsCount);
        }

        public IDataReader GetPublishNewsByClass(string classid, bool unpublish, bool isdesc, string condition, out int ncount)
        {
            return DalPublish.GetPublishNewsByClass(classid, unpublish, isdesc, condition, out ncount);
        }

        public IDataReader GetClassAll(out int nClassCount)
        {
            return DalPublish.GetPublishClass(YSCMS.Global.Current.SiteID, "", true, out nClassCount);
        }

        public IDataReader GetPublishClass(string classid, out int nClassCount)
        {
            return DalPublish.GetPublishClass("", classid, true, out nClassCount);
        }

        public IDataReader GetSpecialAll(string spid, out int nSpecialCount)
        {
            return DalPublish.GetPublishSpecial(spid, out nSpecialCount);
        }

        public IDataReader GetPageAll(string classid, out int nClassCount)
        {
            return DalPublish.GetPublishClass("", classid, true, out nClassCount);
        }
    }
}
