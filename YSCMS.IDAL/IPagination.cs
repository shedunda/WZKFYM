using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using YSCMS.Model;
using System.Reflection;

namespace YSCMS.IDAL
{
    public interface IPagination
    {
        DataTable GetPage(string PageName, int PageIndex, int PageSize, out int RecordCount, out int PageCount, params SQLConditionInfo[] SqlCondition);
    }
}
