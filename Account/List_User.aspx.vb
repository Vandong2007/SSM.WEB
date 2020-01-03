Imports System.Data.SqlClient
Imports DevExpress.Web.ASPxGridView


Public Class List_User
    Inherits AdminPage
    Dim oj As New SSMDATA

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("TenDangNhap") Is Nothing Then
            Dim url As String = Request.Url.AbsoluteUri
            Session("UrlReturn") = url
            Response.Redirect("~/Account/Login.aspx")
        End If
        pb = oj.Getpb(Session("TenDangNhap").ToString())
        If pb <> "IT" Then
            Dim url As String = Request.Url.AbsoluteUri
            Session("UrlReturn") = url

            Response.Redirect("~/Account/Thongbao.html")

        End If
        Dim column As GridViewDataColumn = TryCast(ASPxGridView1.Columns("Customer"), GridViewDataColumn)
        If column Is Nothing Then
            Return
        End If
        ASPxGridView1.SettingsEditing.NewItemRowPosition = GridViewNewItemRowPosition.Bottom
        column.EditFormSettings.VisibleIndex = 2
        column.EditFormSettings.ColumnSpan = 3
        column.EditFormSettings.RowSpan = 1
    End Sub
    Protected Sub ASPxGridView1_CustomButtonCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomButtonCallbackEventArgs)
        If e.ButtonID = "setpass" Then
            Dim num As String
            num = reset(ASPxGridView1.GetRowValues(e.VisibleIndex, "Tendangnhap").ToString)

            'Response.Write("<script LANGUAGE='JavaScript' >alert('đã reset pas" + ASPxGridView1.GetRowValues(e.VisibleIndex, "Tendangnhap").ToString + " thành công  ')</script>")

            Response.Redirect("~/Account/thongbaopass.html")

        Else
            Return
        End If

    End Sub
    Private Function reset(Usename As String) As String
        Dim quyen As String
        Dim arrParam As SqlParameter() = {New SqlParameter("@uname", SqlDbType.NVarChar)}
        arrParam(0).Value = Usename


        quyen = oj.ThucThiStore_DataSets("ResetPas", arrParam).Tables(0).Rows(0)(0).ToString


        Return quyen


    End Function
    'Protected Sub btCreate_Click(sender As Object, e As EventArgs) Handles btCreate.Click
    '    Using con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())


    '        'Dim Con As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
    '        Using cmd As New SqlCommand("update [TB_DangNhap] set  [MaPhongban] =  @phongban , hovaten = @hoten, email  =  @Email   where Tendangnhap = @tendangnhap", con)

    '            Using sda As New SqlDataAdapter()
    '                'cmd.CommandType = CommandType.StoredProcedure
    '                cmd.Parameters.AddWithValue("@tendangnhap", tbUsername.Text.Trim())
    '                cmd.Parameters.AddWithValue("@phongban", tbbophan.Text.Trim())
    '                cmd.Parameters.AddWithValue("@hoten", tbhovaten.Text.Trim())
    '                cmd.Parameters.AddWithValue("@Email", tbEmail.Text.Trim())
    '                cmd.Connection = con
    '                con.Open()
    '                cmd.ExecuteScalar()

    '                '// mo ket noi 
    '                'cmd.ExecuteNonQuery()

    '                con.Close()
    '            End Using
    '        End Using
    '        Using cmd As New SqlCommand(" UPDATE [TBQuyenUser]  SET [Bophan]=@bophan ,[Region] =@Region,[Area] = @Area,[Customer] = @Customer WHERE [Tendangnhap] = @tendangnhap ", con)

    '            Using sda As New SqlDataAdapter()
    '                'cmd.CommandType = CommandType.StoredProcedure
    '                cmd.Parameters.AddWithValue("@tendangnhap", tbUsername.Text.Trim())
    '                cmd.Parameters.AddWithValue("@bophan", tbbophan.Text.Trim())
    '                cmd.Parameters.AddWithValue("@region", tbRegion.Text.Trim())
    '                cmd.Parameters.AddWithValue("@Area", tbArea.Text.Trim())
    '                cmd.Parameters.AddWithValue("@Customer", tbcus.Text.Trim())
    '                cmd.Connection = con
    '                con.Open()
    '                cmd.ExecuteScalar()

    '                '// mo ket noi 
    '                'cmd.ExecuteNonQuery()

    '                con.Close()
    '            End Using
    '        End Using
    '    End Using

    '    'Dim builder As New StringBuilder()

    '    'builder.Append("<script language=JavaScript> hidea(); </script>" & vbLf)
    '    'Page.ClientScript.RegisterStartupScript(Me.[GetType](), "Hide", builder.ToString())
    'End Sub

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting

    End Sub
End Class