Imports System.Data.SqlClient
Imports System.IO
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Utils
Imports DevExpress.Web
Public Class DsUser
    Inherits AdminPage


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim args As DataSourceSelectArguments = New DataSourceSelectArguments()
        'Dim view As DataView = DirectCast(SqlDataSource1.[Select](args), DataView)
        'lstDanhSach.DataSource = view.ToTable()
        If pb <> "IT" Then
            Dim url As String = Request.Url.AbsoluteUri
            Session("UrlReturn") = url

            Response.Redirect("~/Account/Thongbao.html")

        End If

    End Sub

    Protected Sub btnActive_Click(sender As Object, e As EventArgs)
        Dim b As Button = TryCast(sender, Button)
        Dim message As String = String.Empty
        Dim commandArgs As String() = b.CommandArgument.ToString().Split(New Char() {","c})
        Dim us As String = commandArgs(0)
        Dim email As String = commandArgs(1)

        'Dim constr As String = ConfigurationManager.ConnectionStrings("SSMConnectionString").ConnectionString
        Using con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())


            'Dim Con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
            Using cmd As New SqlCommand("update [TB_DangNhap] set trangthai = 1 , ngayactiver = getdate() where Tendangnhap ='" + us + "'", con)

                con.Open()
                '// mo ket noi 
                cmd.ExecuteNonQuery()

                ' // thuc thi 
                con.Close()
            End Using


            Dim oj As New SSMDATA
            Dim sb As New StringBuilder()
            'Dim read As New StreamReader(Server.MapPath("~/temmail.htm"))
            'Dim body As String

            'read.Close()
            'Dim mail As New SendEmail()
            'body = String.Format(body, email, us)
            sb.Append("<html><head>")
            sb.Append("<link rel='stylesheet' type='text/css' href='theme.css' />")
            sb.Append("</head>")
            sb.Append("<body>")

            sb.Append("<table>")
            sb.Append("<tr><td>  Tài khoản   " & email & " đã được kích hoạt trên hệ thống Everst V2</td></tr>")
            sb.Append("<tr><td>--------------------------------------------------------------------------------</td></tr>")
            sb.Append("<tr><td>© Copyright © 2014 - Wipro Unza Việt Nam</td></tr>")
            sb.Append("</table>")
            sb.Append("</body>")
            sb.Append("</html>")
            oj.sendEmail(email, "EVEREST V2: Tài khoản của bạn đã được kich hoạt ", sb.ToString(), "") 'sb.ToString()
            'oj.sendEmail("dong.tranvan@wipro-unza.com", "Thông Báo", body, "") 'sb.ToString()
            message = "Activer successful.\nUser Id: " + email
            ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") & message) + "');", True)
            Response.Redirect(Request.RawUrl)
        End Using
    End Sub

    Protected Sub btncn_Click(sender As Object, e As EventArgs)
        Dim b As Button = TryCast(sender, Button)
        Dim commandArgs As String() = b.CommandArgument.ToString().Split(New Char() {","c})
        Dim us As String = commandArgs(0)
        tbUsername.Text = us
        tbEmail.Text = commandArgs(1).ToString
        tbhovaten.Text = commandArgs(2).ToString
        tbbophan.Text = commandArgs(3).ToString
        tbRegion.Text = commandArgs(4).ToString
        tbArea.Text = commandArgs(5).ToString
        tbcus.Text = commandArgs(6).ToString
        Dim builder As New StringBuilder()

        builder.Append("<script language=JavaScript> ShowCreateAccountWindow(); </script>" & vbLf)
        Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())
    End Sub
    
    Protected Sub btndeActive_Click(sender As Object, e As EventArgs)
        Dim b As Button = TryCast(sender, Button)
        Dim message As String = String.Empty

        'Dim constr As String = ConfigurationManager.ConnectionStrings("SSMConnectionString").ConnectionString
        Using con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())


            'Dim Con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
            Using cmd As New SqlCommand("update [TB_DangNhap] set trangthai = 2 where Tendangnhap ='" + b.CommandArgument.ToString() + "'", con)

                con.Open()
                '// mo ket noi 
                cmd.ExecuteNonQuery()

                con.Close()
            End Using
        End Using

        ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") & message) + "');", True)
        Response.Redirect(Request.RawUrl)

    End Sub
    Protected Sub BtnDel_Click(sender As Object, e As EventArgs)
        Dim b As Button = TryCast(sender, Button)
        Dim message As String = String.Empty

        'Dim constr As String = ConfigurationManager.ConnectionStrings("SSMConnectionString").ConnectionString
        Using con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())


            'Dim Con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
            Using cmd As New SqlCommand("delete from [TB_DangNhap]  where Email ='" + b.CommandArgument.ToString() + "'", con)

                con.Open()
                '// mo ket noi 
                cmd.ExecuteNonQuery()

                con.Close()
            End Using
        End Using

        ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") & message) + "');", True)
        Response.Redirect(Request.RawUrl)

    End Sub
    Protected Sub ASPxGridView1_CommandButtonInitialize(ByVal sender As Object, ByVal e As ASPxGridViewCommandButtonEventArgs)
        If e.VisibleIndex = -1 Then
            Return
        End If

        'Select Case e.ButtonType
        '    Case ColumnCommandButtonType.Edit
        '        e.Visible = EditButtonVisibleCriteria(CType(sender, ASPxGridView), e.VisibleIndex)
        '    Case ColumnCommandButtonType.Delete
        '        e.Visible = DeleteButtonVisibleCriteria(CType(sender, ASPxGridView), e.VisibleIndex)
        'End Select
    End Sub
    Protected Sub ASPxGridView1_CustomButtonInitialize(ByVal sender As Object, ByVal e As ASPxGridViewCustomButtonEventArgs)
        If e.VisibleIndex = -1 Then
            Return
        End If
         
        If e.ButtonID = "DActiver" Then
            e.Visible = Dacti(CType(sender, ASPxGridView), e.VisibleIndex)
        End If
       

        If e.ButtonID = "Activer" Then
            e.Visible = act(CType(sender, ASPxGridView), e.VisibleIndex)
        End If



    End Sub
 
    Private Function act(ByVal grid As ASPxGridView, ByVal visibleIndex As Integer) As DefaultBoolean
        Dim row As DefaultBoolean
        '= If(GetStates(grid.GetRowValues(visibleIndex, "trangthai")) = "yes", True, False)
        If GetStates(grid.GetRowValues(visibleIndex, "trangthai")) = "yes" Then
            row = DefaultBoolean.False

        Else
            row = DefaultBoolean.True
        End If
        Return row
    End Function
    Private Function Dacti(ByVal grid As ASPxGridView, ByVal visibleIndex As Integer) As DefaultBoolean
        Dim row As DefaultBoolean
        '= If(GetStates(grid.GetRowValues(visibleIndex, "trangthai")) = "yes", True, False)
        If GetState(grid.GetRowValues(visibleIndex, "trangthai")) = "yes" Then

            row = DefaultBoolean.True
        Else
            row = DefaultBoolean.False
        End If
        Return row
    End Function
    'Protected Sub ASPxGridView1_CustomButtonCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomButtonCallbackEventArgs)
    '    If e.ButtonID <> "DActiver" Then
    '        '    Return
    '        '

    '        Dim b As Button = TryCast(sender, Button)
    '        Dim message As String = String.Empty

    '        'Dim constr As String = ConfigurationManager.ConnectionStrings("SSMConnectionString").ConnectionString
    '        Using con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())


    '            'Dim Con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
    '            Using cmd As New SqlCommand("update [TB_DangNhap] set trangthai = 2 where Tendangnhap ='" + ASPxGridView1.GetRowValues(e.VisibleIndex, "Tendangnhap").ToString() + "'", con)

    '                con.Open()
    '                '// mo ket noi 
    '                cmd.ExecuteNonQuery()

    '                con.Close()
    '            End Using
    '        End Using

    '        ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") & message) + "');", True)
    '        Response.Redirect(Request.RawUrl)
    '    End If
    '    If e.ButtonID = "Activer" Then
    '        Dim b As Button = TryCast(sender, Button)
    '        Dim message As String = String.Empty
    '        Dim commandArgs As String() = b.CommandArgument.ToString().Split(New Char() {","c})
    '        Dim us As String = commandArgs(0)
    '        Dim email As String = commandArgs(1)

    '        'Dim constr As String = ConfigurationManager.ConnectionStrings("SSMConnectionString").ConnectionString
    '        Using con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())


    '            'Dim Con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
    '            Using cmd As New SqlCommand("update [TB_DangNhap] set trangthai = 1 where Tendangnhap ='" + us + "'", con)

    '                con.Open()
    '                '// mo ket noi 
    '                cmd.ExecuteNonQuery()

    '                ' // thuc thi 
    '                con.Close()
    '            End Using


    '            Dim oj As New SSMDATA
    '            Dim sb As New StringBuilder()
    '            'Dim read As New StreamReader(Server.MapPath("~/temmail.htm"))


    '            'read.Close()
    '            'Dim mail As New SendEmail()
    '            'body = String.Format(body, email, us)
    '            sb.Append("<html><head>")
    '            sb.Append("<link rel='stylesheet' type='text/css' href='theme.css' />")
    '            sb.Append("</head>")
    '            sb.Append("<body>")

    '            sb.Append("<table>")
    '            sb.Append("<tr><td>  Tài khoản   " & email & " đã được kích hoạt trên hệ thống Everst V2</td></tr>")
    '            sb.Append("<tr><td>--------------------------------------------------------------------------------</td></tr>")
    '            sb.Append("<tr><td>© Copyright © 2014 - Wipro Unza Việt Nam</td></tr>")
    '            sb.Append("</table>")
    '            sb.Append("</body>")
    '            sb.Append("</html>")
    '            oj.sendEmail(email, "EVEREST V2: Tài khoản của bạn đã được kich hoạt ", sb.ToString(), "") 'sb.ToString()
    '            'oj.sendEmail("dong.tranvan@wipro-unza.com", "Thông Báo", body, "") 'sb.ToString()
    '            message = "Activer successful.\nUser Id: " + email
    '            ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") & message) + "');", True)
    '            Response.Redirect(Request.RawUrl)
    '        End Using
    '    End If
    'End Sub
    'Private Sub ASPxGridView1_HtmlCommandCellPrepared(sender As Object, e As ASPxGridViewTableCommandCellEventArgs) Handles ASPxGridView1.HtmlCommandCellPrepared

    '    If e.CommandCellType <> DevExpress.Web.ASPxGridView.GridViewTableCommandCellType.Data Then
    '        'If e.CommandColumn.CustomButtons.Ite = "Activer" Then
    '        '    e.Visible = DeleteButtonVisibleCriteria(CType(sender, ASPxGridView), e.VisibleIndex)
    '        'End If
    '        'If e.ButtonID = "DeActiver" Then
    '        '    e.Visible = EditButtonVisibleCriteria(CType(sender, ASPxGridView), e.VisibleIndex)
    '        'End If
    '        If e.VisibleIndex <> 0 Then
    '            e.Cell.Controls("Activer").Visible = False
    '        End If
    '    End If
    'End Sub


    Protected Sub btCreate_Click(sender As Object, e As EventArgs) Handles btCreate.Click
        Using con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())


            'Dim Con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
            Using cmd As New SqlCommand("update [TB_DangNhap] set  [MaPhongban] =  @phongban , hovaten = @hoten, email  =  @Email   where Tendangnhap = @tendangnhap", con)

                Using sda As New SqlDataAdapter()
                    'cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@tendangnhap", tbUsername.Text.Trim())
                    cmd.Parameters.AddWithValue("@phongban", tbbophan.Text.Trim())
                    cmd.Parameters.AddWithValue("@hoten", tbhovaten.Text.Trim())
                    cmd.Parameters.AddWithValue("@Email", tbEmail.Text.Trim())
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteScalar()

                    '// mo ket noi 
                    'cmd.ExecuteNonQuery()

                    con.Close()
                End Using
            End Using
            Using cmd As New SqlCommand(" UPDATE [TBQuyenUser]  SET [Bophan]=@bophan ,[Region] =@Region,[Area] = @Area,[Customer] = @Customer WHERE [Tendangnhap] = @tendangnhap ", con)

                Using sda As New SqlDataAdapter()
                    'cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@tendangnhap", tbUsername.Text.Trim())
                    cmd.Parameters.AddWithValue("@bophan", tbbophan.Text.Trim())
                    cmd.Parameters.AddWithValue("@region", tbRegion.Text.Trim())
                    cmd.Parameters.AddWithValue("@Area", tbArea.Text.Trim())
                    cmd.Parameters.AddWithValue("@Customer", tbcus.Text.Trim())
                    cmd.Connection = con
                    con.Open()
                    cmd.ExecuteScalar()

                    '// mo ket noi 
                    'cmd.ExecuteNonQuery()

                    con.Close()
                End Using
            End Using
        End Using
        lstDanhSach.DataBind()
        'Dim builder As New StringBuilder()

        'builder.Append("<script language=JavaScript> hidea(); </script>" & vbLf)
        'Page.ClientScript.RegisterStartupScript(Me.[GetType](), "Hide", builder.ToString())
    End Sub
End Class