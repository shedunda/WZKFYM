using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using YSCMS.Model;
using YSCMS.DALFactory;
using YSCMS.IDAL;

namespace YSCMS.CMS
{
    public class FreeLabel
    {

        private IFreeLabel dal;
        public FreeLabel()
        {
            dal = DataAccess.CreateFreeLabel();
        }
        public IList<FreeLablelDBInfo> GetTables()
        {
            return dal.GetTables();
        }
        public IList<FreeLablelDBInfo> GetFields(string TableName)
        {
            return dal.GetFields(TableName);
        }
        public bool IsNameRepeat(int id, string Name)
        {
            return dal.IsNameRepeat(id, Name);
        }
        public bool Add(FreeLabelInfo info)
        {
            info.SiteID = YSCMS.Global.Current.SiteID;
            return dal.Add(info);
        }
        public bool Update(FreeLabelInfo info)
        {
            return dal.Update(info);
        }
        public FreeLabelInfo GetSingle(int id)
        {
            return dal.GetSingle(id);
        }
        public bool Delete(int id)
        {
            return dal.Delete(id);
        }
        public DataTable TestSQL(string Sql)
        {
            return dal.TestSQL(Sql);
        }
    }
}