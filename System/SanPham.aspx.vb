
Imports Microsoft.VisualBasic
Imports System
Imports System.Web.UI
Imports DevExpress.Web.ASPxGridView


Partial Public Class SanPham

    Inherits AdminPage

    Protected Sub ASPxGridView2_CustomUnboundColumnData(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs)
        If e.Column.FieldName = "CompositeKey" Then
            Dim customerId As String = Convert.ToString(e.GetListSourceFieldValue("ItemGrp"))
            Dim productId As String = Convert.ToString(e.GetListSourceFieldValue("Itemcode"))
            Dim orderDate As String = Convert.ToString(e.GetListSourceFieldValue("Type"))
            e.Value = customerId & "-" & productId & "-" & orderDate
        End If
    End Sub
    Protected Sub btnXlsxExport_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnXlsxExport.Click
        ASPxGridViewExporter1.WriteXlsxToResponse()
    End Sub
    Protected Sub btnXlsxExport2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnXlsxExport2.Click
        ASPxGridViewExporter2.WriteXlsxToResponse()
    End Sub
    Private Sub ASPxGridView1_CommandButtonInitialize(sender As Object, e As ASPxGridViewCommandButtonEventArgs) Handles ASPxGridView1.CommandButtonInitialize
        If e.VisibleIndex = -1 Then
            Return
        End If

        Select Case e.ButtonType
            Case ColumnCommandButtonType.Edit
                e.Visible = sua
                Exit Select
                'Case ColumnCommandButtonType.Delete
                '    Visible = sua
                '    Exit Select
                'Case ColumnCommandButtonType.New
                '    Visible = sua
                'Exit Select
        End Select
    End Sub
    Private Sub ASPxGridView2_CommandButtonInitialize(sender As Object, e As ASPxGridViewCommandButtonEventArgs) Handles ASPxGridView2.CommandButtonInitialize
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

    Private Sub Page_PreLoad(sender As Object, e As EventArgs) Handles Me.PreLoad
       
        pageControl.TabPages.FindByText("Danh sách sản phẩm Group").Visible = sua
    End Sub
End Class