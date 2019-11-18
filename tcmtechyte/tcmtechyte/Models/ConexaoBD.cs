using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace tcmtechyte.Models
{
    public class ConexaoBD : IDisposable
    {
        public readonly SqlConnection conexao;

        public ConexaoBD()
        {
            conexao = new SqlConnection(ConfigurationManager.ConnectionStrings["conexao"].ConnectionString);
            conexao.Open();
        }
   
        public void Dispose()
        {
            if (conexao.State==ConnectionState.Open)
            {
                conexao.Close();
            }
           
        }

     }
}