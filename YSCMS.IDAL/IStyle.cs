using System;
using System.Collections.Generic;
using System.Data;
using System.Reflection;

namespace YSCMS.IDAL
{
    public interface IStyle
    {
        int SytleClassAdd(YSCMS.Model.StyleClassInfo sc);
        int StyleClassEdit(YSCMS.Model.StyleClassInfo sc);
        void StyleClassDel(string id);
        void StyleClassRDel(string id);
        int StyleAdd(YSCMS.Model.StyleInfo sc);
        int StyleEdit(YSCMS.Model.StyleInfo sc);
        void StyleDel(string id);
        void StyleRdel(string id);
        DataTable GetstyleClassInfo(string id);
        DataTable GetstyleInfo(string id);
        DataTable Styledefine();
        DataTable StyleClassList();
        int StyleNametf(string CName);
        DataTable GetLabelStyle();
    }
}
