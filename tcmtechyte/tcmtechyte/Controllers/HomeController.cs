using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Web.SessionState;
using tcmtechyte.Models;
using System.Data.SqlClient; 
using System.IO;

namespace tcmtechyte.Controllers
{
    [SessionState (SessionStateBehavior.Default)]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
       
           // Session.Add("mvc", "bem vindo ao mvc");
            return View();
        }

        public ActionResult Login()
        {
            var usuario = new Usuario();
            return View(usuario);

        }

        [HttpPost]
        public ActionResult Login( Usuario usuario)
        {
            if (ModelState.IsValid)
            {

                var comando = new ComandoBanco();
                var verifica = comando.VerificaLogin(usuario);

                if (verifica[0] == usuario.NomeUsuario)
                {
                    Session["funcionarios"] = verifica[0];
                    // Session.Add("funcionarios",verifica[0]);

                   if (verifica[1] == "1")
                    {
                        Session["adm"] = "GE2002";
                       // Session.Add("adm",2002);
                        Response.Redirect("Painel");
                    }
                   else
                    {
                        Response.Redirect("Funcionario");
                    }
                }
                else {
                    ViewBag.ver = verifica[0];
                    return View("Resultado", usuario);
                }
            }
            return View(usuario);

        }
        public ActionResult Logout()
        {
            Session.Clear();
            Session.Remove("funcionarios");
            return View("Index");
        }


        public ActionResult Resultado(Usuario usuario)
        {
            return View(usuario);
        }
        public ActionResult Painel()
        {
            var todosusuarios = Listar();
            return View(todosusuarios);
        }

        public ActionResult Editar(CadastroFunc func)
        {
            
            return View();
        }
        public ActionResult Funcionario()
        {

            return View();
        }

        public List<Usuario> Listar()
        {
            var comando = new ComandoBanco();
            string resultado = "select * from func";
            var retorno = comando.Func(resultado);
            return ListaDeFuncionario(retorno);
        }
        public List<Usuario> ListaDeFuncionario(SqlDataReader sql)
        {
 
            var usuarios = new List<Usuario>();
            while (sql.Read())
            {
                var tempFuncionario = new Usuario()
                {
                    CodUsuario = int.Parse(sql["cod_usuario"].ToString()),
                    NomeUsuario = sql["nome_usuario"].ToString(),
                    Email = sql["email"].ToString()
                };
                usuarios.Add(tempFuncionario);
               
            }
            sql.Close();
            return usuarios;
        }

        public ActionResult FuncionarioCadastro()
        {
            var funcionario = new CadastroFunc();
            return View(funcionario);

        }
        [HttpPost]
        public ActionResult FuncionarioCadastro(CadastroFunc funcionario)
        {
            //var conexao = new ConexaoBD();
            //var comando = new ComandoBanco();
            //string inserir = "INSERT INTO func(nome,sobre)VALUES('pedro','narigao')";
            ///comando.ExecutaComando(inserir);
            ///
            if (funcionario.Senha != funcionario.confirmaSenha)
            {
                ModelState.AddModelError("Senha",errorMessage:"Senha inadequadas");
            }
            if (ModelState.IsValid)
            {

                Response.Write("lixao kkkkk");
            }
           
            return View(funcionario);
        }


    }
}