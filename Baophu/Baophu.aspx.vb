Imports System.IO

Public Class Baophu
    Inherits AdminPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim today As DateTime = DateTime.Now
        ''current date
        'Dim firstDay As DateTime = today.AddDays(-(today.Day - 1))
        ''first day
        'today = today.AddMonths(1)
        'Dim lastDay As DateTime = today.AddDays(-(today.Day))

        If datest.Value = Nothing Then
            datest.Value = ngaybt
        End If
        If dateen.Value = Nothing Then
            dateen.Date = ngaykt
        End If
        'blindata()
    End Sub

    'Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
    '    e.Command.CommandTimeout = 600
    'End Sub

    'Protected Sub Btok_Click(sender As Object, e As EventArgs) Handles Btok.Click
    '    blindata()
    'End Sub
    'Sub blindata()
    '    Dim oj As New SSMDATA
    '    If Session("TenDangNhap") IsNot Nothing Then

    '        'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirectMe", "alert(" + Session("TenDangNhap") + ");", True)
    '        ASPxPivotGrid1.DataSource = oj.SSM_THBaophu(CDate(datest.Value), CDate(dateen.Value), Session("TenDangNhap").ToString())
    '    End If
    'End Sub
    Protected Sub btnXlsxExport_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnXlsxExport.Click
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
                    fileName = "Report.xlsx"
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

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        e.Command.CommandTimeout = 555
    End Sub

    Protected Sub Btok_Click(sender As Object, e As EventArgs) Handles Btok.Click

    End Sub
End Class