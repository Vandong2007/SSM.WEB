Imports DevExpress.Web.ASPxGridView
Imports Microsoft.VisualBasic
Imports System
Imports System.Web.UI
Imports System.IO
Imports System.Data.SqlClient

Imports Ionic.Zip
Imports System.Globalization

Public Class Tonkho
    Inherits AdminPage
    Dim oj As New SSMDATA
    Private con As New SqlConnection(ConfigurationManager.ConnectionStrings("SSMConnectionString").ConnectionString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If datest.Value = Nothing Then
            datest.Value = ngaybt
        End If
        If dateen.Value = Nothing Then
            dateen.Date = ngaykt
        End If
        Response.Cache.SetNoStore()
    End Sub

    Protected Overrides Sub OnPreInit(e As EventArgs)
        MyBase.OnPreInit(e)
        If Request.Browser.MSDomVersion.Major = 0 Then
            ' If it is Non IE Browser
            Response.Cache.SetNoStore()
        End If
    End Sub

    'Protected Sub Btok_Click(sender As Object, e As EventArgs) Handles Btok.Click
    '    'blindata()
    'End Sub

    Private Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        e.Command.CommandTimeout = 555
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
            ASPxPivotGridExporter1.OptionsPrint.PrintDataHeaders = DevExpress.Utils.DefaultBoolean.True
            ASPxPivotGridExporter1.OptionsPrint.PageSettings.Landscape = DevExpress.Utils.DefaultBoolean.True



            Dim contentType As String = "", fileName As String = ""

            contentType = "application/ms-excel"
            fileName = "Tonkho.xlsx"
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


    Protected Sub Btok_Click(sender As Object, e As EventArgs) Handles Btok.Click
        ASPxPivotGrid1.Caption = ASPxComboBox1.SelectedItem.GetValue("Debcode") + "-" + ASPxComboBox1.SelectedItem.GetValue("Debname") + "-" + ASPxComboBox1.SelectedItem.GetValue("Debadd")

    End Sub
    Protected Sub exportmdb_Click(sender As Object, e As EventArgs) Handles exportmdb.Click

        Dim filesToInclude As New System.Collections.Generic.List(Of String)()
        If (IsPostBack) Then
            Dim num As Integer
            'Request.PhysicalApplicationPath 
            Dim s As String = Request.PhysicalApplicationPath + "Excel\" + [String].Format("TonkhoEverest_{0}.mdb", Session("Tendangnhap").ToString)
            Dim s1 As String = Request.PhysicalApplicationPath + "Excel\Getdata.mdb"

            Try
                If File.Exists(s) = True Then
                    File.Delete(s)
                End If
                File.Copy(s1, s, True)
                '        'Label1.Text = "File copied"

                Dim dtb As DataTable = StoreToDataTable(s, CDate(datest.Value), CDate(dateen.Value), Session("TenDangNhap").ToString())
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

                   

                    Response.Clear()
                    Response.ContentType = "application/octet-stream"
                    Response.AppendHeader("content-disposition", "attachment; filename=" + Path.GetFileName(destdir))
                    Response.TransmitFile(destdir)

                    Response.[End]()

                End Using



                ' 
            Catch ex As Exception
                '        'Label1.Text = "an error occured!<br/>" & ex.ToString()

                ' 
            End Try
        End If

        'oj.TheDownload(s)
    End Sub
    Private Function StoreToDataTable(file As String, TuNgay As DateTime, DenNgay As DateTime, urname As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@file", SqlDbType.NVarChar), New SqlParameter("@TuNgay", SqlDbType.DateTime), New SqlParameter("@DenNgay", SqlDbType.DateTime), New SqlParameter("@Username", SqlDbType.NVarChar)}
        arrParam(0).Value = file
        arrParam(1).Value = TuNgay
        arrParam(2).Value = DenNgay
        arrParam(3).Value = urname
        Return oj.ThucThiStore_DataSets("WEBEXPORTmdb1", arrParam).Tables(0)
    End Function
    Private Function Storetonkho(TuNgay As DateTime, DenNgay As DateTime, MaNPP As String, urname As String) As DataSet
        Dim arrParam As SqlParameter() = {New SqlParameter("@TuNgay", SqlDbType.DateTime), New SqlParameter("@DenNgay", SqlDbType.DateTime), New SqlParameter("@MaNPP", SqlDbType.NVarChar), New SqlParameter("@Username", SqlDbType.NVarChar)}

        arrParam(0).Value = TuNgay
        arrParam(1).Value = DenNgay
        arrParam(2).Value = MaNPP
        arrParam(3).Value = urname
        Return oj.ThucThiStore_DataSets("WebGetNhapxuatTon", arrParam)
    End Function

    Protected Sub btgui_Click(sender As Object, e As EventArgs) Handles btgui.Click

        Dim filesToInclude As New System.Collections.Generic.List(Of String)()
      
        
        Dim ds As New DataSet()
        'da.Fill(ds, "Tbdathang_ct")
     
        'If ASPxComboBox1.SelectedItem.GetValue("Debcode") = "ALL" Then
        Dim a As New DataView
        a = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)

        Dim db As DataTable = a.ToTable(True, "MaNPP")
        If db.Rows.Count > 0 Then
            For Each DBd As DataRow In db.Rows
                Try
                    ds = Storetonkho(CDate(datest.Value), CDate(dateen.Value), DBd("MaNPP").ToString, Session("TenDangNhap").ToString())
                    If ds.Tables(0).Rows.Count < 0 Then
                        Return
                    End If
                    Dim fpath = String.Empty
                    If Directory.Exists(Server.MapPath("~/Excel/tonkho/" + Session("TenDangNhap").ToString() + "/")) = False Then
                        Directory.CreateDirectory(Server.MapPath("~/Excel/tonkho/" + Session("TenDangNhap").ToString() + "/"))
                    End If
                    fpath = Server.MapPath("~/Excel/tonkho/" + Session("TenDangNhap").ToString() + "/tonkho_" + DBd("MaNPP").ToString + ".xls")
                    If File.Exists(fpath) = False Then
                        File.Create(fpath).Close()
                    Else
                        File.Create(fpath).Close()
                    End If
                    If fpath.Trim() <> String.Empty Then
                        DataSetToExcel(ds, fpath, DBd("MaNPP").ToString, "", " ", " ", True, CDate(datest.Value), CDate(dateen.Value))
                        filesToInclude.Add(fpath)
                    End If
                Catch ex As Exception
                End Try
            Next

        End If
        If filesToInclude.Count > 0 Then

            Using zip As New ZipFile()
                'filesToInclude.Add(s)
                'zip.Password = "123"
                'zip.Encryption = EncryptionAlgorithm.WinZipAes256
                'Dim filename As String = Path.GetFileName(s)

                'Dim filenameWitoutextension As String = Path.GetFileNameWithoutExtension(s)
                Dim destdir As String = Request.PhysicalApplicationPath + "Excel\tonkho\" + Session("TenDangNhap").ToString() + "\tonkho_" + Session("TenDangNhap").ToString() + "_" + CDate(datest.Value).ToString("dd_MMM_yy") + "_" + CDate(dateen.Value).ToString("dd_MMM_yy") + ".Zip"
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
                lnkDownloadYourFile.NavigateUrl = "~/Excel/tonkho/" + Session("TenDangNhap").ToString() + "/" & Path.GetFileName(destdir)
                lnkDownloadYourFile.Text = String.Format("Download " & Path.GetFileName(destdir))

                'Response.Clear()
                'Response.ContentType = "application/octet-stream"
                'Response.AppendHeader("content-disposition", "attachment; filename=" + Path.GetFileName(destdir))
                'Response.TransmitFile(destdir)

                'Response.[End]()

            End Using
        End If
        'Response.Write("<script LANGUAGE='JavaScript' >alert('đã chuyển thành công " + item(0).ToString() + " ssang unzadata')</script>")

    End Sub


    Private Sub DataSetToExcel(dsExport As DataSet, path As String, tableName1 As String, tableName As String, add As String, region As String, d As Boolean, bd As Date, kt As Date)
        If path = String.Empty Then
            Return
        End If
        Dim builder As New StringBuilder
        builder.Append("Mọi thắc mắc về tồn kho, đề nghị đại lý thông tin về phòng AP&P Wipro Unza  <br/>")
        builder.Append("trong vòng 1 ngày từ khi nhận được thông báo tồn kho.  <br/>")

        ' Append a line break.
        builder.AppendLine()
        If Left(dsExport.Tables(0).Rows(0)("Region").ToString, 4) = "nort" Then
            builder.Append("Liên hệ AP&P Hà Nội Email:trang.tranthi@wipro-unza.com Phone:04-36625557/8/9-Fax 04-36625556(Ext: 104-105). <br/> Sau 1 ngày nếu không có thắc mắc gì chúng tôi sẽ chốt số liệu theo kết quả này.").AppendLine()
        Else
            builder.Append("Liên hệ AP&P VSIP Phone:0650-3743972/3/4 (Ext: 166-169-202). <br/> Sau 2 ngày nếu không có thắc mắc gì chúng tôi sẽ chốt số liệu theo kết quả này.").AppendLine()

        End If
        'Dim builder As New StringBuilder
        'builder.Append("Mọi thắc mắc về tồn kho , đề nghị đại lý thông tin về phòng AP&P Wipro Unza  <br/>")
        'builder.Append("Muộn nhất 1 ngày sau khi nhận được bản tồn kho này, Sau khoảng thời gian trên bên công tý sẻ lấy số liệu theo tồn kho này  <br/>")

        '' Append a line break.
        'builder.AppendLine()


        ' Append a string and then another line break.

        Dim sumdk, sumdkhb, sumdkkm, sumnhb, sumnkm, sumxhb, sumxkm, sumxdc, sumchb, sumckm, sumck As Decimal
        Dim SWriter As New StreamWriter(path)
        Dim str As String = String.Empty
        Dim str1 As String = String.Empty
        Dim colspan As Int32 = dsExport.Tables(0).Columns.Count - 6
        str += (Convert.ToString("<table ><tr><td align='left'   style='font-size:12px' colspan=3 >") & "CÔNG TY TNHH WIPRO-UNZA VIỆT NAM") + "</td></tr>"
        str += (Convert.ToString("<tr><td align='left'   style='font-size:11px' colspan=  3 >") & "Số 7, đường 4, KCN Việt Nam Singapore, Thuận An, Bình Dương") + "</td></tr>"
        str += (Convert.ToString("<tr><td align='center'   style='font-size:18px' colspan=" + Convert.ToString(colspan - 3) + ">")) + "BẢNG TỔNG HỢP NHẬP XUẤT TỒN" + " </td></tr>"
        str += (Convert.ToString("<tr><td align='center'   style='font-size:18px' colspan=" + Convert.ToString(colspan - 3) + "> <a>") & dsExport.Tables(0).Rows(0)("MaNPP").ToString & "-" & dsExport.Tables(0).Rows(0)("TenNPP").ToString & "-" & dsExport.Tables(0).Rows(0)("Region").ToString & "</a>  ") + "</td></tr>"
        str += (Convert.ToString("<tr></tr><tr><td align='center'   style='font-size:14px' colspan=" + Convert.ToString(colspan - 3) + ">")) + " Từ Ngày: " + bd + " Đến Ngày: " + kt + "</td></tr><tr></tr> <tr>"


        For Each DBCol As DataColumn In dsExport.Tables(0).Columns
            If DBCol.ColumnName = "Region" Or DBCol.ColumnName = "TonDKTU" Or DBCol.ColumnName = "NhapTU" Or DBCol.ColumnName = "XuatTU" Or DBCol.ColumnName = "TonCKTU" Or DBCol.ColumnName = "DVT" Or DBCol.ColumnName = "Area" Or DBCol.ColumnName = "MaNPP" Or DBCol.ColumnName = "TenNPP" Then
            Else
                If DBCol.ColumnName = "MaSP" Then
                    str1 = "Mã S.Phẩm"
                ElseIf DBCol.ColumnName = "TenSP" Then
                    str1 = "Tên Sản Phẩm"
                ElseIf DBCol.ColumnName = "NhanSP" Then
                    str1 = "Nhãn SP"
                ElseIf DBCol.ColumnName = "Gia" Then
                    str1 = "Giá"
                ElseIf DBCol.ColumnName = "TonDK" Then
                    str1 = "Tồn Đầu Kỳ"
                ElseIf DBCol.ColumnName = "TonDKHB" Then
                    str1 = "Tồn Đầu HB"
                ElseIf DBCol.ColumnName = "TonDKKM" Then
                    str1 = "Tồn Đầu KM"
                    'ElseIf DBCol.ColumnName = "TonDKTU" Then
                    '    str1 = "Tồn Đầu TU"
                ElseIf DBCol.ColumnName = "NhapHB" Then
                    str1 = "Nhập HB"
                ElseIf DBCol.ColumnName = "NhapKM" Then
                    str1 = "Nhập KM"
                ElseIf DBCol.ColumnName = "XuatHB" Then
                    str1 = "Xuất HB"
                ElseIf DBCol.ColumnName = "XuatKM" Then
                    str1 = "Xuất KM"
                ElseIf DBCol.ColumnName = "XuatDHBKM" Then
                    str1 = "Xuất Khác"
                    'ElseIf DBCol.ColumnName = "XuatTU" Then
                    '    str1 = "X"
                ElseIf DBCol.ColumnName = "TonCK" Then
                    str1 = "Tồn Cuối"
                ElseIf DBCol.ColumnName = "TonCKHB" Then
                    str1 = "Tồn Cuối HB"
                ElseIf DBCol.ColumnName = "TonCKKM" Then
                    str1 = "Tồn Cuối KM"
                    'Else
                    'str1 = DBCol.ColumnName
                End If

                'If DBCol.ColumnName = "AmountFull" Or DBCol.ColumnName = "tax" Then
                '    str += ""
                'Else

                str += "<td style=' border: .5pt solid windowtext; border-collapse: collapse'   bgcolor='#3399FF'>" + str1 + "</td>"
                'End If
            End If
        Next

        Dim i As Integer
        str += "</tr>"
        i = 1
        For Each DBRow As DataRow In dsExport.Tables(0).Rows

            str += "<tr>"
            For Each DBCol As DataColumn In dsExport.Tables(0).Columns
                If DBCol.ColumnName = "Region" Or DBCol.ColumnName = "TonDKTU" Or DBCol.ColumnName = "NhapTU" Or DBCol.ColumnName = "XuatTU" Or DBCol.ColumnName = "TonCKTU" Or DBCol.ColumnName = "DVT" Or DBCol.ColumnName = "Area" Or DBCol.ColumnName = "MaNPP" Or DBCol.ColumnName = "TenNPP" Then
                Else

                    If DBCol.ColumnName = "TonDK" Then
                        sumdk = sumdk + Convert.ToInt64(DBRow(DBCol.ColumnName)) * Convert.ToInt64(DBRow("Gia"))
                    End If
                    If DBCol.ColumnName = "TonDKHB" Then
                        sumdkhb = sumdkhb + Convert.ToInt64(DBRow(DBCol.ColumnName)) * Convert.ToInt64(DBRow("Gia"))
                    End If
                    If DBCol.ColumnName = "TonDKKM" Then
                        sumdkkm = sumdkkm + Convert.ToInt64(DBRow(DBCol.ColumnName)) * Convert.ToInt64(DBRow("Gia"))
                    End If
                    If DBCol.ColumnName = "NhapHB" Then
                        sumnhb = sumnhb + Convert.ToInt64(DBRow(DBCol.ColumnName)) * Convert.ToInt64(DBRow("Gia"))
                    End If
                    If DBCol.ColumnName = "NhapKM" Then
                        sumnkm = sumnkm + Convert.ToInt64(DBRow(DBCol.ColumnName)) * Convert.ToInt64(DBRow("Gia"))

                    ElseIf DBCol.ColumnName = "XuatHB" Then
                        sumxhb = sumxhb + Convert.ToInt64(DBRow(DBCol.ColumnName)) * Convert.ToInt64(DBRow("Gia"))
                    ElseIf DBCol.ColumnName = "XuatKM" Then
                        sumxkm = sumxkm + Convert.ToInt64(DBRow(DBCol.ColumnName)) * Convert.ToInt64(DBRow("Gia"))
                    ElseIf DBCol.ColumnName = "XuatDHBKM" Then
                        sumxdc = sumxdc + Convert.ToInt64(DBRow(DBCol.ColumnName)) * Convert.ToInt64(DBRow("Gia"))
                        'ElseIf DBCol.ColumnName = "XuatTU" Then
                        '    str1 = "X"
                    ElseIf DBCol.ColumnName = "TonCK" Then
                        sumck = sumck + Convert.ToInt64(DBRow(DBCol.ColumnName)) * Convert.ToInt64(DBRow("Gia"))
                    ElseIf DBCol.ColumnName = "TonCKHB" Then
                        sumchb = sumchb + Convert.ToInt64(DBRow(DBCol.ColumnName)) * Convert.ToInt64(DBRow("Gia"))
                    ElseIf DBCol.ColumnName = "TonCKKM" Then
                        sumckm = sumckm + Convert.ToInt64(DBRow(DBCol.ColumnName)) * Convert.ToInt64(DBRow("Gia"))
                        'Else
                        'str1 = DBCol.ColumnName
                    End If
                    '  If DBCol.ColumnName = "TonDK" Or DBCol.ColumnName = "TonDKHB" Or DBCol.ColumnName = "TonDKKM" Or DBCol.ColumnName = "Quantity" Or DBCol.ColumnName = "PriceIV" Then
                    If DBCol.DataType.Name.ToString = "Double" Then
                        If (DBCol.ColumnName = "TonCK" Or DBCol.ColumnName = "TonCKHB") And Convert.ToInt64(DBRow(DBCol.ColumnName)) < 0 Then

                            str += "<td  style=' border: .5pt solid windowtext; border-collapse: collapse font-size: 18px'  bgcolor=' #FFFF00' >" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", DBRow(DBCol.ColumnName)) + "</td>"

                        Else
                            str += "<td  style=' border: .5pt solid windowtext; border-collapse: collapse font-size: 18px' >" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", DBRow(DBCol.ColumnName)) + "</td>"

                        End If


                    Else

                        str += "<td  style=' border: .5pt solid windowtext; border-collapse: collapse font-size: 18px' >" + Convert.ToString(DBRow(DBCol.ColumnName)) + "</td>"
                    End If
                End If
            Next
            str += "</tr>"
            i = i + 1
        Next
        str += "<tr>"
        For Each DBCol As DataColumn In dsExport.Tables(0).Columns
            If DBCol.ColumnName = "Region" Or DBCol.ColumnName = "TonDKTU" Or DBCol.ColumnName = "NhapTU" Or DBCol.ColumnName = "XuatTU" Or DBCol.ColumnName = "TonCKTU" Or DBCol.ColumnName = "DVT" Or DBCol.ColumnName = "Area" Or DBCol.ColumnName = "MaNPP" Or DBCol.ColumnName = "TenNPP" Then
            Else
                If DBCol.ColumnName = "TonDK" Then

                    str += "<td style='border: .5pt solid windowtext ; font-size:14px' align='right'   bgcolor='#3399FF'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumdk) + "</td>"
                     

                ElseIf DBCol.ColumnName = "TonDKHB" Then
                    str += "<td style='border: .5pt solid windowtext ; font-size:14px' align='right'   bgcolor='#3399FF'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumdkhb) + "</td>"

                ElseIf DBCol.ColumnName = "TonDKKM" Then
                    str += "<td style='border: .5pt solid windowtext ; font-size:14px' align='right'   bgcolor='#3399FF'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumdkkm) + "</td>"
                    'ElseIf DBCol.ColumnName = "TonDKTU" Then
                    '    str1 = "Tồn Đầu TU"
                ElseIf DBCol.ColumnName = "NhapHB" Then
                    str += "<td style='border: .5pt solid windowtext ; font-size:14px' align='right'   bgcolor='#3399FF'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumnhb) + "</td>"
                ElseIf DBCol.ColumnName = "NhapKM" Then
                    str += "<td style='border: .5pt solid windowtext ; font-size:14px' align='right'   bgcolor='#3399FF'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumnkm) + "</td>"
                ElseIf DBCol.ColumnName = "XuatHB" Then
                    str += "<td style='border: .5pt solid windowtext ; font-size:14px' align='right'   bgcolor='#3399FF'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumxhb) + "</td>"
                ElseIf DBCol.ColumnName = "XuatKM" Then
                    str += "<td style='border: .5pt solid windowtext ; font-size:14px' align='right'   bgcolor='#3399FF'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumxkm) + "</td>"
                ElseIf DBCol.ColumnName = "XuatDHBKM" Then
                    str += "<td style='border: .5pt solid windowtext ; font-size:14px' align='right'   bgcolor='#3399FF'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumxdc) + "</td>"
                    '    str1 = "X"
                ElseIf DBCol.ColumnName = "TonCK" Then
                    str += "<td style='border: .5pt solid windowtext ; font-size:14px' align='right'   bgcolor='#3399FF'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumck) + "</td>"
                ElseIf DBCol.ColumnName = "TonCKHB" Then
                    str += "<td style='border: .5pt solid windowtext ; font-size:14px' align='right'   bgcolor='#3399FF'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumchb) + "</td>"
                ElseIf DBCol.ColumnName = "TonCKKM" Then
                    str += "<td style='border: .5pt solid windowtext ; font-size:14px' align='right'   bgcolor='#3399FF'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumckm) + "</td>"


                Else

                    str += "<td style='border: .5pt solid windowtext ; font-size:14px' align='center'   bgcolor='#3399FF'>" + "" + "</td>"
                End If
            End If
        Next

        str += "</tr><tr>"
        'For Each DBCol As DataColumn In dsExport.Tables(0).Columns
        '    If DBCol.ColumnName = "Region" Or DBCol.ColumnName = "DVT" Or DBCol.ColumnName = "Area" Or DBCol.ColumnName = "MaNPP" Or DBCol.ColumnName = "TenNPP" Then
        '    Else
        '        If DBCol.ColumnName = "Id" Then
        '            str += (Convert.ToString(" <td  colspan=9  >")) + "  </td>"
        '        ElseIf DBCol.ColumnName = "Itemcode" Or DBCol.ColumnName = "Itemname" Or DBCol.ColumnName = "Brand" Or DBCol.ColumnName = "AmountFull" Or DBCol.ColumnName = "tax" Or DBCol.ColumnName = "thung" Or DBCol.ColumnName = "Chan" Or DBCol.ColumnName = "Le" Then
        '            str += ""
        '        ElseIf DBCol.ColumnName = "AmountINV" Then
        '            str += "<td style='border: .5pt solid windowtext ; font-size:16px' align='right'   bgcolor='#ebe717'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumtax) + "</td>"


        '        ElseIf DBCol.ColumnName = "PriceIV" Then
        '            str += (Convert.ToString(" <td  style='border: .5pt solid windowtext ; font-size:16px' align='center' bgcolor='#ebe717'     >")) + " Thuế </td>"


        '            str += "<td style='border: .5pt solid windowtext ; font-size:18px' align='center'   bgcolor='#ebe717'>" + "" + "</td>"
        '        End If
        '    End If
        'Next
        'str += "</tr><tr>"
        'For Each DBCol As DataColumn In dsExport.Tables(0).Columns
        '    If DBCol.ColumnName = "Region" Or DBCol.ColumnName = "DVT" Or DBCol.ColumnName = "Area" Or DBCol.ColumnName = "MaNPP" Or DBCol.ColumnName = "TenNPP" Then
        '    Else
        '        If DBCol.ColumnName = "Id" Then
        '            str += (Convert.ToString(" <td  colspan=9  >")) + "  </td>"
        '        ElseIf DBCol.ColumnName = "Itemcode" Or DBCol.ColumnName = "Itemname" Or DBCol.ColumnName = "Brand" Or DBCol.ColumnName = "AmountFull" Or DBCol.ColumnName = "tax" Or DBCol.ColumnName = "thung" Or DBCol.ColumnName = "Chan" Or DBCol.ColumnName = "Le" Then
        '            str += ""
        '        ElseIf DBCol.ColumnName = "AmountINV" Then
        '            str += "<td style='border: .5pt solid windowtext ; font-size:16px' align='right'   bgcolor='#ebe717'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumfull) + "</td>"


        '        ElseIf DBCol.ColumnName = "PriceIV" Then
        '            str += (Convert.ToString(" <td  style='border: .5pt solid windowtext ; font-size:16px' align='center' bgcolor='#ebe717'     >")) + " Tổng tiền chuyển</td>"


        '            str += "<td style='border: .5pt solid windowtext ; font-size:18px' align='center'   bgcolor='#ebe717'>" + "" + "</td>"
        '        End If
        '    End If

        'Next

        'str += (Convert.ToString("<tr><td  style='border: .5pt solid windowtext font-size:14px' align='center' bgcolor='#3399FF'  font-weight: bold  color: #0000FF  colspan=" + Convert.ToString(3) + ">")) + " Tổng cộng </td><td style='border: .5pt solid windowtext' align='left' bgcolor='#3399FF'  font-weight: bold  color: #0000FF > " + "" + "</td><td style='border: .5pt solid windowtext' align='left' bgcolor='#3399FF'  font-weight: bold  color: #0000FF  colspan=" + Convert.ToString(colspan - 4) + "></td> </tr> "
        str += "<tr></tr><tr><td  style='border: .5pt solid windowtext ; font-size:18px' align='center' bgcolor=' #FFFF00'  rowspan= 3 colspan=" + Convert.ToString(colspan - 3) + "> " + builder.ToString + " </td> </tr> "

        str += "</table>"
        SWriter.WriteLine(str)
        SWriter.Flush()
        SWriter.Close()
        'If path.Length > 5 And d = True Then
        '    DownloadFile(path)
        'End If
    End Sub
    Private Sub DownloadFile(FPath As String)
        Dim strRequest As [String] = Request.QueryString("file")
        Dim file As New FileInfo(FPath)
        If file.Exists Then
            Response.Clear()
            Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name)
            Response.AddHeader("Content-Length", file.Length.ToString())
            Response.ContentType = "application/octet-stream"
            Response.WriteFile(file.FullName)
            Response.[End]()
        Else
            Response.Write("This file does not exist.")
        End If
    End Sub
   
End Class