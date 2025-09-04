<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeForm.aspx.cs" Inherits="GESTION_TAREAS.Views.Home.HomeForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
     
<head runat="server">
    <link href="<%= ResolveUrl("~/Diseño/StyleSheet1.css")  %>"" rel="stylesheet" type="text/css" />
    <title>Inicio - Sistema de Gestión de Proyectos</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="dashboard">
    <form id="form1" runat="server">
        <h1>Bienvenido, <asp:Label ID="lblUsuario" runat="server" >User</asp:Label>
        </h1>
        <h2>Resumen</h2>
        <table>
            <tr>
                <td>
                    <h3>Proyectos</h3>
                    <asp:GridView ID="gvProyectos" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="gvProyectos_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                            <asp:BoundField DataField="estado" HeaderText="Estado" />
                            <asp:BoundField DataField="fecha_inicio" HeaderText="Inicio" DataFormatString="{0:dd/MM/yyyy}" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td>
                    <h3>Tareas asignadas</h3>
                    <asp:GridView ID="gvTareas" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="titulo" HeaderText="Título" />
                            <asp:BoundField DataField="estado" HeaderText="Estado" />
                            <asp:BoundField DataField="fecha_limite" HeaderText="Límite" DataFormatString="{0:dd/MM/yyyy}" />
                        </Columns>
                    </asp:GridView>
                </td>
                 <td>
                 <div class="Gestiones">
                    <h3>Administración</h3>
                     <p>
                         <asp:Button ID="btnUsuario" CssClass="btn" runat="server" Text="Crear Usuario" OnClick="btnUsuario_Click" Width="114px" />
                     </p>
                     <p>
                         <asp:Button ID="btnTarea" runat="server" CssClass="btn" Text="Crear Tarea" OnClick="btnTarea_Click" Width="113px" />
                     </p>
                     </div>
                 </td>
                <td>
                    <div class="notificaciones">
                    <h3>Notificaciones</h3>
                    <asp:Repeater ID="rptNotificaciones" runat="server">
                        <ItemTemplate>
                            <div>
                                <%# Eval("mensaje") %> <br />
                                <small>(<%# Eval("fecha", "{0:dd/MM/yyyy HH:mm}") %>)</small>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    </div>
                </td>
               
            </tr>
        </table>
        <hr />
        <table>
            <tr>
                <td>
                    <h3>Proyectos por estado</h3>
                    <canvas id="chartProyectos"></canvas>
                </td>
                <td>
                    <h3>Tareas por estado</h3>
                    <canvas id="chartTareas"></canvas>
                </td>
            </tr>
        </table>
    </form>
        </div>
    <script>
        // Datos de ejemplo
        var proyectosPorEstado = {
            labels: ['Activo', 'Finalizado', 'En pausa'],
            data: [5, 2, 1]
        };

        var tareasPorEstado = {
            labels: ['Pendiente', 'En progreso', 'Completada'],
            data: [8, 4, 10]
        };

        // Gráfica de barras: Proyectos por estado
        new Chart(document.getElementById('chartProyectos'), {
            type: 'bar',
            data: {
                labels: proyectosPorEstado.labels,
                datasets: [{
                    label: 'Cantidad',
                    data: proyectosPorEstado.data,
                    backgroundColor: ['#007bff', '#28a745', '#ffc107']
                }]
            },
            options: {
                responsive: true,
                plugins: { legend: { display: false } }
            }
        });

        // Gráfica de pastel: Tareas por estado
        new Chart(document.getElementById('chartTareas'), {
            type: 'pie',
            data: {
                labels: tareasPorEstado.labels,
                datasets: [{
                    data: tareasPorEstado.data,
                    backgroundColor: ['#dc3545', '#17a2b8', '#28a745']
                }]
            },
            options: {
                responsive: true
            }
        });
    </script>

</body>
</html>
