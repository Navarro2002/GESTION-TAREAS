using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESTION_TAREAS.Views.Proyectos
{
	public partial class TareasForm : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlDataTarea.Insert();
                GridViewTarea.DataBind();

                txtTitulo.Text = "";
                txtDescripcion.Text = "";
                lblMensaje.Text = "Tarea creada exitosamente";
                lblMensaje.Visible = true;

                // Registrar script para ocultar después de 3 segundos
                string script = "setTimeout(function(){ document.getElementById('" + lblMensaje.ClientID + "').style.display='none'; }, 3000);";
                ClientScript.RegisterStartupScript(this.GetType(), "OcultarMensaje", script, true);
            }
        }
    }
}