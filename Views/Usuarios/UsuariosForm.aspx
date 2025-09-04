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
                    <asp:DropDownList ID="ddlRol" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Activo:</td>
                <td>
                    <asp:CheckBox ID="chkActivo" runat="server" Checked="true" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnCrear" CssClass="btn" runat="server" Text="Crear Usuario" OnClick="btnCrear_Click" />
                </td>
            </tr>
        </table>
        <hr />
        <h2>Lista de usuarios</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_usuario" DataSourceID="SqlDataSUsuarios">
            <Columns>
                <asp:BoundField DataField="id_usuario" HeaderText="id_usuario" InsertVisible="False" ReadOnly="True" SortExpression="id_usuario" />
                <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Rol" HeaderText="Rol" SortExpression="Rol" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:GestionProyectosTareasConnectionString2 %>" InsertCommand="INSERT INTO usuarios(nombre, email, password, fecha_creacion, id_rol) VALUES (,,,GETDATE(),)" SelectCommand="SELECT 
    u.id_usuario,
    u.nombre AS Usuario,
    u.email AS Email,
    r.nombre AS Rol
FROM 
    usuarios u
INNER JOIN 
    roles r ON u.id_rol = r.id_rol
ORDER BY 
    u.id_usuario;
"></asp:SqlDataSource>
    </form>
    </div>
</body>
</html>