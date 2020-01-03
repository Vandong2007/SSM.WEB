Imports System.IO
Imports System.Data
Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports System.Configuration
Imports DevExpress.Web.ASPxGridView
Public Class updateBeatCode
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
            Case ".xls"
                'Excel 97-03
                connString = ConfigurationManager.ConnectionStrings("Excel03ConString").ConnectionString
                Exit Select
            Case ".csv"
                'Excel 97-03
                connString = ConfigurationManager.ConnectionStrings("Excel07+ConString").ConnectionString
                Exit Select
            Case ".xlsx"
                '    'Excel 07 or higher
                connString = ConfigurationManager.ConnectionStrings("Excel07+ConString").ConnectionString
                Exit Select
                'Case ".mdb"
                '    'Excel 07 or higher
                '    connString = ConfigurationManager.ConnectionStrings("accesss").ConnectionString
                '    Exit Select
                'Case ".unza"
                '    'Excel 07 or higher
                '    connString = ConfigurationManager.ConnectionStrings("accesss").ConnectionString
                '    Exit Select

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
            If Loai.Value = "3" Then
                dtExcelData.Columns.AddRange(New DataColumn(3) {New DataColumn("distributorCode", GetType(String)),
            New DataColumn("beatCode", GetType(String)),
            New DataColumn("retailerCode", GetType(String)),
           New DataColumn("sequenceNumber", GetType(Integer))
          })
            ElseIf Loai.Value = "2" Then
                dtExcelData.Columns.AddRange(New DataColumn(3) {New DataColumn("distributorCode", GetType(String)),
          New DataColumn("beatCode", GetType(String)),
          New DataColumn("dayOfWeek", GetType(String)),
         New DataColumn("weekNumber", GetType(String))
        })
            Else
                dtExcelData.Columns.AddRange(New DataColumn(5) {New DataColumn("distributorCode", GetType(String)),
       New DataColumn("beatCode", GetType(String)),
       New DataColumn("beatName", GetType(String)),
      New DataColumn("shortName", GetType(String)),
         New DataColumn("active", GetType(String)),
                 New DataColumn("salesRepCode", GetType(String))
     })
            End If


            Using oda As New OleDbDataAdapter("SELECT *  FROM  [" & sheet1 & "] where beatCode is not null", excel_con)
                oda.Fill(dtExcelData)
            End Using


            'GrDic.Caption = Path.GetFileName(FilePath)
            'GrDic.DataSource = dtExcelData

            'GrDic.DataBind()
            Session("dd") = dtExcelData
            ASPxGridView1.DataSource = Session("dd")
            ASPxGridView1.DataBind()

            excel_con.Close()
            ASPxGridView1.Caption = Path.GetFileName(FilePath)

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



            Dim conString As String = ConfigurationManager.ConnectionStrings("SSMConnectionString").ConnectionString
            Using con As New SqlConnection(conString)



                'Update  ton kho

                Try
                    If Loai.Value = "3" Then
                        Using cmd As New SqlCommand("DELETE FROM  [TB_M_beat_mapping] where distributorCode ='" + ASPxTextBox1.Text + "' ", con)

                            con.Open()
                            '// mo ket noi 
                            cmd.ExecuteNonQuery()
                            ' // thuc thi 
                            con.Close()
                        End Using
                    ElseIf Loai.Value = "2" Then
                        Using cmd As New SqlCommand("DELETE FROM  [TB_M_beat_schedule] where distributorCode ='" + ASPxTextBox1.Text + "' ", con)

                            con.Open()
                            '// mo ket noi 
                            cmd.ExecuteNonQuery()
                            ' // thuc thi 
                            con.Close()
                        End Using
                    Else
                        Using cmd As New SqlCommand("DELETE FROM  [TB_M_beatcode] where distributorCode ='" + ASPxTextBox1.Text + "' ", con)

                            con.Open()
                            '// mo ket noi 
                            cmd.ExecuteNonQuery()
                            ' // thuc thi 
                            con.Close()
                        End Using
                    End If

                Catch ex As Exception
                    con.Close()
                End Try


                'Doanhso so
                Using sqlBulkCopy As New SqlBulkCopy(con)
                    'Set the database table name
                    If Loai.Value = "3" Then
                        sqlBulkCopy.DestinationTableName = "dbo.TB_M_beat_mapping"

                        '[OPTIONAL]: Map the Excel columns with that of the database table

                        sqlBulkCopy.ColumnMappings.Add("distributorCode", "distributorCode")
                        sqlBulkCopy.ColumnMappings.Add("beatCode", "beatCode")
                        sqlBulkCopy.ColumnMappings.Add("retailerCode", "retailerCode")
                        sqlBulkCopy.ColumnMappings.Add("sequenceNumber", "sequenceNumber")

                        con.Open()
                        sqlBulkCopy.BulkCopyTimeout = 4000
                        sqlBulkCopy.WriteToServer(ASPxGridView1.DataSource)
                        con.Close()
                    ElseIf Loai.Value = "" Then
                        sqlBulkCopy.DestinationTableName = "dbo.TB_M_beat_schedule"

                        '[OPTIONAL]: Map the Excel columns with that of the database table

                        sqlBulkCopy.ColumnMappings.Add("distributorCode", "distributorCode")
                        sqlBulkCopy.ColumnMappings.Add("beatCode", "beatCode")
                        sqlBulkCopy.ColumnMappings.Add("dayOfWeek", "dayOfWeek")
                        sqlBulkCopy.ColumnMappings.Add("weekNumber", "weekNumber")

                        con.Open()
                        sqlBulkCopy.BulkCopyTimeout = 4000
                        sqlBulkCopy.WriteToServer(ASPxGridView1.DataSource)
                        con.Close()
                    Else
                        sqlBulkCopy.DestinationTableName = "dbo.TB_M_beatcode"

                        '[OPTIONAL]: Map the Excel columns with that of the database table

                        sqlBulkCopy.ColumnMappings.Add("distributorCode", "distributorCode")
                        sqlBulkCopy.ColumnMappings.Add("beatCode", "beatCode")
                        sqlBulkCopy.ColumnMappings.Add("beatName", "beatName")
                        sqlBulkCopy.ColumnMappings.Add("shortName", "shortName")
                        sqlBulkCopy.ColumnMappings.Add("active", "active")
                        sqlBulkCopy.ColumnMappings.Add("salesRepCode", "salesRepCode")



                        con.Open()
                        sqlBulkCopy.BulkCopyTimeout = 4000
                        sqlBulkCopy.WriteToServer(ASPxGridView1.DataSource)
                        con.Close()
                    End If
                    'Exit Sub
                End Using

            End Using
        End If
    End Sub


End Class