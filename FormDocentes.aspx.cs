using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgendaDeReunionesDocente
{
    public partial class FormDocentes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtNombres.Focus();
                if (Request.QueryString["Id"] != null)
                {
                    int id = int.Parse(Request.QueryString["Id"]);
                    obtenerDocente(id);
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (ViewState["Id"] != null)
                {
                    //SI HAY UN ID EN EL VIEWSTATE, SIGNIFICA QUE ESTAMOS ACTUALIZANDO UN DOCENTE
                    dsDocente.UpdateParameters["Id"].DefaultValue = ViewState["Id"].ToString();
                    dsDocente.Update();
                }
                else
                {
                    //SI NO HAY UN ID, SIGNIFICA QUE ESTAMOS INSERTANDO UN NUEVO DOCENTE
                    dsDocente.Insert();
                }
                Response.Redirect("Docentes.aspx");
            }
        }

        protected void cvGenero_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (rblGenero.SelectedItem != null && (rblGenero.SelectedItem.Value == "M" || rblGenero.SelectedItem.Value == "F"))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void obtenerDocente(int id)
        {
            if (id > 0)
            {
                //GUARDAMOS EN EL VIEWSTATE EL ID PARA USARLO EN EL UPDATE
                ViewState["Id"] = id;
                //ACTUALIZAMOS EL PARAMETRO DEL SELECT PARA OBTENER LOS DATOS DEL DOCENTE
                dsDocente.SelectParameters["Id"].DefaultValue = id.ToString();

                DataView dv = (DataView)dsDocente.Select(DataSourceSelectArguments.Empty);
                if (dv.Count > 0)
                {
                    txtNombres.Text = dv[0]["Nombres"].ToString();
                    txtApellidos.Text = dv[0]["Apellidos"].ToString();
                    txtEdad.Text = dv[0]["Edad"].ToString();
                    rblGenero.SelectedValue = dv[0]["Genero"].ToString();
                    txtCorreo.Text = dv[0]["Correo"].ToString();
                    txtTelefono.Text = dv[0]["Telefono"].ToString();
                }
            }
        }
    }
}