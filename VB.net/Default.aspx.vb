Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data.SqlClient
Public Class _Default
    Inherits Page
    Dim connString As String = "Server=tcp:smarthealthdb.database.windows.net,1433;Initial Catalog=SmarthHealth_DB;Persist Security Info=False;User ID=SmarthHealthDB;Password=5rUBXEMSREBsRzZ;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub SubmitHospital_Click(sender As Object, e As EventArgs)
        Dim dt As New DataTable

        Using conn As New SqlConnection(connString)
            conn.Open()
            'Create New DataAdapter
            Using cmd As New SqlCommand("SelectAllCustomers", conn)

                cmd.CommandType = System.Data.CommandType.StoredProcedure
                cmd.Parameters.Add("@usuario", SqlDbType.VarChar, (255)).Value = inputUser.Value
                cmd.Parameters.Add("@contrasena", SqlDbType.VarChar, (255)).Value = inputPass.Value

                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    Try
                        If dt IsNot Nothing Then
                            Response.Redirect("https://google.com.mx/")
                        End If
                    Catch ex As Exception

                    End Try
                End Using

                cmd.Connection.Close()
            End Using
        End Using
    End Sub

    Protected Sub SubmitDoctores_Click(sender As Object, e As EventArgs)
        Dim dt As New DataTable

        Using conn As New SqlConnection(connString)
            conn.Open()
            'Create New DataAdapter
            Using cmd As New SqlCommand("SelectAllDoctors", conn)

                cmd.CommandType = System.Data.CommandType.StoredProcedure
                cmd.Parameters.Add("@usuario", SqlDbType.VarChar, (255)).Value = inputUserDoctores.Value
                cmd.Parameters.Add("@contrasena", SqlDbType.VarChar, (255)).Value = inputPassDoctores.Value

                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    Try
                        If dt IsNot Nothing Then
                            Response.Redirect("Doctors.aspx")
                        End If
                    Catch ex As Exception

                    End Try
                End Using

                cmd.Connection.Close()
            End Using
        End Using
    End Sub
    Protected Sub SubmitPacientes_Click(sender As Object, e As EventArgs)
        Dim dt As New DataTable

        Using conn As New SqlConnection(connString)
            conn.Open()
            'Create New DataAdapter
            Using cmd As New SqlCommand("SelectAllPatients", conn)

                cmd.CommandType = System.Data.CommandType.StoredProcedure
                cmd.Parameters.Add("@usuario", SqlDbType.VarChar, (255)).Value = inputUserPaciente.Value
                cmd.Parameters.Add("@contrasena", SqlDbType.VarChar, (255)).Value = inputPassPaciente.Value

                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(dt)
                    Try
                        If dt IsNot Nothing Then
                            Response.Redirect("https://google.com.mx/")
                        End If
                    Catch ex As Exception

                    End Try
                End Using

                cmd.Connection.Close()
            End Using
        End Using
    End Sub
End Class