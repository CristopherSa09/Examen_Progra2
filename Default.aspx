<%@ Page Title="Gestión de Clientes" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="Examen_Progra2._Default" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h3>Agregar Nuevo Cliente</h3>
    <div class="mb-3">
        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Placeholder="Nombre"></asp:TextBox>
    </div>
    <div class="mb-3">
        <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control" Placeholder="Apellidos"></asp:TextBox>
    </div>
    <div class="mb-3">
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Email"></asp:TextBox>
    </div>
    <div class="mb-3">
        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" Placeholder="Teléfono"></asp:TextBox>
    </div>
    <asp:Button ID="btnAgregar" runat="server" CssClass="btn btn-primary" Text="Agregar Cliente" OnClick="btnAgregar_Click" />

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
