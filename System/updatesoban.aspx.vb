Imports System.IO
Imports System.Data
Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports System.Configuration
Imports DevExpress.Web.ASPxGridView
Public Class updatesoban
    Inherits AdminPage
    Dim FilePath As String
    Dim oj As New SSMDATA
    Dim gsDataSQL As String = ConfigurationManager.ConnectionStrings("SSMConnectionString").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Session("TenDangNhap") Is Nothing Then
        Else
            Try


                xem = oj.Getquen(Session("TenDangNhap").ToString())

            Catch ex As Exception

            End Try

        End If
        If xem <> 0 Then
            Dim url As String = Request.Url.AbsoluteUri
            Session("UrlReturn") = url

            Response.Redirect("~/Account/Thongbao.html")

        End If


        FilePath = ""
        Dim FolderPath As String = ConfigurationManager.AppSettings("FolderPath")

        Dim FileName As String = ASPxGridView1.Caption
        If FileName <> "" Then
            Dim Extension As String = Path.GetExtension(FileName)

            FilePath = Server.MapPath(FolderPath + FileName)



            Import_To_Grid(FilePath, Extension)



            ASPxGridView1.DataBind()
        End If
    End Sub
 
    'Sub blindata()
    '    'Upload and save the file
    '    Dim excelPath As String
    '    Try
    '        If Path.GetFileName(FileUpload3.PostedFile.FileName) Is Nothing Then
    '            excelPath = Server.MapPath("~/Files/") + Path.GetFileName(FileUpload3.PostedFile.FileName)
    '            FileUpload3.SaveAs(excelPath)
    '            ASPxTextBox1.Text = excelPath
    '        End If
    '    Catch ex As Exception

    '        excelPath = ASPxTextBox1.Text



    '    End Try

    '    Dim connString As String = String.Empty
    '    Dim extension As String = Path.GetExtension(FileUpload3.PostedFile.FileName)
    '    Select Case extension
    '        'Case ".xls"
    '        '    'Excel 97-03
    '        '    connString = ConfigurationManager.ConnectionStrings("Excel03ConString").ConnectionString
    '        '    Exit Select
    '        'Case ".xlsx"
    '        '    'Excel 07 or higher
    '        '    connString = ConfigurationManager.ConnectionStrings("Excel07+ConString").ConnectionString
    '        '    Exit Select
    '        Case ".mdb"
    '            'Excel 07 or higher
    '            connString = ConfigurationManager.ConnectionStrings("accesss").ConnectionString
    '            Exit Select
    '        Case ".unza"
    '            'Excel 07 or higher
    '            connString = ConfigurationManager.ConnectionStrings("accesss").ConnectionString
    '            Exit Select

    '    End Select
    '    connString = String.Format(connString, excelPath)
    '    Using excel_con As New OleDbConnection(connString)
    '        excel_con.Open()
    '        Dim sheet1 As String = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing).Rows(0)("TABLE_NAME").ToString()
    '        Dim dtExcelData As New DataTable()

    '        dtExcelData.Columns.AddRange(New DataColumn(14) {New DataColumn("Id", GetType(Integer)), _
    '         New DataColumn("MaXK", GetType(String)), _
    '        New DataColumn("Ngay", GetType(DateTime)), _
    '        New DataColumn("MaNV", GetType(String)), _
    '        New DataColumn("MaKH", GetType(String)), _
    '        New DataColumn("Type", GetType(String)), _
    '        New DataColumn("MaSP", GetType(String)), _
    '        New DataColumn("Soluong", GetType(Decimal)), _
    '        New DataColumn("Dongia", GetType(Decimal)), _
    '        New DataColumn("TyleCK", GetType(Decimal)), _
    '        New DataColumn("Khuyenmai", GetType(Decimal)), _
    '        New DataColumn("TienCK", GetType(Decimal)), _
    '        New DataColumn("Thanhtien", GetType(Decimal)), _
    '        New DataColumn("Loai", GetType(String)), _
    '        New DataColumn("MaCT", GetType(String))})

    '        Using oda As New OleDbDataAdapter("SELECT * FROM   SDDoanhso ", excel_con)
    '            oda.Fill(dtExcelData)
    '        End Using
    '        excel_con.Close()
    '        ASPxGridView1.DataSource = dtExcelData
    '        ASPxGridView1.DataBind()

    '    End Using
    'End Sub

    'Private Sub Btok_Click(sender As Object, e As EventArgs) Handles Btok.Click
    '    blindata()
    'End Sub


    'Protected Sub ASPxGridView1_PageIndexChanged(ByVal sender As Object, ByVal e As ASPxGridViewRowEventArgs)

    '    Dim FolderPath As String = ConfigurationManager.AppSettings("FolderPath")

    '    Dim FileName As String = ASPxGridView1.Caption

    '    Dim Extension As String = Path.GetExtension(FileName)

    '    Dim FilePath As String = Server.MapPath(FolderPath + FileName)



    '    Import_To_Grid(FilePath, Extension)

    '    '   ASPxGridView1.PageIndex = e.

    '    ASPxGridView1.DataBind()

    'End Sub

    'Private Sub ASPxGridView1_PageIndexChanged(sender As Object, e As EventArgs) Handles ASPxGridView1.PageIndexChanged
    '    Dim FolderPath As String = ConfigurationManager.AppSettings("FolderPath")

    '    Dim FileName As String = ASPxGridView1.Caption

    '    Dim Extension As String = Path.GetExtension(FileName)

    '    Dim FilePath As String = Server.MapPath(FolderPath + FileName)



    '    Import_To_Grid(FilePath, Extension)

    '    ASPxGridView1.PageIndex = e.NewPageIndex

    '    ASPxGridView1.DataBind()
    'End Sub


    Protected Sub Btok_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btok.Click

        If FileUpload3.PostedFile.FileName.Trim <> "" Then

            Dim FileName As String = Path.GetFileName(FileUpload3.PostedFile.FileName)

            Dim Extension As String = Path.GetExtension(FileUpload3.PostedFile.FileName)

            Dim FolderPath As String = ConfigurationManager.AppSettings("FolderPath")



            Dim FilePath As String = Server.MapPath(FolderPath + Session("TenDangNhap").ToString + "_" + FileName)

            FileUpload3.SaveAs(FilePath)
            '    ASPxTextBox1.Text = FilePath
            Import_To_Grid(FilePath, Extension)
        End If

    End Sub


    Private Sub Import_To_Grid(ByVal FilePath As String, ByVal Extension As String)



        Dim connString As String = String.Empty

        Select Case Extension
            'Case ".xls"
            '    'Excel 97-03
            '    connString = ConfigurationManager.ConnectionStrings("Excel03ConString").ConnectionString
            '    Exit Select
            'Case ".xlsx"
            '    'Excel 07 or higher
            '    connString = ConfigurationManager.ConnectionStrings("Excel07+ConString").ConnectionString
            '    Exit Select
            Case ".mdb"
                'Excel 07 or higher
                connString = ConfigurationManager.ConnectionStrings("accesss").ConnectionString
                Exit Select
            Case ".unza"
                'Excel 07 or higher
                connString = ConfigurationManager.ConnectionStrings("accesss").ConnectionString
                Exit Select

        End Select
        connString = String.Format(connString, FilePath)
        Using excel_con As New OleDbConnection(connString)
            excel_con.Open()
            Dim sheet1 As String = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing).Rows(0)("TABLE_NAME").ToString()
            Dim dtExcelData As New DataTable()
            Dim dtExcelngay As New DataTable()
            '[OPTIONAL]: It is recommended as otherwise the data will be considered as String by default.
            'dtExcelData.Columns.AddRange(New DataColumn(2) {New DataColumn("Id", GetType(Integer)), _
            '                                                New DataColumn("Name", GetType(String)), _
            '                                                New DataColumn("Salary", GetType(Decimal))})
            dtExcelData.Columns.AddRange(New DataColumn(17) {New DataColumn("Id", GetType(Integer)), _
             New DataColumn("MaNPP", GetType(String)), _
             New DataColumn("MaXK", GetType(String)), _
            New DataColumn("Ngay", GetType(DateTime)), _
            New DataColumn("MaNV", GetType(String)), _
            New DataColumn("MaKH", GetType(String)), _
            New DataColumn("Type", GetType(String)), _
            New DataColumn("MaSP", GetType(String)), _
            New DataColumn("Soluong", GetType(Decimal)), _
            New DataColumn("Dongia", GetType(Decimal)), _
            New DataColumn("TyleCK", GetType(Decimal)), _
            New DataColumn("Khuyenmai", GetType(Decimal)), _
            New DataColumn("TienCK", GetType(Decimal)), _
            New DataColumn("Thanhtien", GetType(Decimal)), _
            New DataColumn("Loai", GetType(String)), _
            New DataColumn("MaCT", GetType(String)), _
             New DataColumn("USERs", GetType(String)), _
              New DataColumn("dates", GetType(DateTime))})

            Using oda As New OleDbDataAdapter("SELECT  SDDoanhso.*, '" + Session("TenDangNhap").ToString + "' as USERs ,  '" + CDate(Date.Now) + "'  as dates  FROM   SDDoanhso ", excel_con)
                oda.Fill(dtExcelData)
            End Using
            Using oda2 As New OleDbDataAdapter("SELECT max(manpp) as manpp ,min(ngay) as ngays  ,max(ngay) as ngaye    FROM   SDDoanhso ", excel_con)
                oda2.Fill(dtExcelngay)

            End Using
            excel_con.Close()
            ASPxGridView1.Caption = Path.GetFileName(FilePath)
            ASPxGridView1.DataSource = dtExcelData
            ASPxTextBox1.Text = dtExcelngay.Rows(0)(0).ToString
            datest.Value = dtExcelngay.Rows(0)(1)
            dateen.Value = dtExcelngay.Rows(0)(2)
            ASPxGridView1.DataBind()
            If dateen IsNot Nothing Then
                btupdload.Enabled = True
            End If
        End Using
        'ASPxGridView1.GetTotalSummaryValue()
        'Dim gsiValue As Date = Convert.ToDateTime(ASPxGridView1.GetGroupSummaryValue(0, ASPxGridView1.GroupSummary("Ngay", DevExpress.Data.SummaryItemType.Max)))

    End Sub
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
    Private Function StoreToDataTable(MaNPP As String, tungay As Date, denngay As Date, TenDangNhap As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@MaNPP", SqlDbType.NVarChar), New SqlParameter("@Tungay", SqlDbType.SmallDateTime), New SqlParameter("@Denngay", SqlDbType.SmallDateTime), New SqlParameter("@Username", SqlDbType.NVarChar)}
        arrParam(0).Value = MaNPP
        arrParam(1).Value = tungay
        arrParam(2).Value = denngay
        arrParam(3).Value = TenDangNhap
        Return ThucThiStore_DataSet("Webdeletedata1", arrParam).Tables(0)
    End Function
    Private Function Storef5(MaNPP As String, tungay As Date, denngay As Date) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@MaNPP", SqlDbType.NVarChar), New SqlParameter("@Tungay", SqlDbType.SmallDateTime), New SqlParameter("@Denngay", SqlDbType.SmallDateTime)}
        arrParam(0).Value = MaNPP
        arrParam(1).Value = tungay
        arrParam(2).Value = denngay

        Return ThucThiStore_DataSet("chaydsnpp", arrParam).Tables(0)
    End Function
    Private Function tow4k(MaNPP As String, tungay As Date, denngay As Date) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@MaNPP", SqlDbType.NVarChar), New SqlParameter("@Tungay", SqlDbType.SmallDateTime), New SqlParameter("@Denngay", SqlDbType.SmallDateTime)}
        arrParam(0).Value = MaNPP
        arrParam(1).Value = tungay
        arrParam(2).Value = denngay

        Return ThucThiStore_DataSet("w3k_w4k", arrParam).Tables(0)
    End Function

    Private Function insertkh(files As String, TenDangNhap As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@files", SqlDbType.NVarChar), New SqlParameter("@username", SqlDbType.NVarChar)}
        arrParam(0).Value = files
   
        arrParam(1).Value = TenDangNhap
        Return ThucThiStore_DataSet("IMPORTKHACHHANG", arrParam).Tables(0)
    End Function
    Private Function inserport(files As String, TenDangNhap As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@npp", SqlDbType.NVarChar), New SqlParameter("@username", SqlDbType.NVarChar)}
        arrParam(0).Value = files

        arrParam(1).Value = TenDangNhap
        Return ThucThiStore_DataSet("IMPORTDULIEU2", arrParam).Tables(0)
    End Function
    Private Function insertnv(files As String, TenDangNhap As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@files", SqlDbType.NVarChar), New SqlParameter("@username", SqlDbType.NVarChar)}
        arrParam(0).Value = files

        arrParam(1).Value = TenDangNhap
        Return ThucThiStore_DataSet("IMPORTNhanVien", arrParam).Tables(0)
    End Function

    Private Sub btupdload_Click(sender As Object, e As EventArgs) Handles btupdload.Click
        Dim message As String = String.Empty


        Dim email As String = "dong.tranvan@wipro-unza.com"
        Dim num As Integer = 0
        If Session("TenDangNhap") IsNot Nothing Then
            ' Dim sd As New DataSet
            Dim dtb As DataTable = StoreToDataTable(ASPxTextBox1.Text, CDate(datest.Value), CDate(dateen.Value), Session("TenDangNhap").ToString())
            'sd = oj.SSM_Webdeletedata(CDate(datest.Value), CDate(dateen.Value), Session("TenDangNhap").ToString(), ASPxTextBox1.Text)
            'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirectMe", "alert(" + Session("TenDangNhap") + ");", True)
            'ASPxPivotGrid1.DataSource = oj.SSM_GetDS(CDate(datest.Value), CDate(dateen.Value), Session("TenDangNhap").ToString())
            num = Integer.Parse("0" + dtb.Rows(0)(0))
          

            If num = 2 Then
               

                Dim conString As String = ConfigurationManager.ConnectionStrings("SSMConnectionString").ConnectionString
                Using con As New SqlConnection(conString)
                    'khachhang hang
                    'Dim dtbs As DataTable = insertkh(FilePath, Session("TenDangNhap").ToString())
                    'Dim d As Integer
                    'd = Integer.Parse("0" + dtbs.Rows(0)(0))
                    ''nhan vien
                    'Dim dtbnv As DataTable = insertnv(FilePath, Session("TenDangNhap").ToString())
                    'Dim d1 As Integer
                    'd1 = Integer.Parse("0" + dtbnv.Rows(0)(0))

                    Try
                        'strSelect = "INSERT INTO  [tbllog] ([Manpp],[DateSend],[Dateupdate],[datemax],[users]) VALUES ('" & ASPxTextBox1.Text & "' , getdate() , getdate(), convert(datetime,'" & CDate(dateen.Value) & "',102) ,'" & Session("TenDangNhap").ToString & "' )"

                        Using cmd As New SqlCommand(" INSERT INTO  [tbllog] ([Manpp],[DateSend],[Dateupdate],[datemax],[users]) VALUES ('" + ASPxTextBox1.Text + "' ,  getdate() ,  getdate() , convert(datetime,'" & dateen.Value & "',103) ,'" & Session("TenDangNhap").ToString & "' )", con)
                            con.Open()
                            cmd.ExecuteNonQuery()
                            con.Close()
                        End Using
                    Catch ex As Exception
                        con.Close()
                    End Try



                    'Update  ton kho

                    Try
                        Using cmd As New SqlCommand("DELETE FROM  [SDkhachhang1] where MaNPP ='" + ASPxTextBox1.Text + "' ", con)
                            con.Open()
                            '// mo ket noi 
                            cmd.ExecuteNonQuery()
                            ' // thuc thi 
                            con.Close()
                        End Using
                    Catch ex As Exception
                        con.Close()
                    End Try
                    Try
                        Using cmd As New SqlCommand("DELETE FROM [SDnhanvien1] where MaNPP ='" + ASPxTextBox1.Text + "' ", con)
                            con.Open()
                            '// mo ket noi 
                            cmd.ExecuteNonQuery()
                            ' // thuc thi 
                            con.Close()
                        End Using
                    Catch ex As Exception
                        con.Close()
                    End Try

                    Try
                        Using cmd As New SqlCommand("DELETE FROM [SSM].[dbo].[SDTonkho] where MaNPP ='" + ASPxTextBox1.Text + "'", con)
                            con.Open()
                            '// mo ket noi 
                            cmd.ExecuteNonQuery()
                            ' // thuc thi 
                            con.Close()
                        End Using

                        
                    Catch ex As Exception
                        con.Close()
                    End Try

                    Try
                        Using cmd As New SqlCommand("DELETE FROM  [SDKhachhangNV] where MaNPP ='" + ASPxTextBox1.Text + "' ", con)
                            con.Open()
                            '// mo ket noi 
                            cmd.ExecuteNonQuery()
                            ' // thuc thi 
                            con.Close()
                        End Using

                    Catch ex As Exception
                        con.Close()
                    End Try
                    Try
                        Using cmd As New SqlCommand("DELETE FROM Tb_DMS_EVEREST where  MaNPP ='" + ASPxTextBox1.Text + "' and Ngay >='" & CDate(datest.Value) & "' and Ngay <='" & CDate(dateen.Value) & "' ", con)
                            con.Open()
                            '// mo ket noi  CDate(datest.Value), CDate(dateen.Value)
                            cmd.ExecuteNonQuery()
                            ' // thuc thi 
                            con.Close()
                        End Using
                    Catch ex As Exception
                        con.Close()
                    End Try
                    'Try
                    '    Using cmd As New SqlCommand("INSERT INTO SDTonkho (MaNPP,MaSP,TonCK,TonHB,TonKM,TonTU) SELECT MaNPP,MaSP,TonCK,TonHB,TonKM,TonTU FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0','" & FilePath & "';;,SDTonkho)", con)
                    '        con.Open()
                    '        cmd.ExecuteNonQuery()
                    '        con.Close()
                    '    End Using
                    'Catch ex As Exception
                    '    con.Close()
                    'End Try

                    Import_To_Grid2(FilePath)

                    Import_To_Grid1(FilePath)

                    Import_To_khnv(FilePath)

                    Import_To_TK(FilePath)
                   
                    Dim dtb2 As DataTable = inserport(ASPxTextBox1.Text, Session("TenDangNhap").ToString())
                    num = Integer.Parse("0" + dtb2.Rows(0)(0))

                    'Doanhso so
                    Using sqlBulkCopy As New SqlBulkCopy(con)
                        'Set the database table name
                        sqlBulkCopy.DestinationTableName = "dbo.SDDoanhso"

                        '[OPTIONAL]: Map the Excel columns with that of the database table

                        sqlBulkCopy.ColumnMappings.Add("Id", "Id")
                        sqlBulkCopy.ColumnMappings.Add("MaNPP", "MaNPP")
                        sqlBulkCopy.ColumnMappings.Add("MaXK", "MaXK")
                        sqlBulkCopy.ColumnMappings.Add("Ngay", "Ngay")
                        sqlBulkCopy.ColumnMappings.Add("MaNV", "MaNV")
                        sqlBulkCopy.ColumnMappings.Add("MaKH", "MaKH")

                        sqlBulkCopy.ColumnMappings.Add("Type", "Type")
                        sqlBulkCopy.ColumnMappings.Add("MaSP", "MaSP")

                        sqlBulkCopy.ColumnMappings.Add("Soluong", "Soluong")
                        sqlBulkCopy.ColumnMappings.Add("Dongia", "Dongia")
                        sqlBulkCopy.ColumnMappings.Add("TyleCK", "TyleCK")
                        sqlBulkCopy.ColumnMappings.Add("Khuyenmai", "Khuyenmai")
                        sqlBulkCopy.ColumnMappings.Add("TienCK", "TienCK")
                        sqlBulkCopy.ColumnMappings.Add("Thanhtien", "Thanhtien")
                        sqlBulkCopy.ColumnMappings.Add("Loai", "Loai")
                        sqlBulkCopy.ColumnMappings.Add("MaCT", "MaCT")
                        sqlBulkCopy.ColumnMappings.Add("USERs", "USERs")
                        sqlBulkCopy.ColumnMappings.Add("dates", "dates")

                        con.Open()
                        sqlBulkCopy.BulkCopyTimeout = 4000
                        sqlBulkCopy.WriteToServer(ASPxGridView1.DataSource)
                        con.Close()

                        'Exit Sub
                    End Using
                    Import_To_DMS(FilePath)
                    Try
                        Dim dtb23 As DataTable = Storef5(ASPxTextBox1.Text, CDate(datest.Value), CDate(dateen.Value))
                        num = Integer.Parse("0" + dtb23.Rows(0)(0))
                        '/UPDATE SANG W4K

                        'Dim dtb3 As DataTable = tow4k(ASPxTextBox1.Text, CDate(datest.Value), CDate(dateen.Value))
                        'num = Integer.Parse("0" + dtb3.Rows(0)(0))

                       
                    Catch ex As Exception
                        con.Close()
                    End Try
                End Using

                Dim sb As New StringBuilder()
              
                'Dim read As New StreamReader(Server.MapPath("~/temmail.htm"))


                'read.Close()
                'Dim mail As New SendEmail()
                'body = String.Format(body, email, us)
                sb.Append("<html><head>")
                sb.Append("<link rel='stylesheet' type='text/css' href='theme.css' />")
                sb.Append("</head>")
                sb.Append("<body>")

                sb.Append("<table>")
                sb.Append("<tr><td>  Tài khoản   " & Session("TenDangNhap").ToString() & " Vừa update dữ liệu </td></tr>")
                sb.Append("<tr><td>  Nhà phân phối  " & ASPxTextBox1.Text & "  </td></tr>")
                sb.Append("<tr><td>  Từ ngày   " & datest.Value.ToString & " ngày" & dateen.Value.ToString & " </td></tr>")
                sb.Append("<tr><td>--------------------------------------------------------------------------------</td></tr>")
                sb.Append("<tr><td>© Copyright © 2014 - Wipro Unza Việt Nam</td></tr>")
                sb.Append("</table>")
                sb.Append("</body>")
                sb.Append("</html>")
                oj.sendEmail(email, "EVEREST V2: Update data ", sb.ToString(), "") 'sb.ToString()
                'oj.sendEmail("dong.tranvan@wipro-unza.com", "Thông Báo", body, "") 'sb.ToString()
                message = "Đã updload thành công .\n Nhà phân phối: " + ASPxTextBox1.Text

                ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") & message) + "');", True)
                Response.Redirect(If(Request.QueryString("ReturnUrl"), "~/System/thongbaos.aspx"))
            Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirectMe", "alert('bản không có quyền');", True)
                Exit Sub
            End If

        End If
    End Sub

    Private Sub Import_To_DMS(ByVal FilePath As String)

        Dim connString As String = String.Empty

        connString = String.Format("Provider=Microsoft.ACE.OLEDB.12.0; Data Source=  {0}", FilePath)
        Using excel_con As New OleDbConnection(connString)
            excel_con.Open()
            Dim sheet1 As String = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing).Rows(0)("TABLE_NAME").ToString()



            Dim dms As New DataTable()

            dms.Columns.AddRange(New DataColumn(3) {New DataColumn("MaDH", GetType(String)),
                New DataColumn("MaXK", GetType(String)),
                New DataColumn("MaNPP", GetType(String)),
               New DataColumn("Ngay", GetType(DateTime))
                })

            Using oda2 As New OleDbDataAdapter("SELECT MaDH, MaXK, MaNPP,   Ngay FROM SDDoanhso WHERE ((( MaDH) Is Not Null)) GROUP BY  MaDH,  MaNPP,  MaXK,  Ngay; ", excel_con)
                oda2.Fill(dms)
            End Using

            excel_con.Close()
            If dms.Rows.Count > 0 Then


                Using con As New SqlConnection(gsDataSQL)

                    Using sqlBulkCopykh As New SqlBulkCopy(con)
                        'Set the database table name
                        sqlBulkCopykh.DestinationTableName = "dbo.Tb_DMS_EVEREST"

                        '[OPTIONAL]: Map the Excel columns with that of the database table

                        sqlBulkCopykh.ColumnMappings.Add("MaNPP", "MaNPP")
                        sqlBulkCopykh.ColumnMappings.Add("MaDH", "MaDH")
                        sqlBulkCopykh.ColumnMappings.Add("MaXK", "MaXK")
                        sqlBulkCopykh.ColumnMappings.Add("Ngay", "Ngay")


                        con.Open()
                        sqlBulkCopykh.BulkCopyTimeout = 333
                        sqlBulkCopykh.WriteToServer(dms)
                        con.Close()
                    End Using
                    'Exit Sub
                End Using
            End If
        End Using

    End Sub
    Private Sub Import_To_Grid2(ByVal FilePath As String)

        Dim connString As String = String.Empty

        connString = String.Format("Provider=Microsoft.ACE.OLEDB.12.0; Data Source=  {0}", FilePath)
        Using excel_con As New OleDbConnection(connString)
            excel_con.Open()
            Dim sheet1 As String = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing).Rows(0)("TABLE_NAME").ToString()



            Dim dtkh As New DataTable()

            dtkh.Columns.AddRange(New DataColumn(21) {New DataColumn("MaNPP", GetType(String)),
                New DataColumn("MaKH", GetType(String)),
                New DataColumn("Tenkh", GetType(String)),
                New DataColumn("Diachi", GetType(String)),
                New DataColumn("Phuong", GetType(String)),
                New DataColumn("Quan", GetType(String)),
                New DataColumn("Thanhpho", GetType(String)),
                New DataColumn("Phone", GetType(String)),
                New DataColumn("Fax", GetType(String)),
                New DataColumn("Active", GetType(Boolean)),
                New DataColumn("NgayHD", GetType(DateTime)),
                New DataColumn("Users", GetType(String)),
                New DataColumn("chietkhau", GetType(String)),
              New DataColumn("DcGiao", GetType(String)),
             New DataColumn("Nguoimuhang", GetType(String)),
             New DataColumn("ckg", GetType(String)),
             New DataColumn("MaDMS", GetType(String)),
             New DataColumn("GPS", GetType(String)),
             New DataColumn("NgaySinh", GetType(String)),
             New DataColumn("CMND", GetType(String)),
             New DataColumn("Email", GetType(String)),
                New DataColumn("Lastchange", GetType(DateTime))})

            Using oda2 As New OleDbDataAdapter("SELECT  SDKhachhang.*, '" + Session("TenDangNhap").ToString() + "' as Users ,  '" + CDate(Date.Now) + "'  as Lastchange  FROM   SDKhachhang ", excel_con)
                oda2.Fill(dtkh)
            End Using

            excel_con.Close()
            Using con As New SqlConnection(gsDataSQL)

                Using sqlBulkCopykh As New SqlBulkCopy(con)
                    'Set the database table name
                    sqlBulkCopykh.DestinationTableName = "dbo.SDkhachhang1"

                    '[OPTIONAL]: Map the Excel columns with that of the database table

                    sqlBulkCopykh.ColumnMappings.Add("MaNPP", "MaNPP")
                    sqlBulkCopykh.ColumnMappings.Add("MaKH", "MaKH")
                    sqlBulkCopykh.ColumnMappings.Add("Tenkh", "Tenkh")
                    sqlBulkCopykh.ColumnMappings.Add("Diachi", "Diachi")
                    sqlBulkCopykh.ColumnMappings.Add("Phuong", "Phuong")
                    sqlBulkCopykh.ColumnMappings.Add("Quan", "Quan")
                    sqlBulkCopykh.ColumnMappings.Add("Thanhpho", "Thanhpho")
                    sqlBulkCopykh.ColumnMappings.Add("Phone", "Phone")
                    sqlBulkCopykh.ColumnMappings.Add("Fax", "Fax")
                    sqlBulkCopykh.ColumnMappings.Add("Active", "Active")
                    sqlBulkCopykh.ColumnMappings.Add("NgayHD", "NgayHD")
                    sqlBulkCopykh.ColumnMappings.Add("Users", "Users")
                    sqlBulkCopykh.ColumnMappings.Add("Lastchange", "Lastchange")
                    sqlBulkCopykh.ColumnMappings.Add("chietkhau", "chietkhau")
                    sqlBulkCopykh.ColumnMappings.Add("DcGiao", "DcGiao")
                    sqlBulkCopykh.ColumnMappings.Add("Nguoimuhang", "Nguoimuhang")
                    sqlBulkCopykh.ColumnMappings.Add("ckg", "ckg")
                    sqlBulkCopykh.ColumnMappings.Add("MaDMS", "MaDMS")
                    sqlBulkCopykh.ColumnMappings.Add("GPS", "GPS")
                    sqlBulkCopykh.ColumnMappings.Add("NgaySinh", "NgaySinh")
                    sqlBulkCopykh.ColumnMappings.Add("CMND", "CMND")
                    sqlBulkCopykh.ColumnMappings.Add("Email", "Email")
                    con.Open()
                    sqlBulkCopykh.BulkCopyTimeout = 333
                    sqlBulkCopykh.WriteToServer(dtkh)
                    con.Close()
                End Using
                'Exit Sub
            End Using

        End Using

    End Sub
    Private Sub Import_To_khnv(ByVal FilePath As String)

        Dim connString As String = String.Empty

        connString = String.Format("Provider=Microsoft.ACE.OLEDB.12.0; Data Source=  {0}", FilePath)
        Using excel_con As New OleDbConnection(connString)
            excel_con.Open()
            Dim sheet1 As String = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing).Rows(0)("TABLE_NAME").ToString()


            Dim dtkhnv As New DataTable()



            dtkhnv.Columns.AddRange(New DataColumn(3) {New DataColumn("MaNPP", GetType(String)), _
                    New DataColumn("MaKH", GetType(String)), _
                    New DataColumn("MaNV", GetType(String)), _
                    New DataColumn("Activer", GetType(String))})

            Using oda1 As New OleDbDataAdapter("SELECT SDKhachhangNV.* , '1' as Activer FROM  SDKhachhangNV", excel_con)
                oda1.Fill(dtkhnv)
            End Using

            excel_con.Close()
            Using con As New SqlConnection(gsDataSQL)

                Using sqlBulkCopykhnv As New SqlBulkCopy(con)
                    'Set the database table name
                    sqlBulkCopykhnv.DestinationTableName = "dbo.SDKhachhangNV"

                    '[OPTIONAL]: Map the Excel columns with that of the database table
                    sqlBulkCopykhnv.ColumnMappings.Add("MaNPP", "MaNPP")
                    sqlBulkCopykhnv.ColumnMappings.Add("MaKH", "MaKH")
                    sqlBulkCopykhnv.ColumnMappings.Add("MaNV", "MaNV")
                    sqlBulkCopykhnv.ColumnMappings.Add("Activer", "Activer")
                    con.Open()
                    sqlBulkCopykhnv.BulkCopyTimeout = 333
                    sqlBulkCopykhnv.WriteToServer(dtkhnv)
                    con.Close()
                End Using

            End Using

        End Using

    End Sub
    Private Sub Import_To_TK(ByVal FilePath As String)

        Dim connString As String = String.Empty

        connString = String.Format("Provider=Microsoft.ACE.OLEDB.12.0; Data Source=  {0}", FilePath)
        Using excel_con As New OleDbConnection(connString)
            excel_con.Open()
            Dim sheet1 As String = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing).Rows(0)("TABLE_NAME").ToString()


            Dim dttk As New DataTable()



            dttk.Columns.AddRange(New DataColumn(5) {New DataColumn("MaNPP", GetType(String)), _
                    New DataColumn("MaSP", GetType(String)), _
                    New DataColumn("TonCK", GetType(String)), _
                     New DataColumn("TonHB", GetType(String)), _
                     New DataColumn("TonKM", GetType(String)), _
                    New DataColumn("TonTU", GetType(String))})

            Using oda1 As New OleDbDataAdapter("SELECT  SDTonkho.*   FROM   SDTonkho", excel_con)
                oda1.Fill(dttk)
            End Using

            excel_con.Close()
            Using con As New SqlConnection(gsDataSQL)

                Using sqlBulkCopytk As New SqlBulkCopy(con)
                    'Set the database table name
                    sqlBulkCopytk.DestinationTableName = "dbo.SDTonkho"

                    '[OPTIONAL]: Map the Excel columns with that of the database table
                    sqlBulkCopytk.ColumnMappings.Add("MaNPP", "MaNPP")
                    sqlBulkCopytk.ColumnMappings.Add("MaSP", "MaSP")
                    sqlBulkCopytk.ColumnMappings.Add("TonCK", "TonCK")
                    sqlBulkCopytk.ColumnMappings.Add("TonHB", "TonHB")
                    sqlBulkCopytk.ColumnMappings.Add("TonKM", "TonKM")
                    sqlBulkCopytk.ColumnMappings.Add("TonTU", "TonTU")
                    con.Open()
                    sqlBulkCopytk.BulkCopyTimeout = 333
                    sqlBulkCopytk.WriteToServer(dttk)
                    con.Close()
                End Using

            End Using

        End Using

    End Sub
    Private Sub Import_To_Grid1(ByVal FilePath As String)

        Dim connString As String = String.Empty

        connString = String.Format("Provider=Microsoft.ACE.OLEDB.12.0; Data Source=  {0}", FilePath)
        Using excel_con As New OleDbConnection(connString)
            excel_con.Open()
            Dim sheet1 As String = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing).Rows(0)("TABLE_NAME").ToString()


            Dim dtnv As New DataTable()



            dtnv.Columns.AddRange(New DataColumn(13) {New DataColumn("MaNPP", GetType(String)), _
                    New DataColumn("Manv", GetType(String)), _
                    New DataColumn("Hoten", GetType(String)), _
                    New DataColumn("Ngaysinh", GetType(Date)), _
                    New DataColumn("Ngayvao", GetType(Date)), _
                    New DataColumn("Diachi", GetType(String)), _
                    New DataColumn("Phuong", GetType(String)), _
                    New DataColumn("Quan", GetType(String)), _
                    New DataColumn("Thanhpho", GetType(String)), _
                    New DataColumn("Phone", GetType(String)), _
                    New DataColumn("Email", GetType(String)), _
                    New DataColumn("Active", GetType(String)), _
                    New DataColumn("Users", GetType(String)), _
                    New DataColumn("Lastchange", GetType(Date))})

            Using oda1 As New OleDbDataAdapter("SELECT  MaNPP, Manv, Hoten,  iif (year(Ngaysinh) < 1950  OR year(Ngaysinh) > 2020   ,#01/10/2000# , Ngaysinh  )  as Ngaysinh , iif (year(Ngayvao) < 2000 ,#01/10/2000# , Ngayvao  ) as Ngayvao, Diachi, Phuong, Quan, Thanhpho, Phone, Email, Active, '" + Session("TenDangNhap").ToString() + "' as Users ,  '" + CDate(Date.Now) + "'  as Lastchange  FROM   SDNhanvien ", excel_con)
                oda1.Fill(dtnv)
            End Using
            excel_con.Close()

            Using con As New SqlConnection(gsDataSQL)

                Using sqlBulkCopynv As New SqlBulkCopy(con)
                    'Set the database table name
                    sqlBulkCopynv.DestinationTableName = "dbo.SDNhanvien1"

                    '[OPTIONAL]: Map the Excel columns with that of the database table
                    sqlBulkCopynv.ColumnMappings.Add("MaNPP", "MaNPP")
                    sqlBulkCopynv.ColumnMappings.Add("Manv", "Manv")
                    sqlBulkCopynv.ColumnMappings.Add("Hoten", "Hoten")
                    sqlBulkCopynv.ColumnMappings.Add("Ngaysinh", "Ngaysinh")
                    sqlBulkCopynv.ColumnMappings.Add("Ngayvao", "Ngayvao")
                    sqlBulkCopynv.ColumnMappings.Add("Diachi", "Diachi")
                    sqlBulkCopynv.ColumnMappings.Add("Phuong", "Phuong")
                    sqlBulkCopynv.ColumnMappings.Add("Quan", "Quan")
                    sqlBulkCopynv.ColumnMappings.Add("Thanhpho", "Thanhpho")
                    sqlBulkCopynv.ColumnMappings.Add("Phone", "Phone")
                    sqlBulkCopynv.ColumnMappings.Add("Email", "Email")
                    sqlBulkCopynv.ColumnMappings.Add("Active", "Active")
                    sqlBulkCopynv.ColumnMappings.Add("Users", "Users")
                    sqlBulkCopynv.ColumnMappings.Add("Lastchange", "Lastchange")


                    con.Open()
                    sqlBulkCopynv.BulkCopyTimeout = 333
                    sqlBulkCopynv.WriteToServer(dtnv)
                    con.Close()
                End Using

            End Using

        End Using

    End Sub
  
End Class