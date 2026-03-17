<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reuniones.aspx.cs" Inherits="AgendaDeReunionesDocente.Reuniones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row mt-5">
        <div class="col-10 offset-1">
            <div class="card">
                <div class="card-header text-center">
                    <h5>LISTADO DE REUNIONES</h5>
                </div>
                <div class="card-body">
                    <div class="col-12 text-end mb-3">
                        <asp:Button Text="Nueva Reunión" CssClass="btn btn-primary" runat="server" ID="btnNuevaReunion" PostBackUrl="~/RegistroReunion.aspx" />
                    </div>
                    <div class="mb-3">

                        <asp:GridView ID="gvReuniones" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="dsReuniones" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="100%" OnRowCommand="gvReuniones_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                                <asp:BoundField DataField="IdUsuario" HeaderText="IdUsuario" SortExpression="IdUsuario" Visible="False" />
                                <asp:BoundField DataField="Titulo" HeaderText="Título" SortExpression="Titulo" />
                                <asp:BoundField DataField="Descripcion" HeaderText="Descripción" SortExpression="Descripcion" />
                                <asp:BoundField DataField="FechaProgramacion" HeaderText="Fecha Programación" SortExpression="FechaProgramacion" />
                                <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                                <asp:ButtonField CommandName="Editar" Text="Editar">
                                <ControlStyle CssClass="btn btn-primary" ForeColor="White" />
                                </asp:ButtonField>
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
                        <asp:SqlDataSource ID="dsReuniones" runat="server" ConnectionString="<%$ ConnectionStrings:AgendaReunionDocentesDBConnectionString %>" DeleteCommand="DELETE FROM [Reunion] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Reunion] ([IdUsuario], [Titulo], [Descripcion], [FechaProgramacion], [Estado]) VALUES (@IdUsuario, @Titulo, @Descripcion, @FechaProgramacion, @Estado)" SelectCommand="SELECT [Id], [IdUsuario], [Titulo], [Descripcion], [FechaProgramacion], [Estado] FROM [Reunion] ORDER BY [Id] DESC" UpdateCommand="UPDATE [Reunion] SET [IdUsuario] = @IdUsuario, [Titulo] = @Titulo, [Descripcion] = @Descripcion, [FechaProgramacion] = @FechaProgramacion, [Estado] = @Estado WHERE [Id] = @Id">
                            <DeleteParameters>
                                <asp:Parameter Name="Id" Type="Int64" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="IdUsuario" Type="Int64" />
                                <asp:Parameter Name="Titulo" Type="String" />
                                <asp:Parameter Name="Descripcion" Type="String" />
                                <asp:Parameter DbType="Date" Name="FechaProgramacion" />
                                <asp:Parameter Name="Estado" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="IdUsuario" Type="Int64" />
                                <asp:Parameter Name="Titulo" Type="String" />
                                <asp:Parameter Name="Descripcion" Type="String" />
                                <asp:Parameter DbType="Date" Name="FechaProgramacion" />
                                <asp:Parameter Name="Estado" Type="String" />
                                <asp:Parameter Name="Id" Type="Int64" />
                            </UpdateParameters>
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
