using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace tcmtechyte.Models
{
    public class CadastroFunc
    {
        public int CodUsuario { get; set; }
        [Required(ErrorMessage = "Nome é obrigatório")]
        public String NomeUsuario { get; set; }
        [Required(ErrorMessage = "sobreNome é obrigatório")]
        public String SobreNome { get; set; }
        [Required(ErrorMessage = "CPF é obrigatório")]
        public String Cpf { get; set; }
        [Required(ErrorMessage = "Cargo é obrigatório")]
        public String Cargo { get; set; }
        [Required(ErrorMessage = "Descrição é obrigatório")]
        [StringLength(50, MinimumLength = 10, ErrorMessage = "Insira umasenha no minnimo de 10 caracteres")]
        public String Descricao { get; set; }
        public String  FotoUsuario{ get; set; }

        [Required(ErrorMessage = "A senha é obrigatório")]
        [StringLength(32, MinimumLength = 5, ErrorMessage = "Insira umasenha no minnimo de 5 caracteres")]
        public String Senha { get; set; }
        [Required(ErrorMessage = "Aconfirmação é obrigatório")]
        [Compare ("Senha",ErrorMessage ="As senhas são diferentes")]
        public String confirmaSenha { get; set; }
        [Required(ErrorMessage = "E-mail é obrigatório")]
        [RegularExpression(@"^[a-zA-Z]+(([\'\,\.\-][a-zA-Z])?[a-zA-Z]*)*\s+<(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3})>$|^(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3})$",
          ErrorMessage = "Digite um e-mail válido")]
        public String Email { get; set; }

        public string CaminhoImage { get; set; }
        public HttpPostedFileBase ImagemFile { get; set; }
    }
}