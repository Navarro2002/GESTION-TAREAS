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
                lblUsuario.Text = "Juan Pérez";

                // Proyectos de prueba
                DataTable dtProyectos = new DataTable();
                dtProyectos.Columns.Add("nombre");
                dtProyectos.Columns.Add("estado");
                dtProyectos.Columns.Add("fecha_inicio", typeof(DateTime));
                dtProyectos.Rows.Add("Proyecto Alpha", "Activo", new DateTime(2024, 1, 10));
                dtProyectos.Rows.Add("Proyecto Beta", "Finalizado", new DateTime(2023, 5, 2));
                dtProyectos.Rows.Add("Proyecto Gamma", "En pausa", new DateTime(2024, 3, 15));
                gvProyectos.DataSource = dtProyectos;
                gvProyectos.DataBind();

                // Tareas de prueba
                DataTable dtTareas = new DataTable();
                dtTareas.Columns.Add("titulo");
                dtTareas.Columns.Add("estado");
                dtTareas.Columns.Add("fecha_limite", typeof(DateTime));
                dtTareas.Rows.Add("Diseñar interfaz", "Pendiente", new DateTime(2024, 8, 15));
                dtTareas.Rows.Add("Revisión de código", "En progreso", new DateTime(2024, 8, 20));
                dtTareas.Rows.Add("Pruebas unitarias", "Completada", new DateTime(2024, 7, 30));
                gvTareas.DataSource = dtTareas;
                gvTareas.DataBind();

                // Notificaciones de prueba
                var notificaciones = new List<dynamic>
                {
                    new { mensaje = "Tarea 'Diseñar interfaz' asignada.", fecha = DateTime.Now.AddHours(-2) },
                    new { mensaje = "Proyecto 'Beta' finalizado.", fecha = DateTime.Now.AddDays(-1) },
                    new { mensaje = "Nueva tarea disponible.", fecha = DateTime.Now.AddMinutes(-30) }
                };
                rptNotificaciones.DataSource = notificaciones;
                rptNotificaciones.DataBind();
            }
        }

        protected void gvProyectos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}