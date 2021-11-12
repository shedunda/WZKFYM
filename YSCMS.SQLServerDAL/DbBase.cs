using System;
using System.Collections.Generic;
using System.Text;
using YSCMS.DALProfile;
using System.Data.Common;
using System.Data.SqlClient;
using YSCMS.Config;

namespace YSCMS.SQLServerDAL
{
    public class DbBase : IDbBase
    {
        DbCommand IDbBase.CreateCommand()
        {
            return new SqlCommand();
        }
        DbConnection IDbBase.CreateConnection()
        {
            return new SqlConnection();
        }
        DbDataAdapter IDbBase.CreateDataAdapter()
        {
            return new SqlDataAdapter();
        }
        DbParameter IDbBase.CreateParameter()
        {
            return new SqlParameter();
        }
        public string Pre;
        public DbBase()
        {
            Pre = DBConfig.TableNamePrefix;
            DbHelper.Provider = this;
        }
    }
}
