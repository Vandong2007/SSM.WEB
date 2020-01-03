'Public Class Ket_qua_claim
'    Inherits System.Web.UI.Page

'    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

'    End Sub

'    Protected Sub Bt_dieuChinh_Click(sender As Object, e As EventArgs) Handles Bt_dieuChinh.Click

'    End Sub
'End Class
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Globalization

Public Class Ket_qua_claim
    Inherits AdminPage
    Private con As New SqlConnection(ConfigurationManager.ConnectionStrings("SSMConnectionString").ConnectionString)
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'GridView11.DataBind()
        If datest.Value = Nothing Then
            datest.Value = ngaybt
        End If
        If dateen.Value = Nothing Then
            dateen.Date = ngaykt
        End If
    End Sub
    Protected Sub Bt_dieuChinh_Click(sender As Object, e As EventArgs) Handles Bt_dieuChinh.Click

   

        Dim fieldValues As List(Of Object) = GridView11.GetSelectedFieldValues(New String() {"manpp", "Debname", "Region"})
        For Each item As Object() In fieldValues

            'Dim dtb As DataTable = StoreToDataTable(item(0).ToString(), item(1).ToString(), item(2).ToString(), item(3).ToString(), CDbl(item(4)), CDate(item(5).ToString()), CDate(item(6).ToString()), item(7).ToString())
            'num = Integer.Parse("0" + dtb.Rows(0)(0))


            Dim command As New SqlCommand()




            command.CommandText = "SELECT  dbo.tbCliam_TT.mact, dbo.tbCliam_TT.masp, dbo.tbItems.Itemname, dbo.tbItems.Brand, dbo.tbCliam_TT.price,dbo.tbCliam_TT.Priceinv, " & _
                  "       SUM(dbo.tbCliam_TT.soluong) AS soluong, SUM(dbo.tbCliam_TT.thanhtien) AS thanhtien,  SUM(dbo.tbCliam_TT.Amountinv) AS Amountinv  " & _
" FROM            dbo.tbCliam_TT INNER JOIN  " & _
            "             dbo.tbItems ON dbo.tbCliam_TT.masp = dbo.tbItems.Itemcode  " & _
                 "    where     dbo.tbCliam_TT.manpp ='" & item(0).ToString() & "'  and month(ngay)  =  " & Month(dateen.Value) & " and year(ngay) =  " & Year(dateen.Value) & "     " & _
