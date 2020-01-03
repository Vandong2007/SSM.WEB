
Imports Microsoft.VisualBasic
Imports System
Imports System.Web.UI
Imports DevExpress.Web.ASPxGridView


Partial Public Class DSKhachhangs

    Inherits AdminPage

    
    Protected Sub btnXlsxExport_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnXlsxExport.Click
        ASPxGridViewExporter1.WriteXlsxToResponse()
    End Sub

    Private Sub ASPxButton1_Click(sender As Object, e As EventArgs) Handles ASPxButton1.Click

    End Sub
    Sub blindata()
        'Dim oj As New SSMDATA
        'ASPxPivotGrid1.DataSource = oj.SSM_GetDS(CDate(datest.Value), CDate(dateen.Value))
    End Sub
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