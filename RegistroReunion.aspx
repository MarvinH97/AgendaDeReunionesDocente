<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistroReunion.aspx.cs" Inherits="AgendaDeReunionesDocente.RegistroReunion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row mt-5">
            <div class="col-6 offset-3">
                <div class="card">
                    <div class="card-header text-center">
                        <h5>REGISTRAR REUNIONES</h5>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <asp:Label ID="lblTitulo" runat="server" Text="Título: " CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTitulo" ErrorMessage="El campo es obligatorio" ID="rfvTitulo" Font-Italic="True" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="lblDescripcion" runat="server" Text="Descripción: " CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDescripcion" ErrorMessage="El campo es obligatorio" ID="rfvDescripcion" Font-Italic="True" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="lblFecha" runat="server" Text="Fecha: " CssClass="form-label"></asp:Label>
                            <div class="input-group">
                                <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                                <asp:ImageButton ID="btnImgFecha" runat="server" BackColor="#999999" BorderStyle="None" CausesValidation="False" ImageUrl="~/Images/calendar.jpg" OnClick="btnImgFecha_Click" Width="40px" />
                                <br />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvFecha" runat="server" ControlToValidate="txtFecha" Display="Dynamic" ErrorMessage="El campo es obligatorio" Font-Italic="True" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:Calendar ID="clFecha" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px" OnSelectionChanged="clFecha_SelectionChanged">
                                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                                <DayStyle BackColor="#CCCCCC" />
                                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                                <TodayDayStyle BackColor="#999999" ForeColor="White" />
                            </asp:Calendar>
                        </div>
                        <div class="mb-3 d-flex justify-content-between">
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                            <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn btn-secondary" CausesValidation="False" PostBackUrl="~/Reuniones.aspx" />
                            <asp:SqlDataSource ID="dsReunion" 
                                    runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:AgendaReunionDocentesDBConnectionString %>" 
                                    DeleteCommand="DELETE FROM [Reunion] WHERE [Id] = @Id" 
                                    InsertCommand="INSERT INTO [Reunion] ([IdUsuario], [Titulo], [Descripcion], [FechaProgramacion], [Estado]) VALUES (@IdUsuario, @Titulo, @Descripcion, @FechaProgramacion, @Estado)" 
                                    SelectCommand="SELECT [Id], [IdUsuario], [Titulo], [Descripcion], [FechaProgramacion], [Estado] FROM [Reunion] WHERE Id=@Id" 
                                    UpdateCommand="UPDATE [Reunion] SET [IdUsuario] = @IdUsuario, [Titulo] = @Titulo, [Descripcion] = @Descripcion, [FechaProgramacion] = @FechaProgramacion, [Estado] = @Estado WHERE [Id] = @Id">
                                <DeleteParameters>
                                    <asp:Parameter Name="Id" Type="Int64" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="IdUsuario" Type="Int64" ConvertEmptyStringToNull="True" />
                                    <asp:ControlParameter ControlID="txtTitulo" DefaultValue="" Name="Titulo" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtDescripcion" Name="Descripcion" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="clFecha" DbType="Date" Name="FechaProgramacion" PropertyName="SelectedDate" />
                                    <asp:Parameter DefaultValue="Creada" Name="Estado" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:Parameter Name="Id" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="IdUsuario" Type="Int64" />
                                    <asp:ControlParameter ControlID="txtTitulo" Name="Titulo" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtDescripcion" Name="Descripcion" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="clFecha" DbType="Date" Name="FechaProgramacion" PropertyName="SelectedDate" />
                                    <asp:Parameter Name="Estado" Type="String" DefaultValue="Creada" />
                                    <asp:Parameter Name="Id" Type="Int64" DefaultValue="" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
