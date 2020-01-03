Imports DevExpress.Web.ASPxMenu

Public Class mobile
    Inherits System.Web.UI.MasterPage
    Public xem1 As Integer = 5
    Dim oj As New SSMDATA



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("TenDangNhap") Is Nothing Then
            'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirectMe", "alert(' đổi mật khẩu  !');location.href='~/Account/Login.aspx", True)
            'Response.Redirect(If(Request.QueryString("ReturnUrl"), "~/Account/Login.aspx"))
        Else
            'If Request.Browser.IsMobileDevice Then
            '    ASPxMenu1.DataSource = XmlDataSource1
            '    ASPxMenu1.DataBind()
            '    'Else
            '    '    ASPxMenu1.DataSource = XmlDataSourceHeader
            '    '    ASPxMenu1.DataBind()
            'End If

        End If
        'If Convert.ToString(Session("TenDangNhap")) = "" Then
        '    Response.Redirect("~/Account/Login.aspx")
        'Else
        '    Dim loginName As LoginName = TryCast(HeadLoginView.FindControl("HeadLoginName"), LoginName)

        '    If loginName IsNot Nothing AndAlso Session IsNot Nothing Then
        '        loginName.FormatString = "Full Name"
        '    End If
        '    ASPxLabel2.Text = Convert.ToString(Session("TenDangNhap"))
        '    HeadLoginView.LoggedInTemplate.GetType()
        'End If

    End Sub

    'Private Sub HeadLoginView_PreRender(sender As Object, e As EventArgs) Handles HeadLoginView.PreRender
    '    'If Session("TenDangNhap") Is Nothing Then
    '    'Else
    '    '    Dim s As String
    '    '    s = oj.Getten(Session("TenDangNhap").ToString)

    '    '    Dim loginName As LoginName = TryCast(HeadLoginView.FindControl("HeadLoginName"), LoginName)

    '    '    loginName.FormatString = s
    '    '    xem1 = oj.Getquen(Session("TenDangNhap").ToString())
    '    '    ASPxLabel2.Text = Date.Now.Year.ToString() + Server.HtmlDecode(" &copy; Copyright by [Wipro Unza Việt Nam]")
    '    'End If
    '    ''If Session("TenDangNhap") Is Not Nothing Then
    '    '    loginName.FormatString = oj.Getten(Session("TenDangNhap").ToString)
    '    'End If
    '    'ASPxLabel2.Text = Convert.ToString(Session("TenDangNhap"))
    '    'HeadLoginView.LoggedInTemplate.GetType()

    'End Sub
   
End Class