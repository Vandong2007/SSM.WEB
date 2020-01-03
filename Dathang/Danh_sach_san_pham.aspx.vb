
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

Public Class Danh_sach_san_pham
    Inherits AdminPage
    'Dim dt1 As New DataTable()
    Dim DB As New dungchung

    Private Sub Danh_sach_san_pham_Init(sender As Object, e As EventArgs) Handles Me.Init
        
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
       
        If Session("Manpp") Is Nothing Then
            Dim builder As New StringBuilder()
            builder.Append("<script language=JavaScript> ShowNppss(); </script>" & vbLf)
            Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())

        End If

        Dim dt1 As New DataTable()
        dt1 = DirectCast(Session("cart"), DataTable)
        ld.Text = dt1.Rows.Count.ToString() + " Tổng Tiền RBP: " + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien")))
        ggiohang.DataSource = dt1
        ggiohang.DataBind()
    End Sub
    Private copiedValues As Hashtable = Nothing
    Private copiedFields() As String = {"Itemcode", "Itemname"}
    Protected Sub grid_CustomButtonCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomButtonCallbackEventArgs)
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
                    dr1(3) = Convert.ToInt32(dr1(3).ToString()) + grid.GetRowValues(e.VisibleIndex, "Thung")
                    'neu ma trung thi so luong se copng them 1
                    dr1(4) = Convert.ToInt32(dr1(2)) * Convert.ToInt32(dr1(3))
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
            dr(3) = grid.GetRowValues(e.VisibleIndex, "Thung")
            dr(4) = Convert.ToInt32(dr(2)) * Convert.ToInt32(dr(3))
            dt1.Rows.Add(dr)
            'them rong vao bang
            'gan table do cho session

        End If
        ggiohang.DataSource = dt1
        ggiohang.DataBind()
        grid.JSProperties("cp") = True
        grid.JSProperties("cps") = dt1.Rows.Count.ToString() + " Tổng Tiền RBP: " + String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien")))


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

                End If
            Next
        End If
        e.Cancel = True
        ggiohang.CancelEdit()
        ggiohang.DataSource = dt1
        ggiohang.DataBind()
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
            dt1.Rows.Add(dr)
            'them rong vao bang
            'gan table do cho session

        End If
        Session("cart") = dt1
        e.Cancel = True
        ggiohang.CancelEdit()
        ggiohang.DataSource = dt1
        ggiohang.DataBind()
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

    End Sub

    Protected Sub ggiohang_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs)
        Dim dt1 As New DataTable()
        dt1 = DirectCast(Session("cart"), DataTable)
        ggiohang.DataSource = dt1
        ggiohang.CancelEdit()
        ggiohang.DataBind()

    End Sub

    Protected Sub ASPxButton1_Click(sender As Object, e As EventArgs) Handles ASPxButton1.Click
        Response.Redirect("~/Dathang/ct_donhang.aspx")
    End Sub

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
End Class