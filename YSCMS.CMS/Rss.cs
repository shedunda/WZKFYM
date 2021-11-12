using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using YSCMS.DALFactory;
using YSCMS.Model;
using YSCMS.IDAL;

namespace YSCMS.CMS
{
    public class Rss
    {
        private IRss dal;
        public Rss()
        {
            dal = YSCMS.DALFactory.DataAccess.CreateRss();
        }
        public int sel(string ClassID)
        {
            return dal.sel(ClassID);
        }

        public DataTable getxmllist(string ClassID)
        {
            DataTable dt = dal.getxmllist(ClassID);
            return dt;
        }

    }
}
