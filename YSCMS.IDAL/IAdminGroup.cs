using System;
using System.Collections.Generic;
using System.Data;
using System.Reflection;

namespace YSCMS.DALFactory
{
    public interface IAdminGroup
    {
        int Add(YSCMS.Model.AdminGroup agci);
        int Edit(YSCMS.Model.AdminGroup agci);
        void Del(string id);
        DataTable getInfo(string id);
        DataTable getClassList(string col, string TbName, string sqlselect);
        DataTable getColCname(string colname, string TbName, string classid, string id);
    }
}
