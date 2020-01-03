Public Class homes
    Inherits System.Web.UI.MasterPage
    Public xem1 As Integer = 5
    Dim oj As New SSMDATA

    Public Shared xem As Integer = 5
    Public Shared sua As Boolean = False
    Public Shared them As Boolean = False
    Public Shared xoa As Boolean = False
    Public Shared pb As String = ""


   
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("TenDangNhap") Is Nothing Then

            'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirectMe", "alert(' đổi mật khẩu  !');location.href='~/Account/Login.aspx", True)
            'Response.Redirect(If(Request.QueryString("ReturnUrl"), "~/Account/Login.aspx"))
        Else
            xem1 = oj.Getquen(Session("TenDangNhap").ToString())
            xem = oj.Getquen(Session("TenDangNhap").ToString())
            pb = oj.Getpb(Session("TenDangNhap").ToString())
            sua = oj.Getsua(Session("TenDangNhap").ToString())


        End If
        'Response.Cookies("StoredURLFromLastSession").Value = Request.Url.PathAndQuery.ToString()
    End Sub

    Private Sub ASPxNavBar1_GroupDataBound(source As Object, e As DevExpress.Web.ASPxNavBar.NavBarGroupEventArgs) Handles ASPxNavBar1.GroupDataBound
        If xem1 <> 0 Then
            'Dim url As String = Request.Url.AbsoluteUri
            'Session("UrlReturn") = url
            'If e.Group.Text = "Quản Lý" Then
            '    'ASPxNavBar1.Items.Remove(e.Item)
            '    e.Group.Enabled = False

            'End If

            'Response.Redirect("~/Account/Thongbao.html")

        End If
    End Sub
    

    Private Sub ASPxNavBar1_ItemDataBound(source As Object, e As DevExpress.Web.ASPxNavBar.NavBarItemEventArgs) Handles ASPxNavBar1.ItemDataBound
        If xem1 <> 0 Then
            'Dim url As String = Request.Url.AbsoluteUri
            'Session("UrlReturn") = url
            If e.Item.Text = "Chu Kỳ" Then
                'ASPxNavBar1.Items.Remove(e.Item)
                e.Item.Visible = False

            End If
            If e.Item.Text = "Upload số từ npp" Then
                'ASPxNavBar1.Items.Remove(e.Item)
                e.Item.Visible = False

            End If
            If e.Item.Text = "Định nghĩa CTKM" Then
                'ASPxNavBar1.Items.Remove(e.Item)
                e.Item.Visible = False

            End If
            If e.Item.Text = "Log báo cáo" Then
                'ASPxNavBar1.Items.Remove(e.Item)
                e.Item.Visible = False

            End If
            'Response.Redirect("~/Account/Thongbao.html")

        End If
        If xem1 = 3 Then
            If e.Item.Text = "Định nghĩa CTKM" Then
                'ASPxNavBar1.Items.Remove(e.Item)
                e.Item.Visible = True

            End If
        End If
    End Sub
End Class