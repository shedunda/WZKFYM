namespace YSCMS.Install
{
    using YSCMS.DALProfile;
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.IO;
    using System.Web;

    public class Comm
    {
        public static void ExecuteSql(string Sql)
        {
            DbHelper.ExecuteNonQuery(CommandType.Text, Sql, null);
        }

        public static void ExecuteSql(string connStr, string Sql)
        {
            DbHelper.ExecuteNonQuery(connStr, CommandType.Text, Sql, null);
        }

        public static void ExecuteSql(string connStr, string DatabaseName, string Sql)
        {
            SqlConnection connection = new SqlConnection(connStr);
            SqlCommand command = new SqlCommand(Sql, connection);
            connection.Open();
            if (DatabaseName != "##")
            {
                connection.ChangeDatabase(DatabaseName);
            }
            try
            {
                command.ExecuteNonQuery();
            }
            finally
            {
                connection.Close();
            }
        }

        public static bool FileExists(string filename)
        {
            return File.Exists(filename);
        }

        public static string GetMapPath(string strPath)
        {
            if (HttpContext.Current != null)
            {
                return HttpContext.Current.Server.MapPath(strPath);
            }
            return Path.Combine(AppDomain.CurrentDomain.BaseDirectory, strPath);
        }
    }
}

