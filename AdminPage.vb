

Public Class AdminPage
    Inherits System.Web.UI.Page
    Public Shared sua As Boolean = False
    Public Shared them As Boolean = False
    Public Shared xoa As Boolean = False
    Public Shared dh As Boolean = False
    Public Shared dhar As Boolean = False
    Public Shared xem As Integer = 5
    Public Shared pb As String = ""
    Public Shared ngaybt As Date
    Public Shared ngaykt As Date
    Public Shared dt As DataTable
    Public Shared npptable As DataTable
    Public Shared numberOfpage As Integer = 30

    Protected Sub Page_Init(sender As Object, e As EventArgs)
        Dim oj As New SSMDATA


        If Session("TenDangNhap") Is Nothing Then
            Dim url As String = Request.Url.AbsoluteUri
            Session("UrlReturn") = url
            Response.Redirect("~/Account/Login.aspx")

            'Dim nv As TB_NhanVien = TryCast(Session("user_page"), TB_NhanVien)
            'Session("HoTen") = nv.HoTen
        Else


            '[OPTIONAL]: It is recommended as otherwise the data will be considered as String by default.
            'dtExcelData.Columns.AddRange(New DataColumn(2) {New DataColumn("Id", GetType(Integer)), _
            '                                                New DataColumn("Name", GetType(String)), _
            '                                                New DataColumn("Salary", GetType(Decimal))})
            Dim dt As New DataTable
            dt.Columns.AddRange(New DataColumn(11) {
                                New DataColumn("ID", GetType(Integer)),
            New DataColumn("MaNPP", GetType(String)),
            New DataColumn("Ngay", GetType(DateTime)),
            New DataColumn("maxk", GetType(String)),
            New DataColumn("mact", GetType(String)),
             New DataColumn("Mact_KT", GetType(String)),
            New DataColumn("MaSP", GetType(String)),
            New DataColumn("soluong", GetType(Integer)),
             New DataColumn("price", GetType(Integer)),
            New DataColumn("thanhtien", GetType(Integer)),
            New DataColumn("Lydo", GetType(String)),
        New DataColumn("Users", GetType(String))})

            Dim dt1 As New DataTable()



            dt1.Columns.Add(New DataColumn("OldItemcode", GetType(String)))
            Dim primaryKey(1) As DataColumn
            primaryKey(1) = dt1.Columns("OldItemcode")
            dt1.PrimaryKey = primaryKey
            dt1.Columns.Add(New DataColumn("Itemname", GetType(String)))
            dt1.Columns.Add(New DataColumn("Price", GetType(Single)))
            dt1.Columns.Add(New DataColumn("SoLuong", GetType(Int32)))
            dt1.Columns.Add(New DataColumn("TongTien", GetType(Single)))
            dt1.Columns.Add(New DataColumn("Priceiv", GetType(Single)))
            dt1.Columns.Add(New DataColumn("TongTienIv", GetType(Single)))
            dt1.Columns.Add(New DataColumn("tax", GetType(Single)))
            dt1.Columns.Add(New DataColumn("TongTienFul", GetType(Single)))
            Session("cart") = dt1


            Dim npptable As New DataTable()

            npptable.Columns.AddRange(New DataColumn(0) {New DataColumn("MaNPP", GetType(String))})

            ngaybt = oj.Getngaybdck
            ngaykt = oj.Getngaybdkt
            xem = oj.Getquen(Session("TenDangNhap").ToString())
            pb = oj.Getpb(Session("TenDangNhap").ToString())
            sua = oj.Getsua(Session("TenDangNhap").ToString())
            dh = Convert.ToBoolean(oj.Getq(Session("TenDangNhap").ToString()).Tables(0).Rows(0)("dh"))
            dhar = Convert.ToBoolean(oj.Getq(Session("TenDangNhap").ToString()).Tables(0).Rows(0)("dhar"))
        End If

    End Sub
    Public Shared Function GetState(obj As Object) As String
        Return If(obj.ToString() = "1", "yes", "no")
    End Function
    Public Shared Function GetStates(obj As Object) As String
        Return If(obj.ToString() = "1", "False", "True")
    End Function


    Private Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Dim oj As New SSMDATA

        'Session("ngayketthuc") = CDate(oj.Getngaybdkt.Tables(0).ToString)
        If Session("TenDangNhap") Is Nothing Then
            Dim url As String = Request.Url.AbsoluteUri
            Session("UrlReturn") = url
            Response.Redirect("~/Account/Login.aspx")
        Else
            ngaybt = oj.Getngaybdck
            ngaykt = oj.Getngaybdkt
            xem = oj.Getquen(Session("TenDangNhap").ToString)
            'Dim nv As TB_NhanVien = TryCast(Session("user_page"), TB_NhanVien)
            'Session("HoTen") = nv.HoTen
        End If

    End Sub
End Class
