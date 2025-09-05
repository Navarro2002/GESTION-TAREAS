<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TareasForm.aspx.cs" Inherits="GESTION_TAREAS.Views.Proyectos.TareasForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administrar Tareas</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link href="<%= ResolveUrl("~/Diseño/StyleSheet1.css")  %>"" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="tareas">
    <form id="form1" runat="server" >
        <h1>Administrar Tareas</h1>
        <h2>Crear nueva tarea</h2>
        <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" />
        <table>
            <tr>
                <td>Proyecto:</td>
                <td>
                    <asp:DropDownList ID="ddlProyecto" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Título:</td>
                <td><asp:TextBox ID="txtTitulo" runat="server" /></td>
            </tr>
            <tr>
                <td>Descripción:</td>
                <td><asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Rows="3" Columns="40" /></td>
            </tr>
            <tr>
                <td>Asignado a:</td>
                <td>
                    <asp:DropDownList ID="ddlAsignadoA" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Prioridad:</td>
                <td>
                    <asp:DropDownList ID="ddlPrioridad" runat="server">
                        <asp:ListItem Text="Alta" Value="Alta" />
                        <asp:ListItem Text="Media" Value="Media" />
                        <asp:ListItem Text="Baja" Value="Baja" />
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Estado:</td>
                <td>
                    <asp:DropDownList ID="ddlEstado" runat="server">
                        <asp:ListItem Text="Pendiente" Value="Pendiente" />
                        <asp:ListItem Text="En progreso" Value="En progreso" />
                        <asp:ListItem Text="Completada" Value="Completada" />
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Fecha límite:</td>
                <td><asp:TextBox ID="txtFechaLimite" runat="server" TextMode="Date" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnCrear" CssClass="btn" runat="server" Text="Crear Tarea" OnClick="btnCrear_Click" />
                </td>
            </tr>
        </table>
        <hr />
        <h2>Lista de tareas</h2>
        <asp:Table ID="TableTareas" CssClass="table2" runat="server" BorderWidth="1" GridLines="Both"></asp:Table>
    </form>
        </div>
</body>
</html>
