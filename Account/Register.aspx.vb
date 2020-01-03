Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.IO

Public Class Register
    Inherits System.Web.UI.Page


    Protected Sub btnCreateUser_Click(sender As Object, e As EventArgs) Handles btnCreateUser.Click

        ' 
        Dim userId As Integer = 0
        'Dim constr As String = ConfigurationManager.ConnectionStrings("SSMConnectionString").ConnectionString
        Using con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
            'Dim Con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
            Using cmd As New SqlCommand("Insert_User")
                Using sda As New SqlDataAdapter()
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Username", tbUserName.Text.Trim())
                    cmd.Parameters.AddWithValue("@Password", tbPassword.Text.Trim())
                    cmd.Parameters.AddWithValue("@Email", tbEmail.Text.Trim())
                    cmd.Parameters.AddWithValue("@dep", CbPhongban.Text.Trim())
                    cmd.Parameters.AddWithValue("@name", tbhovaten.Text.Trim())
                    cmd.Parameters.AddWithValue("@loai", "1")
                    cmd.Connection = con
                    con.Open()
                    userId = Convert.ToInt32(cmd.ExecuteScalar())
                    con.Close()
                End Using
            End Using
            Dim message As String = String.Empty
            Select Case userId
                Case -1
                    message = "Username already exists.\nPlease choose a different username."
                    Exit Select
                Case -2
                    message = "Supplied email address has already been used."
                    Exit Select
                Case Else
                    message = "Registration successful.\nUser Id: " + userId.ToString()
                    Dim oj As New SSMDATA
                    'Dim sb As New StringBuilder()
                    Dim read As New StreamReader(Server.MapPath("~/temmail.htm"))
                    Dim body As String = read.ReadToEnd()

                    read.Close()
                    'Dim mail As New SendEmail()
                    body = String.Format(body, tbUserName.Text, tbhovaten.Text, CbPhongban.Text, tbEmail.Text)
                    'sb.Append("<html><head>")
                    'sb.Append("<link rel='stylesheet' type='text/css' href='theme.css' />")
                    'sb.Append("</head>")
                    'sb.Append("<body>")

                    'sb.Append("<table>")
                    'sb.Append("<tr><td>  Email address  " & tbEmail.Text.Trim() & " Registration successful</td></tr>")
                    'sb.Append("<tr><td>--------------------------------------------------------------------------------</td></tr>")
                    'sb.Append("<tr><td>© Copyright © 2014 - Wipro Unza Việt Nam</td></tr>")
                    'sb.Append("</table>")
                    'sb.Append("</body>")
                    'sb.Append("</html>")
                    oj.sendEmail(tbEmail.Text.Trim(), "Thông Báo", body, "") 'sb.ToString()
                    oj.sendEmail("dong.tranvan@wipro-unza.com", "Thông Báo", body, "") 'sb.ToString()
                    Response.Redirect(If(Request.QueryString("ReturnUrl"), "~/Account/RegisterSuccess.aspx"))
                    Exit Select
            End Select
            ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") & message) + "');", True)
        End Using
    End Sub

    'Protected Sub RegisterUser(sender As Object, e As EventArgs)
    '    Dim userId As String = ""
    '    'Dim constr As String = ConfigurationManager.ConnectionStrings("SSMConnectionString").ConnectionString
    '    Using con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
    '        'Dim Con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
    '        Using cmd As New SqlCommand("Insert_User")
    '            Using sda As New SqlDataAdapter()
    '                cmd.CommandType = CommandType.StoredProcedure
    '                cmd.Parameters.AddWithValue("@Username", tbUserName.Text.Trim())
    '                cmd.Parameters.AddWithValue("@Password", tbPassword.Text.Trim())
    '                cmd.Parameters.AddWithValue("@Email", tbEmail.Text.Trim())
    '                cmd.Parameters.AddWithValue("@dep", CbPhongban.Text.Trim())
    '                cmd.Connection = con
    '                con.Open()
    '                userId = tbUserName.Text
    '                con.Close()
    '            End Using
    '        End Using
    '        Dim message As String = String.Empty
    '        Select Case userId
    '            Case -1
    '                message = "Username already exists.\nPlease choose a different username."
    '                Exit Select
    '            Case -2
    '                message = "Supplied email address has already been used."
    '                Exit Select
    '            Case Else
    '                message = "Registration successful.\nUser Id: " + userId.ToString()
    '                Exit Select
    '        End Select
    '        ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") & message) + "');", True)
    '    End Using
    'End Sub
End Class