Imports DevExpress.Web.ASPxGridLookup
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.Data
Imports DevExpress.Web.ASPxClasses
Imports DevExpress.Web.ASPxEditors
Imports System.Data.SqlClient

Public Class WebXuatAm
    Inherits AdminPage


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If xem <> 0 Then
        '    Dim url As String = Request.Url.AbsoluteUri
        '    Session("UrlReturn") = url

        '    Response.Redirect("~/Account/Thongbao.html")

        'End If
        If datest.Value = Nothing Then
            datest.Value = ngaybt

        End If
        If dateen.Value = Nothing Then
            dateen.Date = ngaykt

        End If
        'datest.Value = CDate(Date.Now)
        btnupload.Visible = sua

    End Sub
    Protected Sub btnXlsxExport_Click(sender As Object, e As EventArgs) Handles btnXlsxExport.Click
        ASPxGridViewExporter1.WriteXlsxToResponse()
    End Sub
    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        e.Command.CommandTimeout = 555
    End Sub
    Private Function Trukho(tuNgay As DateTime, denngay As DateTime, manpp As String) As DataTable
        Dim oj As New SSMDATA
        Dim arrParam As SqlParameter() = {New SqlParameter("@TuNgay", SqlDbType.SmallDateTime), New SqlParameter("@DenNgay", SqlDbType.SmallDateTime), New SqlParameter("@NPP", SqlDbType.NVarChar)}
        arrParam(0).Value = CDate(tuNgay)
        arrParam(1).Value = CDate(denngay)
        arrParam(2).Value = manpp
        Return oj.ThucThiStore_DataSets("trukho_npp", arrParam).Tables(0)
    End Function
    Protected Sub btnupload_Click(sender As Object, e As EventArgs) Handles btnupload.Click
        Dim dtbnv As DataTable = Trukho(datest.Value, dateen.Value, ASPxComboBox1.Value)
        SqlDataSource1.DataBind()
        ASPxGridView1.DataBind()
    End Sub
End Class