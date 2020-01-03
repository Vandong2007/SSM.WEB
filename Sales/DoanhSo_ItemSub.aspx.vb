Imports System.IO

Public Class DoanhSo_ItemSub
    Inherits AdminPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If datest.Value = Nothing Then
            datest.Value = ngaybt
        End If
        If dateen.Value = Nothing Then
            dateen.Date = ngaykt
        End If
        'datest.Value = CDate(Date.Now)
        'blindata()

    End Sub
    Private Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        e.Command.CommandTimeout = 333
    End Sub
    


    'Protected Sub btnXlsxExport_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnXlsxExport.Click
    '    Export(1)



    'End Sub
    Protected Sub btnXlsxExport2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnXlsxExport2.Click
        Export2(1)



    End Sub
    'Private Sub Export(ByVal saveAs As Boolean)
    '    Using stream As New MemoryStream()
    '        ASPxPivotGridExporter1.OptionsPrint.PrintHeadersOnEveryPage = DevExpress.Utils.DefaultBoolean.True
    '        ASPxPivotGridExporter1.OptionsPrint.PrintFilterHeaders = DevExpress.Utils.DefaultBoolean.False
    '        ASPxPivotGridExporter1.OptionsPrint.PrintColumnHeaders = DevExpress.Utils.DefaultBoolean.True
    '        ASPxPivotGridExporter1.OptionsPrint.PrintRowHeaders = DevExpress.Utils.DefaultBoolean.True
    '        ASPxPivotGridExporter1.OptionsPrint.PrintDataHeaders = DevExpress.Utils.DefaultBoolean.False


    '        ASPxPivotGridExporter1.OptionsPrint.PageSettings.Landscape = DevExpress.Utils.DefaultBoolean.True



    '        Dim contentType As String = "", fileName As String = ""

    '        contentType = "application/ms-excel"
    '        fileName = "Report.xlsx"
    '        ASPxPivotGridExporter1.ExportToXlsx(stream)


    '        Dim buffer(stream.Length - 1) As Byte
    '        Array.Copy(stream.GetBuffer(), buffer, buffer.Length)

    '        Dim disposition As String
    '        If saveAs Then
    '            disposition = "attachment"
    '        Else
    '            disposition = "inline"
    '        End If
    '        Response.Clear()
    '        Response.Buffer = False
    '        Response.AppendHeader("Content-Type", contentType)
    '        Response.AppendHeader("Content-Transfer-Encoding", "binary")
    '        Response.AppendHeader("Content-Disposition", disposition & "; filename=" & fileName)
    '        Response.BinaryWrite(buffer)
    '        Response.End()
    '    End Using
    'End Sub
    Private Sub Export2(ByVal saveAs As Boolean)
        Using stream As New MemoryStream()
            ASPxPivotGridExporter2.OptionsPrint.PrintHeadersOnEveryPage = DevExpress.Utils.DefaultBoolean.True
            ASPxPivotGridExporter2.OptionsPrint.PrintFilterHeaders = DevExpress.Utils.DefaultBoolean.False
            ASPxPivotGridExporter2.OptionsPrint.PrintColumnHeaders = DevExpress.Utils.DefaultBoolean.True
            ASPxPivotGridExporter2.OptionsPrint.PrintRowHeaders = DevExpress.Utils.DefaultBoolean.True
            ASPxPivotGridExporter2.OptionsPrint.PrintDataHeaders = DevExpress.Utils.DefaultBoolean.False


            ASPxPivotGridExporter2.OptionsPrint.PageSettings.Landscape = DevExpress.Utils.DefaultBoolean.True



            Dim contentType As String = "", fileName As String = ""

            contentType = "application/ms-excel"
            fileName = "Report.xlsx"
            ASPxPivotGridExporter2.ExportToXlsx(stream)


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