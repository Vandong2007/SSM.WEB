Imports Microsoft.VisualBasic
Imports System
Imports System.Web.UI
Imports DevExpress.Web.ASPxGridView

Partial Public Class khachhang

    Inherits AdminPage
    'Protected Sub btnPdfExport_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnPdfExport.Click
    '    ASPxGridViewExporter1.WritePdfToResponse()
    'End Sub
    'Protected Sub btnXlsExport_Click(ByVal sender As Object, ByVal e As EventArgs)
    '    ASPxGridViewExporter1.WriteXlsToResponse()
    'End Sub
    Protected Sub btnXlsxExport_Click(ByVal sender As Object, ByVal e As EventArgs)
        ASPxGridViewExporter1.WriteXlsxToResponse()
    End Sub
    'Protected Sub btnRtfExport_Click(ByVal sender As Object, ByVal e As EventArgs)
    '    ASPxGridViewExporter1.WriteRtfToResponse()
    'End Sub
    'Protected Sub btnCsvExport_Click(ByVal sender As Object, ByVal e As EventArgs)
    '    ASPxGridViewExporter1.WriteCsvToResponse()
    'End Sub
    'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    '    If xem <> 0 Then
    '        Dim url As String = Request.Url.AbsoluteUri
    '        Session("UrlReturn") = url

    '        Response.Redirect("~/Account/Thongbao.html")

    '    End If
    'End Sub
    'Private Sub ASPxGridView1_CommandButtonInitialize(sender As Object, e As ASPxGridViewCommandButtonEventArgs) Handles ASPxGridView1.CommandButtonInitialize
    '    'If e.VisibleIndex = -1 Then
    '    '    Return
    '    'End If

    '    Select Case e.ButtonType
    '        Case ColumnCommandButtonType.Edit
    '            e.Visible = sua
    '            Exit Select
    '        Case ColumnCommandButtonType.Delete
    '            Visible = sua
    '            Exit Select
    '            'Case ColumnCommandButtonType.New
    '            '    Visible = sua
    '            '    Exit Select
    '    End Select
    'End Sub

    Private Sub ASPxGridView1_CommandButtonInitialize(sender As Object, e As ASPxGridViewCommandButtonEventArgs) Handles ASPxGridView1.CommandButtonInitialize
        If e.VisibleIndex = -1 Then
            Return
        End If

        Select Case e.ButtonType
            Case ColumnCommandButtonType.Edit
                e.Visible = sua
                Exit Select
            Case ColumnCommandButtonType.Delete
                Visible = sua
                Exit Select
            Case ColumnCommandButtonType.New
                Visible = sua
                Exit Select
        End Select
    End Sub
End Class