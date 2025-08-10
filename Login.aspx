<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="Examen_Progra2.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

      <!-- Bloque del inicio se sesion login -->

    <title>Login - Inicio de sesión</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:300px; margin: auto; padding-top: 100px;">
            <h2>Iniciar Sesión</h2>
            <asp:TextBox ID="txtEmail" runat="server" Placeholder="Correo electrónico" Width="100%"></asp:TextBox>
            <br /><br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Contraseña" Width="100%"></asp:TextBox>
            <br /><br />
            <asp:Button ID="btnLogin" runat="server" Text="Ingresar" OnClick="btnLogin_Click" Width="100%" />
            <br /><br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>