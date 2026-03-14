<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Docentes.aspx.cs" Inherits="AgendaDeReunionesDocente.Docentes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="row mt-5">
        <div class="col-10 offset-1">
            <div class="card">
                 <div class="card-header text-center">
                     <h5>LISTADO DE DOCENTES</h5>
                 </div>
                 <div class="card-body">
                    <div class="col-12 text-end mb-3">
                        <asp:Button Text="Nuevo Registro" CssClass="btn btn-primary" runat="server" ID="btnNuevoDocente" PostBackUrl="~/FormDocentes.aspx" />
                    </div>
                    <div class="mb-3">
                        <asp:GridView ID="gvDocentes" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="dsDocentes" Width="100%" OnRowCommand="gvDocentes_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                                <asp:BoundField DataField="Nombres" HeaderText="Nombres" SortExpression="Nombres" />
                                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                                <asp:BoundField DataField="Edad" HeaderText="Edad" SortExpression="Edad" />
                                <asp:BoundField DataField="Genero" HeaderText="Genero" SortExpression="Genero" />
                                <asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
                                <asp:BoundField DataField="Telefono" HeaderText="Telefono" SortExpression="Telefono" />
                                <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" Visible="False" />
                                <asp:BoundField DataField="Clave" HeaderText="Clave" SortExpression="Clave" Visible="False" />
                                <asp:CheckBoxField DataField="EsDocente" HeaderText="EsDocente" SortExpression="EsDocente" Visible="False" />
                                <asp:ButtonField ButtonType="Button" ShowHeader="True" Text="Editar" CommandName="Editar">
                                <ControlStyle CssClass="btn btn-primary" />
                                </asp:ButtonField>
                               <%-- <asp:ButtonField ButtonType="Button" Text="Eliminar" CommandName="Eliminar">
                                <ControlStyle CssClass="btn btn-danger" />
                                </asp:ButtonField>--%>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="btnEliminar"
                                            runat="server"
                                            Text="Eliminar"
                                            CssClass="btn btn-danger"
                                            CommandName="Eliminar"
                                            CommandArgument="<%# Container.DataItemIndex %>"
                                            OnClientClick="return confirmarEliminar(this);" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#330099" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                            <SortedAscendingCellStyle BackColor="#FEFCEB" />
                            <SortedAscendingHeaderStyle BackColor="#AF0101" />
                            <SortedDescendingCellStyle BackColor="#F6F0C0" />
                            <SortedDescendingHeaderStyle BackColor="#7E0000" />
                        </asp:GridView>
                        <asp:SqlDataSource 
                                ID="dsDocentes" 
                                runat="server" 
                                ConnectionString="<%$ ConnectionStrings:AgendaReunionDocentesDBConnectionString %>" 
                                SelectCommand="SELECT [Id], [Nombres], [Apellidos], [Edad], [Genero], [Correo], [Telefono], [Usuario], [Clave], [EsDocente] FROM [Usuario] Where [EsDocente] = 1 ORDER BY [Id] DESC" 
                                DeleteCommand="DELETE FROM [Usuario] WHERE [Id] = @Id;">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                        
                    </div>
                 </div>
            </div>
        </div>
    </div>
    <script>
        function confirmarEliminar(btn) {
            Swal.fire({
                title: '¿Estás seguro?',
                text: 'Esta acción eliminará el registro',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, eliminar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    __doPostBack(btn.name, ''); // fuerza el postback al servidor
                }
            });
            return false; // evita el postback inmediato
        }
    </script>
</asp:Content>
