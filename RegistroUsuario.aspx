<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroUsuario.aspx.cs" Inherits="AgendaDeReunionesDocente.RegistroUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <webopt:bundlereference runat="server" path="~/Content/css" />
    <!-- SWEETALERT --> 
    <link href="Content/SweetAlert/sweetalert2.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <div class="row mt-5">
        <div class="col-6 offset-3">
            <div class="card">
                 <div class="card-header text-center">
                     <h5>REGISTRAR USUARIO</h5>
                 </div>
                 <div class="card-body">
                     <form runat="server">
                        <div class="mb-3">
                            <asp:Label ID="lblNombres" runat="server" Text="Nombres: " CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNombres" ErrorMessage="El campo es obligatorio" ID="rfvNombres" Font-Italic="True" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="lblApellidos" runat="server" Text="Apellidos: " CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtApellidos" ErrorMessage="El campo es obligatorio" ID="rfvApellidos" Font-Italic="True" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="lblEdad" runat="server" Text="Edad: "></asp:Label>
                            <asp:TextBox ID="txtEdad" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEdad" ErrorMessage="El campo es obligatorio" ID="rfvEdad" Font-Italic="True" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator runat="server" ControlToValidate="txtEdad" ErrorMessage="La edad debe estar entre 18-100 años" ID="rvEdad" Font-Size="Small" Font-Italic="true" Display="Dynamic" MaximumValue="100" MinimumValue="18" ForeColor="Red" Type="Integer"></asp:RangeValidator>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="lblGenero" runat="server" Text="Género: "></asp:Label>
                            <asp:RadioButtonList ID="rblGenero" runat="server" CellPadding="4" RepeatDirection="Horizontal">
                                <asp:ListItem Value="M">Masculino</asp:ListItem>
                                <asp:ListItem Value="F">Femenino</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:CustomValidator 
                                ID="cvGenero" 
                                runat="server" 
                                Display="Dynamic" 
                                ErrorMessage="Seleccione un Género" 
                                Font-Italic="True" Font-Size="Small" 
                                ForeColor="Red" 
                                OnServerValidate="cvGenero_ServerValidate">
                            </asp:CustomValidator>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="lblCorreo" runat="server" Text="Correo: "></asp:Label>
                            <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCorreo" ErrorMessage="El campo es obligatorio" ID="rfvCorreo" Font-Italic="True" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revCorreo" runat="server" Display="Dynamic" ErrorMessage="El correo debe ser válido" Font-Italic="True" Font-Size="Small" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtCorreo"></asp:RegularExpressionValidator>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="lblTelefono" runat="server" Text="Teléfono: "></asp:Label>
                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="lblUsuario" runat="server" Text="Usuario: "></asp:Label>
                            <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsuario" ErrorMessage="El campo es obligatorio" ID="rfvUsuario" Font-Italic="True" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="lblPassword" runat="server" Text="Contraseña: "></asp:Label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" ErrorMessage="El campo es obligatorio" ID="rfvPassword" Font-Italic="True" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3 d-flex justify-content-between">
                            <asp:Button ID="btnVolver" 
                                runat="server" 
                                Text="Volver" 
                                CssClass="btn btn-secondary" 
                                CausesValidation="false"
                                OnClick="btnVolver_Click" />
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" OnClientClick="return confirmarEliminar();" />
                        </div>
                     </form>
                 </div>
            </div>
            <asp:SqlDataSource ID="dsRegistroUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:AgendaReunionDocentesDBConnectionString %>" DeleteCommand="DELETE FROM [Usuario] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Usuario] ([Nombres], [Apellidos], [Edad], [Genero], [Correo], [Telefono], [Usuario], [Clave], [EsDocente]) VALUES (@Nombres, @Apellidos, @Edad, @Genero, @Correo, @Telefono, @Usuario, @Clave, @EsDocente)" ProviderName="<%$ ConnectionStrings:AgendaReunionDocentesDBConnectionString.ProviderName %>" SelectCommand="SELECT [Id], [Nombres], [Apellidos], [Edad], [Genero], [Correo], [Telefono], [Usuario], [Clave], [EsDocente] FROM [Usuario]" UpdateCommand="UPDATE [Usuario] SET [Nombres] = @Nombres, [Apellidos] = @Apellidos, [Edad] = @Edad, [Genero] = @Genero, [Correo] = @Correo, [Telefono] = @Telefono, [Usuario] = @Usuario, [Clave] = @Clave, [EsDocente] = @EsDocente WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int64" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtNombres" Name="Nombres" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtApellidos" Name="Apellidos" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtEdad" Name="Edad" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="rblGenero" Name="Genero" PropertyName="SelectedValue" Type="Char" />
                    <asp:ControlParameter ControlID="txtCorreo" Name="Correo" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtTelefono" Name="Telefono" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtUsuario" Name="Usuario" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtPassword" Name="Clave" PropertyName="Text" Type="String" />
                    <asp:Parameter DefaultValue="False" Name="EsDocente" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Nombres" Type="String" />
                    <asp:Parameter Name="Apellidos" Type="String" />
                    <asp:Parameter Name="Edad" Type="Int32" />
                    <asp:Parameter Name="Genero" Type="String" />
                    <asp:Parameter Name="Correo" Type="String" />
                    <asp:Parameter Name="Telefono" Type="String" />
                    <asp:Parameter Name="Usuario" Type="String" />
                    <asp:Parameter Name="Clave" Type="String" />
                    <asp:Parameter Name="EsDocente" Type="Boolean" />
                    <asp:Parameter Name="Id" Type="Int64" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    </div>

    <asp:PlaceHolder runat="server">
         <%: Scripts.Render("~/Scripts/bootstrap.js") %>
    </asp:PlaceHolder>
    <script src="Scripts/SweetAlert/sweetalert2.all.min.js"></script>
    <script>
        function confirmarEliminar() {
            Swal.fire({
                title: '¿Estás seguro?',
                text: 'Esta acción eliminará el registro',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, eliminar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    __doPostBack('btnGuardar', ''); // fuerza el postback al servidor
                }
            });
            return false; // evita el postback inmediato
        }

    </script>
</body>
</html>
