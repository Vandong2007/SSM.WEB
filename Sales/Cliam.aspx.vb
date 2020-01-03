Imports System.IO
Imports System.Data.SqlClient
Imports Ionic.Zip

Public Class Cliam
    Inherits AdminPage
    Dim oj As New SSMDATA

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If datest.Value = Nothing Then
            datest.Value = ngaybt
        End If
        If dateen.Value = Nothing Then
            dateen.Date = ngaykt
        End If
        'datest.Value = CDate(Date.Now)
        'blindata()

    End Sub
    Private Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        e.Command.CommandTimeout = 3333
    End Sub
    'Protected Sub Btok_Click(sender As Object, e As EventArgs) Handles Btok.Click
    '    blindata()

    'End Sub
    'Sub blindata()
    '    Dim oj As New SSMDATA


    '    If Session("TenDangNhap") IsNot Nothing Then
    '        ASPxPivotGrid1.DataSource = oj.SSM_GetDS(CDate(datest.Value), CDate(dateen.Value), Session("TenDangNhap").ToString())

    '    End If
    'End Sub
    Private Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Convert.ToString(Session("TenDangNhap")) = "" Then
            Response.Redirect("~/Account/Login.aspx")

        End If
    End Sub


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
            fileName = "Report.xlsx"
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
    Private Function Storemdb(file As String, re As String, TuNgay As DateTime, DenNgay As DateTime, urname As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@file", SqlDbType.NVarChar), New SqlParameter("@re", SqlDbType.NVarChar), New SqlParameter("@TuNgay", SqlDbType.DateTime), New SqlParameter("@DenNgay", SqlDbType.DateTime), New SqlParameter("@Username", SqlDbType.NVarChar)}
        arrParam(0).Value = file
        arrParam(1).Value = re
        arrParam(2).Value = TuNgay
        arrParam(3).Value = DenNgay
        arrParam(4).Value = urname
        Return oj.ThucThiStore_DataSets("WEBEXPORTClam", arrParam).Tables(0)
    End Function
    Protected Sub export1_Click(sender As Object, e As EventArgs)
        Dim filesToInclude As New System.Collections.Generic.List(Of String)()
        If (IsPostBack) Then
            Dim num As Integer
            'Request.PhysicalApplicationPath 
            Dim s As String = Request.PhysicalApplicationPath + "Excel\" + [String].Format("{0}_Cliam.mdb", Session("Tendangnhap").ToString)
            Dim s1 As String = Request.PhysicalApplicationPath + "Excel\Claim_temp.mdb"

            Try
                If File.Exists(s) = True Then
                    File.Delete(s)
                End If
                File.Copy(s1, s, True)
                '        'Label1.Text = "File copied"

                Dim dtb As DataTable = Storemdb(s, ASPxComboBox1.Text, CDate(datest.Value), CDate(dateen.Value), Session("TenDangNhap").ToString())
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
End Class