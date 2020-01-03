Imports SAP.Middleware.Connector
Imports System.Data.SqlClient
Imports DevExpress.Web.ASPxClasses
Imports DevExpress.Web.ASPxGridView
Imports System.Globalization
Imports DevExpress.Web.ASPxEditors
Imports System.IO
Imports DevExpress.Web.ASPxRoundPanel
Imports DevExpress.Data

Public Class Donhang_chitiet
    Inherits AdminPage
    'Dim t As New DataTable()
    Dim DB As New dungchung
    Dim oj As New SSMDATA
    Private _ecc As RfcDestination
    Private _ecc1 As RfcDestination
    Public log As String = ""


    Private Sub Donhang_chitiet_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not IsPostBack Then
            If Session("TenDangNhap") Is Nothing Then
                Dim url As String = Request.Url.AbsoluteUri
                Session("UrlReturn") = url
                Response.Redirect("~/Account/Login.aspx")
            End If
            Dim a As String
            a = DB.thongtinnpp(Request("Sodathang").ToString, Session("TenDangNhap").ToString).Trim
            If a.Length <= 4 Then
                Response.Redirect("~/Dathang/Donhang.aspx")
            End If

            If Request("Sodathang") <> Nothing And Request("Sodathang").ToString.Length > 5 Then


                Try

                    'Dim c As New ECCDestinationConfig()
                    'RfcDestinationManager.RegisterDestinationConfiguration(c)
                    _ecc = RfcDestinationManager.GetDestination("SEQ")
                    Dim repository As RfcRepository = _ecc.Repository

                    'Dim destination As RfcDestination = RfcDestinationManager.GetDestination("SEQ")
                    Dim func As IRfcFunction = repository.CreateFunction("ZBAPI_SALESORDER1")
                    Dim rfcreturn As IRfcStructure = func.GetStructure("RETURN")
                    Dim cd As IRfcTable = func.GetTable("ZSALES")
                    func.SetValue("ZNN", Request("Sodathang").ToString.Trim)
                    'Dim bapiGetCompanyList As IRfcFunction
                    'func.SetValue("Customer_Number", "000120004")
                    ''func.SetValue("Sales_Organization", "2000")

                    'func.SetValue("Document_Date", CDate("10.10.2013"))
                    'func.SetValue("Document_Date_To", CDate("10.10.2015"))
                    'func.SetValue("CUSTOMER_NUMBER", "120035")
                    'func.SetValue("SALES_ORGANIZATION", "2000")
                    'func.SetValue("PURCHASE_ORDER", Request("Sodathang").ToString.Trim)
                    'func.SetParameterActive("DOCUMENT_DATE", False)
                    'func.SetParameterActive("DOCUMENT_DATE_TO", False)
                    'func.SetParameterActive("MATERIAL", False)
                    'func.SetParameterActive("MATERIAL_EVG", False)
                    'func.SetParameterActive("PURCHASE_ORDER", True)
                    'func.SetParameterActive("PURCHASE_ORDER_NUMBER", False)
                    'func.SetParameterActive("TRANSACTION_GROUP", False)

                    func.Invoke(_ecc)


                    Session("donhang") = GetDataTableFromRFCTable2(cd)

                    'Dim view As DataTable = GetDataTableFromRFCTable(cd)
                    'Dim view As IRfcTableView = TryCast(func.GetTable("SALES_ORDERS"), ISupportTableView).DefaultView

                    'RfcDestinationManager.UnregisterDestinationConfiguration(c)
                Catch ex As Exception
                    tennpp.Text = log & "Error " & ex.Message

                End Try
            End If
        End If

        Dim t As DataTable
        t = DirectCast(Session("donhang"), DataTable)
        If t Is Nothing Then
            t.Clear()
            t.Columns.Add(New DataColumn("KUNNR", GetType(String)))
            t.Columns.Add(New DataColumn("NAME1", GetType(String)))
            t.Columns.Add(New DataColumn("POSNR", GetType(String)))
            t.Columns.Add(New DataColumn("VBELN", GetType(String)))
            t.Columns.Add(New DataColumn("FKDAT", GetType(String)))
            t.Columns.Add(New DataColumn("MATNR", GetType(String)))
            t.Columns.Add(New DataColumn("ARKTX", GetType(String)))
            t.Columns.Add(New DataColumn("SPART", GetType(String)))
            t.Columns.Add(New DataColumn("CARTON", GetType(String)))
            t.Columns.Add(New DataColumn("QTY", GetType(Int64)))
            t.Columns.Add(New DataColumn("P_RBP", GetType(Int64)))
            t.Columns.Add(New DataColumn("NET_PRICE", GetType(Int64)))
            t.Columns.Add(New DataColumn("NET_VALE", GetType(Int64)))
            t.Columns.Add(New DataColumn("DISC", GetType(Int64)))
            t.Columns.Add(New DataColumn("N_CUST", GetType(Int64)))
            t.Columns.Add(New DataColumn("STAX", GetType(Int64)))
            t.Columns.Add(New DataColumn("AUART", GetType(String)))
            t.Columns.Add(New DataColumn("REASON", GetType(String)))
            t.Columns.Add(New DataColumn("SD_DOC", GetType(String)))
            t.Columns.Add(New DataColumn("PURCH_NO", GetType(String)))
            t.Columns.Add("dRBP", GetType(Int64))
            t.Columns.Add("dFull", GetType(Int64))
            't.Columns.Add(New DataColumn("A_RBP", GetType(Int32)))
            't.Columns.Add(New DataColumn("sldat", GetType(Int32)))
            't.Columns.Add(New DataColumn("Type", GetType(String)))
            't.Columns.Add(New DataColumn("FULL", GetType(Int64)))
        End If
        If t.Rows.Count = 0 Then
            t.Clear()
            t.Columns.Add(New DataColumn("KUNNR", GetType(String)))
            t.Columns.Add(New DataColumn("NAME1", GetType(String)))
            t.Columns.Add(New DataColumn("POSNR", GetType(String)))
            t.Columns.Add(New DataColumn("VBELN", GetType(String)))
            t.Columns.Add(New DataColumn("FKDAT", GetType(String)))
            t.Columns.Add(New DataColumn("MATNR", GetType(String)))
            t.Columns.Add(New DataColumn("ARKTX", GetType(String)))
            t.Columns.Add(New DataColumn("SPART", GetType(String)))
            t.Columns.Add(New DataColumn("CARTON", GetType(String)))
            t.Columns.Add(New DataColumn("QTY", GetType(Int64)))
            t.Columns.Add(New DataColumn("P_RBP", GetType(Int64)))
            t.Columns.Add(New DataColumn("NET_PRICE", GetType(Int64)))
            t.Columns.Add(New DataColumn("NET_VALE", GetType(Int64)))
            t.Columns.Add(New DataColumn("DISC", GetType(Int64)))
            t.Columns.Add(New DataColumn("N_CUST", GetType(Int64)))
            t.Columns.Add(New DataColumn("STAX", GetType(Int64)))
            t.Columns.Add(New DataColumn("AUART", GetType(String)))
            t.Columns.Add(New DataColumn("REASON", GetType(String)))
            t.Columns.Add(New DataColumn("SD_DOC", GetType(String)))
            t.Columns.Add(New DataColumn("PURCH_NO", GetType(String)))
      
            't.Columns.Add(New DataColumn("A_RBP", GetType(Int32)))
            't.Columns.Add(New DataColumn("sldat", GetType(Int32)))
            't.Columns.Add(New DataColumn("Type", GetType(String)))
            't.Columns.Add(New DataColumn("FULL", GetType(Int64)))
        End If

        Dim s As DataTable = DB.thongtindh(Request("Sodathang").ToString)
        If s.Rows.Count > 0 Then
            'If t.Rows.Count > 0 Then
            For Each d2 As DataRow In s.Rows
                Dim kt As Boolean = False
                Dim sl As Integer
                sl = d2("QuantityBK")
                For Each dr As DataRow In t.Rows

                    If dr("MATNR").ToString.Trim = d2("Itemcode").ToString.Trim Then
                        dr("sldat") = sl
                        dr("dRBP") = dr("P_RBP") * d2("QuantityBK")
                        dr("dFull") = dr("NET_PRICE") * d2("QuantityBK")
                        sl = 0
                        kt = True


                    End If
                Next



                If kt = False Then
                    Dim drs As DataRow = t.NewRow()
                    drs("VBELN") = "000000"
                    drs("MATNR") = d2("Itemcode").ToString.Trim
                    drs("sldat") = d2("QuantityBK")
                    drs("ARKTX") = d2("Itemname")
                    drs("P_RBP") = d2("Price")
                    drs("NET_PRICE") = d2("PriceIV")
                    'drs("N_CUST") = d2("AmountINV")
                    drs("KUNNR") = d2("Debcode").ToString
                    drs("FKDAT") = d2("Dates")
                    drs("NAME1") = d2("Debname")
                    drs("dRBP") = d2("Price") * d2("QuantityBK")
                    drs("dFull") = d2("PriceIV") * d2("QuantityBK")
                    t.Rows.Add(drs)

                End If

            Next

            Dim ResultCount As Integer = t.AsDataView.ToTable(True, "VBELN").Rows.Count

            'End If
            manpp.Text = "<h4>" + t.Rows(0)("KUNNR").ToString + "-" + t.Rows(0)("NAME1").ToString + "</h4> "
            dateS.Text = t.Rows(0)("FKDAT").ToString
            Dim d As GridViewDataColumn
            d = dhs.Columns("VBELN")
            If ResultCount < 2 Then
                d.GroupIndex = -1
            End If
            dhs.DataSource = Session("donhang")
            dhs.DataBind()
        End If

    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("UrlReturn") = Request.Url.ToString().ToLower()
    End Sub
    Protected Sub ASPExport_Click(sender As Object, e As EventArgs) Handles ASPExport.Click
        ASPxGridViewExporter1.WriteXlsxToResponse()
    End Sub

    Public Function GetDataTableFromRFCTable2(ByVal myrfcTable As IRfcTable) As DataTable
        Dim loTable As New DataTable

        Dim liElement As Integer
        For liElement = 0 To myrfcTable.ElementCount - 1
            Dim metadata As RfcElementMetadata = myrfcTable.GetElementMetadata(liElement)
            Dim a As String
            a = metadata.DataType.ToString
            If a = "BCD" And metadata.Name <> "CARTON" Then
                loTable.Columns.Add(New DataColumn(metadata.Name, GetType(Int64)))
            Else
                loTable.Columns.Add(metadata.Name)
            End If

        Next
        loTable.Columns.Add("A_RBP", GetType(Int32))
        loTable.Columns.Add("sldat", GetType(Int32))
        loTable.Columns.Add("Type", GetType(String))
        loTable.Columns.Add("FULL", GetType(Int64))
        loTable.Columns.Add("dRBP", GetType(Int64))
        loTable.Columns.Add("dFull", GetType(Int64))
        For Each Row As IRfcStructure In myrfcTable
            Dim ldr As DataRow = loTable.NewRow()
            For liElement = 0 To myrfcTable.ElementCount - 1
                Dim metadata As RfcElementMetadata = myrfcTable.GetElementMetadata(liElement)
                Dim a As String
                a = metadata.DataType.ToString
                If a = "BCD" And metadata.Name <> "CARTON" Then
                    'loTable.Columns.Add(New DataColumn(metadata.Name, GetType(Int64)))
                    ldr(metadata.Name) = CInt(Row.GetString(metadata.Name))
                ElseIf metadata.Name = "REASON" And Row.GetString(metadata.Name).Contains("U") Then
                    ldr("Type") = "Rejection Chờ xử lý"
                    ldr("STAX") = 0
                    ldr("N_CUST") = 0
                Else
                    ldr(metadata.Name) = Row.GetString(metadata.Name)
                End If
                'ldr("FULL") = ldr("STAX") + ldr("N_CUST")


            Next
            'ldr("AVAIL") = ldr("AVAIL") - DB.laykho(ldr("LGORT"), ldr("MATNR"))
            'If ldr("AVAIL") > 0 Then
            '    loTable.Rows.Add(ldr)
            'End If
            'ldr("Loai") = DB.Layloai(ldr("MATNR"))
            If ldr("N_CUST") > 0 Then

                ldr("A_RBP") = ldr("P_RBP") * ldr("QTY")
            Else
                ldr("A_RBP") = 0
            End If
            ldr("MATNR") = ldr("MATNR").ToString.Trim()
            ldr("FULL") = ldr("STAX") + ldr("N_CUST")
        
            loTable.Rows.Add(ldr)
        Next




        Return loTable
    End Function

    

    Protected Sub dhs_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles dhs.HtmlRowPrepared
 
        If e.RowType = GridViewRowType.Data Then

            Dim sldat As Integer = (IIf(Convert.IsDBNull(e.GetValue("sldat")), 0, e.GetValue("sldat")))



            Dim QTY As Integer = (IIf(Convert.IsDBNull(e.GetValue("QTY")), 0, e.GetValue("QTY")))
            If (sldat - QTY) > 0 Then
                e.Row.ForeColor = System.Drawing.Color.Red
            ElseIf (sldat - QTY) < 0 Then
                e.Row.ForeColor = System.Drawing.Color.Blue
            End If
        End If

    End Sub

    Private Shared Function GetNullable(Of T)(dataobj As Object) As T
        If Convert.IsDBNull(dataobj) Then
            Return Nothing
        Else
            Return CType(dataobj, T)

        End If

    End Function
End Class