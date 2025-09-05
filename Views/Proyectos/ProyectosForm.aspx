<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProyectosForm.aspx.cs" Inherits="GESTION_TAREAS.Views.Proyectos.ProyectosForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <link href="<%= ResolveUrl("~/Content/styles.css")  %>"" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
    <div class="tareas">
        <h1>Administrar Proyectos</h1>
        <h2>Crear nuevo proyecto</h2>
        <asp:Label ID="lblMensaje" runat="server" ForeColor="#00CC00" />
        <table>
            <tr>
                <td class="auto-style2">Nombre:</td>
                <td>
                    <asp:TextBox ID="txtNombre" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Descripción:</td>
                <td class="auto-style1"><asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Rows="3" Columns="40" /></td>
            </tr>
            <tr>
                <td class="auto-style2">Fecha inicio:</td>
                <td>
                    <input id="txtFechaInicio" type="date" name="txtFechaInicio" /></td>
            </tr>
            <tr>
                <td class="auto-style2">Fecha fin:</td>
                <td>
                    <input id="txtFechaFin" type="date" name="txtFechaFin" /></td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnCrear" CssClass="btn" runat="server" Text="Crear proyecto" OnClick="btnCrear_Click" />
                </td>
            </tr>
        </table>
        <hr />
        <h2>Lista de proyectos<asp:SqlDataSource ID="SqlDataProyectos" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionSQL %>" DeleteCommand="DELETE FROM [proyectos] WHERE [id_proyecto] = @id_proyecto" InsertCommand="INSERT INTO [proyectos] ([nombre], [descripcion], [fecha_inicio], [fecha_fin], [id_estado], [id_usuario_creador]) VALUES (@nombre, @descripcion, @fecha_inicio, @fecha_fin, @id_estado, @id_usuario_creador)" SelectCommand="SELECT
    p.id_proyecto,
    p.nombre,
    p.descripcion,
    p.fecha_inicio,
    p.fecha_fin,
    et.nombre AS estado,
    u.nombre AS creador,
    p.id_estado
FROM
    proyectos AS p
JOIN
    estados_tareas AS et ON p.id_estado = et.id_estado
JOIN
    usuarios AS u ON p.id_usuario_creador = u.id_usuario
WHERE
    p.id_usuario_creador = @id_usuario;" UpdateCommand="UPDATE [proyectos] SET [nombre] = @nombre, [descripcion] = @descripcion, [fecha_inicio] = @fecha_inicio, [fecha_fin] = @fecha_fin, [id_estado] = @id_estado WHERE [id_proyecto] = @id_proyecto">
            <DeleteParameters>
                <asp:Parameter Name="id_proyecto" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="txtNombre" Name="nombre" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtDescripcion" Name="descripcion" PropertyName="Text" Type="String" />
                <asp:FormParameter DbType="Date" FormField="txtFechaInicio" Name="fecha_inicio" />
                <asp:FormParameter DbType="Date" FormField="txtFechaFin" Name="fecha_fin" />
                <asp:Parameter Name="id_estado" Type="Int32" DefaultValue="1" />
                <asp:SessionParameter DefaultValue="1" Name="id_usuario_creador" SessionField="IdUsuario" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="id_usuario" SessionField="IdUsuario" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="descripcion" Type="String" />
                <asp:Parameter DbType="Date" Name="fecha_inicio" />
                <asp:Parameter DbType="Date" Name="fecha_fin" />
                <asp:Parameter Name="id_estado" Type="Int32" />
                <asp:Parameter Name="id_proyecto" Type="Int32" />
            </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_proyecto" DataSourceID="SqlDataProyectos" AllowPaging="True" Width="1155px">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="id_proyecto" HeaderText="id_proyecto" InsertVisible="False" ReadOnly="True" SortExpression="id_proyecto" />
                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                    <asp:BoundField DataField="fecha_inicio" HeaderText="fecha_inicio" SortExpression="fecha_inicio" />
                    <asp:BoundField DataField="fecha_fin" HeaderText="fecha_fin" SortExpression="fecha_fin" />
                    <asp:BoundField DataField="estado" HeaderText="estado" SortExpression="estado" />
                    <asp:BoundField DataField="creador" HeaderText="creador" SortExpression="creador" />
                    <asp:BoundField DataField="id_estado" HeaderText="id_estado" SortExpression="id_estado" />
                </Columns>
            </asp:GridView>
        </h2>
        </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSourceEstados" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionSQL %>" SelectCommand="SELECT * FROM [estados_tareas]"></asp:SqlDataSource>
    </form>
</body>
</html>
