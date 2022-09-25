Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data
Public Class Agendar
    Inherits System.Web.UI.Page
    Dim connString As String = "Server=tcp:smarthealthdb.database.windows.net,1433;Initial Catalog=SmarthHealth_DB;Persist Security Info=False;User ID=SmarthHealthDB;Password=5rUBXEMSREBsRzZ;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
    Dim dt As New DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Unnamed_Click(sender As Object, e As EventArgs)
        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand("setAgenda", conn)
                conn.Open()
                cmd.CommandType = System.Data.CommandType.StoredProcedure
                cmd.Parameters.Add("@NombreP", SqlDbType.VarChar, (255)).Value = inputPaciente.Value
                cmd.Parameters.Add("@Fecha", SqlDbType.VarChar, (255)).Value = inputFecha.Value
                cmd.Parameters.Add("@hora", SqlDbType.VarChar, (255)).Value = inputHora.Value
                cmd.Parameters.Add("@doctor", SqlDbType.VarChar, (255)).Value = inputDoctor.Value

                Try
                    cmd.ExecuteNonQuery()
                Catch ex As Exception
                    MsgBox("Can't load Web page" & vbCrLf & ex.Message)
                End Try
            End Using
        End Using
        Response.Redirect("Doctors.aspx")
    End Sub
End Class