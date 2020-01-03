Public Class Log_bao_cao
    Inherits AdminPage
    Dim oj As New SSMDATA
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
        If xem <> 0 Then
            Dim url As String = Request.Url.AbsoluteUri
            Session("UrlReturn") = url

            Response.Redirect("~/Account/Thongbao.html")

        End If
        If datest.Value = Nothing Then
            datest.Value = ngaybt
            ASPxDateEdit1.Value = ngaybt
        End If
        If dateen.Value = Nothing Then
            dateen.Date = ngaykt
            ASPxDateEdit2.Value = ngaykt
        End If
        'datest.Value = CDate(Date.Now)


    End Sub
    Protected Sub btnXlsxExport_Click(sender As Object, e As EventArgs) Handles btnXlsxExport.Click
        ASPxGridViewExporter1.WriteXlsxToResponse()
    End Sub
    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        e.Command.CommandTimeout = 555
    End Sub
End Class