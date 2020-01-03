
Imports DevExpress.Web.ASPxGridView
Imports System.Collections
Imports System.Configuration
Imports System.Data
Imports System.Linq
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
'Imports System.Xml.Linq
Imports System.Data.SqlClient
Imports System.Globalization
Imports DevExpress.Web.ASPxClasses

Public Class tao_don_hang
    Inherits AdminPage
    'Dim dt1 As New DataTable()
    Dim DB As New dungchung
    Dim oj As New SSMDATA
    Private Sub Danh_sach_san_pham_Init(sender As Object, e As EventArgs) Handles Me.Init

        If Session("TenDangNhap") Is Nothing Then
            Dim url As String = Request.Url.AbsoluteUri
            Session("UrlReturn") = url
            Response.Redirect("~/Account/Login.aspx")
        End If
        If pb = "ADMINSD" Then
            Session("Manpp") = oj.Getdh(Session("TenDangNhap").ToString()).Tables(0).Rows(0)("Olddebcode").ToString
            Session("store") = oj.Getdh(Session("TenDangNhap").ToString()).Tables(0).Rows(0)("Sdf").ToString
            Session("storename") = oj.Getdh(Session("TenDangNhap").ToString()).Tables(0).Rows(0)("Diengiai").ToString
            Session("ck") = oj.Getdh(Session("TenDangNhap").ToString()).Tables(0).Rows(0)("Discount")
            Session("Tax") = oj.Getdh(Session("TenDangNhap").ToString()).Tables(0).Rows(0)("Tax")
        End If


        If Session("Manpp") Is Nothing Or Session("storename") Is Nothing Then
            Dim builder As New StringBuilder()
            builder.Append("<script language=JavaScript> ShowNppss(); </script>" & vbLf)
            Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())
        Else

            Dim dt1 As New DataTable()
            dt1 = DirectCast(Session("cart"), DataTable)
            ggiohang.DataSource = dt1
            ggiohang.DataBind()
            ggiohang1.DataSource = dt1
            ggiohang1.DataBind()
            npp.Text = DB.TenNPP(Session("Manpp").ToString)
            ASPxRoundPanel2.HeaderText = "Thông tin tồn kho của " + Session("storename").ToString
            ld.Text = dt1.Rows.Count.ToString()
            lrbp.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien")))
            lInv.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")))
            ltax.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))
            ltong.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) + ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))

        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If pb = "ADMINSD" Then
            Session("Manpp") = oj.Getdh(Session("TenDangNhap").ToString()).Tables(0).Rows(0)("Olddebcode").ToString
            Session("store") = oj.Getdh(Session("TenDangNhap").ToString()).Tables(0).Rows(0)("Sdf").ToString
            Session("storename") = oj.Getdh(Session("TenDangNhap").ToString()).Tables(0).Rows(0)("Diengiai").ToString
            Session("ck") = oj.Getdh(Session("TenDangNhap").ToString()).Tables(0).Rows(0)("Discount")
            Session("Tax") = oj.Getdh(Session("TenDangNhap").ToString()).Tables(0).Rows(0)("Tax")
        End If

        If Session("Manpp") Is Nothing Or Session("storename") Is Nothing Then
            Dim builder As New StringBuilder()
            builder.Append("<script language=JavaScript> ShowNppss(); </script>" & vbLf)
            Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())
        Else

            Dim dt1 As New DataTable()
            dt1 = DirectCast(Session("cart"), DataTable)
            ggiohang.DataSource = dt1
            ggiohang.DataBind()
            ggiohang1.DataSource = dt1
            ggiohang1.DataBind()
            npp.Text = DB.TenNPP(Session("Manpp").ToString)
            ASPxRoundPanel2.HeaderText = "Thông tin tồn kho của " + Session("storename").ToString
            ld.Text = dt1.Rows.Count.ToString()
            lrbp.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien")))
            lInv.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")))
            ltax.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))
            ltong.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) + ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))

        End If
        'If Session("Manpp") Is Nothing Then
        '    Dim builder As New StringBuilder()
        '    builder.Append("<script language=JavaScript> ShowNppss(); </script>" & vbLf)
        '    Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())

        'End If

        'Dim dt1 As New DataTable()
        'dt1 = DirectCast(Session("cart"), DataTable)
        'ggiohang.DataSource = dt1
        'ggiohang.DataBind()
        'ggiohang1.DataSource = dt1
        'ggiohang1.DataBind()

        'ld.Text = dt1.Rows.Count.ToString()
        'lrbp.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien")))
    End Sub
    Private copiedValues As Hashtable = Nothing
    Private copiedFields() As String = {"Itemcode", "Itemname"}
    Protected Sub grid_CustomButtonCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomButtonCallbackEventArgs) Handles grid.CustomButtonCallback
        Dim dt1 As New DataTable()
        If e.ButtonID <> "DH" Then
            Return
        End If
        'copiedValues = New Hashtable()
        'For Each fieldName As String In copiedFields
        '    copiedValues(fieldName) = grid.GetRowValues(e.VisibleIndex, fieldName)
        'Next fieldName
        'grid.AddNewRow()

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
            For Each dr1 As DataRow In dt1.Rows
                'vong lap lay tat ca cac rong trong bang
                If dr1(0).ToString() = grid.GetRowValues(e.VisibleIndex, "OldItemcode").ToString Then
                    'kiem tra neu san pham vua chon xem co trung voi san pham trong gio hang hay khong
                    If (Convert.ToInt32(dr1(3).ToString()) + grid.GetRowValues(e.VisibleIndex, "Thung")) <= grid.GetRowValues(e.VisibleIndex, "ton") Then
                        dr1(3) = Convert.ToInt32(dr1(3).ToString()) + grid.GetRowValues(e.VisibleIndex, "Thung")
                    Else
                        dr1(3) = Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "ton"))
                    End If
                    'neu ma trung thi so luong se copng them 1
                    dr1(4) = Convert.ToInt32(dr1(2)) * Convert.ToInt32(dr1(3))
                    'dr1(5) = Convert.ToInt32((grid.GetRowValues(e.VisibleIndex, "Price") / 1.1) * (100 - Convert.ToDouble(Session("ck"))) / 100)
                    dr1(6) = dr1(5) * dr1(3)
                    'dr1(7) = Convert.ToDouble(Session("Tax"))
                    dr1(7) = Convert.ToInt32(dr1(6) * Convert.ToDouble(Session("Tax")) / 100)
                    dr1(8) = dr1(7) + dr1(6)
                    'cap nhat lai row thanh tien
                    'gan cho bien kt==true
                    kt = True
                End If
            Next
        End If
        If kt = False Then
            'o day co nghia la chon 1 mon hang dau tien co nghia la khi nguoi dung bat dau mua 1 mon hang

            Dim dr As DataRow = dt1.NewRow()
            'tao 1 doi tuong la dr co nghia la tao 1 rong moi
            dr(0) = grid.GetRowValues(e.VisibleIndex, "OldItemcode").ToString
            'day la gan gia tri vao tung rong dr[0]bat dau tu kai dau tien
            dr(1) = grid.GetRowValues(e.VisibleIndex, "Itemname").ToString
            dr(2) = grid.GetRowValues(e.VisibleIndex, "Price")
            'dr(3) = grid.GetRowValues(e.VisibleIndex, "Thung")
            If (Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "Thung"))) <= Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "ton")) Then
                dr(3) = grid.GetRowValues(e.VisibleIndex, "Thung")
            Else
                dr(3) = Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "ton"))
            End If

            dr(4) = Convert.ToInt32(dr(2)) * Convert.ToInt32(dr(3))
            dr(5) = Convert.ToInt32((grid.GetRowValues(e.VisibleIndex, "Price") / 1.1) * (100 - Convert.ToDouble(Session("ck"))) / 100)
            dr(6) = dr(5) * Convert.ToInt32(dr(3))
            dr(7) = Convert.ToInt32(dr(6) * Convert.ToDouble(Session("Tax")) / 100)
            dr(8) = dr(7) + dr(6)

            dt1.Rows.Add(dr)
            'them rong vao bang
            'gan table do cho session

        End If
        ggiohang.DataSource = dt1
        ggiohang.DataBind()
        ggiohang1.DataSource = dt1
        ggiohang1.DataBind()
        grid.JSProperties("cp") = True
        grid.JSProperties("cps") = dt1.Rows.Count.ToString()
        grid.JSProperties("cprpb") = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien")))
        grid.JSProperties("cpinv") = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")))
        grid.JSProperties("cptax") = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))
        grid.JSProperties("cpfull") = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) + ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))

        'grid.JSProperties("cp1") = "aa" 'ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien")).ToString
    End Sub
    'Protected Sub DataList1_ItemCommand(source As Object, e As DataListCommandEventArgs)
    '    Dim kt As Boolean = False
    '    'TAo bien boolean de kiem? tra xem nguoi dung bat dau mua hay la gi
    '    Dim MaSP As String = DataList1.DataKeys(e.Item.ItemIndex).ToString()
    '    'Day la lay' ID cua? san pham trong kai datalist
    '    dt = DirectCast(Session("cart"), DataTable)
    '    'Gan cho no bang session muc dich get/set gia tri cho row cua datatable
    '    Dim TenSP As String = DB.LayTenSP(Convert.ToString(MaSP))
    '    'Kai nay la lay ten cua san pham dua vao ID san pham
    '    If dt.Rows.Count <> 0 Then
    '        'Check xem gio hang co hang hay chua
    '        For Each dr As DataRow In dt.Rows
    '            'vong lap lay tat ca cac rong trong bang
    '            If dr(0).ToString() = MaSP Then
    '                'kiem tra neu san pham vua chon xem co trung voi san pham trong gio hang hay khong
    '                dr(3) = Convert.ToInt32(dr(3).ToString()) + 1
    '                'neu ma trung thi so luong se copng them 1
    '                dr(4) = Convert.ToInt32(dr(2)) * Convert.ToInt32(dr(3))
    '                'cap nhat lai row thanh tien
    '                'gan cho bien kt==true
    '                kt = True
    '            End If
    '        Next
    '    End If
    '    If kt = False Then
    '        'o day co nghia la chon 1 mon hang dau tien co nghia la khi nguoi dung bat dau mua 1 mon hang

    '        Dim dr As DataRow = dt.NewRow()
    '        'tao 1 doi tuong la dr co nghia la tao 1 rong moi
    '        dr(0) = Convert.ToString(MaSP)
    '        'day la gan gia tri vao tung rong dr[0]bat dau tu kai dau tien
    '        dr(1) = DB.LayTenSP(Convert.ToString(MaSP))
    '        dr(2) = DB.LayGiaSP(Convert.ToString(MaSP))
    '        dr(3) = 1
    '        dr(4) = Convert.ToInt32(dr(2)) * Convert.ToInt32(dr(3))
    '        dt.Rows.Add(dr)
    '        'them rong vao bang
    '        'gan table do cho session
    '        Session("cart") = dt
    '    End If
    '    'lbl_baoloi.Text = dt.Rows.Count.ToString();
    'End Sub



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
                    dr(7) = Convert.ToInt32(dr(6) * Convert.ToDouble(Session("Tax")) / 100)
                    dr(8) = dr(7) + dr(6)
                End If
            Next
        End If
        e.Cancel = True
        ggiohang.CancelEdit()
        ggiohang.DataSource = dt1
        ggiohang.DataBind()
        ggiohang1.DataSource = dt1
        ggiohang1.DataBind()
        'ld.Text = dt1.Rows.Count.ToString()
        'MsgBox(String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien"))))
        'lrbp.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien")))
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
                    dr(7) = Convert.ToInt32(dr(6) * Convert.ToDouble(Session("Tax")) / 100)
                    dr(8) = dr(7) + dr(6)
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
            dr(7) = Convert.ToInt32(dr(6) * Convert.ToDouble(Session("Tax")) / 100)
            dr(8) = dr(7) + dr(6)

            dt1.Rows.Add(dr)
            'them rong vao bang
            'gan table do cho session

        End If
        Session("cart") = dt1
        e.Cancel = True
        ggiohang.CancelEdit()
        ggiohang.DataSource = dt1
        ggiohang.DataBind()
        ggiohang1.DataSource = dt1
        ggiohang1.DataBind()
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
        ggiohang1.DataSource = dt1
        ggiohang1.DataBind()
        'ld.Text = dt1.Rows.Count.ToString()
        'lrbp.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien")))
        'lInv.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")))
        'ltax.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))
        'ltong.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) + ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))

    End Sub

    Protected Sub ggiohang_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs)
        Dim dt1 As New DataTable()
        dt1 = DirectCast(Session("cart"), DataTable)
        ggiohang.DataSource = dt1
        ggiohang.CancelEdit()
        ggiohang.DataBind()
        ggiohang1.DataSource = dt1
        ggiohang1.DataBind()
        'ld.Text = dt1.Rows.Count.ToString()
        'lrbp.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien")))
        'lInv.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")))
        'ltax.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))
        'ltong.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) + ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))

    End Sub

    'Protected Sub ASPxButton1_Click(sender As Object, e As EventArgs) Handles ASPxButton1.Click
    '    'Response.Redirect("~/Dathang/ct_donhang.aspx")
    'End Sub

    'Protected Sub aspxem_Click(sender As Object, e As EventArgs) Handles aspxem.Click
    '    Dim dt1 As New DataTable()
    '    dt1 = DirectCast(Session("cart"), DataTable)
    '    ggiohang.DataSource = dt1
    '    ggiohang.DataBind()
    '    ld.Text = dt1.Rows.Count.ToString()
    'End Sub


    Protected Sub ASPxButton3_Click(sender As Object, e As EventArgs) Handles ASPxButton3.Click
        Session("Manpp") = ASPMnpp.Value
        Session("store") = Kho.Value
        Session("storename") = Kho.Text
        Session("ck") = ASPMnpp.SelectedItem.GetValue("Discount")
        Session("Tax") = ASPMnpp.SelectedItem.GetValue("Tax")
    End Sub

    Protected Sub ASPxButton4_Click(sender As Object, e As EventArgs) Handles ASPxButton4.Click
        Response.Redirect("~/Dathang/Donhang.aspx")
    End Sub

    Protected Sub ASPxBC_Click(sender As Object, e As EventArgs) Handles ASPxBC.Click
        Session("GioHang") = Nothing
        Session("Manpp") = Nothing
        Session("store") = Nothing
        Response.Redirect("~/Dathang/Donhang.aspx")
    End Sub

    Protected Sub CmbCity_Callback(ByVal source As Object, ByVal e As CallbackEventArgsBase)
        SqlDataSource3.DataBind()

        Kho.DataBind()
        Kho.SelectedIndex = 0
    End Sub

    'Protected Sub FillCityCombo(ByVal countryName As String)
    '    If String.IsNullOrEmpty(countryName) Then
    '        Return
    '    End If

    '    Using context = New WorldCitiesContext()
    '        Dim country = context.Countries.SingleOrDefault(Function(c) c.CountryName = countryName)
    '        CmbCity.DataSource = context.Cities.Where(Function(c) c.Country.CountryName = countryName).OrderBy(Function(c) c.CityName).ToList()
    '        CmbCity.DataBind()
    '        CmbCity.Value = country.City.CityName
    '    End Using
    'End Sub

    'Private Sub Page_PreRender1(sender As Object, e As EventArgs) Handles Me.PreRender


    'End Sub

    Private Function taodonhang(Debcode As String, uname As String, inv As Double, rbp As Double, thue As Double, full As Double, kho As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@Debcode", SqlDbType.NVarChar), New SqlParameter("@Username", SqlDbType.NVarChar), New SqlParameter("@Amount", SqlDbType.Money), New SqlParameter("@AmountRBP", SqlDbType.Real), New SqlParameter("@tax", SqlDbType.Real), New SqlParameter("@Amountfull", SqlDbType.Real), New SqlParameter("@Storage", SqlDbType.NVarChar)}
        arrParam(0).Value = Debcode
        arrParam(1).Value = uname
        arrParam(2).Value = inv
        arrParam(3).Value = rbp
        arrParam(4).Value = thue
        arrParam(5).Value = full
        arrParam(6).Value = kho


        Return DB.ThucThiStore_DataSets("taodonhang", arrParam).Tables(0)
    End Function

    
    Private Function taodonhangct(Ordernr As String, Itemcode As String, Price As Double, Qt As Double, ARBP As Double, pi As Double, ai As Double, ta As Double, ful As Double, kh As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@Ordernr", SqlDbType.NVarChar), New SqlParameter("@Itemcode", SqlDbType.NVarChar), New SqlParameter("@Price", SqlDbType.Real), New SqlParameter("@Qt", SqlDbType.Real), New SqlParameter("@ARBP", SqlDbType.Real), New SqlParameter("@PriceIV", SqlDbType.Real), New SqlParameter("@AmountINV", SqlDbType.Real), New SqlParameter("@tax", SqlDbType.Real), New SqlParameter("@AmountFull", SqlDbType.Real), New SqlParameter("@kho", SqlDbType.NVarChar)}
        arrParam(0).Value = Ordernr
        arrParam(1).Value = Itemcode
        arrParam(2).Value = Price
        arrParam(3).Value = Qt
        arrParam(4).Value = ARBP
        arrParam(5).Value = pi
        arrParam(6).Value = ai
        arrParam(7).Value = ta
        arrParam(8).Value = ful
        arrParam(9).Value = kh
        Return DB.ThucThiStore_DataSets("taodonhangct", arrParam).Tables(0)
    End Function

    Protected Sub dathang_Click(sender As Object, e As EventArgs) Handles ASPxButton1.Click
        dt = DirectCast(Session("cart"), DataTable)

        If Session("cart") Is Nothing Then
            Response.Redirect("~/GioHangRong.aspx")
        End If

        Dim num As Integer
        'Getctkmid' NgayBD = CDate(dtset.Tables(0).Rows(0)("DateFrom"))
        Dim dtb As DataTable = taodonhang(Session("Manpp").ToString, Session("TenDangNhap"), dt.Compute("sum(TongTienIv)", ""), dt.Compute("sum(TongTien)", ""), dt.Compute("sum(tax)", ""), dt.Compute("sum(TongTienFul)", ""), Session("store"))
        num = Integer.Parse("0" + dtb.Rows(0)(0))
        If num <> 0 Then
            If dt.Rows.Count <> 0 Then
                For Each r As DataRow In dt.Rows


                    Dim b As Button = TryCast(sender, Button)
                    Dim message As String = String.Empty


                    Dim dts As DataTable = taodonhangct(num.ToString, r("OldItemcode").ToString, CDbl(r("Price")), Convert.ToDouble(r("SoLuong")), Convert.ToDouble(r("TongTien")), Convert.ToDouble(r("Priceiv")), Convert.ToDouble(r("TongTienIv")), Convert.ToDouble(r("tax")), Convert.ToDouble(r("TongTienFul")), Session("store"))
                    Dim num1 As Integer = Integer.Parse("0" + dtb.Rows(0)(0))
                    Dim sb As New StringBuilder()
                    'oj.sendEmail("dong.tranvan@wipro-unza.com", "Thông Báo", body, "") 'sb.ToString()





                Next
            End If
        End If
        Session("GioHang") = Nothing
        Session("GioHang") = Nothing
        Session("Manpp") = Nothing
        Session("store") = Nothing
        Response.Redirect("~/Dathang/Donhang.aspx")
    End Sub

End Class