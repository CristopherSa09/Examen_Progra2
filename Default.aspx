<%@ Page Title="Gestión de Clientes" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="Examen_Progra2._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


<!-- Formulario para agregar al nuevo cliente -->

<h3>Agregar Nuevo Cliente</h3>
<div class="mb-3">
    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Placeholder="Nombre"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre"
        ErrorMessage="El nombre es obligatorio." ForeColor="Red" Display="Dynamic" ValidationGroup="Agregar" />
</div>
<div class="mb-3">
    <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control" Placeholder="Apellidos"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvApellidos" runat="server" ControlToValidate="txtApellidos"
        ErrorMessage="Los apellidos son obligatorios." ForeColor="Red" Display="Dynamic" ValidationGroup="Agregar" />
</div>
<div class="mb-3">
    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Email"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
        ErrorMessage="El email es obligatorio." ForeColor="Red" Display="Dynamic" ValidationGroup="Agregar" />
    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
        ErrorMessage="Formato de email no válido." ForeColor="Red" Display="Dynamic"
        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" ValidationGroup="Agregar" />
</div>
<div class="mb-3">
    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" Placeholder="Teléfono"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono"
        ErrorMessage="El teléfono es obligatorio." ForeColor="Red" Display="Dynamic" ValidationGroup="Agregar" />
    <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono"
        ErrorMessage="El teléfono debe tener 8 dígitos numéricos." ForeColor="Red" Display="Dynamic"
        ValidationExpression="^\d{8}$" ValidationGroup="Agregar" />
</div>
<asp:Button ID="btnAgregar" runat="server" CssClass="btn btn-primary" Text="Agregar Cliente" 
    OnClick="btnAgregar_Click" ValidationGroup="Agregar" />

<!-- GridView  de clientes y datos guardados-->

<h2>Gestión de Clientes</h2>
<asp:GridView ID="GridViewClientes" runat="server" CssClass="table table-striped"
    AutoGenerateColumns="False" DataKeyNames="ClienteId"
    OnRowEditing="GridViewClientes_RowEditing"
    OnRowCancelingEdit="GridViewClientes_RowCancelingEdit"
    OnRowUpdating="GridViewClientes_RowUpdating"
    OnRowDeleting="GridViewClientes_RowDeleting">
    <Columns>
        <asp:BoundField DataField="ClienteId" HeaderText="ID" ReadOnly="True" />

        <asp:TemplateField HeaderText="Nombre">
            <ItemTemplate>
                <%# Eval("Nombre") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtNombreGrid" runat="server" Text='<%# Bind("Nombre") %>' CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNombreGrid" runat="server" ControlToValidate="txtNombreGrid"
                    ErrorMessage="El nombre es obligatorio." ForeColor="Red" Display="Dynamic" ValidationGroup="EditarGrid" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Apellidos">
            <ItemTemplate>
                <%# Eval("Apellidos") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtApellidosGrid" runat="server" Text='<%# Bind("Apellidos") %>' CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvApellidosGrid" runat="server" ControlToValidate="txtApellidosGrid"
                    ErrorMessage="Los apellidos son obligatorios." ForeColor="Red" Display="Dynamic" ValidationGroup="EditarGrid" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Email">
            <ItemTemplate>
                <%# Eval("Email") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEmailGrid" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmailGrid" runat="server" ControlToValidate="txtEmailGrid"
                    ErrorMessage="El email es obligatorio." ForeColor="Red" Display="Dynamic" ValidationGroup="EditarGrid" />
                <asp:RegularExpressionValidator ID="revEmailGrid" runat="server" ControlToValidate="txtEmailGrid"
                    ErrorMessage="Formato de email no válido." ForeColor="Red" Display="Dynamic"
                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" ValidationGroup="EditarGrid" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Teléfono">
            <ItemTemplate>
                <%# Eval("Telefono") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtTelefonoGrid" runat="server" Text='<%# Bind("Telefono") %>' CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTelefonoGrid" runat="server" ControlToValidate="txtTelefonoGrid"
                    ErrorMessage="El teléfono es obligatorio." ForeColor="Red" Display="Dynamic" ValidationGroup="EditarGrid" />
                <asp:RegularExpressionValidator ID="revTelefonoGrid" runat="server" ControlToValidate="txtTelefonoGrid"
                    ErrorMessage="El teléfono debe tener 8 dígitos numéricos." ForeColor="Red" Display="Dynamic"
                    ValidationExpression="^\d{8}$" ValidationGroup="EditarGrid" />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
    </Columns>
</asp:GridView>
</asp:Content>
