Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data.SqlClient
Imports System.Configuration
Public Class Doctors
    Inherits System.Web.UI.Page
    Dim connString As String = "Server=tcp:smarthealthdb.database.windows.net,1433;Initial Catalog=SmarthHealth_DB;Persist Security Info=False;User ID=SmarthHealthDB;Password=5rUBXEMSREBsRzZ;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
    Dim dt As New DataTable
    Dim dt2 As New DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindGrid()
            Me.BindGrid2()
        End If
    End Sub

    Private Sub BindGrid()
        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand("GetPatients", conn)
                cmd.CommandType = System.Data.CommandType.StoredProcedure
                cmd.Parameters.Add("@nombre", SqlDbType.VarChar, (255)).Value = SearchPatient.Value
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
    Private Sub BindGrid2()
        Using conn As New SqlConnection(connString)
            Using cmd As New SqlCommand("getAgenda", conn)
                cmd.CommandType = System.Data.CommandType.StoredProcedure
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt2)
                    Try
                        GridView2.DataSource = dt2
                        GridView2.DataBind()
                    Catch ex As Exception

                    End Try
                End Using
            End Using
        End Using

    End Sub
    Protected Sub GetPacientes_Click(sender As Object, e As EventArgs)
        BindGrid()
    End Sub
    Protected Sub Historial_Click(sender As Object, e As EventArgs)


    End Sub
    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        If (e.CommandName IsNot "Sort") Then
            If e.CommandName = "DataCommand" Then
                'ID = e.CommandArgument.ToString()
                Dim rowIndex As Integer = Convert.ToInt32(e.CommandArgument)

                'Reference the GridView Row.
                Dim row As GridViewRow = GridView1.Rows(rowIndex)

                'Fetch value of Name.
                Dim ID As String
                ID = row.Cells(0).Text

                Response.Redirect("HistorialPaciente.aspx?idP=" + ID)
            End If
        End If

    End Sub

End Class