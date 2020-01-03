Imports System.IO
Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Web.UI
Imports DevExpress.Web.ASPxPivotGrid
Imports DevExpress.XtraCharts
Imports System.Web.Services
Imports System.Data.SqlClient

Public Class _Default

    Inherits AdminPage

    '    <WebMethod> _
    '    Public Shared Function GetChartData() As List(Of Object)
    '        Dim query As String = "SELECT        dbo.tinh.Tinh, round(SUM(dbo.SddoanhsoH.Thanhtien)/100000,0) AS Tien FROM   dbo.tinh INNER JOIN   dbo.tbCustomer ON dbo.tinh.State1 = dbo.tbCustomer.Province INNER JOIN " & _
    '                     "    dbo.SddoanhsoH ON dbo.tbCustomer.Debcode = dbo.SddoanhsoH.MaNPP  " & _
    '" WHERE        (dbo.SddoanhsoH.Ngay >= '2016-05-01 00:00:00.000')  " & _
    '" GROUP BY dbo.tinh.Tinh"
    '        'query += " FROM EmployeesHierarchy";
    '        Dim constr As String = ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ConnectionString
    '        Using con As New SqlConnection(constr)
    '            Using cmd As New SqlCommand(query)
    '                Dim geochart As New List(Of Object)()
    '                cmd.CommandType = CommandType.Text
    '                cmd.Connection = con
    '                con.Open()
    '                Using sdr As SqlDataReader = cmd.ExecuteReader()
    '                    While sdr.Read()
    '                        geochart.Add(New Object() {sdr("Tinh"), sdr("Tien")})
    '                    End While
    '                End Using
    '                con.Close()
    '                Return geochart
    '            End Using
    '        End Using
    '    End Function


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim today As DateTime = DateTime.Now
        'current date
        Dim firstDay As DateTime = today.AddDays(-(today.Day - 1))
        'first day
        today = today.AddMonths(1)
        Dim lastDay As DateTime = today.AddDays(-(today.Day))

        If datest.Value = Nothing Then
            datest.Value = firstDay
        End If
        If dateen.Value = Nothing Then
            dateen.Date = Date.Now
        End If




        If (Not IsPostBack) Then
            Dim restrictedTypes() As ViewType = {ViewType.PolarArea, ViewType.PolarLine, ViewType.SideBySideGantt, ViewType.SideBySideRangeBar, ViewType.RangeBar, ViewType.Gantt, ViewType.PolarPoint, ViewType.Stock, ViewType.CandleStick, ViewType.Bubble}
            For Each type As ViewType In System.Enum.GetValues(GetType(ViewType))
                If Array.IndexOf(Of ViewType)(restrictedTypes, type) >= 0 Then
                    Continue For
                End If
                ChartType.Items.Add(type.ToString())
            Next type

            ChartType.SelectedItem = ChartType.Items.FindByText(ViewType.Line.ToString())
            ChartType.Text = "Bar"
            SetChartType("Bar")
            PointLabels.Checked = WebChart1.SeriesTemplate.LabelsVisibility = DevExpress.Utils.DefaultBoolean.True
            ASPxPivotGrid1.OptionsChartDataSource.ProvideColumnGrandTotals = ShowColumnGrandTotals.Checked
            ASPxPivotGrid1.OptionsChartDataSource.ProvideRowGrandTotals = ShowRowGrandTotals.Checked
            ASPxPivotGrid1.OptionsChartDataSource.ProvideDataByColumns = ChartDataVertical.Checked
        End If
    End Sub


    Sub blindata()
        Dim oj As New SSMDATA
        If Session("TenDangNhap") IsNot Nothing Then

            'ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirectMe", "alert(" + Session("TenDangNhap") + ");", True)
            ASPxPivotGrid1.DataSource = oj.SSM_GetDSo(datest.Value, CDate(dateen.Value), Session("TenDangNhap").ToString())
        End If
    End Sub

    'Private Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
    '    'If Convert.ToString(Session("TenDangNhap")) = "" Then
    '    '    Response.Redirect("~/Account/Login.aspx")

    '    'End If
    'End Sub

    'Protected Sub btsendmail_Click(sender As Object, e As EventArgs) Handles btsendmail.Click
    '    Dim read As New StreamReader(Server.MapPath("~/dangky.html"))
    '    Dim body As [String] = read.ReadToEnd()
    '    Dim q As New SSMDATA
    '    read.Close()

    '    'Dim mail As New oj.SendEmail()
    '    body = [String].Format(body, "dong.tranvan@wipro-unza.com")
    '    '   body = String.Format("Có 1 tài khoản : " + txtEmail.Text+ "vừa đăng ký . Bạn vui lòng đăng nhập vào website http://svc.unza.com.vn để biết thêm thông tin chi tiết. "  
    '    'Dim nvgui As List(Of TB_Nhanvien_phongban) = db.TB_Nhanvien_phongbans.Where(Function(n) n.MS_phongban = 1).ToList()

    '    q.sendEmail("dong.tranvan@wipro-unza.com", "Kích hoạt thành cho viên cho #" + "dong.tranvan@wipro-unza.com", body, "")


    'End Sub

    Protected Sub btnXlsxExport_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnXlsxExport.Click
        Export(1)



    End Sub
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
            fileName = "Doanhso.xlsx"
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
    'Protected Sub grid_SummaryDisplayText(ByVal sender As Object, ByVal e As ASPxGridViewSummaryDisplayTextEventArgs)
    '    If e.Value Is Nothing Then
    '        Return
    '    End If
    '    If e.Item.FieldName = "Size" Then
    '        e.Text = FormatSize(e.Value)
    '    End If
    'End Sub

    Private Sub SetFilter(ByVal field As PivotGridField, ByVal selectNumber As Integer)
        Dim values() As Object = field.GetUniqueValues()
        Dim includedValues As New List(Of Object)(values.Length / selectNumber)
        For i As Integer = 0 To values.Length - 1
            If i Mod selectNumber = 0 Then
                includedValues.Add(values(i))
            End If
        Next i
        field.FilterValues.ValuesIncluded = includedValues.ToArray()
    End Sub
    Private Sub SetChartType(ByVal text As String)
        WebChart1.SeriesTemplate.ChangeView(CType(System.Enum.Parse(GetType(ViewType), text), ViewType))
        If WebChart1.SeriesTemplate.Label IsNot Nothing Then
            PointLabels.Enabled = True
            If PointLabels.Checked Then
                WebChart1.SeriesTemplate.LabelsVisibility = DevExpress.Utils.DefaultBoolean.True
            Else
                WebChart1.SeriesTemplate.LabelsVisibility = DevExpress.Utils.DefaultBoolean.False
            End If
        Else
            PointLabels.Enabled = False
        End If
    End Sub

    Protected Sub ASPxPivotGrid1_PreRender(ByVal sender As Object, ByVal e As EventArgs)
        'If (Not IsPostBack) Then
        '    SetFilter(fieldCategoryName, 4)
        '    fieldOrderYear.FilterValues.SetValues(New Object() {1995}, DevExpress.XtraPivotGrid.PivotFilterType.Included, False)
        'End If
    End Sub
    Protected Sub PointLabels_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
        If PointLabels.Checked Then
            WebChart1.SeriesTemplate.LabelsVisibility = DevExpress.Utils.DefaultBoolean.True
        Else
            WebChart1.SeriesTemplate.LabelsVisibility = DevExpress.Utils.DefaultBoolean.False
        End If
    End Sub


    Protected Sub ChartType_ValueChanged(ByVal sender As Object, ByVal e As EventArgs) Handles ChartType.ValueChanged
        SetChartType(ChartType.SelectedItem.Text)
    End Sub
    Protected Sub ShowColumnGrandTotals_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
        ASPxPivotGrid1.OptionsChartDataSource.ProvideColumnGrandTotals = ShowColumnGrandTotals.Checked
    End Sub
    Protected Sub ShowRowGrandTotals_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
        ASPxPivotGrid1.OptionsChartDataSource.ProvideRowGrandTotals = ShowRowGrandTotals.Checked
    End Sub
    Protected Sub ChartDataVertical_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
        ASPxPivotGrid1.OptionsChartDataSource.ProvideDataByColumns = ChartDataVertical.Checked
    End Sub
    Private Function FormatSize(ByVal value As Object) As String
        Dim unit As String = "b"
        Dim amount As Double = Convert.ToDouble(value)
        If amount > 1000 Then
            amount /= 1000
            unit = "Nghìn"
        End If
        If amount > 1000 Then
            amount /= 1024
            unit = "Triệu"
        End If
        If amount > 1000 Then
            amount /= 1024
            unit = "Tỷ"
        End If
        Return String.Format("{0:#,0.##} {1}", amount, unit)
    End Function


    'Protected Sub grid_SummaryDisplayText(ByVal sender As Object, ByVal e As ASPxPivotGrid  ASPxGridView1SummaryDisplayTextEventArgs)
    '    If e.Value Is Nothing Then
    '        Return
    '    End If
    '    If e.Item.FieldName = "Size" Then
    '        e.Text = FormatSize(e.Value)
    '    End If
    'End Sub



    'Private Sub ASPxPivotGrid1_FieldValueDisplayText(sender As Object, e As PivotFieldDisplayTextEventArgs) Handles ASPxPivotGrid1.FieldValueDisplayText
    '    If e.Value Is Nothing Then
    '        Return
    '    End If
    '    If e.DataField.FieldName = "Thanhtien" Then
    '        e.DisplayText = FormatSize(e.Value)
    '    End If
    'End Sub


    Private Sub ASPxPivotGrid1_FieldFilterChanged(sender As Object, e As PivotFieldEventArgs) Handles ASPxPivotGrid1.FieldFilterChanged

        SetChartType("Bar")
    End Sub


    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        e.Command.CommandTimeout = 400

    End Sub
End Class