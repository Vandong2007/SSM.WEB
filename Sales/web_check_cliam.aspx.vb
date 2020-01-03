Imports System.Data.SqlClient

Public Class web_check_cliam
    Inherits AdminPage
    Dim oj As New SSMDATA

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If datest.Value = Nothing Then
            datest.Value = ngaybt
        End If
        If dateen.Value = Nothing Then
            dateen.Date = ngaykt
        End If


        If pb = "AP&P" Or pb = "IT" Then
             Btchay.Visible = sua
        Else
            Btchay.Visible = False
        End If
    End Sub
    Private Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        e.Command.CommandTimeout = 333
    End Sub
    Protected Sub btnXlsxExport_Click(sender As Object, e As EventArgs) Handles btnXlsxExport.Click
        ASPxGridViewExporter1.WriteXlsxToResponse()
    End Sub

    Protected Sub Btchay_Click(sender As Object, e As EventArgs) Handles Btchay.Click
        Dim dtbnv As DataTable = Trukho(datest.Value, dateen.Value, ASPxComboBox1.Value)
        SqlDataSource1.DataBind()
        ASPxGridView1.DataBind()
    End Sub

    Private Function Trukho(tuNgay As DateTime, denngay As DateTime, manpp As String) As DataTable
        Dim oj As New SSMDATA
        Dim arrParam As SqlParameter() = {New SqlParameter("@TuNgay", SqlDbType.SmallDateTime), New SqlParameter("@DenNgay", SqlDbType.SmallDateTime), New SqlParameter("@Manpps", SqlDbType.NVarChar)}
        arrParam(0).Value = CDate(tuNgay)
        arrParam(1).Value = CDate(denngay)
        arrParam(2).Value = manpp
        Return oj.ThucThiStore_DataSets("tinhclaim", arrParam).Tables(0)
    End Function

End Class