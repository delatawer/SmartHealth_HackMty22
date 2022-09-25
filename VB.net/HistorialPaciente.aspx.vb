Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data
Public Class HistorialPaciente
    Inherits System.Web.UI.Page
    Dim connString As String = "Server=tcp:smarthealthdb.database.windows.net,1433;Initial Catalog=SmarthHealth_DB;Persist Security Info=False;User ID=SmarthHealthDB;Password=5rUBXEMSREBsRzZ;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
    Dim dt As New DataTable
    Dim id As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        id = Request.QueryString("idP").ToString
        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand("getHistorial", conn)
                cmd.CommandType = System.Data.CommandType.StoredProcedure
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = CInt(id)
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    Try
                        GridView1.DataSource = dt
                        GridView1.DataBind()
                    Catch ex As Exception

                    End Try
                End Using
            End Using
        End Using
    End Sub

    Protected Sub HistorialSubmit_Click(sender As Object, e As EventArgs)
        id = Request.QueryString("idP").ToString
        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand("historialPaciente", conn)
                conn.Open()
                cmd.CommandType = System.Data.CommandType.StoredProcedure
                cmd.Parameters.Add("@Motivo", SqlDbType.VarChar, (255)).Value = inputMotivoPaciente.Value
                cmd.Parameters.Add("@Diagnostico", SqlDbType.VarChar, (255)).Value = inputDiagnosticoPaciente.Value
                cmd.Parameters.Add("@Tratamiento", SqlDbType.VarChar, (255)).Value = inputTratamientoPaciente.Value
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = CInt(id)

                Try
                    cmd.ExecuteNonQuery()
                Catch ex As Exception
                    MsgBox("Can't load Web page" & vbCrLf & ex.Message)
                End Try
            End Using
        End Using
    End Sub

End Class