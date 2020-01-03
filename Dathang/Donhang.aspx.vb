Imports DevExpress.Web.ASPxGridView
Imports System.Data.SqlClient
Imports System.IO
Imports System.Globalization

Public Class Donhang
    Inherits AdminPage
    Dim oj As New SSMDATA
    Dim DB As New dungchung

    Private con As New SqlConnection(ConfigurationManager.ConnectionStrings("SSMConnectionString").ConnectionString)

    Private Sub Donhang_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim today As DateTime = DateTime.Now
            'current date
            Dim firstDay As DateTime = today.AddDays(-(today.Day - 1))
            'first day
            today = today.AddMonths(1)
            Dim lastDay As DateTime = today.AddDays(-(today.Day))

            If datest.Value = Nothing Then
                datest.Value = firstDay
            End If
            If dateen.Value = Nothing Then
                dateen.Date = Date.Now
            End If
           

        End If
        ClearSelectionOnOtherPages()
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Response.Cache.SetNoStore()
        Dim ad As DataSet
        If Session("TenDangNhap") Is Nothing Then
        Else
            Try
                ad = oj.Getq(Session("TenDangNhap").ToString())
                dh = Convert.ToBoolean(ad.Tables(0).Rows(0)("dh"))
                dhar = Convert.ToBoolean(ad.Tables(0).Rows(0)("dhar"))

            Catch ex As Exception
                dh = False
                dhar = False
            End Try

        End If
        Bt_dieuChinh.Visible = dh
        ASPxButton3.Visible = dhar
        senmail.Visible = dhar
    End Sub
    Protected Overrides Sub OnPreInit(e As EventArgs)


        MyBase.OnPreInit(e)

        If Request.Browser.MSDomVersion.Major = 0 Then
            ' If it is Non IE Browser


            Response.Cache.SetNoStore()
        End If
    End Sub
    Protected Sub detailGrid_DataSelect(ByVal sender As Object, ByVal e As EventArgs)
        Session("Ordernr") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub
    Protected Sub detailGrid_CustomUnboundColumnData(ByVal sender As Object, ByVal e As ASPxGridViewColumnDataEventArgs)
        If e.Column.FieldName = "Total" Then
            Dim price As Decimal = CDec(e.GetListSourceFieldValue("UnitPrice"))
            Dim quantity As Integer = Convert.ToInt32(e.GetListSourceFieldValue("Quantity"))
            e.Value = price * quantity
        End If
    End Sub
    Protected Sub chkSingleExpanded_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
        G_dh.SettingsDetail.AllowOnlyOneMasterRowExpanded = True
        If G_dh.SettingsDetail.AllowOnlyOneMasterRowExpanded Then
            G_dh.DetailRows.CollapseAllRows()
        End If
    End Sub

    Protected Sub Bt_dieuChinh_Click(sender As Object, e As EventArgs) Handles Bt_dieuChinh.Click
        Response.Redirect("~/Dathang/Form_dat_hang.aspx")
    End Sub

    Protected Sub ASPxButton1_Click(sender As Object, e As EventArgs) Handles ASPxButton1.Click
        Response.Redirect("~/Dathang/Ton_kho.aspx")
    End Sub

    Protected Sub ASPxButton3_Click(sender As Object, e As EventArgs) Handles ASPxButton3.Click
        Dim fieldValues As List(Of Object) = G_dh.GetSelectedFieldValues(New String() {"Ordernr", "Dates"})
        For Each item As Object() In fieldValues

            Dim CN As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())
            CN.Close()
            Dim qry As String = "update [dbo].[tbDatHangs] set [Type] = 'H' ,  dateAP= getdate() ,UserApr =@uname  where  Ordernr = @nu  and type <>'Y'"
            Dim myCommand As New SqlCommand(qry, CN)
            myCommand.Parameters.Add(New SqlParameter("uname", SqlDbType.VarChar)).Value = Session("TenDangNhap").ToString
            myCommand.Parameters.Add(New SqlParameter("nu", SqlDbType.Int)).Value = Convert.ToInt32(item(0).ToString)
            CN.Open()
            myCommand.ExecuteNonQuery()
            CN.Close()
        Next item
        Sqldh.DataBind()
        G_dh.DataBind()
    End Sub


    Private Sub DataSetToExcel(dsExport As DataSet, path As String, tableName1 As String, tableName As String, add As String, region As String, d As Boolean)
        If path = String.Empty Then
            Return
        End If

        Dim builder As New StringBuilder
        builder.Append("Mọi thắc mắc về đơn hàng , đề nghị đại lý thông tin về phòng Logictic Wipro Unza  <br/>")
        builder.Append("Đơn hàng có giá trị đến 17h ngày hôm sau nếu không chuyển tiền  <br/>")

        ' Append a line break.
        builder.AppendLine()


        ' Append a string and then another line break.

        Dim sum, sumiv, sumsl, sumfull, sumtax, sumthung, sumle As Integer
        Dim SWriter As New StreamWriter(path)
        Dim str As String = String.Empty
        Dim str1 As String = String.Empty
        Dim colspan As Int32 = dsExport.Tables(0).Columns.Count
        str += (Convert.ToString("<table ><tr><td align='left'   style='font-size:12px' colspan=3 >") & "CÔNG TY TNHH WIPRO-UNZA VIỆT NAM") + "</td></tr>"
        str += (Convert.ToString("<tr><td align='left'   style='font-size:11px' colspan=  3 >") & "Số 7, đường 4, KCN Việt Nam Singapore, Thuận An, Bình Dương") + "</td></tr>"
        str += (Convert.ToString("<tr><td align='center'   style='font-size:18px' colspan=" + Convert.ToString(colspan) + ">")) + "ĐƠN ĐẶT HÀNG - " & tableName1 & " </td></tr>"
        str += (Convert.ToString("<tr><td align='center'   style='font-size:18px' colspan=" + Convert.ToString(colspan) + "> <a>") & tableName & "-" & add & "</a>  ") + "</td></tr>"
        str += (Convert.ToString("<tr></tr><tr><td align='center'   style='font-size:10px' colspan=" + Convert.ToString(colspan) + ">")) + " Ngày in: " + DateTime.Now.[Date] + "</td></tr><tr></tr> <tr>"


        For Each DBCol As DataColumn In dsExport.Tables(0).Columns

            If DBCol.ColumnName = "chan" Then
                str1 = "Số thùng"
            ElseIf DBCol.ColumnName = "le" Then
                str1 = "Chai Lẻ"
            ElseIf DBCol.ColumnName = "Thung" Then
                str1 = "Quy cách"
            ElseIf DBCol.ColumnName = "Itemcode" Then
                str1 = "Mã sản phẩm"
            ElseIf DBCol.ColumnName = "itemname" Then
                str1 = "Tên sản phẩm"
            ElseIf DBCol.ColumnName = "Brand" Then
                str1 = "Nhãn hàng"
            ElseIf DBCol.ColumnName = "Quantity" Then
                str1 = "Số lượng"
            ElseIf DBCol.ColumnName = "Price" Then
                str1 = "Giá RBP"
            ElseIf DBCol.ColumnName = "AmountrBP" Then
                str1 = "Tiền RBP"
            ElseIf DBCol.ColumnName = "PriceIV" Then
                str1 = "Giá  H.Đơn"
            ElseIf DBCol.ColumnName = "AmountINV" Then
                str1 = "Tiền H.Đơn"
            ElseIf DBCol.ColumnName = "Id" Then
                str1 = "STT"
            Else
                str1 = DBCol.ColumnName
            End If

            If DBCol.ColumnName = "AmountFull" Or DBCol.ColumnName = "tax" Then
                str += ""
            Else

                str += "<td style=' border: 1px solid black; border-collapse: collapse'   bgcolor='#3399FF'>" + str1 + "</td>"
            End If
        Next

        Dim i As Integer
        str += "</tr>"
        i = 1
        For Each DBRow As DataRow In dsExport.Tables(0).Rows

            str += "<tr>"
            For Each DBCol As DataColumn In dsExport.Tables(0).Columns

                If DBCol.ColumnName = "AmountrBP" Then
                    sum += Convert.ToInt32(DBRow(DBCol.ColumnName))
                End If
                If DBCol.ColumnName = "Chan" Then
                    sumthung += Convert.ToInt32(DBRow(DBCol.ColumnName))
                End If
                If DBCol.ColumnName = "Le" Then
                    sumle += Convert.ToInt32(DBRow(DBCol.ColumnName))
                End If
                If DBCol.ColumnName = "AmountINV" Then
                    sumiv += Convert.ToInt32(DBRow(DBCol.ColumnName))
                End If
                If DBCol.ColumnName = "Quantity" Then
                    sumsl += Convert.ToInt32(DBRow(DBCol.ColumnName))
                End If
                If DBCol.ColumnName = "AmountrBP" Or DBCol.ColumnName = "Price" Or DBCol.ColumnName = "AmountINV" Or DBCol.ColumnName = "Quantity" Or DBCol.ColumnName = "PriceIV" Then
                    str += "<td  style=' border: 1px solid black; border-collapse: collapse font-size: 18px' >" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", DBRow(DBCol.ColumnName)) + "</td>"
                ElseIf DBCol.ColumnName = "Id" Then

                    str += "<td  style=' border: 1px solid black; border-collapse: collapse font-size: 18px' >" + Convert.ToString(i) + "</td>"
                ElseIf DBCol.ColumnName = "AmountFull" Then
                    str += ""
                    sumfull += Convert.ToInt32(DBRow(DBCol.ColumnName))
                ElseIf DBCol.ColumnName = "tax" Then
                    sumtax += Convert.ToInt32(DBRow(DBCol.ColumnName))
                    str += ""


                Else

                    str += "<td  style=' border: 1px solid black; border-collapse: collapse font-size: 18px' >" + Convert.ToString(DBRow(DBCol.ColumnName)) + "</td>"
                End If

            Next
            str += "</tr>"
            i = i + 1
        Next
        str += "<tr>"
        For Each DBCol As DataColumn In dsExport.Tables(0).Columns
            If DBCol.ColumnName = "AmountrBP" Then

                str += "<td style='border: 1 solid #010000 ; font-size:16px' align='right'   bgcolor='#3399FF'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sum) + "</td>"
            ElseIf DBCol.ColumnName = "AmountINV" Then
                str += "<td style='border: 1 solid #010000 ; font-size:16px' align='right'   bgcolor='#3399FF'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumiv) + "</td>"

            ElseIf DBCol.ColumnName = "Quantity" Then
                str += "<td style='border: 1 solid #010000 ; font-size:16px' align='right'   bgcolor='#3399FF'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumsl) + "</td>"
            ElseIf DBCol.ColumnName = "Chan" Then
                str += "<td style='border: 1 solid #010000 ; font-size:16px' align='right'   bgcolor='#3399FF'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumthung) + "</td>"
            ElseIf DBCol.ColumnName = "le" Then
                str += "<td style='border: 1 solid #010000 ; font-size:16px' align='right'   bgcolor='#3399FF'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumle) + "</td>"

            ElseIf DBCol.ColumnName = "Id" Then
                str += (Convert.ToString(" <td  style='border: 1 solid #010000 ; font-size:16px' align='center' bgcolor='#3399FF'  colspan=4   >")) + " Tổng cộng </td>"
            ElseIf DBCol.ColumnName = "Itemcode" Or DBCol.ColumnName = "Itemname" Or DBCol.ColumnName = "Brand" Then
                str += ""
            ElseIf DBCol.ColumnName = "AmountFull" Then
                str += ""

            ElseIf DBCol.ColumnName = "tax" Then

                str += ""

            Else

                str += "<td style='border: 1 solid #010000 ; font-size:18px' align='center'   bgcolor='#3399FF'>" + "" + "</td>"
            End If

        Next

        str += "</tr><tr>"
        For Each DBCol As DataColumn In dsExport.Tables(0).Columns
            If DBCol.ColumnName = "Id" Then
                str += (Convert.ToString(" <td  colspan=9  >")) + "  </td>"
            ElseIf DBCol.ColumnName = "Itemcode" Or DBCol.ColumnName = "Itemname" Or DBCol.ColumnName = "Brand" Or DBCol.ColumnName = "AmountFull" Or DBCol.ColumnName = "tax" Or DBCol.ColumnName = "thung" Or DBCol.ColumnName = "Chan" Or DBCol.ColumnName = "Le" Then
                str += ""
            ElseIf DBCol.ColumnName = "AmountINV" Then
                str += "<td style='border: 1 solid #010000 ; font-size:16px' align='right'   bgcolor='#ebe717'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumtax) + "</td>"


            ElseIf DBCol.ColumnName = "PriceIV" Then
                str += (Convert.ToString(" <td  style='border: 1 solid #010000 ; font-size:16px' align='center' bgcolor='#ebe717'     >")) + " Thuế </td>"


                str += "<td style='border: 1 solid #010000 ; font-size:18px' align='center'   bgcolor='#ebe717'>" + "" + "</td>"
            End If

        Next
        str += "</tr><tr>"
        For Each DBCol As DataColumn In dsExport.Tables(0).Columns
            If DBCol.ColumnName = "Id" Then
                str += (Convert.ToString(" <td  colspan=9  >")) + "  </td>"
            ElseIf DBCol.ColumnName = "Itemcode" Or DBCol.ColumnName = "Itemname" Or DBCol.ColumnName = "Brand" Or DBCol.ColumnName = "AmountFull" Or DBCol.ColumnName = "tax" Or DBCol.ColumnName = "thung" Or DBCol.ColumnName = "Chan" Or DBCol.ColumnName = "Le" Then
                str += ""
            ElseIf DBCol.ColumnName = "AmountINV" Then
                str += "<td style='border: 1 solid #010000 ; font-size:16px' align='right'   bgcolor='#ebe717'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumfull) + "</td>"


            ElseIf DBCol.ColumnName = "PriceIV" Then
                str += (Convert.ToString(" <td  style='border: 1 solid #010000 ; font-size:16px' align='center' bgcolor='#ebe717'     >")) + " Tổng tiền chuyển</td>"


                str += "<td style='border: 1 solid #010000 ; font-size:18px' align='center'   bgcolor='#ebe717'>" + "" + "</td>"
            End If

        Next

        'str += (Convert.ToString("<tr><td  style='border: 1 solid #010000 font-size:14px' align='center' bgcolor='#3399FF'  font-weight: bold  color: #0000FF  colspan=" + Convert.ToString(3) + ">")) + " Tổng cộng </td><td style='border: 1 solid #010000' align='left' bgcolor='#3399FF'  font-weight: bold  color: #0000FF > " + "" + "</td><td style='border: 1 solid #010000' align='left' bgcolor='#3399FF'  font-weight: bold  color: #0000FF  colspan=" + Convert.ToString(colspan - 4) + "></td> </tr> "
        str += "<tr></tr><tr><td  style='border: 1 solid #010000 ; font-size:18px' align='center' bgcolor=' #FFFF00'  rowspan= 3 colspan=" + Convert.ToString(colspan - 2) + "> " + builder.ToString + " </td> </tr> "

        str += "</table>"
        SWriter.WriteLine(str)
        SWriter.Flush()
        SWriter.Close()
        If path.Length > 5 And d = True Then
            DownloadFile(path)
        End If
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
    Private Sub ClearSelectionOnOtherPages()
        If G_dh.Selection.Count <= 1 Then
            Return
        End If
        Dim curPageSelection As Integer = GetSelectedRowOnTheCurrentPage()
        G_dh.Selection.UnselectAll()
        G_dh.Selection.SelectRow(curPageSelection)
    End Sub
    Private Function GetSelectedRowOnTheCurrentPage() As Integer
        Dim startIndexOnPage As Integer = G_dh.PageIndex * G_dh.SettingsPager.PageSize
        For i As Integer = 0 To G_dh.VisibleRowCount - 1
            If G_dh.Selection.IsRowSelected(startIndexOnPage + i) Then
                Return startIndexOnPage + i
            End If
        Next i
        Return -1
    End Function
    Protected Sub btnXlsxExport_Click(sender As Object, e As EventArgs)


        Dim fieldValues As List(Of Object) = G_dh.GetSelectedFieldValues(New String() {"Ordernr", "Debcode", "Debname", "Region"})
        For Each item As Object() In fieldValues

            'Dim dtb As Datatable = StoreToDatatable(item(0).ToString(), item(1).ToString(), item(2).ToString(), item(3).ToString(), CDbl(item(4)), CDate(item(5).ToString()), CDate(item(6).ToString()), item(7).ToString())
            'num = Integer.Parse("0" + dtb.Rows(0)(0))


            Dim command As New SqlCommand()




            command.CommandText = "SELECT Tbdathang_ct.Id,  Tbdathang_ct.Itemcode, tbItems.Itemname, tbItems.Brand, Tbdathang_ct.Price, tbItems.Thung, Tbdathang_ct.Quantity, FLOOR(Tbdathang_ct.Quantity / tbItems.Thung) AS chan, CAST(Tbdathang_ct.Quantity AS decimal(10 , 0)) % tbItems.Thung AS le, Tbdathang_ct.AmountrBP,   Tbdathang_ct.PriceIV, Tbdathang_ct.AmountINV, Tbdathang_ct.AmountFull, Tbdathang_ct.tax  FROM Tbdathang_ct INNER JOIN tbItems ON Tbdathang_ct.Itemcode = tbItems.OldItemcode WHERE (Tbdathang_ct.Ordernr ='" & item(0).ToString() & "' )  "
            command.CommandType = CommandType.Text



            command.Connection = con
            Dim da As New SqlDataAdapter(command)
            Dim ds As New DataSet()
            da.Fill(ds, "Tbdathang_ct")
            If ds.Tables(0).Rows.Count < 0 Then
                Return
            End If
            Dim fpath = String.Empty
            If Directory.Exists(Server.MapPath("ExcelTemplates")) = False Then
                Directory.CreateDirectory(Server.MapPath("ExcelTemplates"))
            End If
            fpath = Server.MapPath("ExcelTemplates/don_dat_hang_" + item(0).ToString() + ".xls")
            If File.Exists(fpath) = False Then
                File.Create(fpath).Close()
            Else
                File.Create(fpath).Close()
            End If
            If fpath.Trim() <> String.Empty Then
                DataSetToExcel(ds, fpath, item(0).ToString(), item(1).ToString(), item(2).ToString(), item(3).ToString(), True)
            End If


            'Response.Write("<script LANGUAGE='JavaScript' >alert('đã chuyển thành công " + item(0).ToString() + " ssang unzadata')</script>")
        Next item
    End Sub

    Protected Sub ASPExport_Click(sender As Object, e As EventArgs) Handles ASPExport.Click
        ASPxGridViewExporter1.WriteXlsxToResponse()
    End Sub

    Protected Sub G_dh_CustomButtonCallback(sender As Object, e As ASPxGridViewCustomButtonCallbackEventArgs) Handles G_dh.CustomButtonCallback
        If e.ButtonID = "btexport" Then

            'Dim fieldValues As List(Of Object) = G_dh.GetSelectedFieldValues(New String() {"Ordernr", "Debcode", "Debname", "Region"})
            'For Each item As Object() In fieldValues

            'Dim dtb As Datatable = StoreToDatatable(item(0).ToString(), item(1).ToString(), item(2).ToString(), item(3).ToString(), CDbl(item(4)), CDate(item(5).ToString()), CDate(item(6).ToString()), item(7).ToString())
            'num = Integer.Parse("0" + dtb.Rows(0)(0))


            Dim command As New SqlCommand()




            command.CommandText = "SELECT Tbdathang_ct.Id,  Tbdathang_ct.Itemcode, tbItems.Itemname, tbItems.Brand, Tbdathang_ct.Price, tbItems.Thung, Tbdathang_ct.Quantity, FLOOR(Tbdathang_ct.Quantity / tbItems.Thung) AS chan, CAST(Tbdathang_ct.Quantity AS decimal(10 , 0)) % tbItems.Thung AS le, Tbdathang_ct.AmountrBP,   Tbdathang_ct.PriceIV, Tbdathang_ct.AmountINV, Tbdathang_ct.AmountFull, Tbdathang_ct.tax  FROM Tbdathang_ct INNER JOIN tbItems ON Tbdathang_ct.Itemcode = tbItems.OldItemcode WHERE (Tbdathang_ct.Ordernr ='" & G_dh.GetRowValues(e.VisibleIndex, "Ordernr").ToString & "' )  "
            command.CommandType = CommandType.Text



            command.Connection = con
            Dim da As New SqlDataAdapter(command)
            Dim ds As New DataSet()
            da.Fill(ds, "Tbdathang_ct")
            If ds.Tables(0).Rows.Count < 0 Then
                Return
            End If
            Dim fpath = String.Empty
            If Directory.Exists(Server.MapPath("ExcelTemplates")) = False Then
                Directory.CreateDirectory(Server.MapPath("ExcelTemplates"))
            End If
            fpath = Server.MapPath("ExcelTemplates/don_dat_hang_" + G_dh.GetRowValues(e.VisibleIndex, "Ordernr").ToString + ".xls")
            If File.Exists(fpath) = False Then
                File.Create(fpath).Close()
            Else
                File.Create(fpath).Close()
            End If
            If fpath.Trim() <> String.Empty Then
                DataSetToExcel(ds, fpath, G_dh.GetRowValues(e.VisibleIndex, "Ordernr").ToString, G_dh.GetRowValues(e.VisibleIndex, "Debcode").ToString, G_dh.GetRowValues(e.VisibleIndex, "Debname").ToString, G_dh.GetRowValues(e.VisibleIndex, "Region").ToString, True)
            End If


            'Response.Write("<script LANGUAGE='JavaScript' >alert('đã chuyển thành công " + item(0).ToString() + " ssang unzadata')</script>")
            'Next item
        End If
    End Sub
     
    Protected Sub senmail_Click(sender As Object, e As EventArgs) Handles senmail.Click
        Dim fieldValues As List(Of Object) = G_dh.GetSelectedFieldValues(New String() {"Ordernr", "Dates", "Debcode", "AmountRBP", "Amountfull", "Storage"})
        For Each item As Object() In fieldValues
            Dim oj As New SSMDATA
            'Dim sb As New StringBuilder()
            Dim read As New StreamReader(Server.MapPath("~/Dathang/Email.htm"))
            Dim body As String = read.ReadToEnd()
            Dim rbp As String, ivce As String
            rbp = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(item(3).ToString()).ToString)
            ivce = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(item(4).ToString()).ToString)
            read.Close()
            'Dim mail As New SendEmail()
            body = String.Format(body, item(0).ToString(), item(2).ToString() + "-" + DB.diachi(item(2).ToString()).Tables(0).Rows(0)("Debname").ToString + " Địa Chỉ: " + DB.diachi(item(2).ToString()).Tables(0).Rows(0)("Debadd").ToString, rbp, ivce)
            guimail(item(0).ToString(), item(2).ToString())
            Dim a As DataTable


            a = getmail(item(2).ToString(), "SALESUP;SALES HEAD;CS;ADMINSD", item(5).ToString())
            If a.Rows.Count > 0 Then
                'oj.sendEmail("dong.tranvan@wipro-unza.com", "[WUVL] Đơn đặt hàng", body, Server.MapPath("ExcelTemplates/don_dat_hang_" + num.ToString + ".xls").ToString) 'sb.ToString()

                For Each dr As DataRow In a.Rows
                    'vong lap lay tat ca cac rong trong bang
                    If dr("email").ToString() <> "" Then

                        'If dr("MaPhongban").ToString() = "CS" Then
                        'email = email + dr("email").ToString() + ","
                        If dr("MaPhongban").ToString() = "ADMINSD" Or dr("MaPhongban").ToString() = "SALESUP" Then
                            oj.sendEmail(dr("email").ToString(), "[WUVL] Đơn đặt hàng của bạn", body, Server.MapPath("ExcelTemplates/don_dat_hang_" + item(0).ToString() + ".xls").ToString) 'sb.ToString()
                        Else
                            oj.sendEmailBkup(dr("email").ToString(), "[WUVL] Đơn đặt hàng của :" + dr("Debname").ToString(), body, Server.MapPath("ExcelTemplates/don_dat_hang_" + item(0).ToString() + ".xls").ToString) 'sb.ToString()

                        End If

                    End If
                Next
            End If
        Next

    End Sub
    Protected Sub guimail(num As String, name As String)


        'Dim dtb As Datatable = StoreToDatatable(item(0).ToString(), item(1).ToString(), item(2).ToString(), item(3).ToString(), CDbl(item(4)), CDate(item(5).ToString()), CDate(item(6).ToString()), item(7).ToString())
        'num = Integer.Parse("0" + dtb.Rows(0)(0))


        Dim command As New SqlCommand()




        command.CommandText = "SELECT Tbdathang_ct.Id,  Tbdathang_ct.Itemcode, tbItems.Itemname, tbItems.Brand, Tbdathang_ct.Price, tbItems.Thung, Tbdathang_ct.Quantity, FLOOR(Tbdathang_ct.Quantity / tbItems.Thung) AS chan, CAST(Tbdathang_ct.Quantity AS decimal(10 , 0)) % tbItems.Thung AS le, Tbdathang_ct.AmountrBP,   Tbdathang_ct.PriceIV, Tbdathang_ct.AmountINV, Tbdathang_ct.AmountFull, Tbdathang_ct.tax  FROM Tbdathang_ct INNER JOIN tbItems ON Tbdathang_ct.Itemcode = tbItems.OldItemcode WHERE (Tbdathang_ct.Ordernr ='" & num & "' )  "
        command.CommandType = CommandType.Text



        command.Connection = DB.taoketnoi
        Dim da As New SqlDataAdapter(command)
        Dim ds As New DataSet()
        da.Fill(ds, "Tbdathang_ct")
        If ds.Tables(0).Rows.Count < 0 Then
            Return
        End If
        Dim fpath = String.Empty
        If Directory.Exists(Server.MapPath("ExcelTemplates")) = False Then
            Directory.CreateDirectory(Server.MapPath("ExcelTemplates"))
        End If
        fpath = Server.MapPath("ExcelTemplates/don_dat_hang_" + num + ".xls")
        If File.Exists(fpath) = False Then
            File.Create(fpath).Close()
        Else
            File.Create(fpath).Close()
        End If
        If fpath.Trim() <> String.Empty Then
            DataSetToExcel(ds, fpath, num.ToString, name, DB.TenNPP(name), DB.diachi(name).Tables(0).Rows(0)("Debadd").ToString, False)
        End If



    End Sub
    Private Function getmail(Debcode As String, pb As String, sto As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@Debcode", SqlDbType.NVarChar), New SqlParameter("@pb", SqlDbType.NVarChar), New SqlParameter("@wh", SqlDbType.NVarChar)}
        arrParam(0).Value = Debcode
        arrParam(1).Value = pb
        arrParam(2).Value = sto

        Return DB.ThucThiStore_DataSets("getsendmail2", arrParam).Tables(0)
    End Function
End Class