<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AgendaDeReunionesDocente.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <webopt:bundlereference runat="server" path="~/Content/css" />
</head>
<body>
    <div class="container">
        <div class="row mt-5">
            <div class="col-4 offset-4">
                <form id="form1" runat="server">
                    <div class="card">
                        <div class="card-header text-center">
                            <h5>Login</h5>
                        </div>
                        <div class="card-body">
                            <div class="mb-3">
                                <asp:Label ID="lblUsuario" runat="server" Text="Usuario: " CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsuario" ErrorMessage="El campo es obligatorio" ID="rfvNombres" Font-Italic="True" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="mb-3">
                                <asp:Label ID="lblPassword" runat="server" Text="Contraseña: " CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="El campo es obligatorio" ID="rfvApellidos" Font-Italic="True" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="mb-3">
                                <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" CssClass="btn btn-primary" />
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <asp:PlaceHolder runat="server">
         <%: Scripts.Render("~/Scripts/bootstrap.js") %>
    </asp:PlaceHolder>
</body>
</html>
