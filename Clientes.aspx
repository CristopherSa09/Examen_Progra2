<%@ Page Language="VB" AutoEventWireup="true" CodeBehind="Clientes.aspx.vb" Inherits="Examen_Progra2.Clientes" %>

 <!-- Todo esto es lo mismo que en default por error que tuve -->

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <title>Gestión de Clientes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <h2>Lista de Clientes</h2>

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

    </form>
</body>
</html>

 <!-- Todo esto es lo mismo que en default por error que tuve -->