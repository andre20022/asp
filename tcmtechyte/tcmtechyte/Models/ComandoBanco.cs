using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace tcmtechyte.Models
{
    public class ComandoBanco
    {
        private readonly ConexaoBD db;

        public ComandoBanco()
        {
            db = new ConexaoBD();
           
        }
         
        public void ExecutaComando(string str)
        {
            //var con = new ConexaoBD();

            var comando = new SqlCommand
            {

                CommandText = str,
                CommandType = CommandType.Text,
                Connection = db.conexao

            };
            comando.ExecuteNonQuery();

        }

        public String[] VerificaLogin(Usuario usuario)
        {
            string[] n = new string[2];
            n[0] = "erro nao foi encotrado";
            string resutado = String.Format("select * from func where nome_usuario = '{0}' AND email = '{1}'", usuario.NomeUsuario,usuario.Email);
            SqlCommand com = new SqlCommand(resutado,db.conexao);
            SqlDataReader sqlData = com.ExecuteReader();
         
            if (sqlData.HasRows)
            {
                sqlData.Read();                     
                n[0] = String.Format("{0}", sqlData["nome_usuario"]);
                n[1] = String.Format("{0}", sqlData["nivel"]);
                
                return n;
            }
            else
            {
                return n;
            }
               
        }

        public SqlDataReader Func(string sql)
        {
            SqlCommand com = new SqlCommand(sql,db.conexao);
            return com.ExecuteReader();
        }

    }
}