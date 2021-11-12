using System;
using System.Collections.Generic;
using System.Data;
using System.Reflection;

namespace YSCMS.DALFactory
{
    public interface IAdmin
    {
        void Lock(string id);
        void UnLock(string id);
        void Del(string id);
        DataTable GetAdminGroupList();
        DataTable GetSiteList();
        int Add(YSCMS.Model.AdminInfo aci);
        int Edit(YSCMS.Model.AdminInfo aci);
        DataTable GetAdminInfo(string id);
        string GetAdminPopList(string UserNum, int Id);
        void UpdatePOPlist(string UserNum, int Id, string PopLIST);
        DataTable getAdmininfoList();
    }
}
