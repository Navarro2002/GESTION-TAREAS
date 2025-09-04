using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESTION_TAREAS.Views.Usuarios
{
	public partial class UsuariosForm : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                // Verificar que la sesión exista
                if (Session["IdUsuario"] == null || Session["Nombre"] == null || Session["Rol"] == null)
                {
                    Response.Redirect("/Views/Auth/LoginForm.aspx");
                    return;
                }

                // Obtener datos del usuario desde la sesión
                int idUsuario = Convert.ToInt32(Session["IdUsuario"]);
                string nombre = Session["Nombre"].ToString();
                string rol = Session["Rol"].ToString();

                // Verificar que el usuario esté autenticado como admin
                if (!rol.Equals("admin", StringComparison.OrdinalIgnoreCase))
                {
                    Response.Redirect("/Views/Auth/LoginForm.aspx");
                    return;
                }

                // Aquí puedes cargar los datos de la página para el admin
            }

        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlDataSUsuarios.Insert(); // La fecha se llena automáticamente
                GridView1.DataBind();

                txtNombre.Text = "";
                txtCorreo.Text = "";
                txtContrasena.Text = "";
            }
        }
    }
}