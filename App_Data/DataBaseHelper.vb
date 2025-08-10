Imports System.Data
Imports System.Data.SqlClient


' métodos para ejecutar consultas SQL server

Public Interface IDataHelper
    Function ExecuteNonQuery(query As String, params As Dictionary(Of String, Object)) As Integer
    Function ExecuteScalar(query As String, params As Dictionary(Of String, Object)) As Object
    Function ExecuteReader(query As String, params As Dictionary(Of String, Object)) As SqlDataReader
    Function ExecuteDataTable(query As String, params As Dictionary(Of String, Object)) As DataTable
End Interface

' manejar ejecuciión y consultas

Public Class DatabaseHelper
    Implements IDataHelper

    Private ReadOnly connectionString As String

    Public Sub New()
        connectionString = System.Configuration.ConfigurationManager.ConnectionStrings("II46ConnectionString").ConnectionString
    End Sub

    ' Ejecucion de comandos sql

    Public Function ExecuteNonQuery(query As String, params As Dictionary(Of String, Object)) As Integer Implements IDataHelper.ExecuteNonQuery
        Using conn As New SqlConnection(connectionString)
            Using cmd As New SqlCommand(query, conn)
                AddParameters(cmd, params)
                conn.Open()
                Return cmd.ExecuteNonQuery()
            End Using
        End Using
    End Function

    Public Function ExecuteScalar(query As String, params As Dictionary(Of String, Object)) As Object Implements IDataHelper.ExecuteScalar
        Using conn As New SqlConnection(connectionString)
            Using cmd As New SqlCommand(query, conn)
                AddParameters(cmd, params)
                conn.Open()
                Return cmd.ExecuteScalar()
            End Using
        End Using
    End Function

    Public Function ExecuteReader(query As String, params As Dictionary(Of String, Object)) As SqlDataReader Implements IDataHelper.ExecuteReader
        Dim conn As New SqlConnection(connectionString)
        Dim cmd As New SqlCommand(query, conn)
        AddParameters(cmd, params)
        conn.Open()
        ' Nota: El caller debe cerrar el SqlDataReader y la conexión cuando termine
        Return cmd.ExecuteReader(CommandBehavior.CloseConnection)
    End Function

    Public Function ExecuteDataTable(query As String, params As Dictionary(Of String, Object)) As DataTable Implements IDataHelper.ExecuteDataTable
        Dim dt As New DataTable()
        Using conn As New SqlConnection(connectionString)
            Using cmd As New SqlCommand(query, conn)
                AddParameters(cmd, params)
                Using da As New SqlDataAdapter(cmd)
                    da.Fill(dt)
                End Using
            End Using
        End Using
        Return dt
    End Function

    ' parámetros de inyección SQL

    Private Sub AddParameters(cmd As SqlCommand, params As Dictionary(Of String, Object))
        If params IsNot Nothing Then
            For Each param In params
                cmd.Parameters.AddWithValue(param.Key, param.Value)
            Next
        End If
    End Sub

End Class
