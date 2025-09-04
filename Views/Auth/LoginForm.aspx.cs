using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GESTION_TAREAS.Views.Home;

namespace GESTION_TAREAS.Views.Auth
{
	public partial class LoginForm : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

            
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Views/Home/HomeForm.aspx");
        }
    }
}