<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TareasForm.aspx.cs" Inherits="GESTION_TAREAS.Views.Proyectos.TareasForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administrar Tareas</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link href="<%= ResolveUrl("~/Content/styles.css")  %>"" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            height: 59px;
        }
    </style>
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
                    <asp:DropDownList ID="ddlProyecto" runat="server" DataSourceID="SqlDataProyectos" DataTextField="nombre" DataValueField="id_proyecto"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataProyectos" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionSQL %>" SelectCommand="SELECT [id_proyecto], [nombre] FROM [proyectos]"></asp:SqlDataSource>
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
                    <asp:SqlDataSource ID="SqlDatAsignado" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionSQL %>" SelectCommand="SELECT [id_usuario], [nombre] FROM [usuarios]"></asp:SqlDataSource>
                    <asp:DropDownList ID="ddlAsignadoA" runat="server" DataSourceID="SqlDatAsignado" DataTextField="nombre" DataValueField="id_usuario"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Prioridad:</td>
                <td>
                    <asp:DropDownList ID="ddlPrioridad" runat="server" DataSourceID="SqlDataPrioridad" DataTextField="nombre" DataValueField="id_prioridad">
                        <asp:ListItem Text="Alta" Value="Alta" />
                        <asp:ListItem Text="Media" Value="Media" />
                        <asp:ListItem Text="Baja" Value="Baja" />
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataPrioridad" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionSQL %>" SelectCommand="SELECT [id_prioridad], [nombre] FROM [prioridades]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Estado:</td>
                <td class="auto-style1">
                    <asp:DropDownList ID="ddlEstado" runat="server" DataSourceID="SqlDataEstado" DataTextField="nombre" DataValueField="id_estado">
                        <asp:ListItem Text="Pendiente" Value="Pendiente" />
                        <asp:ListItem Text="En progreso" Value="En progreso" />
                        <asp:ListItem Text="Completada" Value="Completada" />
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataEstado" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionSQL %>" SelectCommand="SELECT * FROM [estados_tareas]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>Fecha limite :</td>
                <td>
                    <input id="txtFechaLimite" type="date" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnCrear" CssClass="btn" runat="server" Text="Crear Tarea" OnClick="btnCrear_Click" />
                </td>
            </tr>
        </table>
        <hr />
        <h2>Lista de tareas<asp:GridView ID="GridViewTarea" runat="server" AutoGenerateColumns="False" DataKeyNames="id_tarea" DataSourceID="SqlDataTarea" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id_tarea" HeaderText="id_tarea" InsertVisible="False" ReadOnly="True" SortExpression="id_tarea" />
                <asp:BoundField DataField="Tarea" HeaderText="Tarea" SortExpression="Tarea" />
                <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                <asp:BoundField DataField="Proyecto" HeaderText="Proyecto" SortExpression="Proyecto" ReadOnly="True" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" ReadOnly="True" />
                <asp:BoundField DataField="Prioridad" HeaderText="Prioridad" SortExpression="Prioridad" ReadOnly="True" />
                <asp:BoundField DataField="fecha_creacion" HeaderText="fecha_creacion" ReadOnly="True" SortExpression="fecha_creacion" />
                <asp:BoundField DataField="fecha_limite" HeaderText="fecha_limite" SortExpression="fecha_limite" ReadOnly="True" />
            </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataTarea" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionSQL %>" DeleteCommand="DELETE FROM [tareas] WHERE [id_tarea] = @id_tarea" InsertCommand="INSERT INTO [tareas] ([id_proyecto], [titulo], [descripcion], [id_prioridad], [id_estado], [fecha_creacion], [fecha_limite]) VALUES (@id_proyecto, @titulo, @descripcion, @id_prioridad, @id_estado, @fecha_creacion, @fecha_limite)" SelectCommand="SELECT 
    t.id_tarea,
    t.titulo AS Tarea,
    t.descripcion,
    p.nombre AS Proyecto,
    e.nombre AS Estado,
    pr.nombre AS Prioridad,
    t.fecha_creacion,
    t.fecha_limite
FROM tareas t
INNER JOIN proyectos p ON t.id_proyecto = p.id_proyecto
INNER JOIN estados_tareas e ON t.id_estado = e.id_estado
INNER JOIN prioridades pr ON t.id_prioridad = pr.id_prioridad
ORDER BY p.nombre, t.titulo;" UpdateCommand="UPDATE [tareas] SET [titulo] = @Tarea, [descripcion] = @Descripcion WHERE [id_tarea] = @id_tarea">
                <DeleteParameters>
                    <asp:Parameter Name="id_tarea" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="ddlProyecto" Name="id_proyecto" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="txtTitulo" Name="titulo" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtDescripcion" Name="descripcion" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="ddlPrioridad" Name="id_prioridad" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="ddlEstado" Name="id_estado" PropertyName="SelectedValue" Type="Int32" />
                    <asp:QueryStringParameter Name="fecha_creacion" QueryStringField="GETDATE()" Type="DateTime" />
                    <asp:FormParameter DbType="Date" FormField="txtFechaLimite" Name="fecha_limite" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_proyecto" Type="Int32" />
                    <asp:Parameter Name="titulo" Type="String" />
                    <asp:Parameter Name="descripcion" Type="String" />
                    <asp:Parameter Name="id_prioridad" Type="Int32" />
                    <asp:Parameter Name="id_estado" Type="Int32" />
                    <asp:Parameter Name="fecha_creacion" Type="DateTime" />
                    <asp:Parameter DbType="Date" Name="fecha_limite" />
                    <asp:Parameter Name="id_tarea" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </h2>
    </form>
        </div>
</body>
</html>
