using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dapper;
using System.Data.SqlClient;

namespace DppPizzaci.Models
{
    public class DPP
    {
        private static string dbcon = "Server=.;Database=Pizzaci;Trusted_Connection=True;";
    
        public static void ExReturn(string procadi, DynamicParameters param = null)
        {
            using (SqlConnection con = new SqlConnection(dbcon))
            {
                con.Open();
                con.Execute(procadi, param, commandType: System.Data.CommandType.StoredProcedure);
            }
        }
        public static IEnumerable<T> ReturnList<T>(string procadi, DynamicParameters param = null)
        {
            using (SqlConnection con = new SqlConnection(dbcon))
            {
                con.Open();
                return con.Query<T>(procadi, param, commandType: System.Data.CommandType.StoredProcedure);
            }
        }
    }
}
