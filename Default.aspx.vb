Imports System
Imports System.Collections.Generic

Partial Class _Default
    Inherits System.Web.UI.Page

    Private repo As New ClienteRepository()

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CargarClientes()
        End If
    End Sub


    ' Carga la lista de clientes y mandarla al grid

    Private Sub CargarClientes()
        Try
            Dim listaClientes As List(Of Cliente) = repo.ObtenerClientes()
            GridViewClientes.DataSource = listaClientes
            GridViewClientes.DataBind()
        Catch ex As Exception
            Response.Write("<pre style='color:red'>" & ex.ToString() & "</pre>")
        End Try
    End Sub

    ' evento para agregar clientes

    Protected Sub btnAgregar_Click(sender As Object, e As EventArgs)
        ' Verificar que la validación de los controles sea correcta
        If Not Page.IsValid Then
            Return
        End If

        ' Si pasó la validación, seguimos con la inserción
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

    ' limpiar campos

    Private Sub LimpiarCampos()
        txtNombre.Text = ""
        txtApellidos.Text = ""
        txtEmail.Text = ""
        txtTelefono.Text = ""
    End Sub

    ' actualizar grid en tiempo real

    Protected Sub GridViewClientes_RowEditing(sender As Object, e As GridViewEditEventArgs)
        GridViewClientes.EditIndex = e.NewEditIndex
        CargarClientes()
    End Sub

    Protected Sub GridViewClientes_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        GridViewClientes.EditIndex = -1
        CargarClientes()
    End Sub

    ' evento para actualizar cliente

    Protected Sub GridViewClientes_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim clienteId As Integer = Convert.ToInt32(GridViewClientes.DataKeys(e.RowIndex).Value)
        Dim row As GridViewRow = GridViewClientes.Rows(e.RowIndex)

        ' Buscar los controles dentro del TemplateField usando FindControl
        Dim txtNombreGrid As TextBox = CType(row.FindControl("txtNombreGrid"), TextBox)
        Dim txtApellidosGrid As TextBox = CType(row.FindControl("txtApellidosGrid"), TextBox)
        Dim txtEmailGrid As TextBox = CType(row.FindControl("txtEmailGrid"), TextBox)
        Dim txtTelefonoGrid As TextBox = CType(row.FindControl("txtTelefonoGrid"), TextBox)

        Dim nombre As String = If(txtNombreGrid IsNot Nothing, txtNombreGrid.Text.Trim(), "")
        Dim apellidos As String = If(txtApellidosGrid IsNot Nothing, txtApellidosGrid.Text.Trim(), "")
        Dim email As String = If(txtEmailGrid IsNot Nothing, txtEmailGrid.Text.Trim(), "")
        Dim telefono As String = If(txtTelefonoGrid IsNot Nothing, txtTelefonoGrid.Text.Trim(), "")

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

    ' Eliminar cliente selecionado

    Protected Sub GridViewClientes_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim clienteId As Integer = Convert.ToInt32(GridViewClientes.DataKeys(e.RowIndex).Value)
        repo.EliminarCliente(clienteId)
        CargarClientes()
    End Sub

End Class
