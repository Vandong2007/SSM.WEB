Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxEditors

Public Class upLoad_ketqua
    Inherits AdminPage
    Dim gsDataSQL As String = ConfigurationManager.ConnectionStrings("SSMConnectionString").ConnectionString
    Dim FilePath As String






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





    Private Sub Check_data_Load(sender As Object, e As EventArgs) Handles Me.Load

        GrilXK.DataSource = DirectCast(Session("Updalod"), DataTable)
        GrilXK.DataBind()
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
            Dim dtExcelnpp As New DataTable()
            '[OPTIONAL]: It is recommended as otherwise the data will be considered as String by default.
            'dtExcelData.Columns.AddRange(New DataColumn(2) {New DataColumn("Id", GetType(Integer)), _
            '                                                New DataColumn("Name", GetType(String)), _
            '                                                New DataColumn("Salary", GetType(Decimal))})
            'dtExcelnpp.Columns.AddRange(New DataColumn(0) {New DataColumn("MaNPP", GetType(String))})
            'New DataColumn("MaSP", GetType(String)), _
            'New DataColumn("ID", GetType(Integer)), _
            dtExcelData.Columns.AddRange(New DataColumn(10) {
                                         New DataColumn("ID", GetType(Integer)), _
            New DataColumn("MaNPP", GetType(String)), _
            New DataColumn("Ngay", GetType(DateTime)), _
            New DataColumn("maxk", GetType(String)), _
            New DataColumn("mact", GetType(String)), _
             New DataColumn("Mact_KT", GetType(String)), _
            New DataColumn("soluong", GetType(Integer)), _
             New DataColumn("price", GetType(Integer)), _
            New DataColumn("thanhtien", GetType(Integer)), _
            New DataColumn("Lydo", GetType(String)), _
        New DataColumn("Users", GetType(String))})
            Using oda As New OleDbDataAdapter(" Select  ID, [MaNPP] ,[Ngay],[maxk],[mact], [MaSP],[soluong],[price],[thanhtien],[Lydo], '" & Session("TenDangNhap").ToString & "' as Users FROM  [" & sheet1 & "] ", excel_con)
                oda.Fill(dtExcelData)

            End Using
            Using oda2 As New OleDbDataAdapter("SELECT  min(ngay) as ngays  ,max(ngay) as ngaye    FROM  [" & sheet1 & "]  ", excel_con)
                oda2.Fill(dtExcelnpp)

            End Using
            'Using oda As New OleDbDataAdapter(" Select  MaNPP FROM  [" & sheet1 & "] group by MaNPP ", excel_con)
            '    oda.Fill(dtExcelnpp)

            'End Using
            'Session("NPP") = dtExcelnpp
            datest.Visible = True
            dateen.Visible = True
            Bt_dieuChinh.Visible = True
            datest.Value = dtExcelnpp.Rows(0)(0)
            dateen.Value = dtExcelnpp.Rows(0)(1)
            Bt_dieuChinh.Enabled = True
            ' DONG MOI SUA 13/08
            Session("Updalod") = dtExcelData
            GrilXK.DataSource = Session("Updalod")
            GrilXK.DataBind()
             
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
    Private Function xoatbale(MaNPP As String, tungay As Date, denngay As Date, TenDangNhap As String) As Integer
        Dim arrParam As SqlParameter() = {New SqlParameter("@MaNPP", SqlDbType.NVarChar), New SqlParameter("@Tungay", SqlDbType.SmallDateTime), New SqlParameter("@Denngay", SqlDbType.SmallDateTime), New SqlParameter("@Username", SqlDbType.NVarChar)}
        arrParam(0).Value = MaNPP
        arrParam(1).Value = tungay
        arrParam(2).Value = denngay
        arrParam(3).Value = TenDangNhap
        'Return ThucThiStore_DataSet("Webdeletedataclaim", arrParam).Tables(0)

        Return Integer.Parse("0" + ThucThiStore_DataSet("Webdeletedataclaim", arrParam).Tables(0).Rows(0)(0))

    End Function
    Private Sub Bt_dieuChinh_Click(sender As Object, e As EventArgs) Handles Bt_dieuChinh.Click
        Dim s As String
        'DirectCast(Session("Updalod"), DataTable)
        Dim message As String = String.Empty
        'Dim num As Integer
        'num = xoatbale()
        'Using con As New SqlConnection(gsDataSQL)

        '    Using sqlBulkCopynv As New SqlBulkCopy(con)
        '        'Set the database table name
        '        sqlBulkCopynv.DestinationTableName = "dbo.tbCliam_TT"
        '        'sqlBulkCopynv.ColumnMappings.Add("ID", "ID")
        '        '[OPTIONAL]: Map the Excel columns with that of the database table

        '        sqlBulkCopynv.ColumnMappings.Add("MaNPP", "manpp")
        '        sqlBulkCopynv.ColumnMappings.Add("Ngay", "ngay")
        '        sqlBulkCopynv.ColumnMappings.Add("maxk", "maxk")
        '        sqlBulkCopynv.ColumnMappings.Add("mact", "mact")
        '        sqlBulkCopynv.ColumnMappings.Add("Mact_KT", "Mact_KT")
        '        sqlBulkCopynv.ColumnMappings.Add("MaSP", "masp")
        '        sqlBulkCopynv.ColumnMappings.Add("soluong", "soluong")
        '        sqlBulkCopynv.ColumnMappings.Add("price", "price")
        '        sqlBulkCopynv.ColumnMappings.Add("thanhtien", "thanhtien")
        '        sqlBulkCopynv.ColumnMappings.Add("Lydo", "LYdo")
        '        sqlBulkCopynv.ColumnMappings.Add("Users", "Users")
        '        con.Open()
        '        sqlBulkCopynv.BulkCopyTimeout = 333
        '        sqlBulkCopynv.WriteToServer(dt)
        '        con.Close()
        '    End Using

        '    'Session("Updalod") = Nothing
        '    'GrilXK.DataSource = Session("Updalod")
        '    'GrilXK.DataBind()
        '    '        GrilXK.DataBind()
        'End Using

        dt = DirectCast(Session("Updalod"), DataTable)
        If dt.Rows.Count <> 0 Then


            Using con As New SqlConnection(gsDataSQL)

                'Try
                '    'strSelect = "INSERT INTO  [tbllog] ([Manpp],[DateSend],[Dateupdate],[datemax],[users]) VALUES ('" & ASPxTextBox1.Text & "' , getdate() , getdate(), convert(datetime,'" & CDate(dateen.Value) & "',102) ,'" & Session("TenDangNhap").ToString & "' )"

                '    Using cmd As New SqlCommand(" delete   from tbCliam_TT where ngay >= convert(datetime,'" & CDate(datest.Value) & "',103) and ngay <= convert(datetime,'" & CDate(dateen.Value) & "',103) and Users ='" & Session("TenDangNhap").ToString & "' )", con)
                '        con.Open()
                '        cmd.ExecuteNonQuery()
                '        con.Close()
                '    End Using
                'Catch ex As Exception
                '    con.Close()
                'End Try
                Dim num As Integer
                If chek.Checked = True Then
                    Using sqlBulkCopynv As New SqlBulkCopy(con)
                        'Try
                        '    'strSelect = "INSERT INTO  [tbllog] ([Manpp],[DateSend],[Dateupdate],[datemax],[users]) VALUES ('" & ASPxTextBox1.Text & "' , getdate() , getdate(), convert(datetime,'" & CDate(dateen.Value) & "',102) ,'" & Session("TenDangNhap").ToString & "' )"

                        '    Using cmd As New SqlCommand("IF OBJECT_ID('tempdb..#" & Session("TenDangNhap").ToString & "') IS NOT NULL  DROP TABLE  " & Session("TenDangNhap").ToString & ";  CREATE TABLE #" & Session("TenDangNhap").ToString & "(	[Id] [int] IDENTITY(1,1) NOT NULL,	[manpp] [nvarchar](20) NULL,	[maxk] [nvarchar](10) NULL,	[mact] [nvarchar](20) NULL,	[Mact_KT] [nvarchar](20) NULL,	[ngay] [smalldatetime] NULL,	[masp] [nvarchar](16) NULL,	[soluong] [float] NULL,	[price] [float] NULL,	[thanhtien] [float] NULL,	[LYdo] [nvarchar](100) NULL,	[Users] [nvarchar](100) NULL,	[dates] [datetime] NULL )", con)
                        '        con.Open()
                        '        cmd.ExecuteNonQuery()
                        '        con.Close()
                        '    End Using
                        'Catch ex As Exception
                        '    con.Close()
                        'End Try
                        Dim cmd As New SqlCommand("IF OBJECT_ID('tempdb..#" & Session("TenDangNhap").ToString & "') IS NOT NULL  DROP TABLE  " & Session("TenDangNhap").ToString & ";  CREATE TABLE #" & Session("TenDangNhap").ToString & "(	[Id] [int] IDENTITY(1,1) NOT NULL,	[manpp] [nvarchar](20) NULL,	[maxk] [nvarchar](10) NULL,	[mact] [nvarchar](20) NULL,	[Mact_KT] [nvarchar](20) NULL,	[ngay] [smalldatetime] NULL,	[masp] [nvarchar](16) NULL,	[soluong] [float] NULL,	[price] [float] NULL,	[thanhtien] [float] NULL,	[LYdo] [nvarchar](100) NULL,	[Users] [nvarchar](100) NULL,	[dates] [datetime] NULL )", con)

                        con.Open()
                        cmd.ExecuteNonQuery()
                        's = " delete   from tbCliam_TT where ngay >=  " & CDate(datest.Value) & " and ngay <=  " & CDate(dateen.Value) & " and Users ='" & Session("TenDangNhap").ToString & "' ; "
                        'Dim cmd11 As New SqlCommand(s, con)

                        'cmd11.ExecuteNonQuery()



                        'Set the database table name
                        sqlBulkCopynv.DestinationTableName = "#" & Session("TenDangNhap").ToString
                        'sqlBulkCopynv.ColumnMappings.Add("ID", "ID")
                        '[OPTIONAL]: Map the Excel columns with that of the database table

                        sqlBulkCopynv.ColumnMappings.Add("MaNPP", "manpp")
                        sqlBulkCopynv.ColumnMappings.Add("Ngay", "ngay")
                        sqlBulkCopynv.ColumnMappings.Add("maxk", "maxk")
                        sqlBulkCopynv.ColumnMappings.Add("mact", "mact")
                        'sqlBulkCopynv.ColumnMappings.Add("Mact_KT", "Mact_KT")
                        sqlBulkCopynv.ColumnMappings.Add("MaSP", "masp")
                        sqlBulkCopynv.ColumnMappings.Add("soluong", "soluong")
                        sqlBulkCopynv.ColumnMappings.Add("price", "price")
                        sqlBulkCopynv.ColumnMappings.Add("thanhtien", "thanhtien")
                        sqlBulkCopynv.ColumnMappings.Add("Lydo", "LYdo")
                        sqlBulkCopynv.ColumnMappings.Add("Users", "Users")
                        'con.Open()
                        sqlBulkCopynv.BulkCopyTimeout = 333
                        sqlBulkCopynv.WriteToServer(dt)
                        'con.Close()


                        'Session("Updalod") = Nothing
                        'GrilXK.DataSource = Session("Updalod")
                        'GrilXK.DataBind()
                        '        GrilXK.DataBind()


                        'Try
                        'strSelect = "INSERT INTO  [tbllog] ([Manpp],[DateSend],[Dateupdate],[datemax],[users]) VALUES ('" & ASPxTextBox1.Text & "' , getdate() , getdate(), convert(datetime,'" & CDate(dateen.Value) & "',102) ,'" & Session("TenDangNhap").ToString & "' )"

                        s = "INSERT INTO [dbo].[tbCliam_TT] ([manpp],[maxk],[mact],[Mact_KT],[ngay],[masp],[soluong],[price],[thanhtien],[LYdo],[Users],[dates],[Priceinv],[Amountinv]) " & _
        " SELECT        cl.manpp, cl.maxk, cl.mact, cl.Mact_KT, cl.ngay,cl.masp,  cl.soluong, it.Price, it.Price * cl.soluong  as  thanhtien, cl.LYdo, cl.Users, getdate() as dates,round(it.Price * 0.87227,0) as Priceinv, round(it.Price * 0.87227,0) *cl.soluong as Amountinv " & _
        " FROM            #" & Session("TenDangNhap").ToString & " AS cl INNER JOIN   dbo.tbItems AS it ON cl.masp = it.Itemcode where cl.soluong<>0"
                        Dim cmd1 As New SqlCommand(s, con)

                        cmd1.ExecuteNonQuery()



                        con.Close()
                    End Using


                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirectMe", "alert('Đã updload thành công kết quả claim');", True)

                Else
                    num = xoatbale("ALL", CDate(datest.Value), CDate(dateen.Value), Session("TenDangNhap"))
                    If num = 2 Then
                        Using sqlBulkCopynv As New SqlBulkCopy(con)
                            'Try
                            '    'strSelect = "INSERT INTO  [tbllog] ([Manpp],[DateSend],[Dateupdate],[datemax],[users]) VALUES ('" & ASPxTextBox1.Text & "' , getdate() , getdate(), convert(datetime,'" & CDate(dateen.Value) & "',102) ,'" & Session("TenDangNhap").ToString & "' )"

                            '    Using cmd As New SqlCommand("IF OBJECT_ID('tempdb..#" & Session("TenDangNhap").ToString & "') IS NOT NULL  DROP TABLE  " & Session("TenDangNhap").ToString & ";  CREATE TABLE #" & Session("TenDangNhap").ToString & "(	[Id] [int] IDENTITY(1,1) NOT NULL,	[manpp] [nvarchar](20) NULL,	[maxk] [nvarchar](10) NULL,	[mact] [nvarchar](20) NULL,	[Mact_KT] [nvarchar](20) NULL,	[ngay] [smalldatetime] NULL,	[masp] [nvarchar](16) NULL,	[soluong] [float] NULL,	[price] [float] NULL,	[thanhtien] [float] NULL,	[LYdo] [nvarchar](100) NULL,	[Users] [nvarchar](100) NULL,	[dates] [datetime] NULL )", con)
                            '        con.Open()
                            '        cmd.ExecuteNonQuery()
                            '        con.Close()
                            '    End Using
                            'Catch ex As Exception
                            '    con.Close()
                            'End Try
                            Dim cmd As New SqlCommand("IF OBJECT_ID('tempdb..#" & Session("TenDangNhap").ToString & "') IS NOT NULL  DROP TABLE  " & Session("TenDangNhap").ToString & ";  CREATE TABLE #" & Session("TenDangNhap").ToString & "(	[Id] [int] IDENTITY(1,1) NOT NULL,	[manpp] [nvarchar](20) NULL,	[maxk] [nvarchar](10) NULL,	[mact] [nvarchar](20) NULL,	[Mact_KT] [nvarchar](20) NULL,	[ngay] [smalldatetime] NULL,	[masp] [nvarchar](16) NULL,	[soluong] [float] NULL,	[price] [float] NULL,	[thanhtien] [float] NULL,	[LYdo] [nvarchar](100) NULL,	[Users] [nvarchar](100) NULL,	[dates] [datetime] NULL )", con)

                            con.Open()
                            cmd.ExecuteNonQuery()
                            's = " delete   from tbCliam_TT where ngay >=  " & CDate(datest.Value) & " and ngay <=  " & CDate(dateen.Value) & " and Users ='" & Session("TenDangNhap").ToString & "' ; "
                            'Dim cmd11 As New SqlCommand(s, con)

                            'cmd11.ExecuteNonQuery()



                            'Set the database table name
                            sqlBulkCopynv.DestinationTableName = "#" & Session("TenDangNhap").ToString
                            'sqlBulkCopynv.ColumnMappings.Add("ID", "ID")
                            '[OPTIONAL]: Map the Excel columns with that of the database table

                            sqlBulkCopynv.ColumnMappings.Add("MaNPP", "manpp")
                            sqlBulkCopynv.ColumnMappings.Add("Ngay", "ngay")
                            sqlBulkCopynv.ColumnMappings.Add("maxk", "maxk")
                            sqlBulkCopynv.ColumnMappings.Add("mact", "mact")
                            'sqlBulkCopynv.ColumnMappings.Add("Mact_KT", "Mact_KT")
                            sqlBulkCopynv.ColumnMappings.Add("MaSP", "masp")
                            sqlBulkCopynv.ColumnMappings.Add("soluong", "soluong")
                            sqlBulkCopynv.ColumnMappings.Add("price", "price")
                            sqlBulkCopynv.ColumnMappings.Add("thanhtien", "thanhtien")
                            sqlBulkCopynv.ColumnMappings.Add("Lydo", "LYdo")
                            sqlBulkCopynv.ColumnMappings.Add("Users", "Users")
                            'con.Open()
                            sqlBulkCopynv.BulkCopyTimeout = 333
                            sqlBulkCopynv.WriteToServer(dt)
                            'con.Close()


                            'Session("Updalod") = Nothing
                            'GrilXK.DataSource = Session("Updalod")
                            'GrilXK.DataBind()
                            '        GrilXK.DataBind()


                            'Try
                            'strSelect = "INSERT INTO  [tbllog] ([Manpp],[DateSend],[Dateupdate],[datemax],[users]) VALUES ('" & ASPxTextBox1.Text & "' , getdate() , getdate(), convert(datetime,'" & CDate(dateen.Value) & "',102) ,'" & Session("TenDangNhap").ToString & "' )"

                            s = "INSERT INTO [dbo].[tbCliam_TT] ([manpp],[maxk],[mact],[Mact_KT],[ngay],[masp],[soluong],[price],[thanhtien],[LYdo],[Users],[dates],[Priceinv],[Amountinv]) " & _
            " SELECT        cl.manpp, cl.maxk, cl.mact, cl.Mact_KT, cl.ngay,cl.masp,  cl.soluong, it.Price, it.Price * cl.soluong  as  thanhtien, cl.LYdo, cl.Users, getdate() as dates,round(it.Price * 0.87227,0) as Priceinv, round(it.Price * 0.87227,0) *cl.soluong as Amountinv " & _
            " FROM            #" & Session("TenDangNhap").ToString & " AS cl INNER JOIN   dbo.tbItems AS it ON cl.masp = it.Itemcode where cl.soluong<>0"
                            Dim cmd1 As New SqlCommand(s, con)

                            cmd1.ExecuteNonQuery()



                            con.Close()
                        End Using


                        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirectMe", "alert('Đã updload thành công kết quả claim');", True)

                        'Response.Redirect(If(Request.QueryString("ReturnUrl"), "~/System/thongbaos.aspx"))
                    Else

                        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirectMe", "alert('Có lỗi xẩy ra');", True)
                        'ClientScript.RegisterStartupScript([GetType](), "alert", (Convert.ToString("alert('") & message) + "');", True)

                    End If

                End If
               

            End Using

            Session("Updalod") = Nothing
            GrilXK.DataSource = Session("Updalod")
            GrilXK.DataBind()
            GrilXK.DataBind()
        End If

        'Dim num As Integer
        'Dim dtb As DataTable = Storedieuchinh(ASPxComboBox1.Value, ASPxDateEdit2.Value, txtngayupdate.Value, Session("TenDangNhap").ToString)
        'num = Integer.Parse("0" + dtb.Rows(0)(0))
        'GrilXK.DataBind()
        'GrilXK.Selection.UnselectAll()
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

    Protected Sub GrilXK_RowDeleting(sender As Object, e As DevExpress.Web.Data.ASPxDataDeletingEventArgs)
        Dim kt As Boolean = False
        dt = DirectCast(Session("Updalod"), DataTable)
        If dt.Rows.Count <> 0 Then
            Try
                'Check xem gio hang co hang hay chua
                For Each dr As DataRow In dt.Rows
                    'vong lap lay tat ca cac rong trong bang
                    If dr(0).ToString() = e.Values("ID").ToString Then

                        dt.Rows.Remove(dr)
                        kt = True

                    End If
                Next

            Catch
            End Try
        End If
        'e.Cancel = True
        'ggiohang.CancelEdit()
        'ggiohang.DataSource = dt
        'ggiohang.DataBind()
        If kt = False Then


            GrilXK.DataBind()
        End If
        e.Cancel = True
        GrilXK.CancelEdit()
        GrilXK.DataSource = dt
        GrilXK.DataBind()
    End Sub

   

    Protected Sub GrilXK_RowUpdating(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
        dt = DirectCast(Session("Updalod"), DataTable)

        If dt.Rows.Count <> 0 Then
            'Check xem gio hang co hang hay chua
            For Each dr As DataRow In dt.Rows
                'vong lap lay tat ca cac rong trong bang
                If dr(0).ToString() = e.NewValues("ID").ToString Then
                    'kiem tra neu san pham vua chon xem co trung voi san pham trong gio hang hay khong
                    dr(7) = e.NewValues("soluong")
                    'neu ma trung thi so luong se copng them 1
                    dr(9) = Convert.ToInt32(e.NewValues("soluong")) * Convert.ToInt32(e.NewValues("price"))
                    'cap nhat lai row thanh tien
                    'gan cho bien kt==true

                End If
            Next
        End If
        e.Cancel = True
        GrilXK.CancelEdit()
        GrilXK.DataSource = dt
        GrilXK.DataBind()
    End Sub

   
     
End Class