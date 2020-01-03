Imports System.IO

Public Class SaleMenActiver
    Inherits AdminPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

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

End Class