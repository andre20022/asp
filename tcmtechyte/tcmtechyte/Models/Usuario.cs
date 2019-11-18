using System;
using System.ComponentModel.DataAnnotations;

namespace tcmtechyte.Models
{
    public class Usuario
    {
        public int CodUsuario { get; set; }

        public String Nivel { get; set; }

        [Required (ErrorMessage="Nome é obrigatório")]
        public String NomeUsuario { get; set; }
    
        [Required(ErrorMessage = "A senha é obrigatório")]
        [StringLength (32,MinimumLength = 5 ,ErrorMessage ="Insira umasenha no minnimo de 5 caracteres")]
        public String Senha { get; set; }
        [Required(ErrorMessage = "E-mail é obrigatório")]
        [RegularExpression(@"^[a-zA-Z]+(([\'\,\.\-][a-zA-Z])?[a-zA-Z]*)*\s+<(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3})>$|^(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3})$",
          ErrorMessage ="Digite um e-mail válido")]
        public String Email { get; set; }
 
    }
}