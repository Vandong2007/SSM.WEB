Imports System.Security.Cryptography
Imports System.Data.SqlClient
Public Class Login
    Inherits System.Web.UI.Page
    Dim url As String
    'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    'End Sub

    'Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
    '    If Membership.ValidateUser(tbUserName.Text, tbPassword.Text) Then
    '        If String.IsNullOrEmpty(Request.QueryString("ReturnUrl")) Then
    '            FormsAuthentication.SetAuthCookie(tbUserName.Text, False)
    '            Response.Redirect("~/")
    '        Else
    '            FormsAuthentication.RedirectFromLoginPage(tbUserName.Text, False)
    '        End If
    '    Else
    '        tbUserName.ErrorText = "Không đúng user hoặc mật khẩu"
    '        tbUserName.IsValid = False
    '    End If
    'End Sub
 



        Public Function MaHoaMatKhau(password As String) As String
            Dim encoding As New UnicodeEncoding()
            Dim hashBytes As [Byte]() = encoding.GetBytes(password)
            ' Compute the SHA-1 hash
            Dim sha1 As New SHA1CryptoServiceProvider()
            Dim cryptPassword As [Byte]() = sha1.ComputeHash(hashBytes)
            Return BitConverter.ToString(cryptPassword)
        End Function
        Private Shared Function ThucThiStore_DataSet(StoredProcedure As String, ParamArray Parameters As SqlParameter()) As DataSet
            ' Dim ConnectionString As String = "SSMConnectionString"

            '"Server =.\SQL2005;Initial Catalog=DatabaseName;User ID=sa;Password=***"
            Dim Conn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
            Dim Command As New SqlCommand(StoredProcedure, Conn)
            If Parameters IsNot Nothing Then
                Command.Parameters.Clear()
                Command.Parameters.AddRange(Parameters)
            End If
            Dim ds As New DataSet()
            Dim da As New SqlDataAdapter(StoredProcedure, Conn)
            Command.CommandType = CommandType.StoredProcedure
            da.SelectCommand = Command
            Try
                Conn.Open()
                da.Fill(ds)
            Finally
                If Conn.State = ConnectionState.Open Then
                    Conn.Close()
                End If
                Conn.Dispose()
            End Try
            Return ds
        End Function
        Private Function StoreToDataTable(TenDangNhap As String, MatKhau As String) As DataTable
            Dim arrParam As SqlParameter() = {New SqlParameter("@TenDangNhap", SqlDbType.NVarChar), New SqlParameter("@MatKhau", SqlDbType.NVarChar)}
            arrParam(0).Value = TenDangNhap
            arrParam(1).Value = MatKhau
            Return ThucThiStore_DataSet("spTB_DangNhap_KiemTraDangNhap", arrParam).Tables(0)
        End Function
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Session("UrlReturn") Is Nothing Then
            url = "~/default.aspx"
        Else
            url = Session("UrlReturn").ToString()
        End If
        'Session.RemoveAll()
        Session("TenDangNhap") = Nothing
        Session("MatKhau") = Nothing
        Session("cart") = Nothing
    End Sub
    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        KiemTraNhap(tbUserName.Text + "", tbPassword.Text.Trim)
       
    End Sub

    Private Sub KiemTraNhap(ByVal TenDangNhap As String, ByVal MatKhau As String)

        Dim oj As New SSMDATA

        'Session["NhanVien"] = "";
        If url Is Nothing OrElse url.ToLower().Contains("login") OrElse url.ToLower().Contains("register") Then
            url = "~/default.aspx"
        End If

        Dim dtb As DataTable = StoreToDataTable(TenDangNhap, MatKhau)
        Dim num As Integer = 0
        If dtb.Rows.Count > 0 Then
            num = Integer.Parse("0" + dtb.Rows(0)(0))
            Select Case num
                Case 0
                    ' Khai báo Session cho phép đăng nhập
                    Session("TenDangNhap") = tbUserName.Text.ToString().ToLower()
                    'Session("MatKhau") = tbPassword.Text

                    FormsAuthentication.SetAuthCookie(tbUserName.Text, False)

                    Dim _onLineTable As New DataTableForCurrentOnlineUser()

                    ' An instance of user's entity.
                    Dim _user As New UserEntity()
                    _user.Ticket = Session("TenDangNhap").ToString
                    _user.UserName = tbUserName.Text.Trim()
                    _user.TrueName = oj.Getten(Session("TenDangNhap").ToString)
                    _user.ClientIP = Me.Request.UserHostAddress
                    _user.RoleID = "1"

                    ' Use session variable to store the ticket.
                    'Me.Session("TenDangNhap") = _user.Ticket

                    ' Log in.
                    _onLineTable.Login(_user, True)
                    'Response.Redirect("CurrentOnlineUserList.aspx")


                    Response.Redirect(url)
                    'Dim cookie As HttpCookie

                    ''cookie = Request.Cookies("StoredURLFromLastSession")
                    'If String.IsNullOrEmpty(HttpContext.Current.Request.Cookies("StoredURLFromLastSession").ToString()) Then
                    '    Dim StoredURLFromLastSession As String = HttpContext.Current.Request.Cookies("StoredURLFromLastSession").ToString()
                    '    Response.Redirect(StoredURLFromLastSession)

                    'End If
                    'Dim returnUrl = Session("UrlReturn").ToString
                    'If String.IsNullOrEmpty(returnUrl) Then
                    '    returnUrl = "~/"
                    '    ''End If
                    '    'If Session("UrlReturn") Is Nothing Then
                    '    '    Response.Redirect(Session("UrlReturn").ToString)
                    '    'Else
                    '    Response.Redirect("~/")
                    'End If
                    'If Request.Browser.IsMobileDevice Then
                    '    ASPxMenu1.DataSource = XmlDataSource1
                    '    ASPxMenu1.DataBind()
                    '    'Else
                    '    '    '    ASPxMenu1.DataSource = XmlDataSourceHeader
                    '    '    '    ASPxMenu1.DataBind()
                    '    '

                    '    Response.Redirect("~/Mobile/sales.aspx")

                    'Else
                    '    Response.Redirect("~/")
                    'End If

                    Exit Sub
                Case 1
                    'Thông báo tên đăng nhập không tồn tại
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirectMe", "alert('Lỗi:không tồn tại');", True)
                    Exit Sub
                Case 2
                    ' thông báo sai mật khẩu
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirectMe", "alert('Lỗi;không đúng!');", True)
                    Exit Sub
                Case 3
                    'thông báo TenDangNhap đã bị khóa
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirectMe", "alert('Lỗi: đã bị khóa!');", True)
                    Exit Sub
                Case 4
                    ' Thông báo phải đổi mật khẩu và chuyển người dùng đến trang DoiMatKhau.aspx
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirectMe", "alert(' đổi mật khẩu  !'); ", True)
                    Session("TenDangNhap") = tbUserName.Text.ToString().ToLower()
                    Session("MatKhau") = tbPassword.Text
                    FormsAuthentication.SetAuthCookie(tbUserName.Text, False)
                    Response.Redirect("~/Account/ChangePassword.aspx")
                    Exit Sub
            End Select
        End If
        dtb.Dispose()
    End Sub

   
   
End Class