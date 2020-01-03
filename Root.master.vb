Imports DevExpress.Web.ASPxMenu

Public Class RootMaster
    Inherits System.Web.UI.MasterPage
    Public xem1 As Integer = 5
    Dim oj As New SSMDATA
  

    Private Sub HeadLoginView_PreRender(sender As Object, e As EventArgs) Handles HeadLoginView.PreRender
        Try
            If Session("TenDangNhap") Is Nothing Then
            Else
                Dim s As String
                s = oj.Getten(Session("TenDangNhap").ToString)

                Dim loginName As LoginName = TryCast(HeadLoginView.FindControl("HeadLoginName"), LoginName)

                loginName.FormatString = s
                xem1 = oj.Getquen(Session("TenDangNhap").ToString())
                ASPxLabel2.Text = Date.Now.Year.ToString() + Server.HtmlDecode(" &copy; Copyright by  Wipro Consumer Care Việt Nam")
            End If
        Catch ex As Exception

        End Try
       
        'If Session("TenDangNhap") Is Not Nothing Then
        '    loginName.FormatString = oj.Getten(Session("TenDangNhap").ToString)
        'End If
        'ASPxLabel2.Text = Convert.ToString(Session("TenDangNhap"))
        'HeadLoginView.LoggedInTemplate.GetType()

    End Sub

    Protected Sub ASPxMenu1_DataBound(sender As Object, e As EventArgs) Handles ASPxMenu1.DataBound
        If xem1 <> 0 Then
            'Dim url As String = Request.Url.AbsoluteUri
            'Session("UrlReturn") = url
           Dim menu As ASPxMenu = TryCast(sender, ASPxMenu)

            'menu.Items(0).Items(0).ClientVisible = False


        End If
       
    End Sub


    Private Sub ASPxMenu1_ItemDataBound(source As Object, e As MenuItemEventArgs) Handles ASPxMenu1.ItemDataBound
        If xem1 <> 0 Then
            'Dim url As String = Request.Url.AbsoluteUri
            'Session("UrlReturn") = url
            If e.Item.Text = "Hệ Thống" Then
                ASPxMenu1.Items.Remove(e.Item)


            End If
            'Response.Redirect("~/Account/Thongbao.html")

        End If
        
    End Sub


End Class