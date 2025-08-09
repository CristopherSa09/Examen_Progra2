Imports System.Data.SqlClient
Imports System.Web.UI

Partial Class SiteMaster
    Inherits MasterPage

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim email As String = txtEmail.Text.Trim()
        Dim pass As String = txtPassword.Text.Trim()

        If ValidarUsuario(email, pass) Then
            Session("Usuario") = email
            Response.Redirect("~/Default.aspx")
        Else
            Response.Write("<script>alert('Usuario o contraseña incorrectos');</script>")
        End If
    End Sub

    Private Function ValidarUsuario(email As String, pass As String) As Boolean
        Dim conexion As String = System.Configuration.ConfigurationManager.ConnectionStrings("II46ConnectionString").ConnectionString

        Using conn As New SqlConnection(conexion)
            Dim query As String = "SELECT COUNT(*) FROM Usuarios WHERE EMAIL=@Email AND CONTRASEÑA=@Pass"
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@Email", email)
                cmd.Parameters.AddWithValue("@Pass", pass)
                conn.Open()
                Dim count As Integer = Convert.ToInt32(cmd.ExecuteScalar())
                Return count > 0
            End Using
        End Using
    End Function

End Class
