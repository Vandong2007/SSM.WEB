Imports System.Data.OleDb
Imports System.IO
Imports System.Data.SqlClient

Public Class import_CTKM
    Inherits AdminPage
    Dim oj As New SSMDATA
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Session("dd") Is Nothing Then
        Else
            GrilXK.DataSource = Session("dd")
            GrilXK.DataBind()
        End If

    End Sub

    Protected Sub ASPxButton2_Click(sender As Object, e As EventArgs) Handles ASPxButton2.Click
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
           

        End Select
        connString = String.Format(connString, FilePath)
        Using excel_con As New OleDbConnection(connString)
            excel_con.Open()
            Dim sheet1 As String = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing).Rows(0)("TABLE_NAME").ToString()
            Dim dtExcelData As New DataTable()

            '[OPTIONAL]: It is recommended as otherwise the data will be considered as String by default.
            'dtExcelData.Columns.AddRange(New DataColumn(2) {New DataColumn("Id", GetType(Integer)), _
            '                                                New DataColumn("Name", GetType(String)), _
            '                                                New DataColumn("Salary", GetType(Decimal))})
            dtExcelData.Columns.AddRange(New DataColumn(8) {
                New DataColumn("MaCT", GetType(String)), _
            New DataColumn("TenCT", GetType(String)), _
            New DataColumn("NhanSP", GetType(String)), _
            New DataColumn("LoaiCT", GetType(String)), _
                 New DataColumn("TyleCK", GetType(Double)), _
             New DataColumn("Ngaybd", GetType(DateTime)), _
             New DataColumn("Ngaykt", GetType(DateTime)), _
              New DataColumn("Type", GetType(String)), _
           New DataColumn("khongapdung", GetType(String))
            })

            Using oda As New OleDbDataAdapter("SELECT MaCT ,TenCT ,NhanSP,LoaiCT,TyleCK,Ngaybd ,Ngaykt,Type,khongapdung FROM  [" & sheet1 & "]", excel_con)
                oda.Fill(dtExcelData)
            End Using


            'GrDic.Caption = Path.GetFileName(FilePath)
            'GrDic.DataSource = dtExcelData

            'GrDic.DataBind()
            Session("dd") = dtExcelData
            GrilXK.DataSource = Session("dd")
            GrilXK.DataBind()

            excel_con.Close()
        End Using
        'ASPxGridView1.GetTotalSummaryValue()
        'Dim gsiValue As Date = Convert.ToDateTime(ASPxGridView1.GetGroupSummaryValue(0, ASPxGridView1.GroupSummary("Ngay", DevExpress.Data.SummaryItemType.Max)))

    End Sub

    Protected Sub Bt_dieuChinh_Click(sender As Object, e As EventArgs) Handles Bt_dieuChinh.Click

        If Session("dd") Is Nothing Then
        Else
            Dim db As DataTable = TryCast(Session("dd"), DataTable)

            If db.Rows.Count > 0 Then
                For Each DBd As DataRow In db.Rows

                    Dim num As Integer
                    Try
                        'Getctkmid' NgayBD = CDate(dtset.Tables(0).Rows(0)("DateFrom"))
                        Dim dtb As DataTable = luu(DBd("MaCT").ToString, DBd("TenCT").ToString, DBd("NhanSP").ToString, DBd("LoaiCT").ToString, IIf(DBd("TyleCK") Is Nothing Or DBd("TyleCK") Is System.DBNull.Value, 0, Convert.ToDouble(DBd("TyleCK"))), (DBd("Ngaybd")), (DBd("Ngaykt")), DBd("Type"), 0, Session("TenDangNhap"), DBd("khongapdung").ToString)
                        num = Integer.Parse("0" + dtb.Rows(0)(0))
                    Catch ex As Exception
                    End Try

                Next
            End If
        End If
        
        Session("dd") = Nothing
        Response.Redirect("~/SYSTEM/CTKM3.aspx")

    End Sub



    Private Function luu(MaCT As String, tenct As String, nhan As String, loaict As String, tyle As Double, TuNgay As Date, DenNgay As Date, type As String, ns As Double, User As String, kad As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@Mact", SqlDbType.NVarChar), New SqlParameter("@TenCT", SqlDbType.NVarChar), New SqlParameter("@NhanSP", SqlDbType.NVarChar), New SqlParameter("@LoaiCT", SqlDbType.NVarChar), New SqlParameter("@TyleCK", SqlDbType.Real), New SqlParameter("@ngaybd", SqlDbType.SmallDateTime), New SqlParameter("@ngaykt", SqlDbType.SmallDateTime), New SqlParameter("@type", SqlDbType.NVarChar), New SqlParameter("@Ngansach", SqlDbType.NVarChar), New SqlParameter("@Users", SqlDbType.NVarChar), New SqlParameter("@kad", SqlDbType.NVarChar)}
        arrParam(0).Value = MaCT
        arrParam(1).Value = tenct
        arrParam(2).Value = nhan
        arrParam(3).Value = loaict
        arrParam(4).Value = tyle
        arrParam(5).Value = TuNgay
        arrParam(6).Value = DenNgay
        arrParam(7).Value = type
        arrParam(8).Value = ns
        arrParam(9).Value = User
        arrParam(10).Value = kad

        Return oj.ThucThiStore_DataSets("new", arrParam).Tables(0)
    End Function

 

    Protected Sub GrilXK_RowUpdating(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs) Handles GrilXK.RowUpdating
        Dim dt1 As New DataTable()
        dt1 = DirectCast(Session("dd"), DataTable)
       
        If dt1.Rows.Count <> 0 Then
            'Check xem gio hang co hang hay chua
            For Each dr As DataRow In dt1.Rows
         
                 'vong lap lay tat ca cac rong trong bang
                If dr(0).ToString() = e.NewValues("MaCT").ToString Then
                    'kiem tra neu san pham vua chon xem co trung voi san pham trong gio hang hay khong
                    
                    dr("TenCT") = e.NewValues("TenCT").ToString
                    dr("NhanSP") = IIf(e.NewValues("NhanSP") Is Nothing Or e.NewValues("NhanSP") Is DBNull.Value, "", e.NewValues("NhanSP"))
                    dr("LoaiCT") = e.NewValues("LoaiCT").ToString
                    dr("TyleCK") = Convert.ToDouble(e.NewValues("TyleCK"))
                    dr("Ngaybd") = CDate(e.NewValues("Ngaybd"))
                    dr("Ngaykt") = CDate(e.NewValues("Ngaykt"))
                    dr("Type") = e.NewValues("Type").ToString
                    dr("khongapdung") = IIf(e.NewValues("khongapdung") Is Nothing Or e.NewValues("khongapdung") Is DBNull.Value, "", e.NewValues("khongapdung"))
                   
                    Exit For

                    

                End If
            Next
        End If
        e.Cancel = True

        Session("dd") = dt1
        GrilXK.CancelEdit()
        GrilXK.DataSource = dt1
        GrilXK.DataBind()
      
    End Sub

    Protected Sub GrilXK_RowDeleting(sender As Object, e As DevExpress.Web.Data.ASPxDataDeletingEventArgs) Handles GrilXK.RowDeleting
        Dim dt11 As New DataTable()
        dt11 = TryCast(GrilXK.DataSource, DataTable)
        Dim kt As Boolean = False
        If dt11.Rows.Count <> 0 Then
            'Check xem gio hang co hang hay chua
            For Each dr1 As DataRow In dt11.Rows

                'vong lap lay tat ca cac rong trong bang
                If dr1("MaCT") = e.Values("MaCT").ToString Then
                    dt11.Rows.Remove(dr1)
                    Exit For
                    kt = True
                End If
            Next
        End If
        If kt = True Then
            GrilXK.DataSource = dt11
            GrilXK.DataBind()


        End If
        e.Cancel = True

        Session("dd") = dt11
        GrilXK.DataSource = dt11
        GrilXK.DataBind()
        GrilXK.CancelEdit()
    End Sub
End Class