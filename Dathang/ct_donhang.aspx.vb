Imports System.Data.SqlClient
Imports DevExpress.Web.ASPxGridView
Imports System.Globalization

Public Class ct_donhang
    Inherits AdminPage
    Dim dt As New DataTable()
    Dim DB As New dungchung
    'Public Function checkton(masp As String) As Integer

    '    Try

    '        'Dim c As New ECCDestinationConfig()
    '        'RfcDestinationManager.RegisterDestinationConfiguration(c)
    '        _ecc = RfcDestinationManager.GetDestination("SEQ")
    '        Dim repository As RfcRepository = _ecc.Repository


    '        'Dim destination As RfcDestination = RfcDestinationManager.GetDestination("SEQ")
    '        Dim func As IRfcFunction = repository.CreateFunction("ZBAPI_SD_ATP")
    '        Dim rfcreturn As IRfcStructure = func.GetStructure("RETURN")
    '        Dim cd As IRfcTable = func.GetTable("ZINV")
    '        'Dim bapiGetCompanyList As IRfcFunction
    '        'func.SetValue("Customer_Number", "000120004")
    '        'func.SetValue("Sales_Organization", "2000")

    '        'func.SetValue("Document_Date", CDate("10.10.2013"))
    '        'func.SetValue("Document_Date_To", CDate("10.10.2015"))
    '        func.SetValue("Z_LGORT", Session("store").ToString)
    '        func.SetValue("Z_WERKS", "VSIP")
    '        func.SetValue("Z_KUNNR", "0000" + Session("Manpp").ToString)
    '        func.SetValue("Z_MATNR", masp)
    '        func.Invoke(_ecc)


    '        Dim view As DataTable = GetDataTableFromRFCTable2(cd)
    '        Return CInt(view.Rows(0)("AVAIL"))
    '        'Dim view As DataTable = GetDataTableFromRFCTable(cd)
    '        'Dim view As IRfcTableView = TryCast(func.GetTable("SALES_ORDERS"), ISupportTableView).DefaultView

    '        'RfcDestinationManager.UnregisterDestinationConfiguration(c)
    '    Catch ex As Exception
    '        'TextBox1.Text = log & "Error " & ex.Message
    '        Return 0

    '    End Try
    'End Function
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '   FillCityCombo(ASPxComboBox1.Value)
        dt = DirectCast(Session("cart"), DataTable)
        ggiohang.CancelEdit()
        ggiohang.DataSource = dt
        ggiohang.DataBind()
        manpp.Text = Session("Manpp").ToString
        tennpp.Text = DB.TenNPP(manpp.Text)
        tKho.Text = Session("storename").ToString
        ngaydat.Value = Now()
        'If Session("Manpp") Is Nothing Then
        '    ASPxComboBox1.SelectedIndex = 1
        'Else
        '    ASPxComboBox1.Value = Session("Manpp").ToString
        '    FillCityCombo(ASPxComboBox1.Value)
        'End If
        lrbp.Text = dt.Rows.Count.ToString()
    End Sub
    Protected Sub PasteToGridView(sender As Object, e As EventArgs)
        Dim dtq As New DataTable()
        Dim dtset As DataSet
        dtq.Columns.AddRange(New DataColumn(1) {New DataColumn("OldItemcode", GetType(String)), New DataColumn("Soluong", GetType(Int32))})

        Dim copiedContent As String = Request.Form(txtCopied.UniqueID)
        For Each row As String In copiedContent.Split(ControlChars.Lf)
            If Not String.IsNullOrEmpty(row) Then
                dtq.Rows.Add()
                Dim i As Integer = 0
                For Each cell As String In row.Split(ControlChars.Tab)
                    If i < 2 Then
                        If i = 1 Then
                            dtq.Rows(dtq.Rows.Count - 1)(i) = CInt(cell)
                        Else
                            dtq.Rows(dtq.Rows.Count - 1)(i) = cell
                        End If

                    End If

                    i += 1
                Next
            End If
        Next


        Dim dt1 As New DataTable()
        Dim kt As Boolean = False
        'TAo bien boolean de kiem? tra xem nguoi dung bat dau mua hay la gi
        'Dim MaSP As String = DataList1.DataKeys(e.Item.ItemIndex).ToString()
        'Day la lay' ID cua? san pham trong kai datalist
        dt1 = DirectCast(Session("cart"), DataTable)
        'Gan cho no bang session muc dich get/set gia tri cho row cua datatable
        'Dim TenSP As String = DB.LayTenSP(Convert.ToString(MaSP))
        'Kai nay la lay ten cua san pham dua vao ID san pham
        If dt1.Rows.Count <> 0 Then
            'Check xem gio hang co hang hay chua
            'For Each dr As DataRow In dt1.Rows
            '    'vong lap lay tat ca cac rong trong bang
            '    If dr(0).ToString() = e.NewValues("OldItemcode").ToString Then
            '        'kiem tra neu san pham vua chon xem co trung voi san pham trong gio hang hay khong
            '        dr(3) = e.NewValues("SoLuong")
            '        'neu ma trung thi so luong se copng them 1
            '        dr(4) = Convert.ToInt32(e.NewValues("SoLuong")) * Convert.ToInt32(e.NewValues("Price"))
            '        'cap nhat lai row thanh tien
            '        'gan cho bien kt==true
            '        dr(6) = dr(5) * dr(3)
            '        'dr1(7) = Convert.ToDouble(Session("Tax"))
            '        dr(8) = dr(6) * dr(7) / 100 + dr(7)
            '        kt = True
            '    End If
            'Next
        End If
        If kt = False Then
            'o day co nghia la chon 1 mon hang dau tien co nghia la khi nguoi dung bat dau mua 1 mon hang
            For Each drq As DataRow In dtq.Rows
                Dim dr As DataRow = dt1.NewRow()
                dtset = DB.laysp(drq("OldItemcode").ToString)
                If dtset.Tables(0).Rows.Count > 0 Then
                    'tao 1 doi tuong la dr co nghia la tao 1 rong moi
                    dr(0) = drq("OldItemcode").ToString
                    'day la gan gia tri vao tung rong dr[0]bat dau tu kai dau tien
                    dr(1) = dtset.Tables(0).Rows(0)("Itemname").ToString
                    dr(2) = dtset.Tables(0).Rows(0)("Price")
                    dr(3) = drq("SoLuong")
                    dr(4) = Convert.ToInt32(drq("SoLuong")) * Convert.ToInt32(dtset.Tables(0).Rows(0)("Price"))
                    dr(5) = Convert.ToInt32((Convert.ToInt32(dtset.Tables(0).Rows(0)("Price")) / 1.1) * (100 - Convert.ToDouble(Session("ck"))) / 100)
                    dr(6) = dr(5) * dr(3)
                    dr(7) = 10
                    dr(8) = dr(6) * dr(7) / 100 + dr(7)

                    dt1.Rows.Add(dr)
                    'them rong vao bang
                    'gan table do cho session
                End If
            Next
        End If
        Session("cart") = dt1

        ggiohang.CancelEdit()
        ggiohang.DataSource = dt1
        ggiohang.DataBind()
        lrbp.Text = dt1.Rows.Count.ToString()

        txtCopied.Text = ""
    End Sub
    Protected Sub ggiohang_RowUpdating(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs) Handles ggiohang.RowUpdating
        Dim dt1 As New DataTable()
        dt1 = DirectCast(Session("cart"), DataTable)

        If dt1.Rows.Count <> 0 Then
            'Check xem gio hang co hang hay chua
            For Each dr As DataRow In dt1.Rows
                'vong lap lay tat ca cac rong trong bang
                If dr(0).ToString() = e.NewValues("OldItemcode").ToString Then
                    'kiem tra neu san pham vua chon xem co trung voi san pham trong gio hang hay khong
                    dr(3) = e.NewValues("SoLuong")
                    'neu ma trung thi so luong se copng them 1
                    dr(4) = Convert.ToInt32(e.NewValues("SoLuong")) * Convert.ToInt32(e.NewValues("Price"))
                    'cap nhat lai row thanh tien
                    'gan cho bien kt==true
                    dr(6) = dr(5) * dr(3)
                    'dr1(7) = Convert.ToDouble(Session("Tax"))
                    dr(8) = dr(6) * dr(7) / 100 + dr(7)
                End If
            Next
        End If
        e.Cancel = True
        ggiohang.CancelEdit()
        ggiohang.DataSource = dt1
        ggiohang.DataBind()
        lrbp.Text = dt1.Rows.Count.ToString()
        'ld.Text = dt1.Rows.Count.ToString()
        '   lrbp.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien")))
        'lInv.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")))
        'ltax.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))
        'ltong.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) + ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))

    End Sub

    Protected Sub ggiohang_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ggiohang.RowInserting
        Dim dt1 As New DataTable()
        Dim kt As Boolean = False
        'TAo bien boolean de kiem? tra xem nguoi dung bat dau mua hay la gi
        'Dim MaSP As String = DataList1.DataKeys(e.Item.ItemIndex).ToString()
        'Day la lay' ID cua? san pham trong kai datalist
        dt1 = DirectCast(Session("cart"), DataTable)
        'Gan cho no bang session muc dich get/set gia tri cho row cua datatable
        'Dim TenSP As String = DB.LayTenSP(Convert.ToString(MaSP))
        'Kai nay la lay ten cua san pham dua vao ID san pham
        If dt1.Rows.Count <> 0 Then
            'Check xem gio hang co hang hay chua
            For Each dr As DataRow In dt1.Rows
                'vong lap lay tat ca cac rong trong bang
                If dr(0).ToString() = e.NewValues("OldItemcode").ToString Then
                    'kiem tra neu san pham vua chon xem co trung voi san pham trong gio hang hay khong
                    dr(3) = e.NewValues("SoLuong")
                    'neu ma trung thi so luong se copng them 1
                    dr(4) = Convert.ToInt32(e.NewValues("SoLuong")) * Convert.ToInt32(e.NewValues("Price"))
                    'cap nhat lai row thanh tien
                    'gan cho bien kt==true
                    dr(6) = dr(5) * dr(3)
                    'dr1(7) = Convert.ToDouble(Session("Tax"))
                    dr(8) = dr(6) * dr(7) / 100 + dr(7)
                    kt = True
                End If
            Next
        End If
        If kt = False Then
            'o day co nghia la chon 1 mon hang dau tien co nghia la khi nguoi dung bat dau mua 1 mon hang

            Dim dr As DataRow = dt1.NewRow()
            'tao 1 doi tuong la dr co nghia la tao 1 rong moi
            dr(0) = e.NewValues("OldItemcode").ToString
            'day la gan gia tri vao tung rong dr[0]bat dau tu kai dau tien
            dr(1) = e.NewValues("Itemname").ToString
            dr(2) = e.NewValues("Price")
            dr(3) = e.NewValues("SoLuong")
            dr(4) = Convert.ToInt32(e.NewValues("SoLuong")) * Convert.ToInt32(e.NewValues("Price"))
            dr(5) = Convert.ToInt32((Convert.ToInt32(e.NewValues("Price")) / 1.1) * (100 - Convert.ToDouble(Session("ck"))) / 100)
            dr(6) = dr(5) * dr(3)
            dr(7) = Convert.ToDouble(Session("Tax"))
            dr(8) = dr(6) * dr(7) / 100 + dr(7)

            dt1.Rows.Add(dr)
            'them rong vao bang
            'gan table do cho session

        End If
        Session("cart") = dt1
        e.Cancel = True
        ggiohang.CancelEdit()
        ggiohang.DataSource = dt1
        ggiohang.DataBind()
        lrbp.Text = dt1.Rows.Count.ToString()
        'ld.Text = dt1.Rows.Count.ToString()
        'lrbp.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien")))
        'lInv.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")))
        'ltax.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))
        'ltong.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) + ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))

    End Sub

    Protected Sub ggiohang_RowDeleting(sender As Object, e As DevExpress.Web.Data.ASPxDataDeletingEventArgs) Handles ggiohang.RowDeleting

        Dim dt1 As New DataTable()
        'Dim row As DataRow = DirectCast(Session("cart"), DataTable).Rows.Find(e.Keys("OldItemcode"))
        'DirectCast(Session("cart"), DataTable).Rows.Remove(row)
        Dim kt As Boolean = False
        dt1 = DirectCast(Session("cart"), DataTable)
        If dt1.Rows.Count <> 0 Then
            Try
                'Check xem gio hang co hang hay chua
                For Each dr As DataRow In dt1.Rows
                    'vong lap lay tat ca cac rong trong bang
                    If dr(0).ToString() = e.Values("OldItemcode").ToString Then

                        dt1.Rows.Remove(dr)
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



            ggiohang.DataBind()
        End If
        e.Cancel = True
        ggiohang.DataSource = dt1
        ggiohang.CancelEdit()
        ggiohang.DataBind()
        lrbp.Text = dt1.Rows.Count.ToString()
        'ld.Text = dt1.Rows.Count.ToString()
        'lrbp.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien")))
        'lInv.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")))
        'ltax.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))
        'ltong.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) + ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))

    End Sub

    Protected Sub ggiohang_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs) Handles ggiohang.CustomCallback
        Dim dt1 As New DataTable()
        dt1 = DirectCast(Session("cart"), DataTable)
        ggiohang.DataSource = dt1
        ggiohang.CancelEdit()
        ggiohang.DataBind()
        lrbp.Text = dt1.Rows.Count.ToString()
        'ld.Text = dt1.Rows.Count.ToString()
        'lrbp.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien")))
        'lInv.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")))
        'ltax.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))
        'ltong.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) + ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))

    End Sub



    'Protected Sub ASPxComboBox1_Callback(sender As Object, e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase) Handles ASPxComboBox1.Callback
    '    FillCityCombo(e.Parameter)
    'End Sub


    Protected Sub FillCityCombo(ByVal countryName As String)
        If String.IsNullOrEmpty(countryName) Then
            Return
        End If
        Dim tenn As String = DB.TenNPP(countryName)
        tennpp.Text = tenn
    End Sub

    'Protected Sub ASPxComboBox1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ASPxComboBox1.SelectedIndexChanged
    '    FillCityCombo(ASPxComboBox1.Value)
    'End Sub

    Private Function taodonhang(Debcode As String, uname As String, inv As Double, rbp As Double) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@Debcode", SqlDbType.NVarChar), New SqlParameter("@Username", SqlDbType.NVarChar), New SqlParameter("@Amount", SqlDbType.Money), New SqlParameter("@AmountRBP", SqlDbType.Real)}
        arrParam(0).Value = Debcode
        arrParam(1).Value = uname
        arrParam(2).Value = inv
        arrParam(3).Value = rbp


        Return DB.ThucThiStore_DataSets("taodonhang", arrParam).Tables(0)
    End Function


    Private Function taodonhangct(Ordernr As String, Itemcode As String, Price As Double, Qt As Double, ARBP As Double) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@Ordernr", SqlDbType.NVarChar), New SqlParameter("@Itemcode", SqlDbType.NVarChar), New SqlParameter("@Price", SqlDbType.Real), New SqlParameter("@Qt", SqlDbType.Real), New SqlParameter("@ARBP", SqlDbType.Real)}
        arrParam(0).Value = Ordernr
        arrParam(1).Value = Itemcode
        arrParam(2).Value = Price
        arrParam(3).Value = Qt
        arrParam(4).Value = ARBP

        Return DB.ThucThiStore_DataSets("taodonhangct", arrParam).Tables(0)
    End Function

    Protected Sub dathang_Click(sender As Object, e As EventArgs) Handles dathang.Click
        dt = DirectCast(Session("cart"), DataTable)

        If Session("cart") Is Nothing Then
            Response.Redirect("~/GioHangRong.aspx")
        End If

        Dim num As Integer
        'Getctkmid' NgayBD = CDate(dtset.Tables(0).Rows(0)("DateFrom"))
        Dim dtb As DataTable = taodonhang(manpp.Text, Session("TenDangNhap"), dt.Compute("sum(TongTienIv)", ""), dt.Compute("sum(TongTien)", ""))
        num = Integer.Parse("0" + dtb.Rows(0)(0))
        If num <> 0 Then
            If dt.Rows.Count <> 0 Then
                For Each r As DataRow In dt.Rows


                    Dim b As Button = TryCast(sender, Button)
                    Dim message As String = String.Empty


                    Dim dts As DataTable = taodonhangct(num.ToString, r("OldItemcode").ToString, CDbl(r("Price")), Convert.ToDouble(r("SoLuong")), Convert.ToDouble(r("TongTien")))
                    Dim num1 As Integer = Integer.Parse("0" + dtb.Rows(0)(0))
                    Dim sb As New StringBuilder()
                    'oj.sendEmail("dong.tranvan@wipro-unza.com", "Thông Báo", body, "") 'sb.ToString()





                Next
            End If
        End If
        Session("GioHang") = Nothing
        Response.Redirect("~/Dathang/Donhang.aspx")
    End Sub

End Class