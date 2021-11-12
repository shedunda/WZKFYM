using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace YSCMS.IDAL
{
    public interface IDatabase
    {
        DataTable ExecuteSql(string sqlText);
        int backSqlData(int type, string backpath);
        void Replace(string oldTxt, string newTxt, string Table, string FieldName);
    }
}
