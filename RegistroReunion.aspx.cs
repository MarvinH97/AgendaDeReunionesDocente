using AgendaDeReunionesDocente.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgendaDeReunionesDocente
{
    public partial class RegistroReunion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                clFecha.Visible = false;
                txtTitulo.Focus();
                if (Request.QueryString["Id"] != null)
                {
                    int id = int.Parse(Request.QueryString["Id"]);
                    obtenerReunion(id);
                }
            }
        }

        protected void btnImgFecha_Click(object sender, ImageClickEventArgs e)
        {
            clFecha.Visible = !clFecha.Visible;
        }

        protected void clFecha_SelectionChanged(object sender, EventArgs e)
        {
            txtFecha.Text = clFecha.SelectedDate.ToShortDateString();
            clFecha.Visible = false;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (ViewState["Id"] != null)
                {
                    //SI HAY UN ID EN EL VIEWSTATE, SIGNIFICA QUE ESTAMOS ACTUALIZANDO UNA REUNIÓN
                    dsReunion.UpdateParameters["Id"].DefaultValue = ViewState["Id"].ToString();
                    dsReunion.Update();
                }
                else
                {
                    //SI NO HAY UN ID, SIGNIFICA QUE ESTAMOS INSERTANDO UNA NUEVA REUNIÓN
                    dsReunion.Insert();
                }
                Response.Redirect("Reuniones.aspx");
            }
        }

        protected void obtenerReunion(int id)
        {
            if (id > 0)
            {
                //GUARDAMOS EN EL VIEWSTATE EL ID PARA USARLO EN EL UPDATE
                ViewState["Id"] = id;
                //ACTUALIZAMOS EL PARAMETRO DEL SELECT PARA OBTENER LOS DATOS DE LA REUNIÓN
                dsReunion.SelectParameters["Id"].DefaultValue = id.ToString();

                DataView dv = (DataView)dsReunion.Select(DataSourceSelectArguments.Empty);
                if (dv.Count > 0)
                {
                    txtTitulo.Text = dv[0]["Titulo"].ToString();
                    txtDescripcion.Text = dv[0]["Descripcion"].ToString();
                    txtFecha.Text = dv[0]["FechaProgramacion"].ToString();
                    DateTime fecha; 
                    if (DateTime.TryParse(txtFecha.Text, out fecha))
                        clFecha.SelectedDate = fecha;
                }
            }
        }
    }
}