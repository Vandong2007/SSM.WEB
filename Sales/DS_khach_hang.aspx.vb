
Imports System
Imports System.Web.UI
'Imports DevExpress.Web.ASPxClasses

 Imports System.IO

Imports System.Data.SqlClient


Public Class DS_khach_hang
    Inherits AdminPage
    Dim oj As New SSMDATA
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If datest.Value = Nothing Then
            datest.Value = ngaybt
        End If
        If dateen.Value = Nothing Then
            dateen.Date = ngaykt
        End If

        ASPxPivotGrid1.DataSource = Session("dtb")
        ASPxPivotGrid1.DataBind()

        'If radioButtonList.SelectedIndex = 0 Then
        '    Session("Item") = "_ALL"
        '    'blindata()
        'ElseIf radioButtonList.SelectedIndex = 1 Then
        '    Session("Item") = "O"
        '    'blindata()
        'End If
    End Sub

    'Protected Sub btnXlsxExport_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnXlsxExport.Click
    '    ASPxGridViewExporter1.WriteXlsxToResponse()


    'End Sub
    'Private Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
    '    e.Command.CommandTimeout = 333
    'End Sub



    Private Sub Export(ByVal saveAs As Boolean)
        Using stream As New MemoryStream()
            ASPxPivotGridExporter1.OptionsPrint.PrintHeadersOnEveryPage = DevExpress.Utils.DefaultBoolean.True
            ASPxPivotGridExporter1.OptionsPrint.PrintFilterHeaders = DevExpress.Utils.DefaultBoolean.False
            ASPxPivotGridExporter1.OptionsPrint.PrintColumnHeaders = DevExpress.Utils.DefaultBoolean.True
            ASPxPivotGridExporter1.OptionsPrint.PrintRowHeaders = DevExpress.Utils.DefaultBoolean.True
            ASPxPivotGridExporter1.OptionsPrint.PrintDataHeaders = DevExpress.Utils.DefaultBoolean.False


            ASPxPivotGridExporter1.OptionsPrint.PageSettings.Landscape = DevExpress.Utils.DefaultBoolean.True



            Dim contentType As String = "", fileName As String = ""

            contentType = "application/ms-excel"
            fileName = "Report.xlsx"
            ASPxPivotGridExporter1.ExportToXlsx(stream)


            Dim buffer(stream.Length - 1) As Byte
            Array.Copy(stream.GetBuffer(), buffer, buffer.Length)

            Dim disposition As String
            If saveAs Then
                disposition = "attachment"
            Else
                disposition = "inline"
            End If
            Response.Clear()
            Response.Buffer = False
            Response.AppendHeader("Content-Type", contentType)
            Response.AppendHeader("Content-Transfer-Encoding", "binary")
            Response.AppendHeader("Content-Disposition", disposition & "; filename=" & fileName)
            Response.BinaryWrite(buffer)
            Response.End()
        End Using
    End Sub

    Protected Sub btnXlsxExport_Click(sender As Object, e As EventArgs) Handles btnXlsxExport.Click
        Export(1)

    End Sub

    'Protected Sub Btok_Click(sender As Object, e As EventArgs) Handles Btok.Click
    '    ASPxGridView1.Caption = GridLookup.Text
    'End Sub
    Private Function Storemdb(re As String, urname As String, TuNgay As DateTime, DenNgay As DateTime, Brand As String, Nhan As String, Mui As String, size As String, Masp As String, Loai As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@re", SqlDbType.NVarChar), New SqlParameter("@Username", SqlDbType.NVarChar), New SqlParameter("@TuNgay", SqlDbType.DateTime), New SqlParameter("@DenNgay", SqlDbType.DateTime), New SqlParameter("@Brand", SqlDbType.NVarChar), New SqlParameter("@Nhan", SqlDbType.NVarChar), New SqlParameter("Mui", SqlDbType.NVarChar), New SqlParameter("@size", SqlDbType.NVarChar), New SqlParameter("@Masp", SqlDbType.NVarChar), New SqlParameter("@loai", SqlDbType.NVarChar)}
        arrParam(0).Value = re
        arrParam(1).Value = urname
        arrParam(2).Value = TuNgay
        arrParam(3).Value = DenNgay
        arrParam(4).Value = Brand
        arrParam(5).Value = Nhan
        arrParam(6).Value = Mui
        arrParam(7).Value = size
        arrParam(8).Value = Masp
        arrParam(9).Value = Loai



        Return oj.ThucThiStore_DataSets("WebDoanhsoKH", arrParam).Tables(0)
    End Function
    'Protected Sub ASPxButton2_Click(sender As Object, e As EventArgs) Handles ASPxButton2.Click
    '    'Dim builder As New StringBuilder()

    '    'builder.Append("<script language=JavaScript> ShowCreateAccountWindow(); </script>" & vbLf)
    '    'Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())
    '    '    Session("Item") = "O"
    '    EBrand.Text = "ALL"
    '    ENhan.Text = "ALL"
    '    ASPmui.Text = "ALL"
    '    ASPxSize.Text = "ALL"
    '    ASPxloai.Text = "ALL"
    '    ASPxItem.Text = "ALL"
    '    'Dim builder As New StringBuilder()

    '    'builder.Append("<script language=JavaScript> ShowCreateAccountWindow(); </script>" & vbLf)
    '    'Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())
    'End Sub

    Protected Sub btCreate_Click(sender As Object, e As EventArgs) Handles btCreate.Click
        'blindata()
        ' Session("Item") = "O"
        Session("Brand") = EBrand.Text
        Session("Nhan") = ENhan.Text
        Session("Mui") = ASPmui.Text
        Session("size") = ASPxSize.Text
        Session("loai") = ASPxloai.Text
        Session("Masp") = ASPxItem.Text
        'SqlDataSource1.DataBind()
        Storemdb()
    End Sub

    Protected Sub Btok_Click(sender As Object, e As EventArgs) Handles Btok.Click
        'blindata()
        'Session("Item") = "_ALL"
        Session("Brand") = "ALL"
        Session("Nhan") = "ALL"
        Session("Mui") = "ALL"
        Session("size") = "ALL"
        Session("loai") = "ALL"
        Session("Masp") = "ALL"

        Storemdb()
        'SqlDataSource1.DataBind()
    End Sub

    Private Function Storemdb()
        Session("dtb") = Storemdb(ASPxComboBox1.Text, Session("TenDangNhap").ToString(), CDate(datest.Value), CDate(dateen.Value), Session("Brand").ToString, Session("Nhan").ToString(), Session("Mui").ToString(), Session("size").ToString(), Session("Masp").ToString(), Session("loai").ToString())
        ASPxPivotGrid1.DataSource = Session("dtb")
        ASPxPivotGrid1.DataBind()
    End Function
    'Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
    '    e.Command.CommandTimeout = 555
    'End Sub

    Protected Sub EBrand_TextChanged(sender As Object, e As EventArgs) Handles EBrand.TextChanged
        SqlNhan.DataBind()
        Sqlmui.DataBind()
        Sqlsize.DataBind()

        SqlItem.DataBind()
    End Sub

    Protected Sub ENhan_TextChanged(sender As Object, e As EventArgs) Handles ENhan.TextChanged
        Sqlmui.DataBind()
        Sqlsize.DataBind()
        SqlItem.DataBind()

    End Sub

    Private Sub ASPmui_TextChanged(sender As Object, e As EventArgs) Handles ASPmui.TextChanged

        Sqlsize.DataBind()
        SqlItem.DataBind()
    End Sub

    Private Sub ASPxloai_TextChanged(sender As Object, e As EventArgs) Handles ASPxloai.TextChanged

        SqlItem.DataBind()
    End Sub

    Private Sub ASPxSize_TextChanged(sender As Object, e As EventArgs) Handles ASPxSize.TextChanged
        Sqlmui.DataBind()

        SqlItem.DataBind()
    End Sub


    Protected Sub ASPxPivotGrid1_CustomSummary(sender As Object, e As DevExpress.Web.ASPxPivotGrid.PivotGridCustomSummaryEventArgs) Handles ASPxPivotGrid1.CustomSummary



        Dim name As String = e.DataField.FieldName

        If e.DataField.SummaryType = DevExpress.Data.PivotGrid.PivotSummaryType.Custom Then
            ' If e.DataField.ToString = "fieldMaKH" AndAlso e.DataField.ToString = "fieldMaKH" Then

            Dim list As IList = e.CreateDrillDownDataSource()

            Dim ht As Hashtable = New Hashtable

            For i As Integer = 0 To list.Count - 1

                Dim row As DevExpress.XtraPivotGrid.PivotDrillDownDataRow = CType(list(i), DevExpress.XtraPivotGrid.PivotDrillDownDataRow)



                Dim v As Object = row(name)



                If Not IsNothing(v) AndAlso (Not v Is DBNull.Value) Then

                    ht(v) = v

                End If

            Next

            e.CustomValue = ht.Count
        End If

    End Sub
End Class