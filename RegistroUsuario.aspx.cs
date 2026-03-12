using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgendaDeReunionesDocente
{
    public partial class RegistroUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtNombres.Focus();
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void cvGenero_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (rblGenero.SelectedItem == null || (rblGenero.SelectedItem.Value != "M" && rblGenero.SelectedItem.Value != "F"))
            {
                args.IsValid = false;
            }
            else 
            {
                args.IsValid = true;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                dsRegistroUsuario.Insert();
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}