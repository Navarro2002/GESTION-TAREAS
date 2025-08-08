<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="GESTION_TAREAS.Views.Auth.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
</head>
<body>
            <form id="form2" runat="server">
    <div style="width:300px; margin:100px auto; border:1px solid #ccc; padding:20px; border-radius:8px;">
        <h2>Iniciar sesión</h2>
        <asp:Label ID="lblUser" runat="server" Text="Usuario:" AssociatedControlID="txtUser" />
        <asp:TextBox ID="txtUser" runat="server" />
        <br /><br />
        <asp:Label ID="lblPassword" runat="server" Text="Contraseña:" AssociatedControlID="txtPassword" />
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
        <br /><br />
        <asp:Button ID="btnLogin" runat="server" Text="Entrar" OnClick="btnLogin_Click" />
        <br /><br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
        </form>
        </div>
</body>
</html>
