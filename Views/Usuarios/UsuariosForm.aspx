<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuariosForm.aspx.cs" Inherits="GESTION_TAREAS.Views.Usuarios.UsuariosForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administrar Usuarios</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="<%= ResolveUrl("~/Content/styles.css")  %>"" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="Usuarios">
    <form id="form1" runat="server">
        <h1>Administrar Usuarios</h1>
        <h2>Crear nuevo usuario</h2>
        <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" />
        <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
        <table>
            <tr>
                <td>Nombre:</td>
                <td><asp:TextBox ID="txtNombre" runat="server" /></td>
            </tr>
            <tr>
                <td>Correo:</td>
                <td><asp:TextBox ID="txtCorreo" runat="server" TextMode="Email" /></td>
            </tr>
            <tr>
                <td>Contraseña:</td>
                <td><asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" /></td>
            </tr>
            <tr>
                <td>Rol:</td>
                <td>
                    <asp:DropDownList ID="ddlRol" runat="server" DataSourceID="SqlDataSource1" DataTextField="nombre" DataValueField="id_rol"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionSQL %>" SelectCommand="SELECT [id_rol], [nombre] FROM [roles]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnCrear" CssClass="btn" runat="server" Text="Crear Usuario" OnClick="btnCrear_Click" />
                </td>
            </tr>
        </table>
        <hr />
        <h2>Lista de usuarios</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_usuario" DataSourceID="SqlDataSUsuarios" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="id_usuario" HeaderText="id_usuario" InsertVisible="False" ReadOnly="True" SortExpression="id_usuario" />
                <asp:BoundField DataField="usuario" HeaderText="usuario" SortExpression="usuario" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="rol" HeaderText="rol" SortExpression="rol" />
                <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                <asp:BoundField DataField="fecha_creacion" HeaderText="fecha_creacion" SortExpression="fecha_creacion" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionSQL %>" InsertCommand="INSERT INTO usuarios (nombre, email, password, id_rol, fecha_creacion)
VALUES (@nombre, @correo, @password, @id_rol, GETDATE());
" SelectCommand="SELECT 
    u.id_usuario,
    u.nombre AS usuario,
    u.email,
    r.nombre AS rol,
    r.descripcion,
    u.fecha_creacion
FROM usuarios u
INNER JOIN roles r ON u.id_rol = r.id_rol
ORDER BY u.id_usuario;
" UpdateCommand="UPDATE usuarios
SET nombre = @nombre,
    email = @correo,
    password = @password,
    id_rol = @id_rol
WHERE id_usuario = @id_usuario;
">
            <InsertParameters>
                <asp:ControlParameter ControlID="txtNombre" DefaultValue="" Name="nombre" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtCorreo" Name="correo" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtContrasena" Name="password" PropertyName="Text" />
                <asp:ControlParameter ControlID="ddlRol" DefaultValue="1" Name="id_rol" PropertyName="SelectedValue" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="txtNombre" Name="nombre" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtCorreo" Name="correo" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtContrasena" Name="password" PropertyName="Text" />
                <asp:ControlParameter ControlID="ddlRol" Name="id_rol" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="txtId" Name="id_usuario" PropertyName="Text" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
    </div>
</body>
</html>