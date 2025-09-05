using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GESTION_TAREAS.Views.Home;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;

namespace GESTION_TAREAS.Views.Auth
{
	public partial class LoginForm : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Validar usuario y guardar datos en sesión
            bool loginCorrecto = ValidarUsuario(username, password);

            if (loginCorrecto)
            {
                // Login correcto, redirigir al home
                Response.Redirect("/Views/Home/HomeForm.aspx");
            }
            else
            {
                // Login incorrecto, mostrar mensaje
                lblMessage.Text = "Usuario o contraseña incorrectos.";
            }
        }


        private bool ValidarUsuario(string usuario, string contraseña)
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // Traer datos del usuario junto con su rol
                string query = @"
                                SELECT u.id_usuario, u.nombre, u.email, r.nombre AS Rol
                                FROM usuarios u
                                INNER JOIN roles r ON u.id_rol = r.id_rol
                                WHERE u.email = @usuario AND u.password = @password";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@usuario", usuario);
                    cmd.Parameters.AddWithValue("@password", contraseña);

                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Guardar los datos del usuario en sesión
                            Session["IdUsuario"] = reader.GetInt32(0);
                            Session["Nombre"] = reader.GetString(1);
                            Session["Email"] = reader.GetString(2);
                            Session["Rol"] = reader.GetString(3);

                            return true; // Usuario válido
                        }
                    }
                }
            }

            return false; // Usuario no válido
        }


        private bool ProbarConexion()
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open(); // Intenta abrir la conexión
                                 // Si llega aquí, la conexión fue exitosa
                    return true;
                }
            }
            catch (Exception ex)
            {
                // Muestra el error si falla
                lblMessage.Text = "Error de conexión: " + ex.Message;
                return false;
            }
        }

  
    }
}