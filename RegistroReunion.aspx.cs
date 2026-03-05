using System;
using System.Collections.Generic;
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
    }
}