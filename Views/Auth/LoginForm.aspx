<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="GESTION_TAREAS.Views.Auth.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <link href="<%= ResolveUrl("~/Diseño/StyleSheet1.css")  %>"" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form2" runat="server">
    <div id="formlogin" style="background-position: center; width:300px; margin:100px auto; border:1px solid #ccc; padding:20px; border-radius:8px; margin-bottom: 10px; margin-left: auto;">
        <h2>Iniciar sesión</h2>
        <div class="form-row">
        <asp:Label ID="lblUser" runat="server" Text="Usuario:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" AssociatedControlID="txtUser" />
        <asp:TextBox ID="txtUser" runat="server" margin="10px" CssClass="form-input" BorderWidth="1px" Width="100px" Wrap="False" />
        </div>
        <br /><br />
        <div class="form-row">
        <asp:Label ID="lblPassword" runat="server" Text="Contraseña:" AssociatedControlID="txtPassword" />
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-input" BorderWidth="1px" Width="100px" />
        </div>
        <br /><br />
        <asp:Button ID="btnLogin" runat="server" Text="Entrar" CssClass="btn" OnClick="btnLogin_Click" />
        <br /><br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
        </form>
      </div>
</body>
</html>
