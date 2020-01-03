Imports System.Data.SqlClient

Public Class ChangePassword
    Inherits AdminPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        lbuser.Text = Session("TenDangNhap").ToString()
    End Sub

    Protected Sub btnChangePassword_Click(sender As Object, e As EventArgs) Handles btnChangePassword.Click
        'Dim currentUser As MembershipUser = Membership.GetUser(User.Identity.Name)
        'If Not Membership.ValidateUser(currentUser.UserName, tbCurrentPassword.Text) Then
        '    tbCurrentPassword.ErrorText = "Old Password is not valid"
        '    tbCurrentPassword.IsValid = False
        'ElseIf Not currentUser.ChangePassword(tbCurrentPassword.Text, tbPassword.Text) Then
        '    tbPassword.ErrorText = "Password is not valid"
        '    tbPassword.IsValid = False
        'Else
        '    Response.Redirect("~/")
        'End If

        Dim userId As Integer = 0
        'Dim constr As String = ConfigurationManager.ConnectionStrings("SSMConnectionString").ConnectionString
        Using con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
            'Dim Con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
            Using cmd As New SqlCommand("change_User")
                Using sda As New SqlDataAdapter()
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Username", lbuser.Text.Trim())
                    cmd.Parameters.AddWithValue("@Password", tbCurrentPassword.Text.Trim())
                    cmd.Parameters.AddWithValue("@Passwordnew", tbPassword.Text.Trim())
                  
                    cmd.Connection = con
                    con.Open()
                    userId = Convert.ToInt32(cmd.ExecuteScalar())
                    con.Close()
                End Using
            End Using
            Response.Redirect(If(Request.QueryString("ReturnUrl"), "~/Account/RegisterSuccess.aspx"))
            '    Dim message As String = String.Empty
            '    Select Case userId
            '        Case -1
            '            message = "Username already exists.\nPlease choose a different username."
            '            Exit Select
            '        Case -2
            '            message = "Supplied email address has already been used."
            '            Exit Select
            '        Case Else
            '            message = "Registration successful.\nUser Id: " + userId.ToString()
            '            Response.Redirect(If(Request.QueryString("ReturnUrl"), "~/Account/RegisterSuccess.aspx"))
            '            Exit Select
            '    End Select
            '    ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") & message) + "');", True)
        End Using
    End Sub
End Class