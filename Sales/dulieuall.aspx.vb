Imports System.IO
Imports System.Data.SqlClient

Public Class dulieuall
    Inherits AdminPage
    Dim oj As New SSMDATA

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If datest.Value = Nothing Then
            datest.Value = ngaybt
        End If
        If dateen.Value = Nothing Then
            dateen.Date = ngaykt
        End If

    End Sub
    Private Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        e.Command.CommandTimeout = 333
    End Sub
    Protected Sub btnXlsxExport_Click(sender As Object, e As EventArgs) Handles btnXlsxExport.Click
        ASPxGridViewExporter1.WriteXlsxToResponse()
    End Sub
    'Private Function StoreToDataTable(file As String, re As String, TuNgay As Date, DenNgay As Date) As DataTable
    '    Dim arrParam As SqlParameter() = {New SqlParameter("@file", SqlDbType.NVarChar), New SqlParameter("@re", SqlDbType.NVarChar), New SqlParameter("@TuNgay", SqlDbType.SmallDateTime), New SqlParameter("@DenNgay", SqlDbType.SmallDateTime)}
    '    arrParam(0).Value = file
    '    arrParam(1).Value = re
    '    arrParam(2).Value = TuNgay
    '    arrParam(3).Value = DenNgay

    '    Return oj.ThucThiStore_DataSets("WEBEXPORT", arrParam).Tables(0)
    'End Function
    'Protected Sub export_Click(sender As Object, e As EventArgs) Handles export.Click
    '    Dim num As Integer
    '    'Request.PhysicalApplicationPath 
    '    Dim s As String = Request.PhysicalApplicationPath + "Excel\test" + Session("Tendangnhap").ToString + ".xlsx"
    '    Dim s1 As String = Request.PhysicalApplicationPath + "Excel\test1.xlsx"

    '    Try
    '        File.Copy(s1, s, True)
    '        'Label1.Text = "File copied"
    '        Dim dtb As DataTable = StoreToDataTable(s, ASPxComboBox1.Text, CDate(datest.Value), CDate(dateen.Value))
    '        num = Integer.Parse("0" + dtb.Rows(0)(0))
    '        'oj.TheDownload(s)
    '        'Response.ContentType = "APPLICATION/OCTET-STREAM"
    '        'Dim Header As [String] = "Attachment; Filename=XMLFile.xml"
    '        'Response.AppendHeader("Content-Disposition", Header)
    '        'Dim Dfile As New System.IO.FileInfo(Server.MapPath("Excel\test" + Session("Tendangnhap").ToString + ".xlsx"))
    '        'Response.WriteFile(Dfile.FullName)
    '        ''Don't forget to add the following line
    '        'Response.[End]()

    '    Catch ex As Exception
    '        'Label1.Text = "an error occured!<br/>" & ex.ToString()
    '    End Try
    '    Response.ContentType = "APPLICATION/OCTET-STREAM"
    '    Dim Header As [String] = "Attachment; Filename= " + [String].Format("DoanhsoFull_{0}_{1}.xlsx", Session("Tendangnhap").ToString, DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"))
    '    Response.AppendHeader("Content-Disposition", Header)
    '    ' Dim Dfile As New System.IO.FileInfo(Server.MapPath("Excel\test" + Session("Tendangnhap").ToString + ".xlsx"))
    '    Dim Dfile As New System.IO.FileInfo(s)
    '    Response.WriteFile(Dfile.FullName)
    '    'Don't forget to add the following line
    '    Response.[End]()

    '    'oj.TheDownload(s)
    'End Sub
End Class