" GROUP BY  dbo.tbCliam_TT.manpp, dbo.tbCliam_TT.mact, dbo.tbCliam_TT.masp, dbo.tbItems.Itemname, dbo.tbItems.Brand,  " & _
                     "    dbo.tbCliam_TT.Priceinv, dbo.tbCliam_TT.price"
            command.CommandType = CommandType.Text



            command.Connection = con
            Dim da As New SqlDataAdapter(command)
            Dim ds As New DataSet()
            da.Fill(ds, "tbCliam_TT")
            If ds.Tables(0).Rows.Count < 0 Then
                Return
            End If
            Dim fpath = String.Empty
            If Directory.Exists(Server.MapPath("ExcelTemplates")) = False Then
                Directory.CreateDirectory(Server.MapPath("ExcelTemplates"))
            End If
            fpath = Server.MapPath("ExcelTemplates/Reports-Claim" + item(0).ToString() + ".xls")
            If File.Exists(fpath) = False Then
                File.Create(fpath).Close()
            Else
                File.Create(fpath).Close()
            End If
            If fpath.Trim() <> String.Empty Then
                DataSetToExcel(ds, fpath, item(0).ToString(), item(1).ToString(), "", item(2).ToString())
            End If


            'Response.Write("<script LANGUAGE='JavaScript' >alert('đã chuyển thành công " + item(0).ToString() + " ssang unzadata')</script>")
        Next item

    End Sub
    Private Sub DataSetToExcel(dsExport As DataSet, path As String, tableName1 As String, tableName As String, add As String, region As String)
        If path = String.Empty Then
            Return
        End If

        Dim builder As New StringBuilder
        builder.Append("Mọi thắc mắc về khuyến mại, đề nghị đại lý thông tin về phòng AP&P Wipro Unza  <br/>")
        builder.Append("trong vòng 2 ngày từ khi nhận được thông báo khuyến mại.  <br/>")

        ' Append a line break.
        builder.AppendLine()
        If Left(region, 4) = "nort" Then
            builder.Append("Liên hệ AP&P Hà Nội Phone:04-36625557/8/9-Fax 04-36625556(Ext: 104-105). <br/> Sau 2 ngày nếu không có thắc mắc gì chúng tôi sẽ chốt số liệu theo kết quả này.").AppendLine()
        Else
            builder.Append("Liên hệ AP&P VSIP Phone:0650-3743972/3/4 (Ext: 166-169-202). <br/> Sau 2 ngày nếu không có thắc mắc gì chúng tôi sẽ chốt số liệu theo kết quả này.").AppendLine()

        End If
        ' Append a string and then another line break.
       
        Dim sum, sumiv, sumsl As Integer
        Dim SWriter As New StreamWriter(path)
        Dim str As String = String.Empty
        Dim str1 As String = String.Empty
        Dim colspan As Int32 = dsExport.Tables(0).Columns.Count
        str += (Convert.ToString("<Table ><TR><TD align='left'   style='font-size:12px' colspan=3 >") & "CÔNG TY TNHH WIPRO-UNZA VIỆT NAM") + "</TD></tr>"
        str += (Convert.ToString("<tr><TD align='left'   style='font-size:11px' colspan=  3 >") & "Số 7, đường 4, KCN Việt Nam Singapore, Thuận An, Bình Dương") + "</TD></tr>"
        str += (Convert.ToString("<tr><TD align='center'   style='font-size:18px' colspan=" + Convert.ToString(colspan) + ">")) + "TỔNG CHI PHÍ KHUYẾN MẠI WIPRO UNZA THANH TOÁN CHO NHÀ PHÂN PHỐI</TD></tr>"
        str += (Convert.ToString("<tr><TD align='center'   style='font-size:18px' colspan=" + Convert.ToString(colspan) + "> <a>") & tableName1 & "-" & tableName & "</a>  ") + "</TD></tr>"
        str += (Convert.ToString("<tr></tr><tr><TD align='center'   style='font-size:10px' colspan=" + Convert.ToString(colspan) + ">")) + " Ngày in: " + DateTime.Now.[Date] + "</TD></tr><tr></TR> <tr>"


        For Each DBCol As DataColumn In dsExport.Tables(0).Columns

            If DBCol.ColumnName = "mact" Then
                str1 = "Mã CTKM"
            ElseIf DBCol.ColumnName = "masp" Then
                str1 = "Mã sản phẩm"
            ElseIf DBCol.ColumnName = "itemname" Then
                str1 = "Tên sản phẩm"
            ElseIf DBCol.ColumnName = "Brand" Then
                str1 = "Nhãn hàng"
            ElseIf DBCol.ColumnName = "soluong" Then
                str1 = "Số lượng"
            ElseIf DBCol.ColumnName = "price" Then
                str1 = "Giá RBP"
            ElseIf DBCol.ColumnName = "thanhtien" Then
                str1 = "Tiền RBP"
            ElseIf DBCol.ColumnName = "Priceinv" Then
                str1 = "Giá K.Mãi"
            ElseIf DBCol.ColumnName = "Amountinv" Then
                str1 = "Tiền K.Mãi"
            Else
                str1 = DBCol.ColumnName
            End If


            str += "<TD style=' border: 1px solid black; border-collapse: collapse'   bgcolor='#3399FF'>" + str1 + "</TD>"
        Next


        str += "</TR>"
        For Each DBRow As DataRow In dsExport.Tables(0).Rows
            str += "<TR>"
            For Each DBCol As DataColumn In dsExport.Tables(0).Columns

                If DBCol.ColumnName = "thanhtien" Then
                    sum += Convert.ToInt32(DBRow(DBCol.ColumnName))
                End If
                If DBCol.ColumnName = "Amountinv" Then
                    sumiv += Convert.ToInt32(DBRow(DBCol.ColumnName))
                End If
                If DBCol.ColumnName = "soluong" Then
                    sumsl += Convert.ToInt32(DBRow(DBCol.ColumnName))
                End If
                If DBCol.ColumnName = "thanhtien" Or DBCol.ColumnName = "price" Or DBCol.ColumnName = "Amountinv" Or DBCol.ColumnName = "soluong" Or DBCol.ColumnName = "Priceinv" Then
                    str += "<TD  style=' border: 1px solid black; border-collapse: collapse font-size: 18px' >" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", DBRow(DBCol.ColumnName)) + "</TD>"
                Else

                    str += "<TD  style=' border: 1px solid black; border-collapse: collapse font-size: 18px' >" + Convert.ToString(DBRow(DBCol.ColumnName)) + "</TD>"
                End If
            Next
            str += "</TR>"

        Next
        For Each DBCol As DataColumn In dsExport.Tables(0).Columns
            If DBCol.ColumnName = "thanhtien" Then

                str += "<TD style='border: 1 solid #010000 ; font-size:16px' align='right'   bgcolor='#3399FF'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sum) + "</TD>"
            ElseIf DBCol.ColumnName = "Amountinv" Then
                str += "<TD style='border: 1 solid #010000 ; font-size:16px' align='right'   bgcolor='#3399FF'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumiv) + "</TD>"

            ElseIf DBCol.ColumnName = "soluong" Then
                str += "<TD style='border: 1 solid #010000 ; font-size:16px' align='right'   bgcolor='#3399FF'>" + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", sumsl) + "</TD>"

            ElseIf DBCol.ColumnName = "mact" Then
                str += (Convert.ToString(" <TD  style='border: 1 solid #010000 ; font-size:16px' align='center' bgcolor='#3399FF'  colspan=3   >")) + " Tổng cộng </TD>"
            ElseIf DBCol.ColumnName = "masp" Or DBCol.ColumnName = "Itemname" Then

            Else

                str += "<TD style='border: 1 solid #010000 ; font-size:18px' align='center'   bgcolor='#3399FF'>" + "" + "</TD>"
            End If

        Next
        'str += (Convert.ToString("<tr><TD  style='border: 1 solid #010000 font-size:14px' align='center' bgcolor='#3399FF'  font-weight: bold  color: #0000FF  colspan=" + Convert.ToString(3) + ">")) + " Tổng cộng </TD><td style='border: 1 solid #010000' align='left' bgcolor='#3399FF'  font-weight: bold  color: #0000FF > " + "" + "</TD><td style='border: 1 solid #010000' align='left' bgcolor='#3399FF'  font-weight: bold  color: #0000FF  colspan=" + Convert.ToString(colspan - 4) + "></td> </tr> "
        str += "<tr></tr><tr><TD  style='border: 1 solid #010000 ; font-size:18px' align='center' bgcolor=' #FFFF00'  rowspan= 3 colspan=" + Convert.ToString(colspan) + "> " + builder.ToString + " </td> </tr> "

        str += "</TABLE>"
        SWriter.WriteLine(str)
        SWriter.Flush()
        SWriter.Close()
        If path.Length > 5 Then
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

    Protected Sub ASPxButton1_Click(sender As Object, e As EventArgs) Handles ASPxButton1.Click
        Response.Redirect("~/Cliam/upLoad_ketqua.aspx")
    End Sub

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        e.Command.CommandTimeout = 333
    End Sub
End Class