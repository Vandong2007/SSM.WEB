'Imports Microsoft.VisualBasic
Imports System
Imports System.Web.UI
'Imports DevExpress.Web.ASPxClasses

Imports DevExpress.Data
Imports DevExpress.Web.ASPxGridView
Imports System.IO
Imports Ionic.Zip
Imports System.Data.SqlClient


Partial Public Class dulieugoc
    Inherits AdminPage
    Dim oj As New SSMDATA
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If datest.Value = Nothing Then
            datest.Value = ngaybt
        End If
        If dateen.Value = Nothing Then
            dateen.Date = ngaykt
        End If
        If Session("TenDangNhap") Is Nothing Then
        Else
            Try

                pb = oj.Getpb(Session("TenDangNhap").ToString())
                xem = oj.Getquen(Session("TenDangNhap").ToString())
                sua = oj.Getsua(Session("TenDangNhap").ToString())
            Catch ex As Exception

            End Try

        End If
        export.Visible = sua

        'If radioButtonList.SelectedIndex = 0 Then
        '    Session("Item") = "_ALL"
        '    'blindata()
        'ElseIf radioButtonList.SelectedIndex = 1 Then
        '    Session("Item") = "O"
        '    'blindata()
        'End If
    End Sub

    'Protected Sub btnXlsxExport_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnXlsxExport.Click
    '    ASPxGridViewExporter1.WriteXlsxToResponse()


    'End Sub
    'Private Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
    '    e.Command.CommandTimeout = 333
    'End Sub
    Private Sub ASPxGridView1_AutoFilterCellEditorInitialize(sender As Object, e As DevExpress.Web.ASPxGridView.ASPxGridViewEditorEventArgs) Handles ASPxGridView1.AutoFilterCellEditorInitialize
        e.Column.Width = 100
        If e.Column.FieldName = "TenNPP" Or e.Column.FieldName = "TenSP" Or e.Column.FieldName = "TenCT" Then

            e.Column.Width = 350

        End If
    End Sub



    Protected Sub ASPxGridView1_CustomUnboundColumnData(ByVal sender As Object, ByVal e As ASPxGridViewColumnDataEventArgs)
        If e.Column.FieldName <> "Thanhtien" Then
            Return
        End If
        Dim price As Decimal = CDec(e.GetListSourceFieldValue("Dongia"))
        Dim quantity As Integer = Convert.ToInt32(e.GetListSourceFieldValue("SLHB"))
        e.Value = price * quantity
    End Sub
    Protected Sub ASPxGridView1_CustomSummaryCalculate(ByVal sender As Object, ByVal e As CustomSummaryEventArgs)
        If Object.Equals(e.Item, ASPxGridView1.TotalSummary("Region")) Then
            e.TotalValue = ASPxGridView1.Selection.Count
            e.TotalValueReady = True
        End If
        If Object.Equals(e.Item, ASPxGridView1.TotalSummary("Thanhtien")) Then
            If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
                e.TotalValue = 0
            End If
            If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then
                Dim keyValue As Object = e.GetValue("Region")
                If ASPxGridView1.Selection.IsRowSelectedByKey(keyValue) Then
                    e.TotalValue = Convert.ToDecimal(e.TotalValue) + Convert.ToDecimal(e.FieldValue)
                End If
            End If
        End If
    End Sub
    Private Function StoreToDataTable(file As String, re As String, TuNgay As DateTime, DenNgay As DateTime, urname As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@file", SqlDbType.NVarChar), New SqlParameter("@re", SqlDbType.NVarChar), New SqlParameter("@TuNgay", SqlDbType.DateTime), New SqlParameter("@DenNgay", SqlDbType.DateTime), New SqlParameter("@Username", SqlDbType.NVarChar)}
        arrParam(0).Value = file
        arrParam(1).Value = re
        arrParam(2).Value = TuNgay
        arrParam(3).Value = DenNgay
        arrParam(4).Value = urname
        Return oj.ThucThiStore_DataSets("WEBEXPORTmdb", arrParam).Tables(0)
    End Function
    Private Function Storemdb(file As String, re As String, TuNgay As DateTime, DenNgay As DateTime, urname As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@file", SqlDbType.NVarChar), New SqlParameter("@re", SqlDbType.NVarChar), New SqlParameter("@TuNgay", SqlDbType.DateTime), New SqlParameter("@DenNgay", SqlDbType.DateTime), New SqlParameter("@Username", SqlDbType.NVarChar)}
        arrParam(0).Value = file
        arrParam(1).Value = re
        arrParam(2).Value = TuNgay
        arrParam(3).Value = DenNgay
        arrParam(4).Value = urname
        Return oj.ThucThiStore_DataSets("WEBEXPORT", arrParam).Tables(0)
    End Function
    Protected Sub export_Click(sender As Object, e As EventArgs) Handles export.Click
        Dim filesToInclude As New System.Collections.Generic.List(Of String)()
        If (IsPostBack) Then
            Dim num As Integer
            'Request.PhysicalApplicationPath 
            Dim s As String = Request.PhysicalApplicationPath + "Excel\" + [String].Format("DataEverest_{0}.mdb", Session("Tendangnhap").ToString)
            Dim s1 As String = Request.PhysicalApplicationPath + "Excel\Getdata.mdb"

            Try
                If File.Exists(s) = True Then
                    File.Delete(s)
                End If
                File.Copy(s1, s, True)
                '        'Label1.Text = "File copied"

                Dim dtb As DataTable = StoreToDataTable(s, ASPxComboBox1.Text, CDate(datest.Value), CDate(dateen.Value), Session("TenDangNhap").ToString())
                num = Integer.Parse("0" + dtb.Rows(0)(0))
                'num = oj.Getclaim(s, ASPxComboBox1.Text, CDate(datest.Value).ToString(), CDate(dateen.Value).ToString())
                'If num = 2 Then
                'Response.ContentType = "APPLICATION/OCTET-STREAM"
                'Dim Header As [String] = "Attachment; Filename= " + [String].Format("DoanhsoFull_{0}.mdb", Session("Tendangnhap").ToString)
                'Response.AppendHeader("Content-Disposition", Header)
                '' Dim Dfile As New System.IO.FileInfo(Server.MapPath("Excel\test" + Session("Tendangnhap").ToString + ".xlsx"))
                'Dim Dfile As New System.IO.FileInfo(s)
                'Response.WriteFile(Dfile.FullName)
                ''Don't forget to add the following line
                'Response.[End]()


                Using zip As New ZipFile()
                    filesToInclude.Add(s)
                    'zip.Password = "123"
                    'zip.Encryption = EncryptionAlgorithm.WinZipAes256
                    Dim filename As String = Path.GetFileName(s)

                    Dim filenameWitoutextension As String = Path.GetFileNameWithoutExtension(s)
                    Dim destdir As String = Request.PhysicalApplicationPath + "Excel\" + filenameWitoutextension + ".Zip"
                    'zip.AddDirectory(Request.PhysicalApplicationPath + "Excel\")
                    If File.Exists(destdir) = True Then
                        File.Delete(destdir)
                    End If
                    zip.AddFiles(filesToInclude, "Everest")
                    zip.Save(destdir)
                    'Dim files As String() = System.IO.Directory.GetFiles(Server.MapPath("~/Excel//"))
                    'For Each f As String In files
                    '    System.IO.File.Delete(f)
                    'Next
                    pnlUploadMessage.Visible = True
                    lnkDownloadYourFile.NavigateUrl = "~/Excel/" & Path.GetFileName(destdir)
                    lnkDownloadYourFile.Text = String.Format("Download " & Path.GetFileName(destdir))

                    'Response.Clear()
                    'Response.ContentType = "application/octet-stream"
                    'Response.AppendHeader("content-disposition", "attachment; filename=" + Path.GetFileName(destdir))
                    'Response.TransmitFile(destdir)

                    'Response.[End]()

                End Using



                'filesToInclude.Add(s)
                'If (filesToInclude.Count = 0) Then
                '    'ErrorMessage.InnerHtml = ErrorMessage.InnerHtml & "You did not select any files?<br/>\n"
                'Else
                '    Response.Clear()
                '    Response.BufferOutput = False

                '    Dim enc As Ionic.Zip.EncryptionAlgorithm = Ionic.Zip.EncryptionAlgorithm.None


                '    Dim c As System.Web.HttpContext = System.Web.HttpContext.Current

                '    Dim archiveName As String = String.Format("archive-{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"))
                '    Response.ContentType = "application/zip"
                '    Response.AddHeader("Content-Disposition", "inline; filename=" & Chr(34) & archiveName & Chr(34))


                '    Dim tempfile As String = "c:\temp\" & archiveName
                '    Using zip As New ZipFile()
                '        ' the Readme.txt file will not be password-protected.


                '        ' filesToInclude is a string[] or List<String>
                '        zip.AddFiles(filesToInclude, "files")

                '        ' save the zip to a filesystem file
                '        zip.Save(tempfile)
                '    End Using

                '    ' open and read the file, and copy it to Response.OutputStream
                '    Using fs As System.IO.FileStream = System.IO.File.OpenRead("c:\temp\" & archiveName)
                '        Dim b(1024) As Byte
                '        Dim n As New Int32
                '        n = -1
                '        While (n <> 0)
                '            n = fs.Read(b, 0, b.Length)
                '            If (n <> 0) Then
                '                Response.OutputStream.Write(b, 0, n)
                '            End If
                '        End While
                '    End Using
                '    Response.Close()
                '    System.IO.File.Delete(tempfile)

                'End If


                'Response.Clear()
                'Response.BufferOutput = False

                'Dim enc As Ionic.Zip.EncryptionAlgorithm = Ionic.Zip.EncryptionAlgorithm.None


                'Dim c As System.Web.HttpContext = System.Web.HttpContext.Current

                'Dim archiveName As String = String.Format("Tonkho-{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"))
                'Response.ContentType = "application/zip"
                'Response.AddHeader("Content-Disposition", "inline; filename=" & Chr(34) & archiveName & Chr(34))
                'filesToInclude.Add(s)
                'Using zip As New ZipFile()
                '    ' the Readme.txt file will not be password-protected.


                '    ' filesToInclude is a string[] or List<String>
                '    zip.AddFiles(filesToInclude, "files")

                '    zip.Save(Response.OutputStream)
                'End Using
                'Response.WriteFile(Dfile.FullName)
                'Response.[End]()
                'Response.Close()
                'End If
            Catch ex As Exception
                '        'Label1.Text = "an error occured!<br/>" & ex.ToString()

                ' 
            End Try
        End If

        'oj.TheDownload(s)
    End Sub

    Protected Sub btnXlsxExport_Click(sender As Object, e As EventArgs) Handles btnXlsxExport.Click
        ASPxGridViewExporter1.WriteXlsxToResponse()

    End Sub

    'Protected Sub Btok_Click(sender As Object, e As EventArgs) Handles Btok.Click
    '    ASPxGridView1.Caption = GridLookup.Text
    'End Sub

    Protected Sub ASPxButton2_Click(sender As Object, e As EventArgs) Handles ASPxButton2.Click
        'Dim builder As New StringBuilder()

        'builder.Append("<script language=JavaScript> ShowCreateAccountWindow(); </script>" & vbLf)
        'Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())
        Session("Item") = "O"
        EBrand.Text = "ALL"
        ENhan.Text = "ALL"
        ASPmui.Text = "ALL"
        ASPxSize.Text = "ALL"
        ASPxloai.Text = "ALL"
        ASPxItem.Text = "ALL"
        Dim builder As New StringBuilder()

        builder.Append("<script language=JavaScript> ShowCreateAccountWindow(); </script>" & vbLf)
        Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())
    End Sub

    Protected Sub btCreate_Click(sender As Object, e As EventArgs) Handles btCreate.Click
        'blindata()
        Session("Item") = "O"
        Session("Brand") = EBrand.Text
        Session("Nhan") = ENhan.Text
        Session("Mui") = ASPmui.Text
        Session("size") = ASPxSize.Text
        Session("loai") = ASPxloai.Text
        Session("Masp") = ASPxItem.Text
        SqlDataSource1.DataBind()
    End Sub
    Sub blindata()
        Dim oj As New SSMDATA


        If Session("TenDangNhap") IsNot Nothing Then
            ASPxGridView1.DataSource = layso(ASPxComboBox1.Text, EBrand.Text, ENhan.Text, ASPmui.Text, ASPxSize.Text, ASPxItem.Text, ASPxloai.Text, Session("Item").ToString, CDate(datest.Text), CDate(dateen.Text), Session("TenDangNhap").ToString())
            ASPxGridView1.DataBind()
        End If
    End Sub
    Private Function layso(re As String, Bran As String, Nhan As String, mui As String, size As String, Masp As String, loai As String, Item As String, TuNgay As DateTime, DenNgay As DateTime, urname As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@re", SqlDbType.NVarChar), New SqlParameter("@Brand", SqlDbType.NVarChar), New SqlParameter("@Nhan", SqlDbType.NVarChar), New SqlParameter("@mui", SqlDbType.NVarChar), New SqlParameter("@size", SqlDbType.NVarChar), New SqlParameter("@Masp", SqlDbType.NVarChar), New SqlParameter("@loai", SqlDbType.NVarChar), New SqlParameter("@Item", SqlDbType.NVarChar), New SqlParameter("@TuNgay", SqlDbType.DateTime), New SqlParameter("@DenNgay", SqlDbType.DateTime), New SqlParameter("@Username", SqlDbType.NVarChar)}


        arrParam(0).Value = re
        arrParam(1).Value = Bran
        arrParam(2).Value = Nhan
        arrParam(3).Value = mui
        arrParam(4).Value = size
        arrParam(5).Value = Masp
        arrParam(6).Value = loai
        arrParam(7).Value = Item
        arrParam(8).Value = TuNgay
        arrParam(9).Value = DenNgay
        arrParam(10).Value = urname

        Return oj.ThucThiStore_DataSets("WebGetRGDraft2", arrParam).Tables(0)
    End Function
    'Protected Sub radioButtonList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles radioButtonList.SelectedIndexChanged
    '    If radioButtonList.SelectedIndex = 0 Then
    '        Session("Item") = "_ALL"
    '    ElseIf radioButtonList.SelectedIndex = 1 Then
    '        Session("Item") = "O"
    '    End If
    '    If radioButtonList.SelectedIndex = 1 Then
    '        Session("Item") = "O"
    '        EBrand.Text = "ALL"
    '        ENhan.Text = "ALL"
    '        ASPmui.Text = "ALL"
    '        ASPxSize.Text = "ALL"
    '        ASPxloai.Text = "ALL"
    '        ASPxItem.Text = "ALL"
    '        Dim builder As New StringBuilder()

    '        builder.Append("<script language=JavaScript> ShowCreateAccountWindow(); </script>" & vbLf)
    '        Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())
    '    End If
    'End Sub

    Protected Sub Btok_Click(sender As Object, e As EventArgs) Handles Btok.Click
        'blindata()
        Session("Item") = "_ALL"
        Session("Brand") = "ALL"
        Session("Nhan") = "ALL"
        Session("Mui") = "ALL"
        Session("size") = "ALL"
        Session("loai") = "ALL"
        Session("Masp") = "ALL"
        SqlDataSource1.DataBind()
    End Sub

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        e.Command.CommandTimeout = 555
    End Sub

    Protected Sub EBrand_TextChanged(sender As Object, e As EventArgs) Handles EBrand.TextChanged
        SqlNhan.DataBind()
        Sqlmui.DataBind()
        Sqlsize.DataBind()

        SqlItem.DataBind()
    End Sub

    Protected Sub ENhan_TextChanged(sender As Object, e As EventArgs) Handles ENhan.TextChanged
        Sqlmui.DataBind()
        Sqlsize.DataBind()
        SqlItem.DataBind()

    End Sub

    Private Sub ASPmui_TextChanged(sender As Object, e As EventArgs) Handles ASPmui.TextChanged

        Sqlsize.DataBind()
        SqlItem.DataBind()
    End Sub

    Private Sub ASPxloai_TextChanged(sender As Object, e As EventArgs) Handles ASPxloai.TextChanged
       
        SqlItem.DataBind()
    End Sub

    Private Sub ASPxSize_TextChanged(sender As Object, e As EventArgs) Handles ASPxSize.TextChanged
        Sqlmui.DataBind()

        SqlItem.DataBind()
    End Sub
End Class