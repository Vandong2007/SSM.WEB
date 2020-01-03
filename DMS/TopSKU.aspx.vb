Imports System.Data.OleDb
Imports System.IO
Imports System.Data.SqlClient

Public Class TopSKU

    Inherits AdminPage
    Dim oj As New SSMDATA
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


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

            dtExcelData.Columns.AddRange(New DataColumn(1) {
                New DataColumn("MASP", GetType(String)), _
                         New DataColumn("Ngay", GetType(DateTime))
            })

            Using oda As New OleDbDataAdapter("SELECT MASP  FROM  [" & sheet1 & "]", excel_con)
                oda.Fill(dtExcelData)
            End Using


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

    Protected Sub Bt_dieuChinh_Click(sender As Object, e As EventArgs) Handles Bt_dieuChinh.Click

        If Session("dd") Is Nothing Then
        Else
            Using con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())


                'Dim Con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
                Using cmd As New SqlCommand(" delete from  [dbo].[Tb_DMS_topSku]", con)

                    con.Open()
                    '// mo ket noi 
                    cmd.ExecuteNonQuery()

                    ' // thuc thi 
                    con.Close()
                End Using
            End Using


            Dim db As DataTable = TryCast(Session("dd"), DataTable)

            If db.Rows.Count > 0 Then
                For Each DBd As DataRow In db.Rows

                    Dim num As Integer
                    Try
                        'Getctkmid' NgayBD = CDate(dtset.Tables(0).Rows(0)("DateFrom"))
                        Dim dtb As DataTable = luu(DBd("MASP").ToString, Session("TenDangNhap"))
                        num = Integer.Parse("0" + dtb.Rows(0)(0))
                    Catch ex As Exception
                    End Try

                Next
            End If
        End If

        Session("dd") = Nothing
        ASPxGridView1.DataBind()

        'Response.Redirect("~/SYSTEM/CTKM3.aspx")

    End Sub



    Private Function luu(MaSP As String, User As String) As DataTable
        Dim arrParam As SqlParameter() = {New SqlParameter("@MaSP", SqlDbType.NVarChar), New SqlParameter("@Users", SqlDbType.NVarChar)}
        arrParam(0).Value = MaSP

        arrParam(1).Value = User


        Return oj.ThucThiStore_DataSets("ImportTopSKU", arrParam).Tables(0)
    End Function



     
   
    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting

    End Sub
End Class