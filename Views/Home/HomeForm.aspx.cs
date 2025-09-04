using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESTION_TAREAS.Views.Home
{
    public partial class HomeForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verificar que el usuario esté autenticado
                if (Session["IdUsuario"] == null)
                {
                    Response.Redirect("/Views/Auth/LoginForm.aspx");
                    return;
                }

                // Obtener datos del usuario desde la sesión
                int idUsuario = Convert.ToInt32(Session["IdUsuario"]);
                string nombre = Session["Nombre"].ToString();
                string rol = Session["Rol"].ToString();

                // Mostrar datos en labels
                lblUsuario.Text = rol;

            }
        }

        protected void gvProyectos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Views/Usuarios/UsuariosForm.aspx");
        }
        protected void btnTarea_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Views/Tareas/TareasForm.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear(); // Limpia todas las variables de sesión
            Session.Abandon(); // Marca la sesión actual como terminada

            // Opcional: limpiar cookies de autenticación si usas FormsAuthentication
            // FormsAuthentication.SignOut();

            Response.Redirect("/Views/Auth/LoginForm.aspx");
        }
    }
    
}