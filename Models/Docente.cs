using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AgendaDeReunionesDocente.Models
{
    public class Docente
    {
        public int Id { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public int Edad { get; set; }
        public string Genero { get; set; }
        public string Correo { get; set; }
        public string Telefono { get; set; }
        public string Usuario { get; set; }
        public string Clave { get; set; }
    }
}