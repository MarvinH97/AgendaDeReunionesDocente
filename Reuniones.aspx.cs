using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgendaDeReunionesDocente
{
    public partial class Reuniones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvReuniones_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar" || e.CommandName == "Eliminar")
            {
                // Obtener el índice de la fila
                int index = Convert.ToInt32(e.CommandArgument);

                // Recuperar el Id desde DataKeys
                string id = gvReuniones.DataKeys[index].Value.ToString();
                if (e.CommandName == "Editar")
                    Response.Redirect($"RegistroReunion.aspx?Id={id}");
                else
                    eliminarReunion(int.Parse(id));
            }
        }

        protected void eliminarReunion(int id)
        {
            if (id > 0)
            {
                //ACTUALIZAMOS EL PARAMTEO DEL DELETE PARA ELIMINAR LA REUNIÓN
                dsReuniones.DeleteParameters["Id"].DefaultValue = id.ToString();
                //EJECUTAMOS EL DELETE PARA ELIMINAR LA REUNIÓN
                dsReuniones.Delete();
                //RECARGAMOS LOS DATOS EN EL GRIDVIEW
                dsReuniones.DataBind();
            }
        }
    }
}