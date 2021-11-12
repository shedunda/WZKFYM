using System;
using System.Data;
using System.Reflection;
using YSCMS.Model;

namespace YSCMS.IDAL
{
    public interface IRss
    {
        int sel(string ClassID);
        DataTable getxmllist(string ClassID);
    }
}
