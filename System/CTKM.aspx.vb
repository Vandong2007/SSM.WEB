Imports System.Data.SqlClient
Imports Microsoft.VisualBasic
Imports System
Imports System.Threading
Imports System.Web.UI
Imports DevExpress.Web.ASPxTabControl
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.Data
Imports DevExpress.Web.ASPxGridView

Public Class CTKM
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
        Dim column As GridViewDataColumn = TryCast(ASPxGridView1.Columns("TenCT"), GridViewDataColumn)
        If column Is Nothing Then
            Return
        End If
        ASPxGridView1.SettingsEditing.NewItemRowPosition = GridViewNewItemRowPosition.Top
        column.EditFormSettings.VisibleIndex = 2
        column.EditFormSettings.ColumnSpan = 3
        column.EditFormSettings.RowSpan = 1
        Btsyns.Visible = sua
        butsyn.Visible = sua


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

   



    Private Sub butsyn_Click(sender As Object, e As EventArgs) Handles butsyn.Click
        'Dim num As Integer



        'Dim fieldValues As List(Of Object) = ASPxGridView1.GetSelectedFieldValues(New String() {"MaCT", "TenCT", "NhanSP", "LoaiCT", "TyleCK", "Ngaybd", "Ngaykt", "Type"})
        'For Each item As Object() In fieldValues

        '    Dim dtb As DataTable = StoreToDataTable(item(0).ToString(), item(1).ToString(), item(2).ToString(), item(3).ToString(), CDbl(item(4)), CDate(item(5).ToString()), CDate(item(6).ToString()), item(7).ToString())
        '    num = Integer.Parse("0" + dtb.Rows(0)(0))
        '    Response.Write("<script LANGUAGE='JavaScript' >alert('đã chuyển thành công " + item(0).ToString() + " ssang unzadata')</script>")
        'Next item



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
        End Select
        Select Case e.ButtonType
            Case ColumnCommandButtonType.Delete
                e.Visible = sua
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

    

     

   

    Protected Sub ASPxGridView1_RowUpdating(ByVal sender As Object, ByVal e As ASPxDataUpdatingEventArgs) Handles ASPxGridView1.RowUpdating
        'e.NewValues("TenCT") = GetMemoText()

    End Sub
    Protected Sub ASPxGridView1_RowInserting(ByVal sender As Object, ByVal e As ASPxDataInsertingEventArgs)
        'e.NewValues("TenCT") = GetMemoText()

    End Sub
    Protected Sub ASPxGridView1_CellEditorInitialize(ByVal sender As Object, ByVal e As ASPxGridViewEditorEventArgs)

        'If e.Column.FieldName = "NhanSP" Then
        '    Dim cmb As ASPxComboBox = TryCast(e.Editor, ASPxComboBox)
        '    cmb.DataSource = SqlDataSource2
        '    cmb.ValueField = "NhanSP"
        '    cmb.ValueType = GetType(Int32)
        '    cmb.TextField = "NhanSP"
        '    cmb.DataBindItems()
        'End If
    End Sub
    Protected Sub ASPdtad_DataSelect(ByVal sender As Object, ByVal e As EventArgs)
        'Dim loai As String = (TryCast(sender, ASPxGridView)).GetMasterRowFieldValues("Type").ToString()
        'If loai = "E" Then

        Session("MaCT") = (TryCast(sender, ASPxGridView)).GetMasterRowFieldValues("MaCT")
        'Else
        '    Session("MaCT") = ""

        'End If
    End Sub
    Protected Sub ASPKM_DataSelect(ByVal sender As Object, ByVal e As EventArgs)
        'Dim loai As String = (TryCast(sender, ASPxGridView)).GetMasterRowFieldValues("Type").ToString()
        'If loai = "E" Then

        Session("MaCT") = (TryCast(sender, ASPxGridView)).GetMasterRowFieldValues("MaCT")
        'Else
        '    Session("MaCT") = ""

        'End If
    End Sub

    Protected Sub ASPdtad_InitNewRow(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInitNewRowEventArgs)

        'Dim loai As String = (TryCast(sender, ASPxGridView)).GetMasterRowFieldValues("Type").ToString()
        'If loai = "E" Then
        '    e.NewValues("MS_CTKM") = (TryCast(sender, ASPxGridView)).GetMasterRowFieldValues("MaCT")
        '    e.NewValues("Trangthai") = 1



        'End If

    End Sub
    Protected Sub btnXlsxExport_Click(ByVal sender As Object, ByVal e As EventArgs)
        ASPxGridViewExporter1.WriteXlsxToResponse()
    End Sub
    Protected Sub btnXlsxExport1_Click(ByVal sender As Object, ByVal e As EventArgs)
        ASPxGridViewExporter2.WriteXlsxToResponse()
    End Sub

    'Protected Function GetMemoText() As String
    '    Dim pageControl As ASPxPageControl = TryCast(ASPxGridView1.FindEditFormTemplateControl("pageControl"), ASPxPageControl)
    '    Dim memo As ASPxMemo = TryCast(pageControl.FindControl("TenCTs"), ASPxMemo)
    '    Return memo.Text
    'End Function
 
  
    Private copiedValues As Hashtable = Nothing
    'Private copiedFields() As String = {"ID", "MaCT", "TenCT", "NhanSP", "LoaiCT", "TyleCK", "Ngaybd", "Ngaykt", "Type"}

    Private copiedFields() As String = {"MaCT", "TenCT", "NhanSP", "LoaiCT", "TyleCK", "Ngaybd", "Ngaykt", "Type"}
    'Protected Sub GirlNpp_CustomButtonCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomButtonCallbackEventArgs)
    '    If e.ButtonID <> "add" Then
    '        Return
    '    End If
    '    Dim builder As New StringBuilder()
    '    builder.Append("<script language=JavaScript> ShowCreateAccountWindow(); </script>" & vbLf)
    '    Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())

    'End Sub
    Protected Sub ASPxGridView1_CustomButtonCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomButtonCallbackEventArgs)
        If e.ButtonID <> "copy" Then
            Return
        End If
        If sua = True Then
            copiedValues = New Hashtable()
            For Each fieldName As String In copiedFields
                copiedValues(fieldName) = ASPxGridView1.GetRowValues(e.VisibleIndex, fieldName)

            Next fieldName
            ASPxGridView1.AddNewRow()
        End If


    End Sub
    Protected Sub ASPxGridView1_InitNewRow(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInitNewRowEventArgs)
        If copiedValues Is Nothing Then
            Return
        End If
        For Each fieldName As String In copiedFields
            e.NewValues(fieldName) = copiedValues(fieldName)
            'If fieldName = "ID" Then
            '    e.NewValues(fieldName) = e.NewValues(fieldName) + 1
            'End If
            If fieldName = "MaCT" Then
                e.NewValues(fieldName) = e.NewValues(fieldName) + "new"
                Session("MaCT") = e.NewValues(fieldName)
            End If
        Next fieldName
    End Sub
 
    Private Sub Btsyns_Click(sender As Object, e As EventArgs) Handles Btsyns.Click
        'Using con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        '    'Dim Con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        '    Using cmd As New SqlCommand("importctkm")
        '        Using sda As New SqlDataAdapter()
        '            cmd.CommandType = CommandType.StoredProcedure
        '            Dim userId As Integer = 0

        '            cmd.Connection = con
        '            con.Open()
        '            userId = Convert.ToInt32(cmd.ExecuteScalar())
        '            con.Close()
        '            ASPxGridView1.DataBind()
        '        End Using
        '    End Using

        'End Using
    End Sub

    
End Class