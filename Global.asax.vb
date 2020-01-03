Imports System.Web.SessionState
Imports DevExpress.Web.ASPxClasses
Imports System.Data.SqlClient
Imports SAP.Middleware.Connector

'Imports System.Data.SqlClient

'Applications Language="VB"  



Public Class Global_asax
    Inherits System.Web.HttpApplication
    Dim gsDataSQL As String = ConfigurationManager.ConnectionStrings("SSMConnectionString").ConnectionString
 
    'Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
    '      'AddHandler DevExpress.Web.ASPxClasses.ASPxWebControl.CallbackError, AddressOf Application_Error
    'End Sub

    'Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
    '	' Fires when the session is started
    'End Sub

    'Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
    '	' Fires at the beginning of each request
    'End Sub

    'Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
    '	' Fires upon attempting to authenticate the use
    'End Sub

    'Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
    '	' Fires when an error occurs
    'End Sub

    'Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
    '	' Fires when the session ends
    'End Sub

    'Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
    '	' Fires when the application ends
    'End Sub

    Private Sub Session_Start()

        Dim count_visit As Integer = 0
        'Kiểm tra file count_visit.txt nếu không tồn  tại thì
        'If System.IO.File.Exists(Server.MapPath("cont.txt")) = False Then
        If System.IO.File.Exists(Request.PhysicalApplicationPath + "cont.txt") = False Then
            count_visit = 1
        Else
            ' Ngược lại thì

            ' Đọc dử liều từ file count_visit.txt
            Dim read As New System.IO.StreamReader(Request.PhysicalApplicationPath + "cont.txt")
            count_visit = Integer.Parse(read.ReadLine())
            read.Close()
            ' Tăng biến count_visit thêm 1
            count_visit += 1
        End If
        ' khóa website
        Application.Lock()

        ' gán biến Application count_visit
        Application("count_visit") = count_visit

        ' Mở khóa website
        Application.UnLock()

        ' Lưu dử liệu vào file  count_visit.txt
        Dim writer As New System.IO.StreamWriter(Request.PhysicalApplicationPath + "cont.txt")
        writer.WriteLine(count_visit)
        writer.Close()
      


        'Dim CN As New SqlConnection(gsDataSQL)
        'CN.Close()
        'Dim qry As String = "Update TB_DangNhap Set  Online='True', Slandangnhap=Isnull(Slandangnhap,0)+1  WHERE Tendangnhap=@name"
        'Dim myCommand As New SqlCommand(qry, CN)
        'myCommand.Parameters.Add(New SqlParameter("name", SqlDbType.VarChar)).Value = Session("TenDangNhap").ToString
        'CN.Open()
        'myCommand.ExecuteNonQuery()
        'CN.Close()


    End Sub
    Private Sub Session_End()
         
        'Dim CN As New SqlConnection(gsDataSQL)
        'CN.Close()
        'Dim qry As String = "Update TB_DangNhap  Set  Online =0 WHERE Tendangnhap=@name"
        'Dim myCommand As New SqlCommand(qry, CN)
        'myCommand.Parameters.Add(New SqlParameter("name", SqlDbType.VarChar)).Value = Session("TenDangNhap").ToString
        'CN.Open()
        'myCommand.ExecuteNonQuery()
        'CN.Close()
    End Sub
    Private Sub Application_OnStart()
        'RouteConfig.RegisterRoutes(RouteTable.Routes)
        Dim dc As IDestinationConfiguration = New ECCDestinationConfig()
        RfcDestinationManager.RegisterDestinationConfiguration(dc)
    End Sub
    Private Sub Application_OnEnd()
        Dim CN As New SqlConnection(gsDataSQL)
        CN.Close()
        Dim qry As String = "Update TB_DangNhap  Set  Online =0 WHERE Tendangnhap=@name"
        Dim myCommand As New SqlCommand(qry, CN)
        myCommand.Parameters.Add(New SqlParameter("name", SqlDbType.VarChar)).Value = Session("TenDangNhap").ToString
        CN.Open()
        myCommand.ExecuteNonQuery()
        CN.Close()
    End Sub
    'Private Sub Application_Error(sender As Object, e As EventArgs)
    '    ' Code that runs when an unhandled error occurs
    '    Dim ex As Exception = Server.GetLastError()
    '    Application("TheException") = ex
    '    'store the error for later
    '    Server.ClearError()
    '    'clear the error so we can continue onwards
    '    Response.Redirect("~/Default.aspx")
    '    'direct user to error page
    'End Sub
End Class