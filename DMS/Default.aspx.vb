Imports System.IO
Imports Newtonsoft.Json
Imports System.Net.Http
Imports System.Net
Imports System.Data.SqlClient


Public Class Defail
    Inherits AdminPage
    Dim oj As New SSMDATA
    Public Shared gslink As String = ConfigurationManager.AppSettings("LinkDMS")
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("TenDangNhap") Is Nothing Then
        Else
            Try

                pb = oj.Getpb(Session("TenDangNhap").ToString())
                xem = oj.Getquen(Session("TenDangNhap").ToString())
                sua = oj.Getsua(Session("TenDangNhap").ToString())
            Catch ex As Exception

            End Try

        End If

        Dim today As DateTime = DateTime.Now
        'current date
        Dim firstDay As DateTime = today.AddDays((today.DayOfWeek - DayOfWeek.Monday) * -1)
        'first day
        today = today.AddMonths(1)
        Dim lastDay As DateTime = today.AddDays(-(today.Day))

        If datest.Value = Nothing Then
            datest.Value = firstDay
        End If
        If dateen.Value = Nothing Then
            dateen.Date = Date.Now
        End If
        If pb = "IT" Then
            ASPxButton1.Visible = sua
        Else
            ASPxButton1.Visible = False
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
            fileName = "OrderDMS.xlsx"
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


    Protected Sub ASPxButton1_Click(sender As Object, e As EventArgs) Handles ASPxButton1.Click

        Dim a As New DataTable
        Dim ass As New luu
        Dim lsuser As New DataTable
        lsuser = ass.GetNpp().Tables(0)
        If lsuser.Rows.Count > 0 Then
            For Each r As DataRow In lsuser.Rows

                Try
                    Dim token As String
                    Dim Roottoken As Roottoken = GetTokenDictionary(r("debcode").ToString, r("pass").ToString)

                    token = Roottoken.access_token.ToString



                    'a = GetRESTDats(gslink & "retailLink/mapi/distributor/salesOrder", token, datest.Value)
                    a = d(gslink & "retailLink/mapi/distributor/salesOrder", token, datest.Value, r("debcode").ToString)
                    Dim i = ass.Megedms(r("debcode").ToString)

                    'If a.Rows.Count > 0 Then


                    '    For Each dr As DataRow In a.Rows
                    '        ass.GetTHFullData(CInt(dr("id")), r("debcode").ToString, CDate(dr("orderDate")), dr("orderNumber").ToString, dr("orderLines").ToString, dr("fieldForceCode").ToString, dr("retailerCode").ToString, dr("remark").ToString)
                    '        Dim dtt As DataTable
                    '        dtt = JsonConvert.DeserializeObject(Of DataTable)(dr("orderLines").ToString) ' JsonToDataTable(dr("orderLines").ToString, "data")
                    '        'Dim objs = JsonConvert.DeserializeObject(Of List(Of OrderLine))(dr("orderLines").ToString)

                    '        For Each d As DataRow In dtt.Rows

                    ' ass.insetdt2(CInt(d("id")), CInt(d("lineNumber")), r("debcode").ToString, dr("orderNumber").ToString, d("note").ToString, d("productCode").ToString, CDbl(d("orderQuantity")), d("schemeCode").ToString)


                    '        Next
                    '    Next
                    '    'MessageBox.Show("xong")
                    'End If


                Catch webex As Exception
                    'MessageBox.Show("Es gab so ein Schlamassel! ({0})", webex.Message)
                End Try

            Next

        End If
    End Sub
    Private Function GetRESTDats(uri As String, token As String, datea As Date)
        Dim webRequest__1 = DirectCast(WebRequest.Create(uri), HttpWebRequest)
        webRequest__1.Method = "GET"
        webRequest__1.Headers("authorization") = "Bearer " & token
        webRequest__1.IfModifiedSince = datea
        webRequest__1.ContentType = "application/json"

        Dim webResponse = DirectCast(webRequest__1.GetResponse(), HttpWebResponse)
        Dim dataStream As System.IO.Stream = webResponse.GetResponseStream()
        Dim reader As New StreamReader(dataStream)
        'Dim reader As System.IO.StreamReader = New System.IO.StreamReader(webResponse.GetResponseStream().ToString, True)
        Dim content As String = reader.ReadToEnd()


        'Return JsonConvert.DeserializeObject(List(Print))(s)
        'Dim objs = JsonConvert.DeserializeObject(Of dms)(content)
        'Return objs
        'Dim objs = JsonConvert.DeserializeObject(Of dms)(content)
        'Dim name As OrderLine = DirectCast(objs("Data"), OrderLine)






        '  Dim ds As DataSet = JsonConvert.DeserializeObject(Of DataSet)(content)

        Return JsonToDataTable(content, "data")
        'Return ds
        'DataGridView1.DataSource = objs
    End Function

    Private Function d(uri As String, token As String, datea As Date, npp As String)
        Dim webRequest__1 = DirectCast(WebRequest.Create(uri), HttpWebRequest)
        webRequest__1.Method = "GET"
        webRequest__1.Headers("authorization") = "Bearer " & token
        webRequest__1.IfModifiedSince = datea
        webRequest__1.ContentType = "application/json"

        Dim webResponse = DirectCast(webRequest__1.GetResponse(), HttpWebResponse)
        Dim dataStream As System.IO.Stream = webResponse.GetResponseStream()
        Dim reader As New StreamReader(dataStream)
        'Dim reader As System.IO.StreamReader = New System.IO.StreamReader(webResponse.GetResponseStream().ToString, True)
        Dim content As String = reader.ReadToEnd()
        Dim conString As String = ConfigurationManager.ConnectionStrings("SSMConnectionString").ConnectionString
        Using con As New SqlConnection(conString)
            Using cmd As New SqlCommand("DELETE FROM  tb_DMS_orderH_Temp where Debcode ='" + npp + "' ", con)

                con.Open()
                '// mo ket noi 
                cmd.ExecuteNonQuery()
                ' // thuc thi 
                con.Close()
            End Using
            Using cmd As New SqlCommand("DELETE FROM  tb_DMS_orderD_Temp where Debcode ='" + npp + "' ", con)

                con.Open()
                '// mo ket noi 
                cmd.ExecuteNonQuery()
                ' // thuc thi 
                con.Close()
            End Using
        End Using

        'Return JsonConvert.DeserializeObject(List(Print))(s)
        'Dim objs = JsonConvert.DeserializeObject(Of dms)(content)
        'Return objs
        'Dim objs = JsonConvert.DeserializeObject(Of dms)(content)

        Dim objs1 As dms = JsonConvert.DeserializeObject(Of dms)(content)
        Dim state1s As List(Of data) = objs1.Data.ToList()
        'Dim output As List(Of OrderLine) = objs1.Data.Select(Function(x) x.OrderLines.ToList())
        'Dim output = state1s.Where(Function(p) p.OrderLines.Any(Function(c) c.Id > 0)).SelectMany(Function(p) p.OrderLines).Where(Function(c) c.Id > 0)
        'Dim states As DataTable = oj.ToDataTable(state1s)
        'Dim dataH As tb_DMS_orderH = state1s.Select(Function(p) p.OrderDate)
        Dim dataH As List(Of tb_DMS_orderH) = state1s.Select(Function(n) New tb_DMS_orderH With {.id = n.Id, .orderDate = n.OrderDate, .orderNumber = n.OrderNumber, .Debcode = npp, .fieldForceCode = n.FieldForceCode, .remark = n.Remark, .retailerCode = n.RetailerCode}).OrderByDescending(Function(n) n.id).ToList()
        Dim states As DataTable = oj.ConvertToDatatable(dataH)
        'Dim datad As List(Of tb_DMS_orderD) = state1s.SelectMany(Function(x) x.OrderLines).[Select](Function(n) New tb_DMS_orderD With {.id = n.Id, .lineNumber = n.LineNumber, .orderNumber = x., .Debcode = npp, .fieldForceCode = n.FieldForceCode, .remark = n.Remark, .retailerCode = n.RetailerCode}).OrderByDescending(Function(n) n.id).ToList()

        Dim datad As List(Of tb_DMS_orderD) = (From d1 In state1s From df In d1.OrderLines Select New tb_DMS_orderD With {
     .id = df.Id, .lineNumber = df.LineNumber,
       .Debcode = npp,
     .orderNumber = d1.OrderNumber,
       .notes = df.Note,
       .productCode = df.ProductCode,
      .orderQuantity = df.OrderQuantity,
      .schemeCode = df.schemeCode
}).ToList()


        Dim output As DataTable = oj.ConvertToDatatable(datad)
        'Dim readedr = dataH.AsDataReader()
        Using cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SSMConnectionString").ConnectionString)
            cn.Open()

            Using copy As SqlBulkCopy = New SqlBulkCopy(cn)
                copy.DestinationTableName = "tb_DMS_orderH_Temp"

                copy.ColumnMappings.Add("ID", "id")
                copy.ColumnMappings.Add("Debcode", "Debcode")
                copy.ColumnMappings.Add("orderNumber", "orderNumber")
                copy.ColumnMappings.Add("orderDate", "orderDate")
                copy.ColumnMappings.Add("orderLines", "orderLines")
                copy.ColumnMappings.Add("remark", "remark")
                copy.ColumnMappings.Add("fieldForceCode", "fieldForceCode")
                copy.ColumnMappings.Add("retailerCode", "retailerCode")
                'copy.WriteToServer(states.AsDataReader())
                copy.BulkCopyTimeout = 333
                Try
                    copy.WriteToServer(states)
                Catch ex As Exception

                End Try



            End Using

            Using copy As SqlBulkCopy = New SqlBulkCopy(cn)
                copy.DestinationTableName = "tb_DMS_orderD_Temp"
                copy.ColumnMappings.Add("id", "id")
                copy.ColumnMappings.Add("lineNumber", "lineNumber")
                copy.ColumnMappings.Add("Debcode", "Debcode")
                copy.ColumnMappings.Add("orderNumber", "orderNumber")
                copy.ColumnMappings.Add("notes", "notes")
                copy.ColumnMappings.Add("productCode", "productCode")
                'copy.ColumnMappings.Add("price", "price")
                copy.ColumnMappings.Add("orderQuantity", "orderQuantity")
                copy.ColumnMappings.Add("schemeCode", "schemeCode")

                copy.BulkCopyTimeout = 333
                Try
                    copy.WriteToServer(output)
                Catch ex As Exception

                End Try

            End Using
        End Using
    End Function
    Private Shared Function GetTokenDictionary(userName As String, password As String) As Roottoken

        'Dim content = New Http.FormUrlEncodedContent(pairs)
        Dim content As New Http.StringContent("{""username"":""" & userName & """,""password"":""" & password & """}", UnicodeEncoding.UTF8, "application/json")
        Using client = New HttpClient()
            Dim response = client.PostAsync(gslink & "retailLink/mapi/login", content).Result
            Dim result = response.Content.ReadAsStringAsync().Result
            Dim arr = JsonConvert.DeserializeObject(Of Roottoken)(result)
            Return arr
        End Using
    End Function
    Public Shared Function JsonToDataTable(json As String, tableName As String) As DataTable
        Dim columnsCreated As Boolean = False
        Dim dt As New DataTable(tableName)

        Dim root As Newtonsoft.Json.Linq.JObject = Newtonsoft.Json.Linq.JObject.Parse(json)
        Dim items As Newtonsoft.Json.Linq.JArray = DirectCast(root(tableName), Newtonsoft.Json.Linq.JArray)

        Dim item As Newtonsoft.Json.Linq.JObject
        Dim jtoken As Newtonsoft.Json.Linq.JToken

        For i As Integer = 0 To items.Count - 1
            ' Create the columns once
            If columnsCreated = False Then
                item = DirectCast(items(i), Newtonsoft.Json.Linq.JObject)
                jtoken = item.First

                While jtoken IsNot Nothing
                    dt.Columns.Add(New DataColumn(DirectCast(jtoken, Newtonsoft.Json.Linq.JProperty).Name.ToString()))
                    jtoken = jtoken.[Next]
                End While

                columnsCreated = True
            End If

            ' Add each of the columns into a new row then put that new row into the DataTable
            item = DirectCast(items(i), Newtonsoft.Json.Linq.JObject)
            jtoken = item.First

            ' Create the new row, put the values into the columns then add the row to the DataTable
            Dim dr As DataRow = dt.NewRow

            While jtoken IsNot Nothing
                dr(DirectCast(jtoken, Newtonsoft.Json.Linq.JProperty).Name.ToString()) = DirectCast(jtoken, Newtonsoft.Json.Linq.JProperty).Value.ToString()
                jtoken = jtoken.[Next]
            End While

            dt.Rows.Add(dr)
        Next

        Return dt

    End Function

    Protected Sub ASPxPivotGrid1_CustomSummary(sender As Object, e As DevExpress.Web.ASPxPivotGrid.PivotGridCustomSummaryEventArgs) Handles ASPxPivotGrid1.CustomSummary



        Dim name As String = e.DataField.FieldName

        If e.DataField.SummaryType = DevExpress.Data.PivotGrid.PivotSummaryType.Custom Then
            ' If e.DataField.ToString = "fieldMaKH" AndAlso e.DataField.ToString = "fieldMaKH" Then

            Dim list As IList = e.CreateDrillDownDataSource()

            Dim ht As Hashtable = New Hashtable

            For i As Integer = 0 To list.Count - 1

                Dim row As DevExpress.XtraPivotGrid.PivotDrillDownDataRow = CType(list(i), DevExpress.XtraPivotGrid.PivotDrillDownDataRow)



                Dim v As Object = row(name)



                If Not IsNothing(v) AndAlso (Not v Is DBNull.Value) Then

                    ht(v) = v

                End If

            Next

            e.CustomValue = ht.Count
        End If

    End Sub

    Protected Sub Btok_Click(sender As Object, e As EventArgs) Handles Btok.Click

    End Sub
End Class