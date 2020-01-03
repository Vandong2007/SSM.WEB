Imports System.Data.SqlClient
Imports Microsoft.VisualBasic
Imports System
Imports System.Threading
Imports System.Web.UI
Imports DevExpress.Web.ASPxTabControl
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.Data
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxClasses
Imports DevExpress.Web.ASPxPopupControl
Imports System.IO
Imports System.Data.OleDb

Public Class CTKM3
    Inherits AdminPage
    Dim oj As New SSMDATA
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ''If PopupControl.IsCallback Then
        ''    ' Intentionally pauses server-side processing, 
        ''    ' to demonstrate the Loading Panel functionality.
        ''    Thread.Sleep(1000)
        ''End If
        'If IsCallback Then
        '    ' Intentionally pauses server-side processing, 
        '    ' to demonstrate the Loading Panel functionality.
        '    Thread.Sleep(500)
        'End If
        ''If ASPxCheckBox1.Checked Then

        ''Else
        'LoadingPanel.ContainerElementID = ""
        ''End If
        If datest.Value = Nothing Then
            datest.Date = ngaybt
        End If
        If dateen.Value = Nothing Then
            dateen.Date = ngaykt
        End If

        If Session("TenDangNhap") Is Nothing Then
        Else
            Try

                pb = oj.Getpb(Session("TenDangNhap").ToString())
                xem = oj.Getquen(Session("TenDangNhap").ToString())
                sua = oj.Getsua(Session("TenDangNhap").ToString())
            Catch ex As Exception

            End Try

        End If

        If xem = 0 Or xem = 3 Then
            Dim column As GridViewDataColumn = TryCast(ASPxGridView1.Columns("TenCT"), GridViewDataColumn)
            If column Is Nothing Then
                Return
            End If
            ASPxGridView1.SettingsEditing.NewItemRowPosition = GridViewNewItemRowPosition.Top
            'column.EditFormSettings.VisibleIndex = 1
            column.EditFormSettings.ColumnSpan = 4
            column.EditFormSettings.RowSpan = 1



            If pb = "AP&P" Or pb = "IT" Then
                btchay.Visible = sua
                butsyn.Visible = sua
                Btsyns.Visible = sua

            Else

                btchay.Visible = False
                btchays.Visible = sua
                Btsyns.Visible = sua
                butsyn.Visible = False


            End If
        Else
            Dim url As String = Request.Url.AbsoluteUri
            Session("UrlReturn") = url

            Response.Redirect("~/Account/Thongbao.html")

        End If


    End Sub


    Private Function StoreToDataTable(MaCT As String, tenct As String, nhan As String, loaict As String, tyle As Double, TuNgay As Date, DenNgay As Date, type As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@Mact", SqlDbType.NVarChar), New SqlParameter("@TenCT", SqlDbType.NVarChar), New SqlParameter("@NhanSP", SqlDbType.NVarChar), New SqlParameter("@LoaiCT", SqlDbType.NVarChar), New SqlParameter("@TyleCK", SqlDbType.Real), New SqlParameter("@ngaybd", SqlDbType.SmallDateTime), New SqlParameter("@ngaykt", SqlDbType.SmallDateTime), New SqlParameter("@type", SqlDbType.NVarChar)}
        arrParam(0).Value = MaCT
        arrParam(1).Value = tenct
        arrParam(2).Value = nhan
        arrParam(3).Value = loaict
        arrParam(4).Value = tyle
        arrParam(5).Value = TuNgay
        arrParam(6).Value = DenNgay
        arrParam(7).Value = type
        Return oj.ThucThiStore_DataSets("upctkm", arrParam).Tables(0)
    End Function

    Private Function chayclam(Username As String, TuNgay As Date, DenNgay As Date) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@Username", SqlDbType.NVarChar), New SqlParameter("@TuNgay", SqlDbType.SmallDateTime), New SqlParameter("@DenNgay", SqlDbType.SmallDateTime)}
        arrParam(0).Value = Username
        arrParam(1).Value = TuNgay
        arrParam(2).Value = DenNgay

        Return oj.ThucThiStore_DataSets("getclaim_all", arrParam).Tables(0)
    End Function
    Private Function chayclams(mact As String, TuNgay As Date, DenNgay As Date)
        'Dim arrParam As SqlParameter() = {New SqlParameter("@Mact", SqlDbType.NVarChar), New SqlParameter("@TuNgay", SqlDbType.SmallDateTime), New SqlParameter("@DenNgay", SqlDbType.SmallDateTime)}
        'arrParam(0).Value = mact
        'arrParam(1).Value = TuNgay
        'arrParam(2).Value = DenNgay

        'Return oj.ThucThiStore_DataSets("getclaim_Macts", arrParam)





    End Function


    Private Sub butsyn_Click(sender As Object, e As EventArgs) Handles butsyn.Click
        Dim num As Integer



        Dim fieldValues As List(Of Object) = ASPxGridView1.GetSelectedFieldValues(New String() {"MaCT", "TenCT", "NhanSP", "LoaiCT", "TyleCK", "Ngaybd", "Ngaykt", "Type", "lock_Pro"})
        For Each item As Object() In fieldValues
            If item(8) = 1 Then
                Dim dtb As DataTable = StoreToDataTable(item(0).ToString(), item(1).ToString(), item(2).ToString(), item(3).ToString(), CDbl(item(4)), CDate(item(5).ToString()), CDate(item(6).ToString()), item(7).ToString())
                num = Integer.Parse("0" + dtb.Rows(0)(0))
                Response.Write("<script LANGUAGE='JavaScript' >alert('đã chuyển thành công " + item(0).ToString() + " ssang unzadata')</script>")

            Else
                Response.Write("<script LANGUAGE='JavaScript' >alert('Chương trình " + item(0).ToString() + " đã hết hạn thời gian chỉnh sửa')</script>")

            End If
        Next item



    End Sub

    Private Sub ASPxGridView1_CommandButtonInitialize(sender As Object, e As ASPxGridViewCommandButtonEventArgs) Handles ASPxGridView1.CommandButtonInitialize
        If e.VisibleIndex = -1 Then
            Return
        End If
        Dim fieldValue As Object = ASPxGridView1.GetRowValues(e.VisibleIndex, "lock_Pro")
        Select Case e.ButtonType
            Case ColumnCommandButtonType.Edit
                e.Visible = sua
                Exit Select
                'Case ColumnCommandButtonType.Delete
                '    Visible = sua
                '    Exit Select
        End Select

        Select Case e.ButtonType
            Case ColumnCommandButtonType.Delete
                If pb = "IT" Then
                    e.Visible = True
                Else
                    e.Visible = False
                End If
            Case ColumnCommandButtonType.Update

                If fieldValue = "N" Then
                    e.Visible = True
                Else
                    e.Visible = False
                End If

                Exit Select
                'Case ColumnCommandButtonType.Delete
                '    Visible = sua
                '    Exit Select
        End Select
        Select Case e.ButtonType
            Case ColumnCommandButtonType.New
                e.Visible = sua
                Exit Select
                'Case ColumnCommandButtonType.Delete
                '    Visible = sua
                '    Exit Select
        End Select

    End Sub

    Private Sub ASPxGridView1_CustomButtonInitialize(sender As Object, e As ASPxGridViewCustomButtonEventArgs) Handles ASPxGridView1.CustomButtonInitialize

        e.Visible = sua




    End Sub










    Protected Sub GirlNpp_DataSelect(ByVal sender As Object, ByVal e As EventArgs)


        Session("MaCT") = (TryCast(sender, ASPxGridView)).GetMasterRowFieldValues("MaCT")

    End Sub
    Protected Sub GirlKM_DataSelect(ByVal sender As Object, ByVal e As EventArgs)
        'GirlKM.StartEdit(1)
        Session("MaCT") = (TryCast(sender, ASPxGridView)).GetMasterRowFieldValues("MaCT")

    End Sub
    Protected Sub Girlqd_DataSelect(ByVal sender As Object, ByVal e As EventArgs)
        'GirlKM.StartEdit(1)
        Session("MaCT") = (TryCast(sender, ASPxGridView)).GetMasterRowFieldValues("MaCT")

    End Sub
    Protected Sub Girlad_DataSelect(ByVal sender As Object, ByVal e As EventArgs)
        'GirlKM.StartEdit(1)
        Session("MaCT") = (TryCast(sender, ASPxGridView)).GetMasterRowFieldValues("MaCT")

    End Sub
    Protected Sub GirlNpp_InitNewRow(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInitNewRowEventArgs)


        e.NewValues("MS_CTKM") = (TryCast(sender, ASPxGridView)).GetMasterRowFieldValues("MaCT")
        e.NewValues("Trangthai") = True
        e.NewValues("Region") = "ALL"
        e.NewValues("Area") = "ALL"

        e.NewValues("Customer") = "ALL"
        Dim col As GridViewCommandColumn = TryCast(TryCast(sender, ASPxGridView).Columns(0), GridViewCommandColumn)

        col.UpdateButton.Text = "Create"



    End Sub
    Protected Sub GirlKM_InitNewRow(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInitNewRowEventArgs)

        'End Function

        e.NewValues("MS_CTKM") = (TryCast(sender, ASPxGridView)).GetMasterRowFieldValues("MaCT")
        e.NewValues("Brand") = "ALL"
        e.NewValues("Nhan") = "ALL"
        e.NewValues("Mui") = "ALL"
        e.NewValues("Size") = "ALL"
        e.NewValues("Loai") = "ALL"
        e.NewValues("MaSP") = "ALL"
        Dim col As GridViewCommandColumn = TryCast(TryCast(sender, ASPxGridView).Columns(0), GridViewCommandColumn)

        col.UpdateButton.Text = "Create"

    End Sub
    Protected Sub Girlqd_InitNewRow(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInitNewRowEventArgs)

        'End Function

        e.NewValues("Nhan") = "ALL"
        e.NewValues("Size") = "ALL"
        e.NewValues("MaSP") = "ALL"
        e.NewValues("MS_CTKM") = (TryCast(sender, ASPxGridView)).GetMasterRowFieldValues("MaCT")
        Dim col As GridViewCommandColumn = TryCast(TryCast(sender, ASPxGridView).Columns(0), GridViewCommandColumn)

        col.UpdateButton.Text = "Create"

    End Sub
    Protected Sub Girlad_InitNewRow(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInitNewRowEventArgs)

        'End Function

        e.NewValues("MS_CTKM") = (TryCast(sender, ASPxGridView)).GetMasterRowFieldValues("MaCT")
        e.NewValues("Brand") = "ALL"
        e.NewValues("Nhan") = "ALL"
        e.NewValues("Mui") = "ALL"
        e.NewValues("Size") = "ALL"
        e.NewValues("Loai") = "ALL"
        e.NewValues("MaSP") = "ALL"
        Dim col As GridViewCommandColumn = TryCast(TryCast(sender, ASPxGridView).Columns(0), GridViewCommandColumn)

        col.UpdateButton.Text = "Create"


    End Sub
    Protected Sub Girlcb_DataSelect(ByVal sender As Object, ByVal e As EventArgs)
        'GirlKM.StartEdit(1)
        'Session("MaCT") = (TryCast(sender, ASPxGridView)).GetMasterRowFieldValues("MS_CTKM")
        Session("MaCT") = (TryCast(sender, ASPxGridView)).GetMasterRowFieldValues("MaCT")
    End Sub
    Protected Sub Girlcb_InitNewRow(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInitNewRowEventArgs)

        'End Function

        e.NewValues("MS_CTKM") = (TryCast(sender, ASPxGridView)).GetMasterRowFieldValues("MaCT")

        e.NewValues("Brand") = "ALL"
        e.NewValues("Nhan") = "ALL"
        e.NewValues("Mui") = "ALL"
        e.NewValues("Size") = "ALL"
        e.NewValues("Loai") = "ALL"
        e.NewValues("MaSP") = "ALL"
        Dim col As GridViewCommandColumn = TryCast(TryCast(sender, ASPxGridView).Columns(0), GridViewCommandColumn)

        col.UpdateButton.Text = "Create"


    End Sub



    'Protected Function GetMemoText() As String
    '    Dim pageControl As ASPxPageControl = TryCast(ASPxGridView1.FindEditFormTemplateControl("pageControl"), ASPxPageControl)
    '    Dim memo As ASPxMemo = TryCast(pageControl.FindControl("TenCTs"), ASPxMemo)
    '    Return memo.Text
    'End Function


    Private copiedValues As Hashtable = Nothing
    'Private copiedFields() As String = {"ID", "MaCT", "TenCT", "NhanSP", "LoaiCT", "TyleCK", "Ngaybd", "Ngaykt", "Type"}

    Private copiedFields() As String = {"ID", "MaCT", "TenCT", "NhanSP", "LoaiCT", "TyleCK", "Ngaybd", "Ngaykt", "Type"}
    'Protected Sub GirlNpp_CustomButtonCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomButtonCallbackEventArgs)
    '    If e.ButtonID <> "add" Then
    '        Return
    '    End If
    '    Dim builder As New StringBuilder()
    '    builder.Append("<script language=JavaScript> ShowCreateAccountWindow(); </script>" & vbLf)
    '    Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())

    'End Sub
    'Protected Sub ASPxGridView1_CustomButtonCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomButtonCallbackEventArgs)
    '    If e.ButtonID = "copy" Then

    '        If sua = True Then
    '            'copiedValues = New Hashtable()
    '            'For Each fieldName As String In copiedFields
    '            '    copiedValues(fieldName) = ASPxGridView1.GetRowValues(e.VisibleIndex, fieldName)

    '            'Next fieldName
    '            'ASPxGridView1.AddNewRow()
    '            'End If
    '            fMS_CTKM.Text = "ALL"
    '            ' popup.ShowOnPageLoad = True

    '            'Dim builder As New StringBuilder()

    '            'builder.Append("<script language=JavaScript> ShowCreateAccountWindow(); </script>" & vbLf)
    '            'Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())
    '        End If
    '        'ElseIf e.ButtonID = "btCTKM" Then
    '        '    Dim ss As String
    '        '    ss = ASPxGridView1.GetRowValues(e.VisibleIndex, "MaCT").ToString
    '        '    ''Dim dtb As DataTable = chayclams(ss, CDate(datest.Value), CDate(dateen.Value))
    '        '    ''Dim num = Integer.Parse("0" + dtb.Rows(0)(0))

    '        '    Dim num = oj.chaycls(ss, CDate(datest.Value), CDate(dateen.Value))


    '        '    If num = 0 Then
    '        '        Response.Write("<script LANGUAGE='JavaScript' >alert('đã chạy cliam Không thành công  ')</script>")
    '        '    Else
    '        '        Response.Write("<script LANGUAGE='JavaScript' >alert('đã chạy cliam thành công  ')</script>")
    '        '    End If
    '        '    ASPxGridView1.AddNewRow()



    '    Else
    '        Return
    '    End If

    'End Sub

    'Protected Sub ASPxGridView1_InitNewRow(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInitNewRowEventArgs)
    '    If copiedValues Is Nothing Then
    '        Return
    '    End If
    '    'For Each fieldName As String In copiedFields
    '    '    e.NewValues(fieldName) = copiedValues(fieldName)
    '    '    'If fieldName = "ID" Then
    '    '    '    e.NewValues(fieldName) = e.NewValues(fieldName) + 1
    '    '    'End If
    '    '    If fieldName = "MaCT" Then
    '    '        e.NewValues(fieldName) = e.NewValues(fieldName) + "new"
    '    '        Session("MaCT") = e.NewValues(fieldName)
    '    '    End If
    '    'Next fieldName
    'End Sub

    Private Sub Btsyns_Click(sender As Object, e As EventArgs)
        Using con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
            'Dim Con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
            Using cmd As New SqlCommand("importctkm")
                Using sda As New SqlDataAdapter()
                    cmd.CommandType = CommandType.StoredProcedure
                    Dim userId As Integer = 0

                    cmd.Connection = con
                    con.Open()
                    userId = Convert.ToInt32(cmd.ExecuteScalar())
                    con.Close()
                    ASPxGridView1.DataBind()
                End Using
            End Using

        End Using
    End Sub
    Protected Sub callbackPanel_Callback(ByVal source As Object, ByVal e As CallbackEventArgsBase)
        '    '    'edBinaryImage.Value = FindImage(e.Parameter)
        ' fMS_CTKM.Text = GetNotes(e.Parameter).ToString()
        '  fMS_CTKM.Text = ASPxGridView1.GetRowValues(e.Parameter, "MaCT").ToString

        '  fMS_CTKM.Text = String.Format("DevExpress: VisibleIndex = {0}", e.Parameter)

        '    Return memo.Text
        ''fMS_CTKM.Text = GetNotes(e.Parameter)

        'Dim fieldValues As List(Of Object) = ASPxGridView1.GetRowValues(e.Parameter, "MaCT")
        'For Each item As Object() In fieldValues


        'Dim dtb As DataTable = chayclams(item(0).ToString(), CDate(datest.Value), CDate(dateen.Value))
        'num = Integer.Parse("0" + dtb.Rows(0)(0))
        'Response.Write("<script LANGUAGE='JavaScript' >alert('đã chạy cliam thành công  ')</script>")
        'fMS_CTKM.Text = item(0).ToString()


        'Next item




        '    Session("MaCT") = GetNotes(e.Parameter).ToString()
        '    'Session("MaCT") = (TryCast(e, ASPxGridView)).GetMasterRowFieldValues("MaCT")
    End Sub
    'Protected Sub ASPxGridView2_InitNewRow(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInitNewRowEventArgs)

    '    'End Function

    '    e.NewValues("MaCT") = Session("MaCT")




    'End Sub
    Private Function GetNotes(ByVal id As String) As String
        'Dim ds As New AccessDataSource()
        'Dim d As String
        'Dim fieldValues As List(Of Object) = ASPxGridView1.GetSelectedFieldValues(New String() {"MaCT", "TenCT"})
        'For Each item As Object() In fieldValues
        '    d = item(0).ToString()
        '    Return d
        'Next item


        Dim dtb As DataSet = oj.Getctkm(id)

        Return dtb.Tables(0).Rows(0)("MaCT").ToString
        'Dim pageControl As ASPxPageControl = TryCast(ASPxGridView1.FindEditFormTemplateControl("pageControl"), ASPxPageControl)
        'Dim memo As ASPxMemo = TryCast(pageControl.FindControl("TenCTs"), ASPxMemo)
        'Return memo.Text
        ''ds.DataFile = AccessDataSource1.DataFile
        'ds.SelectCommand = String.Format("Select Notes FROM [Employees] WHERE [EmployeeId]={0}", id)
        'Dim view As DataView = CType(ds.Select(DataSourceSelectArguments.Empty), DataView)
        'If view.Count > 0 Then
        '    Return view(0)("Notes")
        'End If
        'Return Nothing
    End Function
    Protected Sub cbAll_Init(ByVal sender As Object, ByVal e As EventArgs)
        Dim chk As ASPxCheckBox = TryCast(sender, ASPxCheckBox)
        Dim grid As ASPxGridView = (TryCast(chk.NamingContainer, GridViewHeaderTemplateContainer)).Grid
        chk.Checked = (grid.Selection.Count = grid.VisibleRowCount)
    End Sub
    'Private Function FindImage(ByVal id As String) As Byte()
    '    Dim ds As New AccessDataSource()
    '    'ds.DataFile = AccessDataSource1.DataFile
    '    'ds.SelectCommand = "select Photo from [Employees] where employeeid=" & id
    '    'Dim view As DataView = CType(ds.Select(DataSourceSelectArguments.Empty), DataView)
    '    'If view.Count > 0 Then
    '    '    Return TryCast(view(0)(0), Byte())
    '    'End If
    '    'Return Nothing
    'End Function

    Private Sub btchay_Click(sender As Object, e As EventArgs) Handles btchay.Click

        Dim num = oj.chayclALL(Session("TenDangNhap"), CDate(datest.Value), CDate(dateen.Value))

        If num = 0 Then
            Response.Write("<script LANGUAGE='JavaScript' >alert('đã chạy cliam Không thành công  ')</script>")
        Else
            Response.Write("<script LANGUAGE='JavaScript' >alert('đã chạy thành công  ')</script>")
        End If
    End Sub

    'Private Sub btchays_Click(sender As Object, e As EventArgs)

    '    Dim dtb As DataTable = chayclams((TryCast(sender, ASPxGridView)).GetMasterRowFieldValues("MaCT"), CDate(datest.Value), CDate(dateen.Value))
    '    Dim num = Integer.Parse("0" + dtb.Rows(0)(0))
    '    Response.Write("<script LANGUAGE='JavaScript' >alert('đã chạy cliam thành công  ')</script>")
    'End Sub

    Private Sub btchays_Click1(sender As Object, e As EventArgs) Handles btchays.Click


        Dim newDate As DateTime = DateTime.Now.AddMonths(1)
        Dim fieldValues As List(Of Object) = ASPxGridView1.GetSelectedFieldValues(New String() {"ID", "MaCT"})

        For Each item As Object() In fieldValues
            Session("KeyValue") = item(0).ToString
            If Session("KeyValue").ToString <> "" Then
                fMS_CTKM.Text = item(1).ToString
                tMS_CTKM.Text = Left(item(1).ToString, Len(item(1).ToString) - 4) + newDate.ToString("MM") + Right(newDate.ToString("yyyy"), 2)
                Dim builder As New StringBuilder()

                builder.Append("<script language=JavaScript> ShowCreateAccountWindow(); </script>" & vbLf)
                Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())

            Else
                Response.Write("<script LANGUAGE='JavaScript' >alert('Vui lòng chọn CTKM   ')</script>")
            End If
            'Dim dtb As DataTable = chayclams(item(0).ToString(), CDate(datest.Value), CDate(dateen.Value))
            'num = Integer.Parse("0" + dtb.Rows(0)(0))
            'Response.Write("<script LANGUAGE='JavaScript' >alert('đã chạy cliam thành công  ')</script>")

            'num = oj.chaycls(item(0).ToString(), CDate(datest.Value), CDate(dateen.Value))


            'If num = 0 Then
            '    Response.Write("<script LANGUAGE='JavaScript' >alert('đã chạy cliam Không thành công  ')</script>")
            'Else

            'Response.Write("<script LANGUAGE='JavaScript' >alert('đã chạy thành công " + item(0).ToString() + " ')</script>")
            'End If
        Next item

    End Sub

    Protected Sub btCreate_Click(sender As Object, e As EventArgs) Handles btCreate.Click
        Dim num As Integer

        Dim dtb As DataTable = copyctkm(Session("TenDangNhap"), fMS_CTKM.Text, tMS_CTKM.Text, nbatdau.Value, nketthuc.Value)
        num = Integer.Parse("0" + dtb.Rows(0)(0))
        'dateen.Date = dateen.Date.AddMonths(1)
        'datest.Date = datest.Date.AddMonths(1)
        ASPxGridView1.FilterExpression = ""
        'Session("KeyValue") = num
        If num <> 0 Then
            Dim dtbd As DataSet = oj.Getctkmid(num)
            datest.Date = CDate(dtbd.Tables(0)(0)("Ngaybd"))
            dateen.Date = CDate(dtbd.Tables(0)(0)("Ngaykt"))
            'Response.Write("<script LANGUAGE='JavaScript' >alert('Copy thành công  ')</script>")
            Dim index = ASPxGridView1.FindVisibleIndexByKeyValue(num)
            ASPxGridView1.StartEdit(index)
        End If
    End Sub
    Private Function copyctkm(use As String, nguon As String, dich As String, nbd As Date, nkt As Date) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@Username", SqlDbType.NVarChar), New SqlParameter("@CTKM_nguon", SqlDbType.NVarChar), New SqlParameter("@CTKM_dich", SqlDbType.NVarChar), New SqlParameter("@Nbd", SqlDbType.DateTime), New SqlParameter("@Nkt", SqlDbType.DateTime)}
        arrParam(0).Value = use
        arrParam(1).Value = nguon
        arrParam(2).Value = dich
        arrParam(3).Value = nbd
        arrParam(4).Value = nkt

        Return oj.ThucThiStore_DataSets("copyctkm_New", arrParam).Tables(0)





    End Function

    Protected Sub ASPExport_Click(sender As Object, e As EventArgs) Handles ASPExport.Click
        ASPxGridViewExporter1.WriteXlsxToResponse()
    End Sub


    'Protected Sub BtNew_Click(sender As Object, e As EventArgs) Handles BtNew.Click
    '    Dim builder As New StringBuilder()

    '    builder.Append("<script language=JavaScript> Show1(); </script>" & vbLf)
    '    Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())


    'End Sub

    Protected Sub ASPxSV_Click(sender As Object, e As EventArgs) Handles ASPxSV.Click
        Dim num As Integer
        'Getctkmid' NgayBD = CDate(dtset.Tables(0).Rows(0)("DateFrom"))
        Dim dtb As DataTable = luu(MaCT.Text, TenCTs.Text, NhanSPx.Text, LoaiCT.Value.ToString, CDbl(TyleCKS.Value), Ngaybd.Value, Ngaykts.Value, Loai.Value.ToString, CDbl(Ngansachs.Value), Session("TenDangNhap"), khongapdungs.Text)
        num = Integer.Parse("0" + dtb.Rows(0)(0))
        MaCT.Text = ""
        TenCTs.Text = ""
        NhanSPx.Text = ""
        LoaiCT.Value = ""
        TyleCKS.Value = 0
        Ngaybd.Value = datest.Date.AddMonths(1)
        Ngaykts.Value = dateen.Date.AddMonths(1)
        Loai.Value = ""
        Ngansachs.Value = 0
        'dateen.Date = dateen.Date.AddMonths(1)
        'datest.Date = datest.Date.AddMonths(1)
        ASPxGridView1.FilterExpression = ""
        'Session("KeyValue") = num
        If num <> 0 Then

            Dim dtbd As DataSet = oj.Getctkmid(num)
            datest.Date = CDate(dtbd.Tables(0)(0)("Ngaybd"))
            dateen.Date = CDate(dtbd.Tables(0)(0)("Ngaykt"))
            'Response.Write("<script LANGUAGE='JavaScript' >alert('Copy thành công  ')</script>")
            Dim index = ASPxGridView1.FindVisibleIndexByKeyValue(num)
            ASPxGridView1.StartEdit(index)
        End If
    End Sub



    Private Function luu(MaCT As String, tenct As String, nhan As String, loaict As String, tyle As Double, TuNgay As Date, DenNgay As Date, type As String, ns As Double, User As String, kad As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@Mact", SqlDbType.NVarChar), New SqlParameter("@TenCT", SqlDbType.NVarChar), New SqlParameter("@NhanSP", SqlDbType.NVarChar), New SqlParameter("@LoaiCT", SqlDbType.NVarChar), New SqlParameter("@TyleCK", SqlDbType.Real), New SqlParameter("@ngaybd", SqlDbType.SmallDateTime), New SqlParameter("@ngaykt", SqlDbType.SmallDateTime), New SqlParameter("@type", SqlDbType.NVarChar), New SqlParameter("@Ngansach", SqlDbType.NVarChar), New SqlParameter("@Users", SqlDbType.NVarChar), New SqlParameter("@kad", SqlDbType.NVarChar)}
        arrParam(0).Value = MaCT
        arrParam(1).Value = tenct
        arrParam(2).Value = nhan
        arrParam(3).Value = loaict
        arrParam(4).Value = tyle
        arrParam(5).Value = TuNgay
        arrParam(6).Value = DenNgay
        arrParam(7).Value = type
        arrParam(8).Value = ns
        arrParam(9).Value = User
        arrParam(10).Value = kad

        Return oj.ThucThiStore_DataSets("new", arrParam).Tables(0)
    End Function


End Class