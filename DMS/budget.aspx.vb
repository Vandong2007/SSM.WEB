Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxGridView
Imports System.Data.OleDb
Imports System.IO
Imports System.Data.SqlClient

Public Class budget
    Inherits AdminPage
    Dim oj As New SSMDATA
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsPostBack = False Then
            txtNam.Text = Today.Year.ToString
        End If
        If Session("dd") Is Nothing Then
        Else
            ggiohang.DataSource = Session("dd")
            ggiohang.DataBind()
        End If
    End Sub
    Protected Sub ASPxButton2_Click(sender As Object, e As EventArgs) Handles ASPxButton2.Click
        If FileUpload3.PostedFile.FileName.Trim <> "" Then

            Dim FileName As String = Path.GetFileName(FileUpload3.PostedFile.FileName)

            Dim Extension As String = Path.GetExtension(FileUpload3.PostedFile.FileName)

            Dim FolderPath As String = ConfigurationManager.AppSettings("FolderPath")



            Dim FilePath As String = Server.MapPath(FolderPath + Session("TenDangNhap").ToString + FileName)

            FileUpload3.SaveAs(FilePath)
            '    ASPxTextBox1.Text = FilePath
            Import_To_Grid(FilePath, Extension)
            Dim builder As New StringBuilder()
            builder.Append("<script language=JavaScript> ShowCreateAccountWindow(); </script>" & vbLf)
            Page.ClientScript.RegisterStartupScript(Me.[GetType](), "ShowPopup", builder.ToString())
        End If

    End Sub
    Private Sub Import_To_Grid(ByVal FilePath As String, ByVal Extension As String)



        Dim connString As String = String.Empty
        Session("dd") = Nothing
        Select Case Extension
            Case ".xls"
                'Excel 97-03
                connString = ConfigurationManager.ConnectionStrings("Excel03ConString").ConnectionString
                Exit Select
            Case ".xlsx"
                'Excel 07 or higher
                connString = ConfigurationManager.ConnectionStrings("Excel07+ConString").ConnectionString
                Exit Select


        End Select
        connString = String.Format(connString, FilePath)
        Using excel_con As New OleDbConnection(connString)
            excel_con.Open()
            Dim sheet1 As String = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing).Rows(0)("TABLE_NAME").ToString()
            Dim dtExcelData As New DataTable()

            dtExcelData.Columns.AddRange(New DataColumn(6) {
                 New DataColumn("type", GetType(String)), _
                 New DataColumn("maintype", GetType(String)), _
                 New DataColumn("subbrand", GetType(String)), _
                 New DataColumn("syear", GetType(Integer)), _
                 New DataColumn("speriod", GetType(Integer)), _
                 New DataColumn("amount", GetType(Double)), _
                 New DataColumn("status", GetType(Boolean))
            })

            Using oda As New OleDbDataAdapter("SELECT type,	maintype,	subbrand,	syear,	speriod,	amount,	status  FROM  [" & sheet1 & "]", excel_con)
                oda.Fill(dtExcelData)
            End Using
            'Dim newCol As New DataColumn("Id", GetType(Integer))
            'newCol.AllowDBNull = True
            'dtExcelData.Columns.Add(newCol)
            'For Each row As DataRow In dtExcelData.Rows
            '    row("Id") = dtExcelData.Rows.IndexOf(row)
            'Next
            'if you don't want to allow null-values'
            'newCol.AllowDBNull = False

            'GrDic.Caption = Path.GetFileName(FilePath)
            'GrDic.DataSource = dtExcelData

            'GrDic.DataBind()
            Session("dd") = dtExcelData
            ggiohang.DataSource = Session("dd")
            ggiohang.DataBind()

            excel_con.Close()
        End Using
        'ASPxGridView1.GetTotalSummaryValue()
        'Dim gsiValue As Date = Convert.ToDateTime(ASPxGridView1.GetGroupSummaryValue(0, ASPxGridView1.GroupSummary("Ngay", DevExpress.Data.SummaryItemType.Max)))

    End Sub

    Protected Sub spinEdit_Init(ByVal sender As Object, ByVal e As EventArgs)
        Dim spin As ASPxSpinEdit = TryCast(sender, ASPxSpinEdit)
        Dim container As GridViewDataItemTemplateContainer = TryCast(spin.NamingContainer, GridViewDataItemTemplateContainer)


        Dim price As Decimal = 1
        spin.ClientSideEvents.ValueChanged = String.Format("function(s, e) {{ var value = s.GetValue() * {1}; txtBox{0}.SetValue(value); CalculateTotal(); }}", container.VisibleIndex, price)
    End Sub
    Protected Sub tbTotal_Init(ByVal sender As Object, ByVal e As EventArgs)
        Dim tb As ASPxTextBox = TryCast(sender, ASPxTextBox)
        Dim container As GridViewDataItemTemplateContainer = TryCast(tb.NamingContainer, GridViewDataItemTemplateContainer)

        tb.ClientInstanceName = String.Format("txtBox{0}", container.VisibleIndex)
    End Sub

    Protected Sub Bt_dieuChinh_Click(sender As Object, e As EventArgs) Handles Bt_dieuChinh.Click

        If Session("dd") Is Nothing Then
        Else



            Dim db As DataTable = TryCast(Session("dd"), DataTable)

            If db.Rows.Count > 0 Then
                For Each DBd As DataRow In db.Rows

                    Dim num As Integer
                    Try
                        Using con1 As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())


                            'Dim Con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
                            Using cmd1 As New SqlCommand("UPDATE tbbudget SET Status = 0, [Change] = getdate(),[users]='" & Session("TenDangNhap") & "'  WHERE (type ='" & DBd("type").ToString & "' and maintype ='" & DBd("maintype").ToString & "' and subbrand ='" & DBd("subbrand").ToString & "' and syear = " & DBd("syear").ToString & " and speriod = " & DBd("speriod").ToString & " )", con1)

                                con1.Open()
                                '// mo ket noi 
                                cmd1.ExecuteNonQuery()

                                ' // thuc thi 
                                con1.Close()
                            End Using
                        End Using
                        'Getctkmid' NgayBD = CDate(dtset.Tables(0).Rows(0)("DateFrom"))
                        Dim dtb As DataTable = luu(DBd("type").ToString, DBd("maintype").ToString, DBd("subbrand").ToString, CInt(DBd("syear").ToString), CInt(DBd("speriod").ToString), CDbl(DBd("amount").ToString), Session("TenDangNhap"))
                        num = Integer.Parse("0" + dtb.Rows(0)(0))
                    Catch ex As Exception
                    End Try

                Next
            End If
        End If

        Session("dd") = Nothing
        grid.DataBind()

    End Sub

    Private Function luu(type As String, maintype As String, subbrand As String, syear As Integer, speriod As Integer, amount As Double, uses As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@type", SqlDbType.NVarChar), New SqlParameter("@maintype", SqlDbType.NVarChar), New SqlParameter("@subbrand", SqlDbType.NVarChar), New SqlParameter("@syear", SqlDbType.Int), New SqlParameter("@speriod", SqlDbType.Int), New SqlParameter("@amount", SqlDbType.Float), New SqlParameter("@users", SqlDbType.NVarChar)}
        arrParam(0).Value = type

        arrParam(1).Value = maintype
        arrParam(2).Value = subbrand
        arrParam(3).Value = syear
        arrParam(4).Value = speriod
        arrParam(5).Value = amount
        arrParam(6).Value = uses

        Return oj.ThucThiStore_DataSets("Importbudget", arrParam).Tables(0)
    End Function

    Protected Sub ASPExport_Click(sender As Object, e As EventArgs) Handles ASPExport.Click
        ASPxGridViewExporter1.WriteXlsxToResponse()
    End Sub
End Class