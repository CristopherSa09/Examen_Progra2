Imports System.Data.SqlClient

Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim email As String = txtEmail.Text.Trim()
        Dim password As String = txtPassword.Text.Trim()

        If email = "" Or password = "" Then
            lblMessage.Text = "Por favor, ingresa email y contraseña."
            Return
        End If

        Dim connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("II46ConnectionString").ConnectionString

        Using conn As New SqlConnection(connectionString)
            Dim query As String = "SELECT COUNT(*) FROM Usuarios WHERE EMAIL = @Email AND CONTRASEÑA = @Password"
            Dim cmd As New SqlCommand(query, conn)
            cmd.Parameters.AddWithValue("@Email", email)
            cmd.Parameters.AddWithValue("@Password", password)

            conn.Open()
            Dim result As Integer = Convert.ToInt32(cmd.ExecuteScalar())

            If result > 0 Then
                ' Login correcto, redirigir a la página principal
                Response.Redirect("Default.aspx")
            Else
                lblMessage.Text = "Usuario o contraseña incorrectos."
            End If
        End Using
    End Sub
End Class
