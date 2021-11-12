
using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using YSCMS.Model;
using YSCMS.IDAL;
using YSCMS.DALFactory;

namespace YSCMS.CMS
{
    public class Pagination
    {
        public static DataTable GetPage(string PageName, int PageIndex, int PageSize, out int RecordCount, out int PageCount, params SQLConditionInfo[] SqlCondition)
        {
            IPagination dal = DataAccess.CreatePagination();
            return dal.GetPage(PageName, PageIndex, PageSize, out RecordCount, out PageCount, SqlCondition);
        }
    }
}
