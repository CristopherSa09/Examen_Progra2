Imports System
Imports System.Collections.Generic

Partial Class Clientes
    Inherits System.Web.UI.Page

    Private repo As New ClienteRepository()

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' Seguridad: redirigir si no está logueado
        If Session("Usuario") Is Nothing Then
            Response.Redirect("Login.aspx")
            Return
        End If

        If Not IsPostBack Then
            CargarClientes()
        End If
    End Sub

    Private Sub CargarClientes()
        Dim listaClientes As List(Of Cliente) = repo.ObtenerClientes()
        GridViewClientes.DataSource = listaClientes
        GridViewClientes.DataBind()
    End Sub

    ' Evento para agregar nuevo cliente
    Protected Sub btnAgregar_Click(sender As Object, e As EventArgs)
        Dim nuevoCliente As New Cliente() With {
            .Nombre = txtNombre.Text.Trim(),
            .Apellidos = txtApellidos.Text.Trim(),
            .Email = txtEmail.Text.Trim(),
            .Telefono = txtTelefono.Text.Trim()
        }

        repo.InsertarCliente(nuevoCliente)
        CargarClientes()
        LimpiarCampos()
    End Sub

    Private Sub LimpiarCampos()
        txtNombre.Text = ""
        txtApellidos.Text = ""
        txtEmail.Text = ""
        txtTelefono.Text = ""
    End Sub

    ' Evento editar (activar modo edición en el GridView)
    Protected Sub GridViewClientes_RowEditing(sender As Object, e As GridViewEditEventArgs)
        GridViewClientes.EditIndex = e.NewEditIndex
        CargarClientes()
    End Sub

    ' Evento cancelar edición
    Protected Sub GridViewClientes_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        GridViewClientes.EditIndex = -1
        CargarClientes()
    End Sub

    ' Evento actualizar cliente
    Protected Sub GridViewClientes_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim clienteId As Integer = Convert.ToInt32(GridViewClientes.DataKeys(e.RowIndex).Value)
        Dim row As GridViewRow = GridViewClientes.Rows(e.RowIndex)

        Dim nombre As String = DirectCast(row.Cells(1).Controls(0), TextBox).Text.Trim()
        Dim apellidos As String = DirectCast(row.Cells(2).Controls(0), TextBox).Text.Trim()
        Dim email As String = DirectCast(row.Cells(3).Controls(0), TextBox).Text.Trim()
        Dim telefono As String = DirectCast(row.Cells(4).Controls(0), TextBox).Text.Trim()

        Dim clienteActualizado As New Cliente() With {
            .ClienteId = clienteId,
            .Nombre = nombre,
            .Apellidos = apellidos,
            .Email = email,
            .Telefono = telefono
        }

        repo.ActualizarCliente(clienteActualizado)

        GridViewClientes.EditIndex = -1
        CargarClientes()
    End Sub

    ' Evento eliminar cliente
    Protected Sub GridViewClientes_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim clienteId As Integer = Convert.ToInt32(GridViewClientes.DataKeys(e.RowIndex).Value)
        repo.EliminarCliente(clienteId)
        CargarClientes()
    End Sub

End Class