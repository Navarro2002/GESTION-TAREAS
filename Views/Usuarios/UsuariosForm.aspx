<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuariosForm.aspx.cs" Inherits="GESTION_TAREAS.Views.Usuarios.UsuariosForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administrar Usuarios</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="<%= ResolveUrl("~/Content/styles.css")  %>"" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            margin-top: 4px;
        }
    </style>
</head>
<body>
    <div class="Usuarios">
    <form id="form1" runat="server">
        <h1>Administrar Usuarios</h1>
        <h2>Crear nuevo usuario</h2>
        <asp:Label ID="lblMensaje" runat="server" ForeColor="Lime" />
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
                    <asp:Button ID="btnCrear" CssClass="btn" runat="server" Text="Crear Usuario" OnClick="btnCrear_Click" CommandName="Insert" />
                </td>
            </tr>
        </table>
        <hr />
        <h2>Lista de usuarios</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_usuario" DataSourceID="SqlDataSUsuarios" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" CssClass="auto-style1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id_usuario" HeaderText="id_usuario" InsertVisible="False" ReadOnly="True" SortExpression="id_usuario" />
                <asp:BoundField DataField="usuario" HeaderText="usuario" SortExpression="usuario" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="rol" HeaderText="rol" SortExpression="rol" ReadOnly="True" />
                <asp:BoundField DataField="fecha_creacion" HeaderText="fecha_creacion" SortExpression="fecha_creacion" ReadOnly="True" />
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
        <asp:SqlDataSource ID="SqlDataSUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:ConexionSQL %>" InsertCommand="INSERT INTO [usuarios] ([email], [nombre], [password], [id_rol], [fecha_creacion]) VALUES (@email, @nombre, @password, @id_rol, @fecha_creacion)" SelectCommand="SELECT 
    u.id_usuario,
    u.nombre AS usuario,
    u.email,
    r.nombre AS rol,
    r.descripcion,
    u.fecha_creacion
FROM usuarios u
INNER JOIN roles r ON u.id_rol = r.id_rol
ORDER BY u.id_usuario;" UpdateCommand="UPDATE [usuarios] SET [email] = @email, [nombre] = @usuario WHERE [id_usuario] = @id_usuario" DeleteCommand="DELETE FROM [usuarios] WHERE [id_usuario] = @id_usuario">
            <DeleteParameters>
                <asp:Parameter Name="id_usuario" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="txtCorreo" Name="email" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtNombre" Name="nombre" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtContrasena" Name="password" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="ddlRol" Name="id_rol" PropertyName="SelectedValue" Type="Int32" />
                <asp:QueryStringParameter Name="fecha_creacion" QueryStringField="GETDATE()" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="usuario" />
                <asp:Parameter Name="id_usuario" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
    </div>
</body>
</html>