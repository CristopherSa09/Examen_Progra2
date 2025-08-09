Imports System.Data.SqlClient

Public Class ClienteRepository

    Private connectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("II46ConnectionString").ConnectionString

    ' Crear (Insertar)
    Public Sub InsertarCliente(cliente As Cliente)
        Using conn As New SqlConnection(connectionString)
            Dim sql As String = "INSERT INTO Clientes (Nombre, Apellidos, Email, Telefono) VALUES (@Nombre, @Apellidos, @Email, @Telefono)"
            Using cmd As New SqlCommand(sql, conn)
                cmd.Parameters.AddWithValue("@Nombre", cliente.Nombre)
                cmd.Parameters.AddWithValue("@Apellidos", cliente.Apellidos)
                cmd.Parameters.AddWithValue("@Email", cliente.Email)
                cmd.Parameters.AddWithValue("@Telefono", cliente.Telefono)
                conn.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using
    End Sub

    ' Leer (Obtener todos)
    Public Function ObtenerClientes() As List(Of Cliente)
        Dim lista As New List(Of Cliente)
        Using conn As New SqlConnection(connectionString)
            Dim sql As String = "SELECT ClienteId, Nombre, Apellidos, Email, Telefono FROM Clientes"
            Using cmd As New SqlCommand(sql, conn)
                conn.Open()
                Using reader = cmd.ExecuteReader()
                    While reader.Read()
                        Dim c As New Cliente With {
                            .ClienteId = Convert.ToInt32(reader("ClienteId")),
                            .Nombre = reader("Nombre").ToString(),
                            .Apellidos = reader("Apellidos").ToString(),
                            .Email = reader("Email").ToString(),
                            .Telefono = reader("Telefono").ToString()
                        }
                        lista.Add(c)
                    End While
                End Using
            End Using
        End Using
        Return lista
    End Function

    ' Actualizar (Update)
    Public Sub ActualizarCliente(cliente As Cliente)
        Using conn As New SqlConnection(connectionString)
            Dim sql As String = "UPDATE Clientes SET Nombre=@Nombre, Apellidos=@Apellidos, Email=@Email, Telefono=@Telefono WHERE ClienteId=@ClienteId"
            Using cmd As New SqlCommand(sql, conn)
                cmd.Parameters.AddWithValue("@Nombre", cliente.Nombre)
                cmd.Parameters.AddWithValue("@Apellidos", cliente.Apellidos)
                cmd.Parameters.AddWithValue("@Email", cliente.Email)
                cmd.Parameters.AddWithValue("@Telefono", cliente.Telefono)
                cmd.Parameters.AddWithValue("@ClienteId", cliente.ClienteId)
                conn.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using
    End Sub

    ' Eliminar (Delete)
    Public Sub EliminarCliente(clienteId As Integer)
        Using conn As New SqlConnection(connectionString)
            Dim sql As String = "DELETE FROM Clientes WHERE ClienteId=@ClienteId"
            Using cmd As New SqlCommand(sql, conn)
                cmd.Parameters.AddWithValue("@ClienteId", clienteId)
                conn.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using
    End Sub

End Class
