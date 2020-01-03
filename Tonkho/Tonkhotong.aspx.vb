Imports System.IO
Imports System.Data.SqlClient

Public Class Tonkhotong
    Inherits AdminPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If datest.Value = Nothing Then
            datest.Value = ngaybt
        End If
        If dateen.Value = Nothing Then
            dateen.Date = ngaykt
        End If

    End Sub



    'Protected Sub Btok_Click(sender As Object, e As EventArgs) Handles Btok.Click
    '    'blindata()
    'End Sub


    Private Sub SqlDataSource2_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource2.Selecting
        e.Command.CommandTimeout = 333
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
            ASPxPivotGridExporter1.OptionsPrint.PrintDataHeaders = DevExpress.Utils.DefaultBoolean.False


            ASPxPivotGridExporter1.OptionsPrint.PageSettings.Landscape = DevExpress.Utils.DefaultBoolean.True



            Dim contentType As String = "", fileName As String = ""

            contentType = "application/ms-excel"
            fileName = "Tonkho.xlsx"
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
        'Response.Clear()
        'Response.Buffer = True
        'Response.ContentType = "application/vnd.ms-excel"
        'Response.AddHeader("content-disposition", "attachment;filename=SearchResults.xls")
        'Response.Charset = ""
        'Response.Cache.SetCacheability(HttpCacheability.NoCache)
        'Me.EnableViewState = False
        'Dim stringWriter As New StringWriter()
        'Dim htmlTextWriter As New HtmlTextWriter(stringWriter)

        ''I want to chagne this:
        'Me.SqlDataSource2.RenderControl(htmlTextWriter)

        'Response.Write(stringWriter.ToString())
        'Response.[End]()
        ExportToExcel(SqlDataSource2, "TONKHO")
    End Sub


    Public Sub ExportToExcel(dataSrc As SqlDataSource, fileName As String)
        'Add Response header 
        Response.Clear()
        Response.AddHeader("content-disposition", String.Format("attachment;filename={0}.csv", fileName))
        Response.Charset = ""
        Response.ContentType = "application/vnd.xls"

        'GET Data From Database        

        Dim cn As New SqlConnection(dataSrc.ConnectionString)
        Dim query As String = dataSrc.SelectCommand.Replace(vbCr & vbLf, " ").Replace(vbTab, " ")

        Dim cmd As New SqlCommand(query, cn)

        cmd.CommandTimeout = 999999
        cmd.CommandType = CommandType.Text

        Try
            cn.Open()
            Dim dr As SqlDataReader = cmd.ExecuteReader()
            Dim sb As New StringBuilder()
            '
            'Add Header
            '
            Dim count As Integer = 0
            While count < dr.FieldCount
                If dr.GetName(count) <> Nothing Then
                    sb.Append(dr.GetName(count))
                End If
                If count < dr.FieldCount - 1 Then
                    sb.Append(",")
                End If
                System.Math.Max(System.Threading.Interlocked.Increment(count), count - 1)
            End While
            Response.Write(sb.ToString() + vbLf)
            Response.Flush()
            '
            'Append Data
            '
            While dr.Read()
                sb = New StringBuilder()

                Dim col As Integer = 0
                While col < dr.FieldCount - 1
                    If Not dr.IsDBNull(col) Then
                        sb.Append(dr.GetValue(col).ToString().Replace(",", " "))
                    End If
                    sb.Append(",")
                    System.Math.Max(System.Threading.Interlocked.Increment(col), col - 1)
                End While
                If Not dr.IsDBNull(dr.FieldCount - 1) Then
                    sb.Append(dr.GetValue(dr.FieldCount - 1).ToString().Replace(",", " "))
                End If
                Response.Write(sb.ToString() + vbLf)
                Response.Flush()
            End While
            dr.Dispose()
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            cmd.Connection.Close()
            cn.Close()
        End Try
        Response.[End]()
    End Sub





End Class