<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="GESTION_TAREAS.Views.Auth.LoginForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <link href="<%= ResolveUrl("~/Content/styles.css")  %>"" rel="stylesheet" type="text/css" />
<style type="text/css">
</style>

</head>
<body>
    <form id="form2" runat="server">
        <div id="formlogin" class="auto-style1">
            <h2>Iniciar sesión</h2>     
            <div class="form-row">
                <asp:Label ID="lblUser" runat="server" Text="Usuario:" AssociatedControlID="txtUser" CssClass="form-label" />
                <asp:TextBox ID="txtUser" runat="server" CssClass="form-input" />
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" ErrorMessage="Usuario requerido" ForeColor="Red"></asp:RequiredFieldValidator>

            <div class="form-row">
                <asp:Label ID="lblPassword" runat="server" Text="Contraseña:" AssociatedControlID="txtPassword" CssClass="form-label" />
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-input" />
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Contraseña requerida" ForeColor="Red"></asp:RequiredFieldValidator>
            <br/>
            <asp:Button ID="btnLogin" runat="server" Text="Iniciar sesión" CssClass="btn" OnClick="btnLogin_Click" Width="119px" />

            <asp:Label ID="lblMessage" runat="server" CssClass="error-message" />
        </div>
    </form>
</body>
</html>
