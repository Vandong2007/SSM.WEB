Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxEditors

Public Class Check_data
    Inherits AdminPage
    Dim oj As New SSMDATA
    Dim gsDataSQL As String = ConfigurationManager.ConnectionStrings("SSMConnectionString").ConnectionString
    Dim FilePath As String
   

    Protected Sub btnXlsxExport_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnXlsxExport.Click
        Export(1)



    End Sub
    Private Sub Export(ByVal saveAs As Boolean)
        Using stream As New MemoryStream()
            ASPxPivotGridExporter1.OptionsPrint.PrintHeadersOnEveryPage = DevExpress.Utils.DefaultBoolean.True
            ASPxPivotGridExporter1.OptionsPrint.PrintFilterHeaders = DevExpress.Utils.DefaultBoolean.False
            ASPxPivotGridExporter1.OptionsPrint.PrintColumnHeaders = DevExpress.Utils.DefaultBoolean.True
            ASPxPivotGridExporter1.OptionsPrint.PrintRowHeaders = DevExpress.Utils.DefaultBoolean.True
            ASPxPivotGridExporter1.OptionsPrint.PrintDataHeaders = DevExpress.Utils.DefaultBoolean.False


            ASPxPivotGridExporter1.OptionsPrint.PageSettings.Landscape = DevExpress.Utils.DefaultBoolean.True



            Dim contentType As String = "", fileName As String = ""

            contentType = "application/ms-excel"
            fileName = "Tonkho" + DateTime.Now.ToString("yyyy_MM_dd_hh_mm_ss") + ".xlsx"
            ASPxPivotGridExporter1.ExportToXlsx(stream)


            Dim buffer(stream.Length - 1) As Byte
            Array.Copy(stream.GetBuffer(), buffer, buffer.Length)

            Dim disposition As String
            If saveAs Then
                disposition = "attachment"
            Else
                disposition = "inline"
            End If
            Response.Clear()
            Response.Buffer = False
            Response.AppendHeader("Content-Type", contentType)
            Response.AppendHeader("Content-Transfer-Encoding", "binary")
            Response.AppendHeader("Content-Disposition", disposition & "; filename=" & fileName)
            Response.BinaryWrite(buffer)
            Response.End()
        End Using
    End Sub




    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        e.Command.CommandTimeout = 444

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
    Private Function inserttk(manpp As String, TenDangNhap As String, DenNgay As DateTime, ngayup As DateTime) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@MaNPP", SqlDbType.NVarChar), New SqlParameter("@Username", SqlDbType.NVarChar), New SqlParameter("@DenNgay", SqlDbType.SmallDateTime), New SqlParameter("@ngayupdate", SqlDbType.SmallDateTime)}
        arrParam(0).Value = manpp
        arrParam(1).Value = TenDangNhap
        arrParam(2).Value = CDate(DenNgay)
        arrParam(3).Value = CDate(ngayup)
        Return ThucThiStore_DataSet("xoatonkho", arrParam).Tables(0)
    End Function
    Protected Sub btnupload_Click(sender As Object, e As EventArgs) Handles btnupload.Click
        Dim dtbnv As DataTable = inserttk(Manpps.Value.ToString, Session("TenDangNhap").ToString(), txtngaytinh.Value, txtNgayup.Value)
        SqlDataSource1.DataBind()
        ASPxGridView1.DataBind()
    End Sub

    Protected Sub SqlDataSource2_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource2.Selecting
        e.Command.CommandTimeout = 444
    End Sub

    Private Sub Check_data_Load(sender As Object, e As EventArgs) Handles Me.Load
        'txtngayupdate.MaxDate = ngaykt
        txtngayupdate.MinDate = ngaybt
        If Session("TenDangNhap") Is Nothing Then
        Else
            Try

                pb = oj.Getpb(Session("TenDangNhap").ToString())
                xem = oj.Getquen(Session("TenDangNhap").ToString())
                sua = oj.Getsua(Session("TenDangNhap").ToString())
            Catch ex As Exception

            End Try

        End If
        If pb = "AP&P" Or pb = "IT" Then
            pageControl.TabPages.FindByText("Thanh lý tồn kho").Enabled = sua
            pageControl.TabPages.FindByText("Điều chỉnh tồn kho").Enabled = sua
        Else
            pageControl.TabPages.FindByText("Thanh lý tồn kho").Enabled = False
            pageControl.TabPages.FindByText("Điều chỉnh tồn kho").Enabled = False
        End If
        'FilePath = ""
        'Dim FolderPath As String = ConfigurationManager.AppSettings("FolderPath")

        'Dim FileName As String = GrDic.Caption
        'If FileName <> "" Then
        '    Dim Extension As String = Path.GetExtension(FileName)

        '    FilePath = Server.MapPath(FolderPath + FileName)



        '    Import_To_Grid(FilePath, Extension)



        '    GrDic.DataBind()
        'End If
    End Sub

    Protected Sub Btok_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Btok.Click

        If FileUpload3.PostedFile.FileName.Trim <> "" Then

            Dim FileName As String = Path.GetFileName(FileUpload3.PostedFile.FileName)

            Dim Extension As String = Path.GetExtension(FileUpload3.PostedFile.FileName)

            Dim FolderPath As String = ConfigurationManager.AppSettings("FolderPath")



            Dim FilePath As String = Server.MapPath(FolderPath + Session("TenDangNhap").ToString + FileName)

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
            Case ".xlsx"
                'Excel 07 or higher
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
            dtExcelData.Columns.AddRange(New DataColumn(8) {
                New DataColumn("MaNPP", GetType(String)), _
            New DataColumn("Ngay", GetType(DateTime)), _
            New DataColumn("MaSP", GetType(String)), _
            New DataColumn("Soluong", GetType(Integer)), _
                 New DataColumn("Loai", GetType(String)), _
             New DataColumn("DienGiai", GetType(String)), _
             New DataColumn("Users", GetType(String)), _
              New DataColumn("dates", GetType(DateTime)), _
           New DataColumn("Ngayupdate", GetType(DateTime))})

            Using oda As New OleDbDataAdapter("SELECT '" + ASPxComboBox1.Value + "' as MaNPP,'" + ASPxDateEdit2.Value + "' As Ngay,  Masp,Soluong,Loai, '" + TxtLyDO.Text + "'as DienGiai,'" + Session("TenDangNhap").ToString + "' as Users,  '" + CDate(Date.Now) + "'  as dates, '" + txtngayupdate.Value + "' As Ngayupdate FROM  [" & sheet1 & "]", excel_con)
                oda.Fill(dtExcelData)
            End Using


            'GrDic.Caption = Path.GetFileName(FilePath)
            'GrDic.DataSource = dtExcelData

            'GrDic.DataBind()

            Using con As New SqlConnection(gsDataSQL)

                Using sqlBulkCopynv As New SqlBulkCopy(con)
                    'Set the database table name
                    sqlBulkCopynv.DestinationTableName = "dbo.SdxuatKhac"
                    'sqlBulkCopynv.ColumnMappings.Add("Id", "Id")
                    '[OPTIONAL]: Map the Excel columns with that of the database table
                    sqlBulkCopynv.ColumnMappings.Add("MaNPP", "MaNPP")
                    sqlBulkCopynv.ColumnMappings.Add("Ngay", "Ngay")
                    sqlBulkCopynv.ColumnMappings.Add("MaSP", "MaSP")
                    sqlBulkCopynv.ColumnMappings.Add("Soluong", "Soluong")
                    sqlBulkCopynv.ColumnMappings.Add("Loai", "Loai")
                    sqlBulkCopynv.ColumnMappings.Add("DienGiai", "DienGiai")
                    sqlBulkCopynv.ColumnMappings.Add("Users", "Users")
                    sqlBulkCopynv.ColumnMappings.Add("dates", "dates")
                    sqlBulkCopynv.ColumnMappings.Add("Ngayupdate", "Ngayupdate")
                    con.Open()
                    sqlBulkCopynv.BulkCopyTimeout = 333
                    sqlBulkCopynv.WriteToServer(dtExcelData)
                    con.Close()
                End Using
                GrilXK.DataBind()
            End Using
            excel_con.Close()
        End Using
        'ASPxGridView1.GetTotalSummaryValue()
        'Dim gsiValue As Date = Convert.ToDateTime(ASPxGridView1.GetGroupSummaryValue(0, ASPxGridView1.GroupSummary("Ngay", DevExpress.Data.SummaryItemType.Max)))

    End Sub
    Protected Sub GrilXK_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs)

        If e.Parameters = "Delete" Then

            Dim keyValues As List(Of Object) = GrilXK.GetSelectedFieldValues("Id")

            For Each key As Object In keyValues

                GrilXK.DeleteRow(GrilXK.FindVisibleIndexByKeyValue(key))

            Next
            GrilXK.DataBind()

            GrilXK.Selection.UnselectAll()

        End If

    End Sub
    Private Function Storedieuchinh(MaNPP As String, tungay As Date, denngay As Date, TenDangNhap As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@MaNPP", SqlDbType.NVarChar), New SqlParameter("@Denngay", SqlDbType.SmallDateTime), New SqlParameter("@ngayupdate", SqlDbType.SmallDateTime), New SqlParameter("@Username", SqlDbType.NVarChar)}
        arrParam(0).Value = MaNPP
        arrParam(1).Value = tungay
        arrParam(2).Value = denngay
        arrParam(3).Value = TenDangNhap
        Return ThucThiStore_DataSet("Webdieuchinhtonkho", arrParam).Tables(0)
    End Function
    Private Sub Bt_dieuChinh_Click(sender As Object, e As EventArgs) Handles Bt_dieuChinh.Click

        Dim num As Integer
        Dim dtb As DataTable = Storedieuchinh(ASPxComboBox1.Value, ASPxDateEdit2.Value, txtngayupdate.Value, Session("TenDangNhap").ToString)
        num = Integer.Parse("0" + dtb.Rows(0)(0))
        GrilXK.DataBind()
        GrilXK.Selection.UnselectAll()
    End Sub
    Protected Sub grid_CustomJSProperties(ByVal sender As Object, ByVal e As ASPxGridViewClientJSPropertiesEventArgs)
        Dim grid As ASPxGridView = TryCast(sender, ASPxGridView)

        Dim start As Int32 = grid.VisibleStartIndex
        Dim [end] As Int32 = grid.VisibleStartIndex + grid.SettingsPager.PageSize
        Dim selectNumbers As Int32 = 0
        If [end] > grid.VisibleRowCount Then
            [end] = (grid.VisibleRowCount)
        Else
            [end] = ([end])
        End If

        For i As Integer = start To [end] - 1
            If grid.Selection.IsRowSelected(i) Then
                selectNumbers += 1
            End If
        Next i

        e.Properties("cpSelectedRowsOnPage") = selectNumbers
        e.Properties("cpVisibleRowCount") = grid.VisibleRowCount
    End Sub
    Protected Sub cbAll_Init(ByVal sender As Object, ByVal e As EventArgs)
        Dim chk As ASPxCheckBox = TryCast(sender, ASPxCheckBox)
        Dim grid As ASPxGridView = (TryCast(chk.NamingContainer, GridViewHeaderTemplateContainer)).Grid
        chk.Checked = (grid.Selection.Count = grid.VisibleRowCount)
    End Sub
End Class