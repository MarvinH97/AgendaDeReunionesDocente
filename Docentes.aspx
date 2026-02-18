<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Docentes.aspx.cs" Inherits="AgendaDeReunionesDocente.Docentes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row mt-5">
        <div class="col-6 offset-3">
            <div class="card">
                 <div class="card-header text-center">
                     <h5>REGISTRAR DOCENTE</h5>
                 </div>
                 <div class="card-body">
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
                        <asp:RadioButton ID="rbMasculino" runat="server" Text=" Masculino" GroupName="Genero" />
                        &nbsp;
                        <asp:RadioButton ID="rbFemenino" runat="server" Text="Femenino" GroupName="Genero" />
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
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                    </div>
                 </div>
            </div>
        </div>
    </div>

</asp:Content>
