Public Class Ton_kho
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ASPExport_Click(sender As Object, e As EventArgs) Handles ASPExport.Click
        ASPxGridViewExporter1.WriteXlsxToResponse()
    End Sub

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
         e.Command.CommandTimeout = 555
    End Sub
End Class