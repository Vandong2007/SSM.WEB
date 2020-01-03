Imports SAP.Middleware.Connector
Imports System.Data.SqlClient
Imports DevExpress.Web.ASPxClasses
Imports DevExpress.Web.ASPxGridView
Imports System.Globalization
Imports DevExpress.Web.ASPxEditors
Imports System.IO
'Imports DevExpress.Web.ASPxRoundPanel
Imports DevExpress.Data

Public Class Report
    Inherits AdminPage
    'Dim t As New DataTable()
    Dim DB As New dungchung
    Dim oj As New SSMDATA
    Private _ecc As RfcDestination
    Private _ecc1 As RfcDestination
    Public log As String = ""


    Public Function getp(Sodathang As String) As DataTable
        Dim t As New DataTable

        If Sodathang <> Nothing And Sodathang.ToString.Length > 5 Then


            Try

                'Dim c As New ECCDestinationConfig()
                'RfcDestinationManager.RegisterDestinationConfiguration(c)
                _ecc = RfcDestinationManager.GetDestination("SEQ")
                Dim repository As RfcRepository = _ecc.Repository

                'Dim destination As RfcDestination = RfcDestinationManager.GetDestination("SEQ")
                Dim func As IRfcFunction = repository.CreateFunction("ZBAPI_SALESORDER1")
                Dim rfcreturn As IRfcStructure = func.GetStructure("RETURN")
                Dim cd As IRfcTable = func.GetTable("ZSALES")
                func.SetValue("ZNN", Sodathang)


                func.Invoke(_ecc)

                t = GetDataTableFromRFCTable2(cd)

            Catch ex As Exception


                Response.Write("<script LANGUAGE='JavaScript' >alert('Loi " + Sodathang.ToString + ex.Message.ToString() + "  ')</script>")

            End Try
        End If




        If t Is Nothing Or t.Rows.Count = 0 Then
            t.Reset()
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
            t.Columns.Add(New DataColumn("A_RBP", GetType(Int64)))
            t.Columns.Add(New DataColumn("FULL", GetType(Int64)))
            t.Columns.Add(New DataColumn("NET_PRICE", GetType(Int64)))
            t.Columns.Add(New DataColumn("NET_VALE", GetType(Int64)))
            t.Columns.Add(New DataColumn("DISC", GetType(Int64)))
            t.Columns.Add(New DataColumn("N_CUST", GetType(Int64)))
            t.Columns.Add(New DataColumn("STAX", GetType(Int64)))
            t.Columns.Add(New DataColumn("sldat", GetType(Int32)))
            t.Columns.Add(New DataColumn("AUART", GetType(String)))
            t.Columns.Add(New DataColumn("REASON", GetType(String)))
            t.Columns.Add(New DataColumn("SD_DOC", GetType(String)))
            t.Columns.Add(New DataColumn("PURCH_NO", GetType(String)))
            t.Columns.Add(New DataColumn("Region", GetType(String)))
            t.Columns.Add(New DataColumn("Area", GetType(String)))
            t.Columns.Add(New DataColumn("Types", GetType(String)))
            t.Columns.Add(New DataColumn("Type", GetType(String)))
            't.Columns.Add(New DataColumn("FULL", GetType(Int64)))
            t.Columns.Add(New DataColumn("dRBP", GetType(Int64)))
            t.Columns.Add(New DataColumn("dFull", GetType(Int64)))
            t.Columns.Add(New DataColumn("dDAT", GetType(String)))
        End If


        Dim s As DataTable = DB.thongtindh(Sodathang)
        If s.Rows.Count > 0 Then
            'If t.Rows.Count > 0 Then
            For Each d2 As DataRow In s.Rows
                Dim kt As Boolean = False
                Dim sl As Integer
                sl = d2("QuantityBK")
                For Each dr As DataRow In t.Rows

                    If dr("MATNR") = d2("Itemcode") Then
                        dr("sldat") = sl
                        dr("PURCH_NO") = Sodathang
                        sl = 0
                        dr("KUNNR") = dr("KUNNR").ToString.Trim
                        dr("dRBP") = dr("P_RBP") * d2("QuantityBK")
                        dr("dFull") = dr("NET_PRICE") * d2("QuantityBK")
                        dr("Region") = d2("Region")
                        dr("Area") = d2("Area")
                        dr("Type") = d2("Type")
                        dr("NAME1") = d2("Debname")
                        dr("dDAT") = CDate(d2("Dates")).ToString("yyyy-MM-dd HH:mm:ss")

                        kt = True
                    Else
                        dr("PURCH_NO") = Sodathang
                        dr("Type") = "Confirm"
                        dr("dDAT") = CDate(d2("Dates")).ToString("yyyy-MM-dd HH:mm:ss")
                    End If



                Next
                If kt = False Then
                    Dim drs As DataRow = t.NewRow()
                    drs("VBELN") = ""
                    drs("MATNR") = d2("Itemcode")
                    drs("sldat") = d2("QuantityBK")
                    drs("ARKTX") = d2("Itemname")
                    drs("P_RBP") = d2("Price")
                    drs("NET_PRICE") = d2("PriceIV")
                    drs("dRBP") = drs("P_RBP") * d2("QuantityBK")
                    drs("dFull") = drs("NET_PRICE") * d2("QuantityBK")
                    'drs("N_CUST") = d2("AmountINV")
                    drs("KUNNR") = d2("Debcode").ToString.Trim
                    drs("dDAT") = CDate(d2("Dates")).ToString("yyyy-MM-dd HH:mm:ss")
                    drs("NAME1") = d2("Debname")
                    drs("PURCH_NO") = Sodathang
                    drs("Region") = d2("Region")
                    drs("Area") = d2("Area")
                    drs("Type") = d2("Type")
                    drs("Types") = "Cancel"
                    t.Rows.Add(drs)

                End If
            Next




        End If
        Return t

    End Function
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim tabs2 As New DataTable

        If Not IsPostBack Then
            If Session("TenDangNhap") Is Nothing Then
                Dim url As String = Request.Url.AbsoluteUri
                Session("UrlReturn") = url
                Response.Redirect("~/Account/Login.aspx")
            End If
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
            ' ''    Dim tabs1 As New DataTable

            ' ''    If tabs1 Is Nothing Then

            ' ''        tabs1.Columns.Add(New DataColumn("KUNNR", GetType(String)))
            ' ''        tabs1.Columns.Add(New DataColumn("NAME1", GetType(String)))
            ' ''        tabs1.Columns.Add(New DataColumn("POSNR", GetType(String)))
            ' ''        tabs1.Columns.Add(New DataColumn("VBELN", GetType(String)))
            ' ''        tabs1.Columns.Add(New DataColumn("FKDAT", GetType(String)))
            ' ''        tabs1.Columns.Add(New DataColumn("MATNR", GetType(String)))
            ' ''        tabs1.Columns.Add(New DataColumn("ARKTX", GetType(String)))
            ' ''        tabs1.Columns.Add(New DataColumn("SPART", GetType(String)))
            ' ''        tabs1.Columns.Add(New DataColumn("CARTON", GetType(String)))
            ' ''        tabs1.Columns.Add(New DataColumn("QTY", GetType(Int64)))
            ' ''        tabs1.Columns.Add(New DataColumn("P_RBP", GetType(Int64)))
            ' ''        tabs1.Columns.Add(New DataColumn("FULL", GetType(Int64)))
            ' ''        tabs1.Columns.Add(New DataColumn("A_RBP", GetType(Int64)))
            ' ''        tabs1.Columns.Add(New DataColumn("NET_PRICE", GetType(Int64)))
            ' ''        tabs1.Columns.Add(New DataColumn("NET_VALE", GetType(Int64)))
            ' ''        tabs1.Columns.Add(New DataColumn("DISC", GetType(Int64)))
            ' ''        tabs1.Columns.Add(New DataColumn("N_CUST", GetType(Int64)))
            ' ''        tabs1.Columns.Add(New DataColumn("STAX", GetType(Int64)))
            ' ''        tabs1.Columns.Add(New DataColumn("sldat", GetType(Int32)))
            ' ''        tabs1.Columns.Add(New DataColumn("AUART", GetType(String)))
            ' ''        tabs1.Columns.Add(New DataColumn("REASON", GetType(String)))
            ' ''        tabs1.Columns.Add(New DataColumn("SD_DOC", GetType(String)))
            ' ''        tabs1.Columns.Add(New DataColumn("PURCH_NO", GetType(String)))
            ' ''        tabs1.Columns.Add(New DataColumn("Region", GetType(String)))
            ' ''        tabs1.Columns.Add(New DataColumn("Area", GetType(String)))
            ' ''        tabs1.Columns.Add(New DataColumn("Types", GetType(String)))
            ' ''        tabs1.Columns.Add(New DataColumn("dRBP", GetType(Int64)))
            ' ''        tabs1.Columns.Add(New DataColumn("dFull", GetType(Int64)))
            ' ''        tabs1.Columns.Add(New DataColumn("Type", GetType(String)))
            ' ''        tabs1.Columns.Add(New DataColumn("dDAT", GetType(String)))
            ' ''    End If
            ' ''    Dim sa As DataTable
            ' ''    sa = DB.listdhs(CDate(datest.Value), CDate(dateen.Value), Session("TenDangNhap").ToString)
            ' ''    Dim tepm As New DataTable
            ' ''    If sa.Rows.Count > 0 Then
            ' ''        For Each s As DataRow In sa.Rows
            ' ''            tepm = getp(s("Ordernr"))
            ' ''            tabs1.Merge(tepm)
            ' ''            tepm.Clear()
            ' ''        Next
            ' ''    End If
            ' ''    Session("Ts") = tabs1

            ' ''
        End If
        If Session("Ts") IsNot Nothing Then
            dhs.DataSource = Session("Ts")
            dhs.DataBind()
            ASPxPivotGrid1.DataSource = Session("Ts")
            ASPxPivotGrid1.DataBind()
        End If
    End Sub


    Public Function GetDataTableFromRFCTable2(ByVal myrfcTable As IRfcTable) As DataTable
        Dim loTable As New DataTable
        Dim aq As DataSet
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
        loTable.Columns.Add("A_RBP", GetType(Int64))
        loTable.Columns.Add("sldat", GetType(Int32))
        loTable.Columns.Add("Type", GetType(String))
        loTable.Columns.Add("FULL", GetType(Int64))
        loTable.Columns.Add("Region", GetType(String))
        loTable.Columns.Add("Area", GetType(String))
        loTable.Columns.Add("Types", GetType(String))
        loTable.Columns.Add("dRBP", GetType(Int64))
        loTable.Columns.Add("dFull", GetType(Int64))
        loTable.Columns.Add("dDAT", GetType(String))

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
                    ldr("Types") = "Rejection Chờ xử lý"
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
            'ldr("Loai") = DB.Layloai(ldr("MATNR")) .Tables(0).Rows(0)("Debname").ToString()
            If ldr("N_CUST") > 0 Then

                ldr("A_RBP") = ldr("P_RBP") * ldr("QTY")
            Else
                ldr("A_RBP") = 0
            End If
            aq = DB.diachi(ldr("KUNNR").ToString)
            ldr("Region") = aq.Tables(0).Rows(0)("Region").ToString()
            ldr("Area") = aq.Tables(0).Rows(0)("Area").ToString()
            ldr("NAME1") = aq.Tables(0).Rows(0)("Debname").ToString()


            ldr("FULL") = ldr("STAX") + ldr("N_CUST")
            loTable.Rows.Add(ldr)
        Next




        Return loTable
    End Function



    Protected Sub ASPExport_Click(sender As Object, e As EventArgs) Handles ASPExport.Click
        ASPxGridViewExporter1.WriteXlsxToResponse()
    End Sub

    Protected Sub ASPxButton2_Click(sender As Object, e As EventArgs) Handles ASPxButton2.Click
        Try
            Dim tabs22 As New DataTable
            If tabs22 Is Nothing Then
                tabs22.Columns.Clear()
                tabs22.Columns.Add(New DataColumn("KUNNR", GetType(String)))
                tabs22.Columns.Add(New DataColumn("NAME1", GetType(String)))
                tabs22.Columns.Add(New DataColumn("POSNR", GetType(String)))
                tabs22.Columns.Add(New DataColumn("VBELN", GetType(String)))
                tabs22.Columns.Add(New DataColumn("FKDAT", GetType(String)))
                tabs22.Columns.Add(New DataColumn("MATNR", GetType(String)))
                tabs22.Columns.Add(New DataColumn("ARKTX", GetType(String)))
                tabs22.Columns.Add(New DataColumn("SPART", GetType(String)))
                tabs22.Columns.Add(New DataColumn("CARTON", GetType(String)))
                tabs22.Columns.Add(New DataColumn("QTY", GetType(Int64)))
                tabs22.Columns.Add(New DataColumn("FULL", GetType(Int64)))
                tabs22.Columns.Add(New DataColumn("P_RBP", GetType(Int64)))
                tabs22.Columns.Add(New DataColumn("A_RBP", GetType(Int64)))
                tabs22.Columns.Add(New DataColumn("NET_PRICE", GetType(Int64)))
                tabs22.Columns.Add(New DataColumn("NET_VALE", GetType(Int64)))
                tabs22.Columns.Add(New DataColumn("DISC", GetType(Int64)))
                tabs22.Columns.Add(New DataColumn("N_CUST", GetType(Int64)))
                tabs22.Columns.Add(New DataColumn("STAX", GetType(Int64)))
                tabs22.Columns.Add(New DataColumn("sldat", GetType(Int32)))
                tabs22.Columns.Add(New DataColumn("AUART", GetType(String)))
                tabs22.Columns.Add(New DataColumn("REASON", GetType(String)))
                tabs22.Columns.Add(New DataColumn("SD_DOC", GetType(String)))
                tabs22.Columns.Add(New DataColumn("PURCH_NO", GetType(String)))
                tabs22.Columns.Add(New DataColumn("Region", GetType(String)))
                tabs22.Columns.Add(New DataColumn("Area", GetType(String)))
                tabs22.Columns.Add(New DataColumn("Types", GetType(String)))
                tabs22.Columns.Add(New DataColumn("Type", GetType(String)))
                tabs22.Columns.Add(New DataColumn("dRBP", GetType(Int64)))
                tabs22.Columns.Add(New DataColumn("dFull", GetType(Int64)))
                tabs22.Columns.Add(New DataColumn("dDAT", GetType(String)))
            End If
            Dim sa As DataTable
            sa = DB.listdhs(CDate(datest.Value), CDate(dateen.Value), Session("TenDangNhap").ToString)
            Dim tepm As DataTable
            If sa.Rows.Count > 0 Then
                For Each s As DataRow In sa.Rows
                    tepm = getp(s("Ordernr"))
                    tabs22.Merge(tepm)
                    tepm.Clear()
                Next
            End If
            Session("Ts") = tabs22
            ASPxPivotGrid1.DataSource = Session("Ts")
            ASPxPivotGrid1.DataBind()
            dhs.DataSource = Session("Ts")
            dhs.DataBind()
        Catch ex As Exception

            Response.Write("<script LANGUAGE='JavaScript' >alert('Loi " + ex.Message.ToString() + "  ')</script>")

        End Try
    End Sub

    Protected Sub btnXlsxExport_Click(sender As Object, e As EventArgs) Handles btnXlsxExport.Click
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
            fileName = "Report_Aro.xlsx"
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
End Class