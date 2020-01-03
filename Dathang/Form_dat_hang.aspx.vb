Imports SAP.Middleware.Connector
Imports System.Data.SqlClient
Imports DevExpress.Web.ASPxClasses
Imports DevExpress.Web.ASPxGridView
Imports System.Globalization
Imports DevExpress.Web.ASPxEditors
Imports System.IO
Imports DevExpress.Web.ASPxRoundPanel

Public Class Form_dat_hang
    Inherits AdminPage
    'Dim dt1 As New DataTable()
    Dim DB As New dungchung
    Dim oj As New SSMDATA
    Private _ecc As RfcDestination
    Private _ecc1 As RfcDestination
    Public log As String = ""


    Protected Sub ASPExport_Click(sender As Object, e As EventArgs)
        ASPxGridViewExporter1.WriteXlsxToResponse()
    End Sub


    Public Function GetDataTableFromRFCTable(ByVal myrfcTable As IRfcTable) As DataTable
        Dim loTable As New DataTable
        Dim dtset As DataSet
        Dim liElement As Integer
        For liElement = 0 To myrfcTable.ElementCount - 1
            Dim metadata As RfcElementMetadata = myrfcTable.GetElementMetadata(liElement)
            Dim a As String
            a = metadata.DataType.ToString
            If a = "BCD" Then
                loTable.Columns.Add(New DataColumn(metadata.Name, GetType(Int32)))
            Else
                loTable.Columns.Add(metadata.Name)
            End If
        Next
        loTable.Columns.Add("Loai", GetType(String))
        loTable.Columns.Add("Volumn", GetType(String))
        loTable.Columns.Add("mui", GetType(String))
        loTable.Columns.Add("ssl", GetType(Int32))
        For Each Row As IRfcStructure In myrfcTable
            Dim ldr As DataRow = loTable.NewRow()
            For liElement = 0 To myrfcTable.ElementCount - 1
                Dim metadata As RfcElementMetadata = myrfcTable.GetElementMetadata(liElement)

                ldr(metadata.Name) = Row.GetString(metadata.Name)


            Next
            ldr("ssl") = 1
            ldr("AVAIL") = ldr("AVAIL") - DB.laykho(ldr("LGORT"), ldr("MATNR"))
            If ldr("AVAIL") > 0 Then
                loTable.Rows.Add(ldr)
            End If
            'ldr("Loai") = DB.Layloai(ldr("MATNR"))
            'mui()
            Try
                dtset = DB.themsp(ldr("MATNR"))
                ldr("Loai") = dtset.Tables(0).Rows(0)("Category").ToString
                ldr("VIET_UOM") = ldr("VIET_UOM")
                '+ " - " + dtset.Tables(0).Rows(0)("Barcode").ToString
                ldr("Volumn") = dtset.Tables(0).Rows(0)("Volumn").ToString
                ldr("mui") = dtset.Tables(0).Rows(0)("mui").ToString
            Catch ex As Exception
                ldr("Loai") = ""
                ldr("Volumn") = ""
                ldr("mui") = ""
            End Try
        Next




        Return loTable
    End Function
    Public Function GetDataTableFromRFCTable2(ByVal myrfcTable As IRfcTable) As DataTable
        Dim loTable As New DataTable

        Dim liElement As Integer
        For liElement = 0 To myrfcTable.ElementCount - 1
            Dim metadata As RfcElementMetadata = myrfcTable.GetElementMetadata(liElement)
            Dim a As String
            a = metadata.DataType.ToString
            If a = "BCD" Then
                loTable.Columns.Add(New DataColumn(metadata.Name, GetType(Int32)))
            Else
                loTable.Columns.Add(metadata.Name)
            End If
        Next

        For Each Row As IRfcStructure In myrfcTable
            Dim ldr As DataRow = loTable.NewRow()
            For liElement = 0 To myrfcTable.ElementCount - 1
                Dim metadata As RfcElementMetadata = myrfcTable.GetElementMetadata(liElement)

                ldr(metadata.Name) = Row.GetString(metadata.Name)


            Next
            ldr("AVAIL") = ldr("AVAIL") - DB.laykho(ldr("LGORT"), ldr("MATNR"))
            If ldr("AVAIL") > 0 Then
                loTable.Rows.Add(ldr)
            End If
            'ldr("Loai") = DB.Layloai(ldr("MATNR"))
            'mui()

        Next




        Return loTable
    End Function
    Public Function checkton(masp As String) As Integer

        Try

            'Dim c As New ECCDestinationConfig()
            'RfcDestinationManager.RegisterDestinationConfiguration(c)
            _ecc = RfcDestinationManager.GetDestination("SEQ")
            Dim repository As RfcRepository = _ecc.Repository


            'Dim destination As RfcDestination = RfcDestinationManager.GetDestination("SEQ")
            Dim func As IRfcFunction = repository.CreateFunction("ZBAPI_SD_ATP")
            Dim rfcreturn As IRfcStructure = func.GetStructure("RETURN")
            Dim cd As IRfcTable = func.GetTable("ZINV")
            'Dim bapiGetCompanyList As IRfcFunction
            'func.SetValue("Customer_Number", "000120004")
            'func.SetValue("Sales_Organization", "2000")

            'func.SetValue("Document_Date", CDate("10.10.2013"))
            'func.SetValue("Document_Date_To", CDate("10.10.2015"))
            func.SetValue("Z_LGORT", Session("store").ToString)
            func.SetValue("Z_WERKS", "VSIP")
            func.SetValue("Z_KUNNR", "0000" + Session("Manpp").ToString)
            func.SetValue("Z_MATNR", masp)
            func.Invoke(_ecc)


            Dim view As DataTable = GetDataTableFromRFCTable2(cd)
            Return CInt(view.Rows(0)("AVAIL"))
            'Dim view As DataTable = GetDataTableFromRFCTable(cd)
            'Dim view As IRfcTableView = TryCast(func.GetTable("SALES_ORDERS"), ISupportTableView).DefaultView

            'RfcDestinationManager.UnregisterDestinationConfiguration(c)
        Catch ex As Exception
            'TextBox1.Text = log & "Error " & ex.Message
            Return 0

        End Try
    End Function
     

    Private Sub Form_dat_hang_Init(sender As Object, e As EventArgs) Handles Me.Init

        If Session("TenDangNhap") Is Nothing Then
            Dim url As String = Request.Url.AbsoluteUri
            Session("UrlReturn") = url
            Response.Redirect("~/Account/Login.aspx")
            'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirectMe", "alert(' đổi mật khẩu  !');location.href='~/Account/Login.aspx", True)
            'Response.Redirect(If(Request.QueryString("ReturnUrl"), "~/Account/Login.aspx"))
        End If
        If Not IsPostBack Then
            'End If

            Dim ad As DataSet
            ad = oj.Getq(Session("TenDangNhap").ToString())
            dh = Convert.ToBoolean(ad.Tables(0).Rows(0)("dh"))
            pb = oj.Getpb(Session("TenDangNhap").ToString())

            If dh = False Then
                Response.Redirect("~/Dathang/Donhang.aspx")
            End If

            If pb = "ADMINSD" Then
                Dim dtset As DataSet
                dtset = oj.Getdh(Session("TenDangNhap").ToString())
                If dtset.Tables(0).Rows.Count = 1 Then
                    Session("Manpp") = dtset.Tables(0).Rows(0)("Olddebcode").ToString
                    Session("store") = dtset.Tables(0).Rows(0)("Sdf").ToString
                    Session("storename") = dtset.Tables(0).Rows(0)("Diengiai").ToString
                    Session("ck") = dtset.Tables(0).Rows(0)("Discount")
                    Session("Tax") = dtset.Tables(0).Rows(0)("Tax")
                    Session("ch") = dtset.Tables(0).Rows(0)("channel")
                End If
            End If
            If Session("Manpp") Is Nothing Or Session("storename") Is Nothing Then
                Dim builder As New StringBuilder()
                builder.Append("<script language=JavaScript> ShowNppss(); </script>" & vbLf)
                Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())
            End If
            If DB.dem(Session("Manpp")) >= 3 Then
                Dim builder As New StringBuilder()
                builder.Append("<script language=JavaScript> Showtb(); </script>" & vbLf)
                Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())
            Else


                If Session("t") Is Nothing Then
                    Session("er") = Nothing
                    Try

                        'Dim c As New ECCDestinationConfig()
                        'RfcDestinationManager.RegisterDestinationConfiguration(c)
                        _ecc = RfcDestinationManager.GetDestination("SEQ")
                        Dim repository As RfcRepository = _ecc.Repository


                        'Dim destination As RfcDestination = RfcDestinationManager.GetDestination("SEQ")
                        Dim func As IRfcFunction = repository.CreateFunction("ZBAPI_SD_ATP")
                        Dim rfcreturn As IRfcStructure = func.GetStructure("RETURN")
                        Dim cd As IRfcTable = func.GetTable("ZINV")

                        func.SetValue("Z_LGORT", Session("store").ToString)
                        func.SetValue("Z_WERKS", "VSIP")
                        func.SetValue("Z_KUNNR", "0000" + Session("Manpp").ToString)
                        func.SetValue("Z_MATNR", "AL")
                        func.Invoke(_ecc)


                        Session("tons") = GetDataTableFromRFCTable(cd)
                        Dim templateContainer As RoundPanelHeaderTemplateContainer = FindTemplateContainer(DirectCast(ASPxRoundPanel2, Control).Controls)
                        Dim label As Label = DirectCast(templateContainer.FindControl("Label1"), Label)
                        label.Text = "Thông tin tồn kho của " + Session("storename").ToString

                    Catch ex As Exception
                        'TextBox1.Text = log & "Error " & ex.Message

                    End Try
                End If
                End If

        End If
        Dim tonkho As New DataTable()
        tonkho = DirectCast(Session("tons"), DataTable)
        grid.DataSource = tonkho

        'grid.DataSource = Session("tons")
        grid.DataBind()
        ld.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.VisibleRowCount())
        lrbp.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien")))
        lInv.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")))
        ltax.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))
        ltong.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) + ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))

        erro.Text = Session("er")
        'grid.DataSource = Session("tons")
        'grid.DataBind()
    End Sub

    Private Function FindTemplateContainer(controls As ControlCollection) As RoundPanelHeaderTemplateContainer
        For Each control As Control In controls
            If TypeOf control Is RoundPanelHeaderTemplateContainer Then
                Return DirectCast(control, RoundPanelHeaderTemplateContainer)
            Else
                Dim child As RoundPanelHeaderTemplateContainer = FindTemplateContainer(control.Controls)
                If child IsNot Nothing Then
                    Return child
                End If
            End If
        Next
        Return Nothing
    End Function
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dhss As New DataTable()
        If Session("cart") Is Nothing Then

            dhss.Columns.Add(New DataColumn("OldItemcode", GetType(String)))
            Dim primaryKey(1) As DataColumn
            primaryKey(1) = dhss.Columns("OldItemcode")
            dhss.PrimaryKey = primaryKey
            dhss.Columns.Add(New DataColumn("Itemname", GetType(String)))
            dhss.Columns.Add(New DataColumn("Price", GetType(Single)))
            dhss.Columns.Add(New DataColumn("SoLuong", GetType(Int32)))
            dhss.Columns.Add(New DataColumn("TongTien", GetType(Single)))
            dhss.Columns.Add(New DataColumn("Priceiv", GetType(Single)))
            dhss.Columns.Add(New DataColumn("TongTienIv", GetType(Single)))
            dhss.Columns.Add(New DataColumn("tax", GetType(Single)))
            dhss.Columns.Add(New DataColumn("TongTienFul", GetType(Single)))
            Session("cart") = dhss
        Else
            dhss = DirectCast(Session("cart"), DataTable)
        End If
        If Session("Manpp") Is Nothing Or Session("storename") Is Nothing Then
            'Dim builder As New StringBuilder()
            'builder.Append("<script language=JavaScript> ShowNppss(); </script>" & vbLf)
            'Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())
        Else
            If DB.dem(Session("Manpp")) >= 3 Then
                Dim builder As New StringBuilder()
                builder.Append("<script language=JavaScript> Showtb(); </script>" & vbLf)
                Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())
            Else


               
                Dim tonkho As New DataTable()
                'tonkho = DirectCast(Session("tons"), DataTable)
                'grid.DataSource = tonkho
                'grid.DataBind()
                ggiohang.DataSource = dhss
                ggiohang.DataBind()
                ggiohang1.DataSource = dhss
                ggiohang1.DataBind()
                npp.Text = DB.TenNPP(Session("Manpp").ToString)


          

                'ASPxRoundPanel2.HeaderText = "Thông tin tồn kho của " + Session("storename").ToString
                'ld.Text = dt1.Rows.Count.ToString()
                ld.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.VisibleRowCount())
                lrbp.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien")))
                lInv.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")))
                ltax.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))
                ltong.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) + ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))
                'Dim dt2 As New DataTable()


                'dt2 = DirectCast(Session("tons"), DataTable)
                'Dim i As Integer
                'i = Convert.ToInt32(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien")))
                'If dt2.Rows.Count <> 0 And i > 0 Then
                '    'Check xem gio hang co hang hay chua
                '    For Each dr2 As DataRow In dt2.Rows
                '        'vong lap lay tat ca cac rong trong bang
                '        If dr2(1).ToString() = ggiohang.GetRowValues(ggiohang.FindVisibleIndexByKeyValue(dr2(1).ToString()), "OldItemcode").ToString Then
                '            'kiem tra neu san pham vua chon xem co trung voi san pham trong gio hang hay khong
                '            dr2(3) = dr2(3) - ggiohang.GetRowValues(ggiohang.FindVisibleIndexByKeyValue(dr2(1)), "SoLuong")

                '        End If
                '    Next
                'End If

                'Session("tons") = dt2
                End If
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
 
    Protected Sub grid_CustomButtonCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomButtonCallbackEventArgs) Handles grid.CustomButtonCallback
        Dim dt1 As New DataTable()
        If e.ButtonID <> "DH" Then
            Return
        End If
        Dim gridview As ASPxGridView = DirectCast(sender, ASPxGridView)
        Dim ssa As ASPxSpinEdit = DirectCast(GridView.FindRowCellTemplateControl(e.VisibleIndex, TryCast(grid.Columns("ssl"), GridViewDataColumn), "sl"), ASPxSpinEdit)
        Dim classID As Integer = Integer.Parse(ssa.Text.ToString())
        If Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "AVAIL")) <> 0 Then

            'Dim ASPxLabel1 As ASPxSpinEdit = DirectCast(grid.FindRowCellTemplateControlByKey(e.key(0), TryCast(grid.Columns("ssl"), GridViewDataColumn), "sl"), ASPxSpinEdit)


            'Dim gridview As ASPxGridView = DirectCast(sender, ASPxGridView)
            'Dim ASPxSpinEdit As ASPxSpinEdit = DirectCast(gridview.FindControl("sl"), ASPxSpinEdit)

            'Dim classID As Integer = Integer.Parse(ASPxSpinEdit.Text.ToString())
            Dim dt2 As New DataTable()


            dt2 = DirectCast(Session("tons"), DataTable)


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
                    If dr1(0).ToString() = grid.GetRowValues(e.VisibleIndex, "MATNR").ToString Then
                        'kiem tra neu san pham vua chon xem co trung voi san pham trong gio hang hay khong
                        Dim sl As Integer
                        If (Convert.ToInt32(dr1(3).ToString()) + grid.GetRowValues(e.VisibleIndex, "CARTON") * Convert.ToInt32(classID)) <= grid.GetRowValues(e.VisibleIndex, "AVAIL") Then
                            sl = grid.GetRowValues(e.VisibleIndex, "CARTON") * Convert.ToInt32(classID)
                        Else

                            'Response.Write("<script LANGUAGE='JavaScript' >alert('số lượng đặt vượt quá tồn kho ')</script>")
                            sl = Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "AVAIL"))
                            grid.JSProperties("cpMessage") = "Số lượng trong kho còn: " + sl.ToString
                        End If
                        dr1(3) = dr1(3) + sl
                        'neu ma trung thi so luong se copng them 1
                        dr1(4) = Convert.ToInt32(dr1(2)) * Convert.ToInt32(dr1(3))
                        'dr1(5) = Convert.ToInt32((grid.GetRowValues(e.VisibleIndex, "Price") / 1.1) * (100 - Convert.ToDouble(Session("ck"))) / 100)
                        dr1(6) = dr1(5) * dr1(3)
                        'dr1(7) = Convert.ToDouble(Session("Tax"))
                        dr1(7) = Convert.ToInt32(dr1(6) * Convert.ToDouble(Session("Tax")) / 100)
                        dr1(8) = dr1(7) + dr1(6)
                        'cap nhat lai row thanh tien
                        'gan cho bien kt==true

                        If dt2.Rows.Count <> 0 Then
                            'Check xem gio hang co hang hay chua
                            For Each dr2 As DataRow In dt2.Rows
                                'vong lap lay tat ca cac rong trong bang
                                If dr2(1).ToString() = grid.GetRowValues(e.VisibleIndex, "MATNR").ToString Then
                                    'kiem tra neu san pham vua chon xem co trung voi san pham trong gio hang hay khong
                                    dr2(3) = dr2(3) - sl
                                    Exit For
                                End If
                            Next
                        End If

                        kt = True
                    End If
                Next
            End If
            If kt = False Then
                'o day co nghia la chon 1 mon hang dau tien co nghia la khi nguoi dung bat dau mua 1 mon hang

                Dim dr As DataRow = dt1.NewRow()
                If Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "P_INV")) > 0 Then


                    'tao 1 doi tuong la dr co nghia la tao 1 rong moi
                    dr(0) = grid.GetRowValues(e.VisibleIndex, "MATNR").ToString
                    'day la gan gia tri vao tung rong dr[0]bat dau tu kai dau tien
                    dr(1) = grid.GetRowValues(e.VisibleIndex, "VIET_UOM").ToString
                    dr(2) = grid.GetRowValues(e.VisibleIndex, "P_RBP")
                    'dr(3) = grid.GetRowValues(e.VisibleIndex, "CARTON")
                    'If (Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "CARTON")) * Convert.ToInt32(classID)) <= Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "AVAIL")) Then
                    '    dr(3) = grid.GetRowValues(e.VisibleIndex, "CARTON") * Convert.ToInt32(classID)
                    'Else
                    '    dr(3) = Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "AVAIL"))
                    'End If
                    Dim sl As Integer
                    If (Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "CARTON")) * Convert.ToInt32(classID)) <= Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "AVAIL")) Then
                        sl = Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "CARTON")) * Convert.ToInt32(classID)
                    Else

                        sl = Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "AVAIL"))
                        grid.JSProperties("cpMessage") = "Số lượng trong kho còn: " + sl.ToString
                    End If
                    dr(3) = sl

                    dr(4) = Convert.ToInt32(dr(2)) * Convert.ToInt32(dr(3))
                    dr(5) = Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "P_INV"))
                    dr(6) = dr(5) * Convert.ToInt32(dr(3))
                    dr(7) = Convert.ToInt32(dr(6) * Convert.ToDouble(Session("Tax")) / 100)
                    dr(8) = dr(7) + dr(6)


                    If dt2.Rows.Count <> 0 Then
                        'Check xem gio hang co hang hay chua
                        For Each dr2 As DataRow In dt2.Rows
                            'vong lap lay tat ca cac rong trong bang
                            If dr2(1).ToString() = grid.GetRowValues(e.VisibleIndex, "MATNR").ToString Then
                                'kiem tra neu san pham vua chon xem co trung voi san pham trong gio hang hay khong
                                dr2(3) = dr2(3) - sl
                                Exit For
                            End If
                        Next
                    End If
                    dt1.Rows.Add(dr)
                    'them rong vao bang
                    'gan table do cho session
                End If
            End If
            Session("tons") = dt2

            grid.DataSource = Session("tons")
            grid.DataBind()
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
        Else
            grid.JSProperties("cpMessage") = "Số lượng trong kho đã hết "
            Return
        End If
        'grid.JSProperties("cp1") = "aa" 'ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien")).ToString
    End Sub
    


    Protected Sub ggiohang_RowUpdating(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs) Handles ggiohang.RowUpdating
        Dim dt1 As New DataTable()
        dt1 = DirectCast(Session("cart"), DataTable)
        Dim dt2 As New DataTable()
        dt2 = DirectCast(Session("tons"), DataTable)
        Dim sl As Integer
        If dt1.Rows.Count <> 0 Then
            'Check xem gio hang co hang hay chua
            For Each dr As DataRow In dt1.Rows
                sl = e.NewValues("SoLuong") - dr(3)

                Dim s As Integer
                s = grid.GetRowValues(grid.FindVisibleIndexByKeyValue(dr(0).ToString()), "AVAIL")

                'vong lap lay tat ca cac rong trong bang
                If dr(0).ToString() = e.NewValues("OldItemcode").ToString And Convert.ToInt32(e.NewValues("SoLuong")) > 0 And sl <> 0 And sl <= s Then
                    'kiem tra neu san pham vua chon xem co trung voi san pham trong gio hang hay khong
                    s = s - sl
                    If dt2.Rows.Count <> 0 And sl <> 0 Then
                        'Check xem gio hang co hang hay chua
                        For Each dr2 As DataRow In dt2.Rows
                            'vong lap lay tat ca cac rong trong bang
                            If dr2(1).ToString() = e.NewValues("OldItemcode").ToString Then
                                'kiem tra neu san pham vua chon xem co trung voi san pham trong gio hang hay khong
                                dr2(3) = s
                                Exit For
                            End If
                        Next
                    End If
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
        Session("tons") = dt2
        Session("cart") = dt1
        grid.DataSource = Session("tons")
        grid.DataBind()
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
            dr(5) = Convert.ToInt32((Convert.ToInt32(e.NewValues("Priceiv"))))
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
        Dim dt2 As New DataTable()
        dt2 = DirectCast(Session("tons"), DataTable)
        'Dim row As DataRow = DirectCast(Session("cart"), DataTable).Rows.Find(e.Keys("MATNR"))
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
                        If dt2.Rows.Count <> 0 Then
                            'Check xem gio hang co hang hay chua
                            For Each dr2 As DataRow In dt2.Rows
                                'vong lap lay tat ca cac rong trong bang
                                If dr2(1).ToString() = e.Values("OldItemcode").ToString Then
                                    'kiem tra neu san pham vua chon xem co trung voi san pham trong gio hang hay khong
                                    dr2(3) = dr2(3) + e.Values("SoLuong")

                                End If
                            Next
                        End If
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
        Session("tons") = dt2

        grid.DataSource = Session("tons")
        grid.DataBind()
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
        grid.DataSource = Session("tons")
        grid.DataBind()
        ggiohang.JSProperties("cpss") = True
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
        ASPxRoundPanel2.HeaderText = "Thông tin tồn kho của " + Session("storename").ToString
        Session("ck") = ASPMnpp.SelectedItem.GetValue("Discount")
        Session("Tax") = ASPMnpp.SelectedItem.GetValue("Tax")
        npp.Text = ASPMnpp.SelectedItem.GetValue("Debname")
        Session("ch") = ASPMnpp.SelectedItem.GetValue("Channel")
        Try

            'Dim c As New ECCDestinationConfig()
            'RfcDestinationManager.RegisterDestinationConfiguration(c)
            _ecc = RfcDestinationManager.GetDestination("SEQ")
            Dim repository As RfcRepository = _ecc.Repository

            'Dim bapiGetCompanyList As IRfcFunction = repository.CreateFunction("BAPI_COMPANY_GETLIST")
            'Dim bapiGetCompanyDETAIL As IRfcFunction = repository.CreateFunction("BAPI_COMPANY_GETDETAIL")

            'bapiGetCompanyList.Invoke(_ecc)
            'Dim companytable As IRfcTable = bapiGetCompanyList.GetTable("Company_List")
            ''Dim rfcreturn As IRfcStructure = bapiGetCompanyList.GetStructure("RETURN")
            ''Dim dr As DataRow = afile.NewRow
            'Dim afile As DataTable = GetDataTableFromRFCTable(companytable)
            'For companyptr As Integer = 0 To companytable.RowCount - 1
            '    companytable.CurrentIndex = companyptr
            '    log = log & vbCrLf & companytable.GetString("COMPANY") & " " & companytable.GetString("NAME1")
            '    'dr("COMPANY") = companytable.GetString("COMPANY")
            '    'dr("NAME1") = companytable.GetString("NAME1")
            '    'afile.Rows.Add(dr)
            'Next
            'TextBox1.Text = log
            'GridView1.DataSource = afile
            'GridView1.DataBind()

            ''Dim destination As RfcDestination = RfcDestinationManager.GetDestination("SEQ")
            'Dim func As IRfcFunction = repository.CreateFunction("BAPI_SALESORDER_GETLIST")
            'Dim rfcreturn As IRfcStructure = func.GetStructure("RETURN")
            'Dim cd As IRfcTable = func.GetTable("SALES_ORDERS")
            ''Dim bapiGetCompanyList As IRfcFunction
            ''func.SetValue("Customer_Number", "000120004")
            ''func.SetValue("Sales_Organization", "2000")

            ''func.SetValue("Document_Date", CDate("10.10.2013"))
            ''func.SetValue("Document_Date_To", CDate("10.10.2015"))
            'func.SetValue("CUSTOMER_NUMBER", "0000120111")
            'func.SetValue("SALES_ORGANIZATION", "2000")
            'func.Invoke(_ecc)


            'Dim destination As RfcDestination = RfcDestinationManager.GetDestination("SEQ")
            Dim func As IRfcFunction = repository.CreateFunction("ZBAPI_SD_ATP")
            Dim rfcreturn As IRfcStructure = func.GetStructure("RETURN")
            Dim cd As IRfcTable = func.GetTable("ZINV")
            'Dim bapiGetCompanyList As IRfcFunction
            'func.SetValue("Customer_Number", "000120004")
            'func.SetValue("Sales_Organization", "2000")

            'func.SetValue("Document_Date", CDate("10.10.2013"))
            'func.SetValue("Document_Date_To", CDate("10.10.2015"))
            func.SetValue("Z_LGORT", Session("store").ToString)
            func.SetValue("Z_WERKS", "VSIP")
            func.SetValue("Z_KUNNR", "0000" + Session("Manpp").ToString)
            func.SetValue("Z_MATNR", "AL")
            func.Invoke(_ecc)


            Session("tons") = GetDataTableFromRFCTable(cd)
            'dhss.Clear()
            'Session("cart") = dhss
            'Dim view As DataTable = GetDataTableFromRFCTable(cd)
            'Dim view As IRfcTableView = TryCast(func.GetTable("SALES_ORDERS"), ISupportTableView).DefaultView

            'RfcDestinationManager.UnregisterDestinationConfiguration(c)
        Catch ex As Exception
            'TextBox1.Text = log & "Error " & ex.Message

        End Try

        grid.DataSource = Session("tons")
        grid.DataBind()
    End Sub

    Protected Sub ASPxButton4_Click(sender As Object, e As EventArgs) Handles ASPxButton4.Click
        Response.Redirect("~/Dathang/Donhang.aspx")
    End Sub

    Protected Sub ASPxBC_Click(sender As Object, e As EventArgs) Handles ASPxBC.Click
        Session("GioHang") = Nothing
        Session("Manpp") = Nothing
        Session("store") = Nothing
        'dt.Clear()
        Session("er") = Nothing
        Session("cart") = Nothing
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


    Private Function taodonhangct(Ordernr As String, Itemcode As String, Price As Double, Qt As Double, ARBP As Double, pi As Double, ai As Double, ta As Double, ful As Double, kh As String, note As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@Ordernr", SqlDbType.NVarChar), New SqlParameter("@Itemcode", SqlDbType.NVarChar), New SqlParameter("@Price", SqlDbType.Real), New SqlParameter("@Qt", SqlDbType.Real), New SqlParameter("@ARBP", SqlDbType.Real), New SqlParameter("@PriceIV", SqlDbType.Real), New SqlParameter("@AmountINV", SqlDbType.Real), New SqlParameter("@tax", SqlDbType.Real), New SqlParameter("@AmountFull", SqlDbType.Real), New SqlParameter("@kho", SqlDbType.NVarChar), New SqlParameter("@note", SqlDbType.NVarChar)}
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
        arrParam(10).Value = note
        Return DB.ThucThiStore_DataSets("taodonhangct", arrParam).Tables(0)
    End Function

    Protected Sub dathang_Click(sender As Object, e As EventArgs) Handles ASPxButton1.Click
        dt = DirectCast(Session("cart"), DataTable)
        Dim sd As Integer
        If Session("cart") Is Nothing Then
            Response.Redirect("~/Dathang/Donhang.aspx")
        End If
        If Session("ch") = "MT" Then
            sd = 15000000
        Else
            sd = 60000000
        End If
        If dt.Compute("sum(TongTienIv)", "") >= sd Then


            Dim num As Integer
            'Getctkmid' NgayBD = CDate(dtset.Tables(0).Rows(0)("DateFrom"))
            Dim dtb As DataTable = taodonhang(Session("Manpp").ToString, Session("TenDangNhap"), dt.Compute("sum(TongTienIv)", ""), dt.Compute("sum(TongTien)", ""), dt.Compute("sum(tax)", ""), dt.Compute("sum(TongTienFul)", ""), Session("store"))
            num = Integer.Parse("0" + dtb.Rows(0)(0))
            If num <> 0 Then
                If dt.Rows.Count <> 0 Then
                    For Each r As DataRow In dt.Rows

                        Dim sa As Integer = checkton(r("OldItemcode").ToString)
                        'Dim b As Button = TryCast(sender, Button)
                        Dim message As String = String.Empty
                        If sa >= r("SoLuong") Then
                            Dim dts As DataTable = taodonhangct(num.ToString, r("OldItemcode").ToString, CDbl(r("Price")), Convert.ToDouble(r("SoLuong")), Convert.ToDouble(r("TongTien")), Convert.ToDouble(r("Priceiv")), Convert.ToDouble(r("TongTienIv")), Convert.ToDouble(r("tax")), Convert.ToDouble(r("TongTienFul")), Session("store"), "")
                            Dim num1 As Integer = Integer.Parse("0" + dtb.Rows(0)(0))

                            'oj.sendEmail("dong.tranvan@WIPRO CONSUMER CARE.com", "Thông Báo", body, "") 'sb.ToString()
                        ElseIf sa < r("SoLuong") And sa > 0 Then
                            Dim dts As DataTable = taodonhangct(num.ToString, r("OldItemcode").ToString, CDbl(r("Price")), Convert.ToDouble(sa), Convert.ToDouble(sa * CDbl(r("Price"))), Convert.ToDouble(r("Priceiv")), Convert.ToDouble(sa * Convert.ToDouble(r("Priceiv"))), Convert.ToInt64((Convert.ToDouble(Session("Tax")) / 100) * sa * Convert.ToDouble(r("Priceiv"))), Convert.ToInt64((Convert.ToDouble(Session("Tax")) / 100) * sa * Convert.ToDouble(r("Priceiv"))) + Convert.ToDouble(sa * Convert.ToDouble(r("Priceiv"))), Session("store"), "tồn kho hết, số lượng đặt:" + r("SoLuong").ToString)
                            Dim num1 As Integer = Integer.Parse("0" + dtb.Rows(0)(0))

                        End If



                    Next
                End If
                Dim oj As New SSMDATA
                'Dim sb As New StringBuilder()
                Dim read As New StreamReader(Server.MapPath("~/Dathang/Email.htm"))
                Dim body As String = read.ReadToEnd()
                Dim rbp As String, ivce As String
                rbp = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(dt.Compute("sum(TongTien)", "")).ToString)
                ivce = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(dt.Compute("sum(TongTienFul)", "")).ToString)
                read.Close()
                'Dim mail As New SendEmail()
                body = String.Format(body, num.ToString, Session("Manpp").ToString + "-" + DB.diachi(Session("Manpp").ToString).Tables(0).Rows(0)("Debname").ToString + " Địa Chỉ: " + DB.diachi(Session("Manpp").ToString).Tables(0).Rows(0)("Debadd").ToString, rbp, ivce)
                guimail(num.ToString)
                Dim a As DataTable


                a = getmail(Session("Manpp").ToString, "SALESUP;SALES HEAD;CS;ADMINSD", Session("store"))
                If a.Rows.Count > 0 Then
                    'oj.sendEmail("dong.tranvan@WIPRO CONSUMER CARE.com", "[WCCVL] Đơn đặt hàng", body, Server.MapPath("ExcelTemplates/don_dat_hang_" + num.ToString + ".xls").ToString) 'sb.ToString()

                    For Each dr As DataRow In a.Rows
                        'vong lap lay tat ca cac rong trong bang
                        If dr("email").ToString() <> "" Then

                            'If dr("MaPhongban").ToString() = "CS" Then
                            'email = email + dr("email").ToString() + ","
                            'If dr("MaPhongban").ToString() = "ADMINSD" Then
                            '    oj.sendEmail(dr("email").ToString(), "[WCCVL] Đơn đặt hàng của bạn", body, Server.MapPath("ExcelTemplates/don_dat_hang_" + num.ToString + ".xls").ToString) 'sb.ToString()
                            'Else
                            '    oj.sendEmail(dr("email").ToString(), "[WCCVL] Đơn đặt hàng của :" + dr("Debname").ToString(), body, Server.MapPath("ExcelTemplates/don_dat_hang_" + num.ToString + ".xls").ToString) 'sb.ToString()

                            'End If
                            If dr("MaPhongban").ToString() = "ADMINSD" Or dr("MaPhongban").ToString() = "SALESUP" Then
                                oj.sendEmail(dr("email").ToString(), "[WCCVL] Đơn đặt hàng của bạn", body, Server.MapPath("ExcelTemplates/don_dat_hang_" + num.ToString + ".xls").ToString) 'sb.ToString()
                            Else
                                oj.sendEmailBkup(dr("email").ToString(), "[WCCVL] Đơn đặt hàng của :" + dr("Debname").ToString(), body, Server.MapPath("ExcelTemplates/don_dat_hang_" + num.ToString + ".xls").ToString) 'sb.ToString()

                            End If

                        End If
                    Next
                End If

            End If
            'Session("cart") = Nothing
            Session("tons") = Nothing
            Session("cart") = Nothing
            Session("GioHang") = Nothing
            'Session("GioHang") = Nothing
            Session("Manpp") = Nothing
            Session("store") = Nothing
            Response.Redirect("~/Dathang/Donhang.aspx")
        Else

            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirectMe", "alert('Đơn hàng chưa đủ điều kiện tối thiểu!');", True)
            Dim builder As New StringBuilder()
            builder.Append("<script language=JavaScript> function(s, e) {    ghang.Hide();</script>" & vbLf)
            Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())
        End If
    End Sub

    Protected Sub guimail(num As String)


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
            DataSetToExcel(ds, fpath, num.ToString, Session("Manpp").ToString(), DB.TenNPP(Session("Manpp").ToString), DB.diachi(Session("Manpp").ToString).Tables(0).Rows(0)("Debadd").ToString)
        End If



    End Sub
    Private Sub DataSetToExcel(dsExport As DataSet, path As String, tableName1 As String, tableName As String, add As String, region As String)
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
        str += (Convert.ToString("<table ><tr><td align='left'   style='font-size:12px' colspan=3 >") & "CÔNG TY TNHH WIPRO CONSUMER CARE VIỆT NAM") + "</td></tr>"
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
        'If path.Length > 5 Then
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

    Private Function getmail(Debcode As String, pb As String, sto As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@Debcode", SqlDbType.NVarChar), New SqlParameter("@pb", SqlDbType.NVarChar), New SqlParameter("@wh", SqlDbType.NVarChar)}
        arrParam(0).Value = Debcode
        arrParam(1).Value = pb
        arrParam(2).Value = sto

        Return DB.ThucThiStore_DataSets("getsendmail2", arrParam).Tables(0)
    End Function

    Protected Sub ASPxButton5_Click(sender As Object, e As EventArgs) Handles ASPxButton5.Click
        Session("cart") = Nothing
        Session("GioHang") = Nothing
        Session("GioHang") = Nothing
        Session("Manpp") = Nothing
        Session("store") = Nothing
        Session("tons") = Nothing
        Response.Redirect("~/Dathang/Donhang.aspx")
    End Sub


    Protected Sub ASPxButton6_Click(sender As Object, e As EventArgs)
        'Response.Redirect("~/Dathang/ct_donhang.aspx")

        Dim builder As New StringBuilder()
        builder.Append("<script language=JavaScript> ShowPaste(); </script>" & vbLf)
        Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())
    End Sub


    Protected Sub PasteToGridView(sender As Object, e As EventArgs)



        Dim dtq As New DataTable()
        Dim builder As New StringBuilder()
        dtq.Columns.AddRange(New DataColumn(1) {New DataColumn("OldItemcode", GetType(String)), New DataColumn("Soluong", GetType(Int32))})

        Dim copiedContent As String = Request.Form(txtCopied.UniqueID)
        txtCopied.Text = ""
        For Each row As String In copiedContent.Split(ControlChars.Lf)
            If Not String.IsNullOrEmpty(row) Then
                dtq.Rows.Add()
                Dim i As Integer = 0
                For Each cell As String In row.Split(ControlChars.Tab)
                    If i < 2 Then
                        Try
                            If i = 1 And CInt(cell) > 0 Then
                                dtq.Rows(dtq.Rows.Count - 1)(i) = CInt(cell)
                            Else
                                dtq.Rows(dtq.Rows.Count - 1)(i) = cell
                            End If
                        Catch
                        End Try
                    End If

                    i += 1
                Next
            End If
        Next
        copiedContent = ""

        Dim dt12 As New DataTable()

        dt12 = DirectCast(Session("cart"), DataTable)
        Dim kt As Boolean = False
        Dim dt2 As New DataTable()
        dt2 = DirectCast(Session("tons"), DataTable)
        If dtq.Rows.Count > 0 Then
            For Each drt As DataRow In dtq.Rows

                If dt12.Rows.Count > 0 Then

                    For Each dr1 As DataRow In dt12.Rows
                        '= 
                        If dr1(0).ToString() = drt("OldItemcode").ToString Then
                            'kiem tra neu san pham vua chon xem co trung voi san pham trong gio hang hay khong
                            Dim sl As Integer
                            If (Convert.ToInt32(dr1(3).ToString()) + grid.GetRowValues(grid.FindVisibleIndexByKeyValue(drt("OldItemcode").ToString), "CARTON") * Convert.ToInt32(drt("SoLuong"))) <= grid.GetRowValues(grid.FindVisibleIndexByKeyValue(drt("OldItemcode").ToString), "AVAIL") Then
                                sl = grid.GetRowValues(grid.FindVisibleIndexByKeyValue(drt("OldItemcode").ToString), "CARTON") * Convert.ToInt32(drt("SoLuong"))
                            Else

                                'Response.Write("<script LANGUAGE='JavaScript' >alert('số lượng đặt vượt quá tồn kho ')</script>")
                                sl = Convert.ToInt32(grid.GetRowValues(grid.FindVisibleIndexByKeyValue(drt("OldItemcode").ToString), "AVAIL"))

                                builder.Append("  [" + dr1(0) + "] trong kho còn: " + sl.ToString + " Sl đặt: " + (grid.GetRowValues(grid.FindVisibleIndexByKeyValue(drt("OldItemcode").ToString), "CARTON") * Convert.ToInt32(drt("SoLuong"))).ToString & vbLf)


                            End If
                            dr1(3) = dr1(3) + sl
                            'neu ma trung thi so luong se copng them 1
                            dr1(4) = Convert.ToInt32(dr1(2)) * Convert.ToInt32(dr1(3))
                            'dr1(5) = Convert.ToInt32((grid.GetRowValues(e.VisibleIndex, "Price") / 1.1) * (100 - Convert.ToDouble(Session("ck"))) / 100)
                            dr1(6) = dr1(5) * dr1(3)
                            'dr1(7) = Convert.ToDouble(Session("Tax"))
                            dr1(7) = Convert.ToInt32(dr1(6) * Convert.ToDouble(Session("Tax")) / 100)
                            dr1(8) = dr1(7) + dr1(6)
                            'cap nhat lai row thanh tien
                            'gan cho bien kt==true

                            If dt2.Rows.Count <> 0 Then
                                'Check xem gio hang co hang hay chua
                                For Each dr2 As DataRow In dt2.Rows
                                    'vong lap lay tat ca cac rong trong bang
                                    If dr2(1).ToString() = grid.GetRowValues(grid.FindVisibleIndexByKeyValue(drt("OldItemcode").ToString), "MATNR").ToString Then
                                        'kiem tra neu san pham vua chon xem co trung voi san pham trong gio hang hay khong
                                        dr2(3) = dr2(3) - sl
                                        Exit For
                                    End If
                                Next
                            End If

                            kt = True
                        End If
                    Next
                End If
                If kt = False Then
                    'o day co nghia la chon 1 mon hang dau tien co nghia la khi nguoi dung bat dau mua 1 mon hang

                    Dim dr As DataRow = dt12.NewRow()
                    If Convert.ToInt32(grid.GetRowValues(grid.FindVisibleIndexByKeyValue(drt("OldItemcode").ToString), "P_INV")) > 0 Then


                        'tao 1 doi tuong la dr co nghia la tao 1 rong moi
                        dr(0) = grid.GetRowValues(grid.FindVisibleIndexByKeyValue(drt("OldItemcode").ToString), "MATNR").ToString
                        'day la gan gia tri vao tung rong dr[0]bat dau tu kai dau tien
                        dr(1) = grid.GetRowValues(grid.FindVisibleIndexByKeyValue(drt("OldItemcode").ToString), "VIET_UOM").ToString
                        dr(2) = grid.GetRowValues(grid.FindVisibleIndexByKeyValue(drt("OldItemcode").ToString), "P_RBP").ToString
                        'dr(3) = grid.GetRowValues(e.VisibleIndex, "CARTON")
                        'If (Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "CARTON")) * Convert.ToInt32(classID)) <= Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "AVAIL")) Then
                        '    dr(3) = grid.GetRowValues(e.VisibleIndex, "CARTON") * Convert.ToInt32(classID)
                        'Else
                        '    dr(3) = Convert.ToInt32(grid.GetRowValues(e.VisibleIndex, "AVAIL"))
                        'End If
                        Dim sl As Integer
                        If (Convert.ToInt32(grid.GetRowValues(grid.FindVisibleIndexByKeyValue(drt("OldItemcode").ToString), "CARTON")) * Convert.ToInt32(drt("SoLuong"))) <= Convert.ToInt32(grid.GetRowValues(grid.FindVisibleIndexByKeyValue(drt("OldItemcode").ToString), "AVAIL")) Then
                            sl = Convert.ToInt32(grid.GetRowValues(grid.FindVisibleIndexByKeyValue(drt("OldItemcode").ToString), "CARTON")) * Convert.ToInt32(drt("SoLuong"))
                        Else

                            sl = Convert.ToInt32(grid.GetRowValues(grid.FindVisibleIndexByKeyValue(drt("OldItemcode").ToString), "AVAIL"))
                            builder.Append("  [" + dr(0) + "] trong kho còn: " + sl.ToString + " S.l đặt: " + (grid.GetRowValues(grid.FindVisibleIndexByKeyValue(drt("OldItemcode").ToString), "CARTON") * Convert.ToInt32(drt("SoLuong"))).ToString & vbLf)
                            'Dim script As String = "<script type=""text/javascript"">alert('[" + dr(0) + "] Số lượng trong kho còn: " + sl.ToString + "');</script>"
                            'Response.Write(script)
                        End If
                        dr(3) = sl

                        dr(4) = Convert.ToInt32(dr(2)) * Convert.ToInt32(dr(3))
                        dr(5) = Convert.ToInt32(grid.GetRowValues(grid.FindVisibleIndexByKeyValue(drt("OldItemcode").ToString), "P_INV"))
                        dr(6) = dr(5) * Convert.ToInt32(dr(3))
                        dr(7) = Convert.ToInt32(dr(6) * Convert.ToDouble(Session("Tax")) / 100)
                        dr(8) = dr(7) + dr(6)


                        If dt2.Rows.Count <> 0 Then
                            'Check xem gio hang co hang hay chua
                            For Each dr2 As DataRow In dt2.Rows
                                'vong lap lay tat ca cac rong trong bang
                                If dr2(1).ToString() = grid.GetRowValues(grid.FindVisibleIndexByKeyValue(drt("OldItemcode").ToString), "MATNR").ToString Then
                                    'kiem tra neu san pham vua chon xem co trung voi san pham trong gio hang hay khong
                                    dr2(3) = dr2(3) - sl
                                    Exit For
                                End If
                            Next
                        End If
                        dt12.Rows.Add(dr)
                        'them rong vao bang
                        'gan table do cho session
                    End If
                End If
            Next

        Else

            'Return
        End If
        'Session.Remove("cart")
        Session("tons") = dt2
        Session.Item("cart") = dt12
        grid.DataSource = dt2
        grid.DataBind()
        ggiohang.DataSource = dt12
        ggiohang.DataBind()
        ggiohang1.DataSource = dt12
        ggiohang1.DataBind()
        ld.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.VisibleRowCount())
        lrbp.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien")))
        lInv.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")))
        ltax.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))
        ltong.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) + ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))
        'dt1.Clear()
        'dt2.Clear()
        Session("er") = builder.ToString

        erro.Text = Session("er")

        dtq.Clear()

        txtCopied.Text = ""
        Session("t") = 1
        Response.Redirect("~/Dathang/Form_dat_hang.aspx")
    End Sub


   

    Protected Sub ggiohang_CustomButtonCallback(sender As Object, e As ASPxGridViewCustomButtonCallbackEventArgs) Handles ggiohang.CustomButtonCallback
        Dim dt1 As DataTable
        

        dt1 = DirectCast(Session("cart"), DataTable)
        ggiohang.DataSource = dt1
        ggiohang.CancelEdit()
        ggiohang.DataBind()
        ggiohang1.DataSource = dt1
        ggiohang1.DataBind()
        grid.DataSource = Session("tons")
        grid.DataBind()

        ggiohang.JSProperties("cpss") = True
        ld.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.VisibleRowCount())
        lrbp.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTien")))
        lInv.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")))
        ltax.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))
        ltong.Text = String.Format(CultureInfo.InvariantCulture, "{0:0,0}", Convert.ToInt64(ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) + ggiohang.GetTotalSummaryValue(ggiohang.TotalSummary("TongTienIv")) * (Convert.ToDouble(Session("Tax")) / 100)))

        
    End Sub
End Class