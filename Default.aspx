<%@ Page Title="Gestión de Clientes" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="Examen_Progra2._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <!-- Formulario para agregar al nuevo clientee -->

   <h3>Agregar Nuevo Cliente</h3>
    <div class="mb-3">
        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Placeholder="Nombre"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre"
            ErrorMessage="El nombre es obligatorio." ForeColor="Red" Display="Dynamic" />
    </div>
    <div class="mb-3">
        <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control" Placeholder="Apellidos"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvApellidos" runat="server" ControlToValidate="txtApellidos"
            ErrorMessage="Los apellidos son obligatorios." ForeColor="Red" Display="Dynamic" />
    </div>
    <div class="mb-3">
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Email"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
            ErrorMessage="El email es obligatorio." ForeColor="Red" Display="Dynamic" />
        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
            ErrorMessage="Formato de email no válido." ForeColor="Red" Display="Dynamic"
            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" />
    </div>
    
      <!-- control de telefono + validar numeros y 8 digitos -->

    <div class="mb-3">
        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" Placeholder="Teléfono"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono"
            ErrorMessage="El teléfono es obligatorio." ForeColor="Red" Display="Dynamic" />
        <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono"
            ErrorMessage="El teléfono debe tener 8 dígitos numéricos." ForeColor="Red" Display="Dynamic"
            ValidationExpression="^\d{8}$" />
    </div>

    <asp:Button ID="btnAgregar" runat="server" CssClass="btn btn-primary" Text="Agregar Cliente" OnClick="btnAgregar_Click" />


    <!-- el gridView  para mostrar los datos guardados en la base y los que guardaremos y usaremos el crud-->

    <h2>Gestión de Clientes</h2>

    <asp:GridView ID="GridViewClientes" runat="server" CssClass="table table-striped"
        AutoGenerateColumns="False" DataKeyNames="ClienteId"
        OnRowEditing="GridViewClientes_RowEditing"
        OnRowCancelingEdit="GridViewClientes_RowCancelingEdit"
        OnRowUpdating="GridViewClientes_RowUpdating"
        OnRowDeleting="GridViewClientes_RowDeleting">
        <Columns>
            <asp:BoundField DataField="ClienteId" HeaderText="ID" ReadOnly="True" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>

</asp:Content>