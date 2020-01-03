Imports DevExpress.Web.ASPxGridView

Public Class chuky
    Inherits AdminPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '   xem = oj.Getquen(Session("TenDangNhap").ToString)
        'Session("ngayketthuc") = CDate(oj.Getngaybdkt.Tables(0).ToString)
        Dim oj As New SSMDATA

        If Not IsPostBack Then
            If Session("TenDangNhap") IsNot Nothing Then
                xem = oj.Getquen(Session("TenDangNhap").ToString())
                pb = oj.Getpb(Session("TenDangNhap").ToString())
                sua = oj.Getsua(Session("TenDangNhap").ToString())
            End If
            If xem <> 0 Then
                Dim url As String = Request.Url.AbsoluteUri
                Session("UrlReturn") = url

                Response.Redirect("~/Account/Thongbao.html")

            End If
        End If
        If radioButtonList.SelectedIndex = 0 Then
            ASPxGridView2.Visible = False
            ASPxGridView3.Visible = False
            ASPxGridView1.Visible = True
        ElseIf radioButtonList.SelectedIndex = 1 Then
            ASPxGridView2.Visible = True
            ASPxGridView1.Visible = False
            ASPxGridView3.Visible = False
        ElseIf radioButtonList.SelectedIndex = 2 Then
            ASPxGridView2.Visible = False
            ASPxGridView1.Visible = False
            ASPxGridView3.Visible = True
        Else
            ASPxGridView2.Visible = False
            ASPxGridView1.Visible = False
            ASPxGridView3.Visible = False
        End If
    End Sub
    Private Sub ASPxGridView1_CommandButtonInitialize(sender As Object, e As ASPxGridViewCommandButtonEventArgs) Handles ASPxGridView1.CommandButtonInitialize
        If e.VisibleIndex = -1 Then
            Return
        End If
        If pb = "IT" Then


            Select Case e.ButtonType
                Case ColumnCommandButtonType.Edit
                    e.Visible = True
                    Exit Select
                    'Case ColumnCommandButtonType.Delete
                    '    Visible = sua
                    '    Exit Select
            End Select
            Select Case e.ButtonType
                Case ColumnCommandButtonType.Delete
                    e.Visible = True
                    Exit Select
                    'Case ColumnCommandButtonType.Delete
                    '    Visible = sua
                    '    Exit Select
            End Select
            Select Case e.ButtonType
                Case ColumnCommandButtonType.New
                    e.Visible = True
                    Exit Select
                    'Case ColumnCommandButtonType.Delete
                    '    Visible = sua
                    '    Exit Select
            End Select
        Else

            Select Case e.ButtonType
                Case ColumnCommandButtonType.Edit
                    e.Visible = False
                    Exit Select
                    'Case ColumnCommandButtonType.Delete
                    '    Visible = sua
                    '    Exit Select
            End Select
            Select Case e.ButtonType
                Case ColumnCommandButtonType.Delete
                    e.Visible = False
                    Exit Select
                    'Case ColumnCommandButtonType.Delete
                    '    Visible = sua
                    '    Exit Select
            End Select
            Select Case e.ButtonType
                Case ColumnCommandButtonType.New
                    e.Visible = False
                    Exit Select
                    'Case ColumnCommandButtonType.Delete
                    '    Visible = sua
                    '    Exit Select
            End Select
        End If

    End Sub
    Protected Sub radioButtonList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles radioButtonList.SelectedIndexChanged
        If radioButtonList.SelectedIndex = 0 Then
            ASPxGridView2.Visible = False
            ASPxGridView3.Visible = False
            ASPxGridView1.Visible = True
            ASPxGridView1.DataBind()
        ElseIf radioButtonList.SelectedIndex = 1 Then
            ASPxGridView2.Visible = True
            ASPxGridView1.Visible = False
            ASPxGridView3.Visible = False
            ASPxGridView2.DataBind()
        ElseIf radioButtonList.SelectedIndex = 2 Then
            ASPxGridView2.Visible = False
            ASPxGridView1.Visible = False
            ASPxGridView3.Visible = True
            ASPxGridView3.DataBind()
        Else
            ASPxGridView2.Visible = False
            ASPxGridView1.Visible = False
            ASPxGridView3.Visible = False
        End If
    End Sub

  
     
End Class