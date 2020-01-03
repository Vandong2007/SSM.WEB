Imports System.Net
Imports System.Web.Http
Imports System.Data
Imports System.Data.SqlClient
Imports System.Net.Mail
Imports System.Net.Mime
Imports System.Data.OleDb
Imports System.IO
Imports System.Xml
Imports System.Reflection
Imports System.ComponentModel

Public Class SSMDATA
    Inherits System.Web.UI.Page
    Dim accconStr As OleDbConnection
    Dim cmdSelect As OleDbCommand
    Dim strSelect As String
    Dim accadp As OleDbDataAdapter
    Dim dtset As DataSet
    Dim sqlconStr As SqlConnection
    Dim sqlcmd As SqlCommand

#Region "SSM"
    'updateto server
    Public Sub UpdateKHtoSQL(ByVal Files As String, ByVal username As String)
        'Dim sqlconStr As SqlConnection
        Try
            sqlconStr = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
            sqlconStr.Open()

            strSelect = "INSERT INTO  [SDKhachhang] select  tmp.[MaNPP],tmp.[MaKH],tmp.[Tenkh],tmp.[Diachi],tmp.[Phuong],tmp.[Quan],tmp.[Thanhpho],tmp.[Phone],tmp.[Fax],tmp.[Active],tmp.[NgayHD], " & username & " AS [User], Getdate() AS[Lastchange] From OPENROWSET('Microsoft.ACE.OLEDB.12.0,'" & Files & "';;,SSDKhachhang' )   tmp	 LEFT JOIN [SDKhachhang] a ON a.[MaNPP]=tmp.[MaNPP] and a.[MaKH] = tmp.[MaKH] WHERE a.[MaKH] IS NULL and a.[MaNPP] IS NULL"
            sqlcmd = New SqlCommand(strSelect, sqlconStr)
            sqlcmd.ExecuteNonQuery()
            sqlconStr.Close()
        Catch ex As Exception
            If sqlconStr.State = ConnectionState.Open Then
                sqlconStr.Close()
            End If
            '  MessageBox.Show("Import failed with error: " & Environment.NewLine & Environment.NewLine & ex.ToString)
        End Try
    End Sub
    Public Function Getctkmid(ByVal id As Integer) As DataSet
        Dim con As SqlConnection
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        con.Open()
        Dim strselect As String = "select * from   tbctkm where ID=  " + id.ToString
        adp = New SqlDataAdapter(strselect, con)
        dtset = New DataSet
        adp.Fill(dtset, "dbo.tbctkm")
        con.Close()
        Return dtset
    End Function
    Public Sub TheDownload(path As String)
        Dim toDownload As New System.IO.FileInfo(HttpContext.Current.Server.MapPath(path))
        HttpContext.Current.Response.Clear()
        HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" & toDownload.Name)
        HttpContext.Current.Response.AddHeader("Content-Length", toDownload.Length.ToString())
        HttpContext.Current.Response.ContentType = "application/octet-stream"
        HttpContext.Current.Response.WriteFile(path)
        HttpContext.Current.Response.End()
    End Sub
    Public Function Getquen(ByVal tendangnhap As String) As Integer
        Dim quyen As Integer
        Dim con As SqlConnection
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        con.Open()
        Dim strselect As String = " SELECT maquyen  FROM  TB_DangNhap  where Tendangnhap  = '" + tendangnhap + "'"
        adp = New SqlDataAdapter(strselect, con)
        dtset = New DataSet
        adp.Fill(dtset, "TB_DangNhap")
        con.Close()
        quyen = CInt(dtset.Tables(0).Rows(0)("maquyen"))
        Return quyen

    End Function
    Public Function Getq(ByVal tendangnhap As String) As DataSet
        'Dim quyen As Integer
        Dim con As SqlConnection
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        con.Open()
        Dim strselect As String = " SELECT  [Tendangnhap],[Bophan],[channel],[Region],[Area],[Customer],[xem],isnull ([sua],0) as sua,isnull ([checks],0) as checks,isnull ([aprover],0) as aprover ,isnull ([dh],0) as dh ,isnull ([dhar],0) as dhar FROM  [TBQuyenUser] where Tendangnhap  = '" + tendangnhap + "'"
        adp = New SqlDataAdapter(strselect, con)
        dtset = New DataSet
        adp.Fill(dtset, "TBQuyenUser")
        con.Close()
        'quyen = CInt(dtset.Tables(0).Rows(0)("maquyen"))
        Return dtset

    End Function

    Public Function Getdh(ByVal tendangnhap As String) As DataSet
        'Dim quyen As Integer
        Dim con As SqlConnection
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        con.Open()
        Dim strselect As String = " select  a.* , b.Diengiai   from [dbo].[Fn_cust_dh]( '" + tendangnhap + "') a inner join [dbo].[tb_khohang] b on a.sdf=b.kho"
        adp = New SqlDataAdapter(strselect, con)
        dtset = New DataSet
        adp.Fill(dtset, "TBQuyenUser")
        con.Close()
        'quyen = CInt(dtset.Tables(0).Rows(0)("maquyen"))
        Return dtset

    End Function
    Public Function Getpb(ByVal tendangnhap As String) As String
        Dim quyen As String
        Dim con As SqlConnection
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        con.Open()
        Dim strselect As String = " SELECT top 1  MaPhongban  FROM  TB_DangNhap  where Tendangnhap  = '" + tendangnhap + "'"
        adp = New SqlDataAdapter(strselect, con)
        dtset = New DataSet
        adp.Fill(dtset, "TB_DangNhap")
        con.Close()
        quyen = (dtset.Tables(0).Rows(0)("MaPhongban")).ToString
        Return quyen

    End Function
    Public Function pd(ByVal order As Integer)
        Dim CN As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        CN.Close()
        Dim qry As String = "update [dbo].[tbDatHangs] set [Type] = 'A' ,  dateAP= getdate() ,UserApr =@uname  where Ordernr =  " + order + " "
        Dim myCommand As New SqlCommand(qry, CN)
        myCommand.Parameters.Add(New SqlParameter("uname", SqlDbType.VarChar)).Value = Session("TenDangNhap").ToString
        CN.Open()
        myCommand.ExecuteNonQuery()
        CN.Close()
    End Function
    Public Function Getquens(ByVal tendangnhap As String) As DataSet
        'Dim quyen As Integer
        Dim con As SqlConnection
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        con.Open()
        Dim strselect As String = "SELECT top 1 * FROM  TBQuyenUser  where Tendangnhap = '" + tendangnhap + "'  "
        adp = New SqlDataAdapter(strselect, con)
        dtset = New DataSet
        adp.Fill(dtset, "TBQuyenUser")
        con.Close()
        'quyen = CInt(dtset.Tables(0).Rows(0)("maquyen"))
        Return dtset

    End Function
    Public Function Getsua(ByVal tendangnhap As String) As Boolean
        Dim quyen As Boolean
        Dim con As SqlConnection
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        con.Open()
        Dim strselect As String = " SELECT top 1  sua  FROM  TBQuyenUser  where Tendangnhap  = '" + tendangnhap + "'"
        adp = New SqlDataAdapter(strselect, con)
        dtset = New DataSet
        adp.Fill(dtset, "TB_DangNhap")
        con.Close()
        quyen = dtset.Tables(0).Rows(0)("sua")
        Return quyen

    End Function
    Public Function Getten(ByVal tendangnhap As String) As String
        Dim quyen As String
        Dim con As SqlConnection
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        con.Open()
        Dim strselect As String = " SELECT hovaten  FROM  TB_DangNhap  where Tendangnhap  = '" + tendangnhap + "'"
        adp = New SqlDataAdapter(strselect, con)
        dtset = New DataSet
        adp.Fill(dtset, "TB_DangNhap")
        con.Close()
        quyen = CStr(dtset.Tables(0).Rows(0)("hovaten"))
        Return quyen
    End Function
    Public Function Getclaim(ByVal file As String, ByVal re As String, ByVal TuNgay As String, ByVal DenNgay As String) As Integer

        Dim i As Integer
        Dim con As SqlConnection
        Dim cmd As SqlCommand
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        cmd = New SqlCommand(" WEBEXPORT", con)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.Add("@file", SqlDbType.NVarChar).Value = file
        cmd.Parameters.Add("@RE", SqlDbType.NVarChar).Value = re
        cmd.Parameters.Add("@Tungay", SqlDbType.NVarChar).Value = TuNgay
        cmd.Parameters.Add("@Denngay", SqlDbType.NVarChar).Value = DenNgay

        cmd.CommandTimeout = 333
        Try
            con.Open()
            'cmd.ExecuteNonQuery()
            adp = New SqlDataAdapter(cmd)
            dtset = New DataSet
            adp.Fill(dtset)
            i = CInt(dtset.Tables(0).Rows(0)("kq"))
            Return i
        Catch ex As Exception

            con.Close()

        End Try

    End Function
    Public Function Getngaybdck() As Date
        Dim NgayBD As Date
        Dim con As SqlConnection
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        con.Open()
        Dim strselect As String = "select top 1 DateFrom  FROM   [tbPeriod] Where Status='O'"
        adp = New SqlDataAdapter(strselect, con)
        dtset = New DataSet
        adp.Fill(dtset, "tbPeriod")
        con.Close()
        NgayBD = CDate(dtset.Tables(0).Rows(0)("DateFrom"))
        Return NgayBD

    End Function
    Public Function Getngaybdkt() As Date
        Dim NgayBD As Date
        Dim con As SqlConnection
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        con.Open()
        Dim strselect As String = "select top 1 Dateto  FROM  [tbPeriod] Where Status='O'"
        adp = New SqlDataAdapter(strselect, con)
        dtset = New DataSet
        adp.Fill(dtset, "tbPeriod")
        con.Close()
        NgayBD = CDate(dtset.Tables(0).Rows(0)("Dateto"))
        Return NgayBD
    End Function
    Public Function Getnpp() As DataSet
        Dim con As SqlConnection
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        con.Open()
        Dim strselect As String = "select * from  dbo.tbCustomerS"
        adp = New SqlDataAdapter(strselect, con)
        dtset = New DataSet
        adp.Fill(dtset, "dbo.tbCustomerS")
        con.Close()
        Return dtset
    End Function
    Public Function Getctkm(ByVal id As Integer) As DataSet
        Dim con As SqlConnection
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        con.Open()
        Dim strselect As String = "select * from  dbo.tbctkm"
        adp = New SqlDataAdapter(strselect, con)
        dtset = New DataSet
        adp.Fill(dtset, "dbo.ttbctkm")
        con.Close()
        Return dtset
    End Function
    'Lam Roi'
    Public Function SSM_Dulieugoc(ByVal MaNPP As String, ByVal TuNgay As Date, ByVal DenNgay As Date) As DataSet

        Dim con As SqlConnection
        Dim cmd As SqlCommand
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        cmd = New SqlCommand("SSM_Dulieugoc", con)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.Add("@MaNPP", SqlDbType.NVarChar).Value = MaNPP
        cmd.Parameters.Add("@Tungay", SqlDbType.SmallDateTime).Value = TuNgay
        cmd.Parameters.Add("@Denngay", SqlDbType.SmallDateTime).Value = DenNgay
        con.Open()
        'cmd.ExecuteNonQuery()
        adp = New SqlDataAdapter(cmd)
        dtset = New DataSet
        adp.Fill(dtset)
        con.Close()
        Return dtset

    End Function
    Public Function SSM_GetDS(ByVal TuNgay As Date, ByVal DenNgay As Date, ByVal Username As String) As DataSet

        Dim con As SqlConnection
        Dim cmd As SqlCommand
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        cmd = New SqlCommand("WebGetDS", con)
        cmd.CommandType = CommandType.StoredProcedure
        'cmd.Parameters.Add("@RE", SqlDbType.NVarChar).Value = re
        cmd.Parameters.Add("@Tungay", SqlDbType.SmallDateTime).Value = TuNgay
        cmd.Parameters.Add("@Denngay", SqlDbType.SmallDateTime).Value = DenNgay
        cmd.Parameters.Add("@Username", SqlDbType.NVarChar).Value = Username
        cmd.CommandTimeout = 333
        Try
            con.Open()
            'cmd.ExecuteNonQuery()
            adp = New SqlDataAdapter(cmd)
            dtset = New DataSet
            adp.Fill(dtset)
            Return dtset
        Catch ex As Exception

            con.Close()

        End Try

    End Function
    Public Function SSM_GetDSo(ByVal TuNgay As Date, ByVal DenNgay As Date, ByVal Username As String) As DataSet

        Dim con As SqlConnection
        Dim cmd As SqlCommand
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        cmd = New SqlCommand("WebGetDoanhso", con)
        cmd.CommandType = CommandType.StoredProcedure
        'cmd.Parameters.Add("@RE", SqlDbType.NVarChar).Value = re
        cmd.Parameters.Add("@Tungay", SqlDbType.SmallDateTime).Value = TuNgay
        cmd.Parameters.Add("@Denngay", SqlDbType.SmallDateTime).Value = DenNgay
        cmd.Parameters.Add("@Username", SqlDbType.NVarChar).Value = Username
        cmd.CommandTimeout = 333
        Try
            con.Open()
            'cmd.ExecuteNonQuery()
            adp = New SqlDataAdapter(cmd)
            dtset = New DataSet
            adp.Fill(dtset)
            Return dtset
        Catch ex As Exception

            con.Close()

        End Try

    End Function
    Public Function SSM_WebGetNhapxuatTon(ByVal TuNgay As Date, ByVal DenNgay As Date, ByVal Username As String) As DataSet

        Dim con As SqlConnection
        Dim cmd As SqlCommand
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        cmd = New SqlCommand("WebGetNhapxuatTon", con)
        cmd.CommandType = CommandType.StoredProcedure
        'cmd.Parameters.Add("@RE", SqlDbType.NVarChar).Value = re
        cmd.Parameters.Add("@Tungay", SqlDbType.SmallDateTime).Value = TuNgay
        cmd.Parameters.Add("@Denngay", SqlDbType.SmallDateTime).Value = DenNgay
        cmd.Parameters.Add("@Username", SqlDbType.NVarChar).Value = Username
        cmd.CommandTimeout = 333
        Try
            con.Open()
            'cmd.ExecuteNonQuery()
            adp = New SqlDataAdapter(cmd)
            dtset = New DataSet
            adp.Fill(dtset)
            Return dtset
        Catch ex As Exception

            con.Close()

        End Try

    End Function
    Public Function SSM_Webdeletedata(ByVal TuNgay As Date, ByVal DenNgay As Date, ByVal Username As String, ByVal MaNPP As String) As DataSet

        Dim con As SqlConnection
        Dim cmd As SqlCommand
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        cmd = New SqlCommand("Webdeletedata1", con)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.Add("@MaNPP", SqlDbType.NVarChar).Value = MaNPP
        cmd.Parameters.Add("@Tungay", SqlDbType.SmallDateTime).Value = TuNgay
        cmd.Parameters.Add("@Denngay", SqlDbType.SmallDateTime).Value = DenNgay
        cmd.Parameters.Add("@Username", SqlDbType.NVarChar).Value = Username
        cmd.CommandTimeout = 333
        Try
            con.Open()
            'cmd.ExecuteNonQuery()
            adp = New SqlDataAdapter(cmd)
            dtset = New DataSet
            adp.Fill(dtset)
            Return dtset
        Catch ex As Exception

            con.Close()

        End Try

    End Function
    Public Function SSM_updatectkm(ByVal MaCT As String, ByVal tenct As String, ByVal nhan As String, ByVal loaict As String, ByVal tyle As Double, ByVal TuNgay As Date, ByVal DenNgay As Date, ByVal type As String) As String

        Dim con As SqlConnection
        Dim cmd As SqlCommand
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        cmd = New SqlCommand("upctkm", con)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.Add("@MaCT", SqlDbType.NVarChar).Value = MaCT
        cmd.Parameters.Add("@TenCT", SqlDbType.NVarChar).Value = tenct
        cmd.Parameters.Add("@NhanSP", SqlDbType.NVarChar).Value = nhan
        cmd.Parameters.Add("@LoaiCT", SqlDbType.NVarChar).Value = loaict
        cmd.Parameters.Add("@TyleCK", SqlDbType.NVarChar).Value = tyle
        cmd.Parameters.Add("@Tungay", SqlDbType.SmallDateTime).Value = TuNgay
        cmd.Parameters.Add("@Denngay", SqlDbType.SmallDateTime).Value = DenNgay
        cmd.Parameters.Add("@type", SqlDbType.NVarChar).Value = type
        cmd.CommandTimeout = 333


        Try
            con.Open()
            'cmd.ExecuteNonQuery()
            adp = New SqlDataAdapter(cmd)
            dtset = New DataSet
            adp.Fill(dtset)
            Return "ok"
        Catch ex As Exception

            con.Close()

        End Try
        Return "ok"
    End Function
    Public Function ThucThiStore_DataSets(StoredProcedure As String, ParamArray Parameters As SqlParameter()) As DataSet
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
        Command.CommandTimeout = 3333
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
    'NVBH'
    Public Function SSM_THBaophu(ByVal TuNgay As Date, ByVal DenNgay As Date, ByVal Username As String) As DataSet

        Dim con As SqlConnection
        Dim cmd As SqlCommand
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        cmd = New SqlCommand("WebGetBaophuNPP", con)
        cmd.CommandType = CommandType.StoredProcedure
        'cmd.Parameters.Add("@RE", SqlDbType.NVarChar).Value = re
        cmd.Parameters.Add("@Tungay", SqlDbType.SmallDateTime).Value = TuNgay
        cmd.Parameters.Add("@Denngay", SqlDbType.SmallDateTime).Value = DenNgay
        cmd.Parameters.Add("@Username", SqlDbType.NVarChar).Value = Username
        cmd.CommandTimeout = 333
        Try
            con.Open()
            'cmd.ExecuteNonQuery()
            adp = New SqlDataAdapter(cmd)
            dtset = New DataSet
            adp.Fill(dtset)
            Return dtset
        Catch ex As Exception

            con.Close()

        End Try


    End Function
    'Vung'
    Public Function SSM_THBaophuNPP(ByVal ID_Regions As String, ByVal TuNgay As Date, ByVal DenNgay As Date) As DataSet

        Dim con As SqlConnection
        Dim cmd As SqlCommand
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        cmd = New SqlCommand("SSM_THBaophuNPP", con)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.Add("@ID_Regions", SqlDbType.NVarChar).Value = ID_Regions
        cmd.Parameters.Add("@Tungay", SqlDbType.SmallDateTime).Value = TuNgay
        cmd.Parameters.Add("@Denngay", SqlDbType.SmallDateTime).Value = DenNgay
        con.Open()
        'cmd.ExecuteNonQuery()
        adp = New SqlDataAdapter(cmd)
        dtset = New DataSet
        adp.Fill(dtset)
        con.Close()
        Return dtset

    End Function
    'Lam Roi'
    Public Function SSM_THNhapXuatTonSKU(ByVal ID_Regions As String, ByVal TuNgay As Date, ByVal DenNgay As Date) As DataSet

        Dim con As SqlConnection
        Dim cmd As SqlCommand
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        cmd = New SqlCommand("SSM_THNhapXuatTonSKU", con)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.Add("@ID_Regions", SqlDbType.NVarChar).Value = ID_Regions
        cmd.Parameters.Add("@Tungay", SqlDbType.SmallDateTime).Value = TuNgay
        cmd.Parameters.Add("@Denngay", SqlDbType.SmallDateTime).Value = DenNgay
        con.Open()
        'cmd.ExecuteNonQuery()
        adp = New SqlDataAdapter(cmd)
        dtset = New DataSet
        adp.Fill(dtset)
        con.Close()
        Return dtset

    End Function
    'Lam Roi'
    Public Function SSM_THNhapXuatTonTuan(ByVal ID_Regions As String, ByVal TuNgay As Date, ByVal DenNgay As Date) As DataSet

        Dim con As SqlConnection
        Dim cmd As SqlCommand
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        cmd = New SqlCommand("SSM_THNhapXuatTonTuan", con)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.Add("@ID_Regions", SqlDbType.NVarChar).Value = ID_Regions
        cmd.Parameters.Add("@Tungay", SqlDbType.SmallDateTime).Value = TuNgay
        cmd.Parameters.Add("@Denngay", SqlDbType.SmallDateTime).Value = DenNgay
        con.Open()
        'cmd.ExecuteNonQuery()
        adp = New SqlDataAdapter(cmd)
        dtset = New DataSet
        adp.Fill(dtset)
        con.Close()
        Return dtset

    End Function
    'Lam Roi'
    Public Function SSM_XuatNhapTonSKU(ByVal MaNPP As String, ByVal TuNgay As Date, ByVal DenNgay As Date) As DataSet

        Dim con As SqlConnection
        Dim cmd As SqlCommand
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        cmd = New SqlCommand("SSM_XuatNhapTonSKU", con)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.Add("@MaNPP", SqlDbType.NVarChar).Value = MaNPP
        cmd.Parameters.Add("@Tungay", SqlDbType.SmallDateTime).Value = TuNgay
        cmd.Parameters.Add("@Denngay", SqlDbType.SmallDateTime).Value = DenNgay
        con.Open()
        'cmd.ExecuteNonQuery()
        adp = New SqlDataAdapter(cmd)
        dtset = New DataSet
        adp.Fill(dtset)
        con.Close()
        Return dtset
    End Function

    Public Function chaycls(ByVal Mact As String, ByVal TuNgay As Date, ByVal DenNgay As Date) As Integer

        Dim con As SqlConnection
        Dim cmd As SqlCommand
        'Dim adp As SqlDataAdapter
        'Dim dtset As DataSet
        Try
            con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
            cmd = New SqlCommand("getclaim_Mact", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add("@Mact", SqlDbType.NVarChar).Value = Mact
            cmd.Parameters.Add("@Tungay", SqlDbType.SmallDateTime).Value = TuNgay
            cmd.Parameters.Add("@Denngay", SqlDbType.SmallDateTime).Value = DenNgay
            con.Open()
            Return cmd.ExecuteNonQuery()
            'adp = New SqlDataAdapter(cmd)
            'dtset = New DataSet
            'adp.Fill(dtset)
            con.Close()
            'Return dtset
        Catch ex As SqlException
            Return 0

        End Try
    End Function

    Public Function chayclALL(ByVal Username As String, ByVal TuNgay As Date, ByVal DenNgay As Date) As Integer

        Dim con As SqlConnection
        Dim cmd As SqlCommand
        'Dim adp As SqlDataAdapter
        'Dim dtset As DataSet
        Try
            con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
            cmd = New SqlCommand("getclaim_all", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add("@Username", SqlDbType.NVarChar).Value = Username
            cmd.Parameters.Add("@Tungay", SqlDbType.SmallDateTime).Value = TuNgay
            cmd.Parameters.Add("@Denngay", SqlDbType.SmallDateTime).Value = DenNgay
            cmd.CommandTimeout = 5000
            con.Open()
            Return cmd.ExecuteNonQuery()
            'adp = New SqlDataAdapter(cmd)
            'dtset = New DataSet
            'adp.Fill(dtset)
            con.Close()
            'Return dtset
        Catch ex As SqlException
            Return 0

        End Try
    End Function
#End Region


    '
    ' TODO: Add constructor logic here
    '


    ' Your gửi mail bị lỗi fonst
    ' ...
    'Public Sub sendEmail(ByVal [to] As String, ByVal [sub] As String, ByVal content As String, ByVal file As String)
    '    Try
    '        Dim mail As New MailMessage()

    '        mail.[To] = [to]

    '        mail.From = "system.wuvl@wipro-unza.com"


    '        mail.BodyFormat = MailFormat.Html

    '        mail.BodyEncoding = Encoding.UTF8
    '        mail.Subject = [sub]
    '        mail.Body = content

    '        If Not [String].IsNullOrEmpty(file) Then
    '            Dim fileNames As [String]() = file.Split(";,".ToCharArray())
    '            For Each fileName As [String] In fileNames
    '                If fileName.Trim().Length > 0 Then
    '                    mail.Attachments.Add(New MailAttachment(fileName.Trim()))
    '                End If
    '            Next
    '        End If

    '        Dim smtpServer As String = "wiprounza.com"
    '        Dim userName As String = "system.wuvl"
    '        Dim password As String = "wum@mail1"
    '        Dim cdoBasic As Integer = 1
    '        Dim cdoSendUsingPort As Integer = 2
    '        If userName.Length > 0 Then
    '            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserver", smtpServer)
    '            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", 2525)
    '            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusing", cdoSendUsingPort)
    '            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", cdoBasic)
    '            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", userName)
    '            mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", password)
    '        End If
    '        'showMessage(mail.Body.ToString());
    '        SmtpMail.SmtpServer = smtpServer
    '        SmtpMail.Send(mail)
    '        Response.Flush()
    '        ' MessageBox.Show("Lỗi kết nối tới server. Vui lòng thử lại!");          

    '    Catch
    '    End Try
    'End Sub


    Public Function sendEmail(mailto As String, Subject As String, Contents As String, file As String) As String
        Try

            Dim msg As New System.Net.Mail.MailMessage()
            If Not [String].IsNullOrEmpty(file) Then
                Dim fileNames As [String]() = file.Split(";,".ToCharArray())
                For Each fileName As [String] In fileNames
                    If fileName.Trim().Length > 0 Then
                        Dim data As New Attachment(file, MediaTypeNames.Application.Octet)
                        'msg.Attachments.Add(new  MailAttachment(fileName.Trim()));
                        msg.Attachments.Add(data)
                    End If
                Next
            End If

            msg.From = New MailAddress("system.wuvl@wipro-unza.com.vn", Subject, System.Text.Encoding.UTF8)
            msg.Subject = Subject
            msg.[To].Add(mailto)
            msg.Bcc.Add("dong.tranvan@wipro-unza.com")
            msg.Body = Contents.ToString()
            'sb.ToString();
            msg.BodyEncoding = System.Text.Encoding.UTF8
            msg.IsBodyHtml = True
            'msg.Priority = System.Web.Mail.MailPriority.High
            'Add the Creddentials
            Dim client As New SmtpClient()
            client.Credentials = New NetworkCredential("system.wuvl@wipro-unza.com.vn", "wUvL@2018")
            client.Port = 587
            client.Host = "smtp.office365.com"
            client.EnableSsl = True
            client.TargetName = "STARTTLS/smtp.office365.com"
            client.Send(msg)





            Return "Successfull!"
        Catch ms As Exception
            Return ms.Message
        End Try
    End Function
    Public Function sendEmailBkup(mailto As String, Subject As String, Contents As String, file As String) As String
        Try

            Dim msg As New System.Net.Mail.MailMessage()
            If Not [String].IsNullOrEmpty(file) Then
                Dim fileNames As [String]() = file.Split(";,".ToCharArray())
                For Each fileName As [String] In fileNames
                    If fileName.Trim().Length > 0 Then
                        Dim data As New Attachment(file, MediaTypeNames.Application.Octet)
                        'msg.Attachments.Add(new  MailAttachment(fileName.Trim()));
                        msg.Attachments.Add(data)
                    End If
                Next
            End If

            msg.From = New MailAddress("system.wuvl@wipro-unza.com", Subject, System.Text.Encoding.UTF8)
            msg.Subject = Subject
            msg.[To].Add(mailto)
            msg.Bcc.Add("dong.tranvan@wipro-unza.com")
            msg.Body = Contents.ToString()
            'sb.ToString();
            msg.BodyEncoding = System.Text.Encoding.UTF8
            msg.IsBodyHtml = True
            'msg.Priority = System.Web.Mail.MailPriority.High
            'Add the Creddentials
            Dim client As New SmtpClient()
            client.Credentials = New System.Net.NetworkCredential("system.wuvl", "wum@mail1")
            client.Port = 2525
            client.Host = "wiprounza.com"
            client.EnableSsl = False
            client.Send(msg)
            Return "Successfull!"
        Catch ms As Exception
            Return ms.Message
        End Try
    End Function



    '' update to server
    'Function GetConnectSQL() As DataSet
    '    accconStr = New OleDbConnection(gsConnect)
    '    accconStr.Open()
    '    strSelect = "Select * From tbServer Order by ID"
    '    accadp = New OleDbDataAdapter(strSelect, accconStr)
    '    dtset = New DataSet
    '    accadp.Fill(dtset, "tbServer")
    '    accconStr.Close()
    '    Return dtset
    'End Function

    'Public Sub UpdateNhanvientoSQL(ByVal AccFile As String)
    '    sqlconStr = New SqlConnection(gsDataSQL)
    '    Try
    '        sqlconStr.Open()

    '        strSelect = "INSERT INTO SDNhanvien (MaNPP, Manv, Hoten, Ngaysinh, Ngayvao, Diachi, Phuong, Quan, Thanhpho, Phone, Email,Active) SELECT MaNPP, Manv, Hoten, Ngaysinh, Ngayvao, Diachi, Phuong, Quan, Thanhpho, Phone, Email,Active FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDNhanvien) As NV WHERE NV.MaNV not in(Select Distinct MaNV From SDNhanvien Where NV.MaNPP=SDNhanvien.MaNPP)"

    '        'strSelect = "INSERT INTO tbNhanvien SELECT ID, MaNV, Hoten FROM OPENDATASOURCE('Microsoft.ACE.OLEDB.12.0','Data Source=" & filepath & ";User ID=;Password=').tbNhanvien"

    '        sqlcmd = New SqlCommand(strSelect, sqlconStr)
    '        sqlcmd.ExecuteNonQuery()
    '        sqlconStr.Close()
    '    Catch ex As Exception
    '        If sqlconStr.State = ConnectionState.Open Then
    '            sqlconStr.Close()
    '        End If
    '        '   MessageBox.Show("Import failed with error: " & Environment.NewLine & Environment.NewLine & ex.ToString)
    '    End Try
    'End Sub

    'Public Sub UpdateNhanvien_ActivetoSQL(ByVal AccFile As String)
    '    sqlconStr = New SqlConnection(gsDataSQL)
    '    Try
    '        sqlconStr.Open()

    '        strSelect = "UPDATE SDNhanvien Set Active=(SELECT Active FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDNhanvien) As NV WHERE NV.MaNPP=SDNhanvien.MaNPP and NV.MaNV=SDNhanvien.MaNV) WHERE SDNhanvien.MaNPP in(SELECT top 1 MaNPP FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDNhanvien)) and SDNhanvien.MaNV in(SELECT distinct MaNV FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDNhanvien) As SDNV WHERE SDNV.Active<>SDNhanvien.Active)"
    '        sqlcmd = New SqlCommand(strSelect, sqlconStr)
    '        sqlcmd.ExecuteNonQuery()
    '        sqlconStr.Close()
    '    Catch ex As Exception
    '        If sqlconStr.State = ConnectionState.Open Then
    '            sqlconStr.Close()
    '        End If
    '        '  MessageBox.Show("Import failed with error: " & Environment.NewLine & Environment.NewLine & ex.ToString)
    '    End Try
    'End Sub

    'Public Sub UpdateKHtoSQL(ByVal AccFile As String)
    '    sqlconStr = New SqlConnection(gsDataSQL)
    '    Try
    '        sqlconStr.Open()

    '        strSelect = "INSERT INTO SDKhachhang (MaNPP,MaKH,Tenkh,Diachi,Phuong,Quan,Thanhpho,Phone,Fax,Active,NgayHD) SELECT MaNPP,MaKH,Tenkh,Diachi,Phuong,Quan,Thanhpho,Phone,Fax,Active,NgayHD FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDKhachhang) As KH WHERE KH.MaKH not in(Select Distinct MaKH From SDKhachhang Where KH.MaNPP=SDKhachhang.MaNPP)"
    '        sqlcmd = New SqlCommand(strSelect, sqlconStr)
    '        sqlcmd.ExecuteNonQuery()
    '        sqlconStr.Close()
    '    Catch ex As Exception
    '        If sqlconStr.State = ConnectionState.Open Then
    '            sqlconStr.Close()
    '        End If
    '        '  MessageBox.Show("Import failed with error: " & Environment.NewLine & Environment.NewLine & ex.ToString)
    '    End Try
    'End Sub

    'Public Sub InsertKHNVtoSQL(ByVal AccFile As String)
    '    sqlconStr = New SqlConnection(gsDataSQL)
    '    Try
    '        sqlconStr.Open()

    '        'strSelect = "INSERT INTO SDKhachhangNV (MaNPP,MaKH,MaNV) SELECT MaNPP,MaKH,MaNV FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDKhachhangNV) As KHNV WHERE KHNV.MaKH not in(Select Distinct MaKH From SDKhachhangNV Where KHNV.MaNPP=SDKhachhangNV.MaNPP) and KHNV.MaNV not in(Select Distinct MaNV From SDKhachhangNV Where KHNV.MaNPP=SDKhachhangNV.MaNPP)"
    '        strSelect = "INSERT INTO SDKhachhangNV (MaNPP,MaKH,MaNV) SELECT MaNPP,MaKH,MaNV FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDKhachhangNV)"
    '        sqlcmd = New SqlCommand(strSelect, sqlconStr)
    '        sqlcmd.ExecuteNonQuery()
    '        sqlconStr.Close()
    '    Catch ex As Exception
    '        If sqlconStr.State = ConnectionState.Open Then
    '            sqlconStr.Close()
    '        End If
    '        '  MessageBox.Show("Import failed with error: " & Environment.NewLine & Environment.NewLine & ex.ToString)
    '    End Try
    'End Sub
    'Public Sub DeleteKHNVtoSQL(ByVal AccFile As String)
    '    sqlconStr = New SqlConnection(gsDataSQL)
    '    Try
    '        sqlconStr.Open()

    '        strSelect = "DELETE FROM SDKhachhangNV WHERE SDKhachhangNV.MaNPP in (SELECT Distinct MaNPP FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDKhachhangNV))"
    '        sqlcmd = New SqlCommand(strSelect, sqlconStr)
    '        sqlcmd.ExecuteNonQuery()
    '        sqlconStr.Close()
    '    Catch ex As Exception
    '        If sqlconStr.State = ConnectionState.Open Then
    '            sqlconStr.Close()
    '        End If
    '        '  MessageBox.Show("Import failed with error: " & Environment.NewLine & Environment.NewLine & ex.ToString)
    '    End Try
    'End Sub
    ''Public Sub UpdateKH_MaNVtoSQL(ByVal AccFile As String)
    ''    sqlconStr = New SqlConnection(gsDataSQL)
    ''    Try
    ''        sqlconStr.Open()
    ''
    ''        strSelect = "UPDATE SDKhachhang Set MaNV=(SELECT MaNV FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDKhachhang) As KH WHERE KH.MaNPP=SDKhachhang.MaNPP and KH.MaKH=SDKhachhang.MaKH) WHERE SDKhachhang.MaNPP in(SELECT top 1 MaNPP FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDKhachhang)) and SDKhachhang.MaKH in(SELECT distinct MaKH FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDKhachhang) As SDKH WHERE SDKH.MaNV<>SDKhachhang.MaNV)"
    ''        sqlcmd = New SqlCommand(strSelect, sqlconStr)
    ''        sqlcmd.ExecuteNonQuery()
    ''        sqlconStr.Close()
    ''    Catch ex As Exception
    ''        If sqlconStr.State = ConnectionState.Open Then
    ''            sqlconStr.Close()
    ''        End If
    ''        MessageBox.Show("Import failed with error: " & Environment.NewLine & Environment.NewLine & ex.ToString)
    ''    End Try
    ''End Sub

    'Public Sub UpdateKH_ActivetoSQL(ByVal AccFile As String)

    '    sqlconStr = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
    '    Try
    '        sqlconStr.Open()

    '        strSelect = "UPDATE SDKhachhang Set Active=(SELECT Active FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDKhachhang) As KH WHERE KH.MaNPP=SDKhachhang.MaNPP and KH.MaKH=SDKhachhang.MaKH) WHERE SDKhachhang.MaNPP in(SELECT top 1 MaNPP FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDKhachhang)) and SDKhachhang.MaKH in(SELECT distinct MaKH FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDKhachhang) As SDKH WHERE SDKH.Active<>SDKhachhang.Active)"
    '        sqlcmd = New SqlCommand(strSelect, sqlconStr)
    '        sqlcmd.ExecuteNonQuery()
    '        sqlconStr.Close()
    '    Catch ex As Exception
    '        If sqlconStr.State = ConnectionState.Open Then
    '            sqlconStr.Close()
    '        End If
    '        '   MessageBox.Show("Import failed with error: " & Environment.NewLine & Environment.NewLine & ex.ToString)
    '    End Try
    'End Sub

    'Public Sub UpdateKH_ThanhphotoSQL(ByVal AccFile As String)
    '    sqlconStr = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())

    '    Try
    '        sqlconStr.Open()

    '        strSelect = "UPDATE SDKhachhang Set Thanhpho=(SELECT Thanhpho FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDKhachhang) As KH WHERE KH.MaNPP=SDKhachhang.MaNPP and KH.MaKH=SDKhachhang.MaKH) WHERE SDKhachhang.MaNPP in(SELECT top 1 MaNPP FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDKhachhang)) and SDKhachhang.MaKH in(SELECT distinct MaKH FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDKhachhang) As SDKH WHERE SDKH.Thanhpho<>SDKhachhang.Thanhpho)"
    '        sqlcmd = New SqlCommand(strSelect, sqlconStr)
    '        sqlcmd.ExecuteNonQuery()
    '        sqlconStr.Close()
    '    Catch ex As Exception
    '        If sqlconStr.State = ConnectionState.Open Then
    '            sqlconStr.Close()
    '        End If
    '        '  MessageBox.Show("Import failed with error: " & Environment.NewLine & Environment.NewLine & ex.ToString)
    '    End Try
    'End Sub

    'Public Sub UpdateKH_TenKHtoSQL(ByVal AccFile As String)
    '    sqlconStr = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())

    '    sqlcmd.CommandTimeout() = 10000
    '    Try
    '        sqlconStr.Open()

    '        strSelect = "UPDATE SDKhachhang Set TenKH=(SELECT TenKH FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDKhachhang) As KH WHERE KH.MaNPP=SDKhachhang.MaNPP and KH.MaKH=SDKhachhang.MaKH) WHERE SDKhachhang.MaNPP in(SELECT top 1 MaNPP FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDKhachhang)) and SDKhachhang.MaKH in(SELECT distinct MaKH FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDKhachhang) As SDKH WHERE SDKH.TenKH<>SDKhachhang.TenKH)"
    '        sqlcmd = New SqlCommand(strSelect, sqlconStr)
    '        sqlcmd.ExecuteNonQuery()
    '        sqlconStr.Close()
    '    Catch ex As Exception
    '        If sqlconStr.State = ConnectionState.Open Then
    '            sqlconStr.Close()
    '        End If
    '        '  MessageBox.Show("Import failed with error: " & Environment.NewLine & Environment.NewLine & ex.ToString)
    '    End Try
    'End Sub

    'Public Sub UpdateTonkhotoSQL(ByVal AccFile As String)
    '    sqlconStr = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())

    '    sqlcmd.CommandTimeout() = 10000
    '    Try
    '        sqlconStr.Open()
    '        ' Xóa tồn kho của NPP
    '        strSelect = "DELETE FROM SDTonkho WHERE SDTonkho.MaNPP in(SELECT Top 1 MaNPP FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDTonkho))"
    '        sqlcmd = New SqlCommand(strSelect, sqlconStr)
    '        sqlcmd.ExecuteNonQuery()
    '        ' Cập nhật tồn kho mới
    '        strSelect = "INSERT INTO SDTonkho (MaNPP,MaSP,TonCK,TonHB,TonKM,TonTU) SELECT MaNPP,MaSP,TonCK,TonHB,TonKM,TonTU FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDTonkho)"
    '        sqlcmd = New SqlCommand(strSelect, sqlconStr)
    '        sqlcmd.ExecuteNonQuery()
    '        sqlconStr.Close()
    '    Catch ex As Exception
    '        If sqlconStr.State = ConnectionState.Open Then
    '            sqlconStr.Close()
    '        End If
    '        '  MessageBox.Show("Import failed with error: " & Environment.NewLine & Environment.NewLine & ex.ToString)
    '    End Try
    'End Sub

    'Public Sub UpdateDoanhsotoSQL(ByVal AccFile As String)
    '    sqlconStr = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())




    '    Try
    '        sqlconStr.Open()

    '        ' Xóa tồn kho của NPP
    '        strSelect = "DELETE FROM SDDoanhso WHERE SDDoanhso.MaNPP in(SELECT Top 1 MaNPP FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDDoanhso)) and SDDoanhso.Ngay >= (SELECT  min(DateFrom)  FROM tbPeriod  where  Lock  = 'N' ) and (SDDoanhso.Ngay between (SELECT Min(Ngay) as Ngay FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDDoanhso)) and (SELECT Max(Ngay) as Ngay FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDDoanhso)))"
    '        sqlcmd = New SqlCommand(strSelect, sqlconStr)
    '        sqlcmd.CommandTimeout() = 100000
    '        sqlcmd.ExecuteNonQuery()
    '        ' Cập nhật tồn kho mới
    '        strSelect = "INSERT INTO SDDoanhso (MaNPP,MaXK,Ngay,MaNV,MaKH,Type,MaSP,Soluong,Dongia,TyleCK,Khuyenmai,TienCK,Thanhtien,Loai,MaCT) SELECT MaNPP,MaXK,Ngay,MaNV,MaKH,Type,MaSP,Soluong,Dongia,TyleCK,Khuyenmai,TienCK,Thanhtien,Loai,MaCT FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & AccFile & "';;,SDDoanhso)"
    '        sqlcmd = New SqlCommand(strSelect, sqlconStr)
    '        sqlcmd.CommandTimeout() = 100000
    '        sqlcmd.ExecuteNonQuery()
    '        sqlconStr.Close()
    '    Catch ex As Exception
    '        If sqlconStr.State = ConnectionState.Open Then
    '            sqlconStr.Close()
    '        End If
    '        '  MessageBox.Show("Bao Loi: " & Environment.NewLine & Environment.NewLine & ex.ToString)
    '    End Try
    'End Sub
    'Public Sub Updatelog_toSQL(ByVal AccFile As String, ByVal ngaysend As Date, ByVal Dateupdate As Date)
    '    sqlconStr = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())

    '    Try
    '        sqlconStr.Open()

    '        strSelect = "INSERT INTO [SSM].[dbo].[tbllog] ([Manpp]  ,[DateSend],Dateupdate) VALUES ('" & AccFile & "' ,'" & ngaysend & "' ,'" & Dateupdate & "')"

    '        sqlcmd = New SqlCommand(strSelect, sqlconStr)
    '        sqlcmd.ExecuteNonQuery()
    '        sqlconStr.Close()
    '    Catch ex As Exception
    '        If sqlconStr.State = ConnectionState.Open Then
    '            sqlconStr.Close()
    '        End If
    '        '   MessageBox.Show("loi: " & Environment.NewLine & Environment.NewLine & ex.ToString)
    '    End Try
    'End Sub

    Public Shared Function GetTable(ByVal strSQL As String, ByVal Optional isProcedured As Boolean = False, ByVal Optional pars As SqlParameter() = Nothing) As DataSet
        Dim dt As DataSet = New DataSet()

        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())

        Try
            conn.Open()
            Dim comm As SqlCommand = New SqlCommand()
            comm.Connection = conn

            If isProcedured Then
                comm.CommandType = CommandType.StoredProcedure
            Else
                comm.CommandType = CommandType.Text
            End If

            comm.CommandText = strSQL

            If pars IsNot Nothing AndAlso pars.Length > 0 Then
                comm.Parameters.AddRange(pars)
            End If

            Dim adapter As SqlDataAdapter = New SqlDataAdapter(comm)
            adapter.Fill(dt)
        Catch ex As Exception
            Throw ex
        Finally
            conn.Close()
        End Try

        Return dt
    End Function

    Public Shared Function Execute(ByVal strSQL As String, ByVal Optional isProcedured As Boolean = False, ByVal Optional pars As SqlParameter() = Nothing) As Boolean
        Dim dt As DataTable = New DataTable()


        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())

        Try
            conn.Open()
            Dim comm As SqlCommand = New SqlCommand()
            comm.Connection = conn

            If isProcedured Then
                comm.CommandType = CommandType.StoredProcedure
            Else
                comm.CommandType = CommandType.Text
            End If

            comm.CommandText = strSQL

            If pars IsNot Nothing AndAlso pars.Length > 0 Then
                comm.Parameters.AddRange(pars)
            End If

            Return comm.ExecuteNonQuery() > 0
        Catch ex As Exception
            Throw ex
        Finally
            conn.Close()
        End Try
    End Function

    'Class SurroundingClass
    Public Function ConvertXMLToDataSet(ByVal xmlData As String) As DataSet
        Dim stream As StringReader = Nothing
        Dim reader As XmlTextReader = Nothing

        Try
            Dim xmlDS As DataSet = New DataSet()
            stream = New StringReader(xmlData)
            reader = New XmlTextReader(stream)
            xmlDS.ReadXml(reader)
            Return xmlDS
        Catch
            Return Nothing
        Finally
            If reader IsNot Nothing Then reader.Close()
        End Try
    End Function

    Public Function ConvertDataSetToXML(ByVal xmlDS As DataSet) As String
        Dim stream As MemoryStream = Nothing
        Dim writer As XmlTextWriter = Nothing

        Try
            stream = New MemoryStream()
            writer = New XmlTextWriter(stream, Encoding.Unicode)
            xmlDS.WriteXml(writer)
            Dim count As Integer = CInt(stream.Length)
            Dim arr As Byte() = New Byte(count - 1) {}
            stream.Seek(0, SeekOrigin.Begin)
            stream.Read(arr, 0, count)
            Dim utf As UnicodeEncoding = New UnicodeEncoding()
            Return utf.GetString(arr).Trim()
        Catch
            Return String.Empty
        Finally
            If writer IsNot Nothing Then writer.Close()
        End Try
    End Function
    'End Class
    Public Function ToDataTable(Of T)(ByVal data As IList(Of T)) As DataTable
        Dim props As PropertyDescriptorCollection = TypeDescriptor.GetProperties(GetType(T))
        Dim table As DataTable = New DataTable()

        For i As Integer = 0 To props.Count - 1
            Dim prop As PropertyDescriptor = props(i)
            table.Columns.Add(prop.Name, prop.PropertyType)
        Next

        Dim values As Object() = New Object(props.Count - 1) {}

        For Each item As T In data

            For i As Integer = 0 To values.Length - 1
                values(i) = props(i).GetValue(item)
            Next

            table.Rows.Add(values)
        Next

        Return table
    End Function
    Public Function ConvertToDatatable(Of T)(ByVal data As List(Of T)) As DataTable
        Dim props As PropertyDescriptorCollection = TypeDescriptor.GetProperties(GetType(T))
        Dim table As DataTable = New DataTable()

        For i As Integer = 0 To props.Count - 1
            Dim prop As PropertyDescriptor = props(i)

            If prop.PropertyType.IsGenericType AndAlso prop.PropertyType.GetGenericTypeDefinition() = GetType(Nullable(Of)) Then
                table.Columns.Add(prop.Name, prop.PropertyType.GetGenericArguments()(0))
            Else
                table.Columns.Add(prop.Name, prop.PropertyType)
            End If
        Next

        Dim values As Object() = New Object(props.Count - 1) {}

        For Each item As T In data

            For i As Integer = 0 To values.Length - 1
                values(i) = props(i).GetValue(item)
            Next

            table.Rows.Add(values)
        Next

        Return table
    End Function
End Class
