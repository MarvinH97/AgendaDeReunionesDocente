using AgendaDeReunionesDocente.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgendaDeReunionesDocente
{
    public partial class Docentes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvDocentes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar" || e.CommandName == "Eliminar")
            {
                // Obtener el índice de la fila
                int index = Convert.ToInt32(e.CommandArgument);

                // Recuperar el Id desde DataKeys
                string id = gvDocentes.DataKeys[index].Value.ToString();
                if (e.CommandName == "Editar")
                    Response.Redirect($"FormDocentes.aspx?Id={id}");
                else
                    eliminarDocente(int.Parse(id));
            }
        }

        protected void eliminarDocente(int id) {
            if (id > 0)
            {
                //ACTUALIZAMOS EL PARAMTEO DEL DELETE PARA ELIMINAR EL DOCENTE
                dsDocentes.DeleteParameters["Id"].DefaultValue = id.ToString();
                //EJECUTAMOS EL DELETE PARA ELIMINAR EL DOCENTE
                dsDocentes.Delete();
                //RECARGAMOS LOS DATOS EN EL GRIDVIEW
                dsDocentes.DataBind();
            }
        }
    }
}