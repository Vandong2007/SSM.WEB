Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.ComponentModel
Imports System.Data.SqlClient
Imports System.Web.Script.Services
Imports System.Data.Odbc
Imports System.Web.Script.Serialization

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<ToolboxItem(False)> _
Public Class ssmwebsv
    Inherits System.Web.Services.WebService
    Dim DB As New SSMDATA
    <WebMethod()> Public Function GetTime() As String
        'Return Now.ToShortDateString
        Dim s As String
        Dim MyConnection As SqlConnection
        Dim MyCommand As SqlCommand
        Dim MyDataAdapter As New SqlDataAdapter()
        Dim MyDataSet As New DataSet()
        MyConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())
        MyCommand = New SqlCommand("select  top 1 getdate() as ngay from tbPeriod ", MyConnection)
        MyDataAdapter.SelectCommand = MyCommand
        MyDataAdapter.Fill(MyDataSet, "tbPeriod")
        s = CDate(MyDataSet.Tables(0).Rows(0)("ngay")).ToString
        Return s

    End Function
    <WebMethod()> Public Function Getchuky() As DataSet
        Dim MyConnection As SqlConnection
        Dim MyCommand As SqlCommand
        Dim MyDataAdapter As New SqlDataAdapter()
        Dim MyDataSet As New DataSet()
        MyConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())
        MyCommand = New SqlCommand("select * from tbPeriod", MyConnection)
        MyDataAdapter.SelectCommand = MyCommand
        MyDataAdapter.Fill(MyDataSet, "tbPeriod")
        Return MyDataSet
    End Function
    '<WebMethod()> <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> Public Function Get_tbItems() As DataSet
    '    Dim MyConnection As SqlConnection
    '    Dim MyCommand As SqlCommand
    '    Dim MyDataAdapter As New SqlDataAdapter()
    '    Dim MyDataSet As New DataSet()
    '    MyConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())
    '    MyCommand = New SqlCommand("  SELECT  Itemcode ,[ItemnameEng] ,[Itemname]  ,[Brand] ,[Category] ,[Subbrand] ,[Unit]  ,[Price] ,[Volumn] as Packsize ,[Type]  ,[OldItemcode] as Sapcode ,[Nhan] as VCategory ,[mui] as fragrance ,[varUnit] as subunit ,[Loai] as types ,[Thung] AS Carton ,[Barcode]  FROM  [tbItems] where type='y'", MyConnection)
    '    MyDataAdapter.SelectCommand = MyCommand
    '    MyDataAdapter.Fill(MyDataSet, "tbItems")
    '    Return MyDataSet
    'End Function

    <WebMethod(Description:="Gets the table tbItems.")> _
<ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Function Get_tbItems() As String
        'Dim objConnection As New OdbcConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ConnectionString)
        'Dim objCommand As New OdbcCommand("SELECT  *  FROM SDKhachhang where MaNPP = '" + manpp + "'", objConnection)
        'Dim objDataSet As New DataSet()
        'Dim objDataAdapter As New OdbcDataAdapter(objCommand)
        'objDataAdapter.Fill(objDataSet, "SDKhachhang")
        'objConnection.Close()
        Dim MyConnection As SqlConnection
        Dim MyCommand As SqlCommand
        Dim MyDataAdapter As New SqlDataAdapter()
        Dim MyDataSet As New DataSet()
        MyConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())
        MyCommand = New SqlCommand(" Select Itemcode ,[ItemnameEng] ,[Itemname]  ,[Brand] ,[Category] ,[Subbrand] ,[Unit]  ,[Price] ,[Volumn] as Packsize ,[Type]  ,[OldItemcode] as Sapcode ,[Nhan] as VCategory ,[mui] as fragrance ,[varUnit] as subunit ,[Loai] as types ,[Thung] AS Carton ,[Barcode]  FROM  [tbItems] where type='y'", MyConnection)
        MyDataAdapter.SelectCommand = MyCommand
        MyDataAdapter.Fill(MyDataSet, "tbItems")
        Dim rows As New List(Of Dictionary(Of String, Object))()
        Dim row As Dictionary(Of String, Object) = Nothing
        Dim JaggedArray As String()() = New String(MyDataSet.Tables(0).Rows.Count - 1)() {}
        If MyDataSet.Tables(0).Rows.Count > 0 Then
            Dim i As Integer = 0
            For Each rs As DataRow In MyDataSet.Tables(0).Rows
                'JaggedArray(i) = New String() {rs("MaNPP").ToString(), rs("MaKH").ToString(), rs("Tenkh").ToString(), rs("Diachi").ToString(), rs("Phuong").ToString(), rs("Quan").ToString(), rs("Thanhpho").ToString(), rs("Phone").ToString(), rs("Fax").ToString(), rs("Active").ToString(), rs("NgayHD").ToString()}
                row = New Dictionary(Of String, Object)()
                For Each col As DataColumn In MyDataSet.Tables(0).Columns
                    row.Add(col.ColumnName, rs(col))
                Next
                rows.Add(row)

                i = i + 1
            Next
        End If
        ' Return JSON data
        Dim js As New JavaScriptSerializer()
        Dim strJSON As String = js.Serialize(rows)
        Return strJSON
    End Function

    '<WebMethod()> Public Function Get_tbCustomer() As DataSet
    '    Dim MyConnection As SqlConnection
    '    Dim MyCommand As SqlCommand
    '    Dim MyDataAdapter As New SqlDataAdapter()
    '    Dim MyDataSet As New DataSet()
    '    MyConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())
    '    MyCommand = New SqlCommand("  SELECT * FROM  [tbCustomer]  ", MyConnection)
    '    MyDataAdapter.SelectCommand = MyCommand
    '    MyDataAdapter.Fill(MyDataSet, "tbCustomer")
    '    Return MyDataSet
    'End Function
    <WebMethod(Description:="Gets the tbCustomer.")> _
<ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Function Get_tbCustomer() As String
        'Dim objConnection As New OdbcConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ConnectionString)
        'Dim objCommand As New OdbcCommand("SELECT  *  FROM SDKhachhang where MaNPP = '" + manpp + "'", objConnection)
        'Dim objDataSet As New DataSet()
        'Dim objDataAdapter As New OdbcDataAdapter(objCommand)
        'objDataAdapter.Fill(objDataSet, "SDKhachhang")
        'objConnection.Close()
        Dim MyConnection As SqlConnection
        Dim MyCommand As SqlCommand
        Dim MyDataAdapter As New SqlDataAdapter()
        Dim MyDataSet As New DataSet()
        MyConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())
        MyCommand = New SqlCommand("  SELECT  *  FROM tbCustomer  ", MyConnection)
        MyDataAdapter.SelectCommand = MyCommand
        MyDataAdapter.Fill(MyDataSet, "tbCustomer")
        Dim rows As New List(Of Dictionary(Of String, Object))()
        Dim row As Dictionary(Of String, Object) = Nothing
        Dim JaggedArray As String()() = New String(MyDataSet.Tables(0).Rows.Count - 1)() {}
        If MyDataSet.Tables(0).Rows.Count > 0 Then
            Dim i As Integer = 0
            For Each rs As DataRow In MyDataSet.Tables(0).Rows
                'JaggedArray(i) = New String() {rs("MaNPP").ToString(), rs("MaKH").ToString(), rs("Tenkh").ToString(), rs("Diachi").ToString(), rs("Phuong").ToString(), rs("Quan").ToString(), rs("Thanhpho").ToString(), rs("Phone").ToString(), rs("Fax").ToString(), rs("Active").ToString(), rs("NgayHD").ToString()}
                row = New Dictionary(Of String, Object)()
                For Each col As DataColumn In MyDataSet.Tables(0).Columns
                    row.Add(col.ColumnName, rs(col))
                Next
                rows.Add(row)

                i = i + 1
            Next
        End If
        ' Return JSON data
        Dim js As New JavaScriptSerializer()
        Dim strJSON As String = js.Serialize(rows)
        Return strJSON
    End Function

    '<WebMethod()> <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> Public Function Get_SDKhachhang(ByVal manpp As String) As String
    '    Dim MyConnection As SqlConnection
    '    Dim MyCommand As SqlCommand
    '    Dim MyDataAdapter As New SqlDataAdapter()
    '    Dim MyDataSet As New DataSet()
    '    MyConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())
    '    MyCommand = New SqlCommand("  SELECT  *  FROM SDKhachhang where MaNPP = '" + manpp + "'", MyConnection)
    '    MyDataAdapter.SelectCommand = MyCommand
    '    MyDataAdapter.Fill(MyDataSet, "SDKhachhang")
    '    Return MyDataSet
    'End Function

    <WebMethod(Description:="Gets the table SDKhacHang.")>
    Public Function Get_SDKhachhang(manpp As String) As DataSet
        'Dim objConnection As New OdbcConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ConnectionString)
        'Dim objCommand As New OdbcCommand("SELECT  *  FROM SDKhachhang where MaNPP = '" + manpp + "'", objConnection)
        'Dim objDataSet As New DataSet()
        'Dim objDataAdapter As New OdbcDataAdapter(objCommand)
        'objDataAdapter.Fill(objDataSet, "SDKhachhang")
        'objConnection.Close()
        Dim MyConnection As SqlConnection
        Dim MyCommand As SqlCommand
        Dim MyDataAdapter As New SqlDataAdapter()
        Dim MyDataSet As New DataSet()
        MyConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())
        MyCommand = New SqlCommand("  SELECT  *  FROM SDKhachhang where MaNPP = '" + manpp + "'", MyConnection)
        MyDataAdapter.SelectCommand = MyCommand
        MyDataAdapter.Fill(MyDataSet, "SDKhachhang")
        'Dim rows As New List(Of Dictionary(Of String, Object))()
        'Dim row As Dictionary(Of String, Object) = Nothing
        'Dim JaggedArray As String()() = New String(MyDataSet.Tables(0).Rows.Count - 1)() {}
        'If MyDataSet.Tables(0).Rows.Count > 0 Then
        '    Dim i As Integer = 0
        '    For Each rs As DataRow In MyDataSet.Tables(0).Rows
        '        'JaggedArray(i) = New String() {rs("MaNPP").ToString(), rs("MaKH").ToString(), rs("Tenkh").ToString(), rs("Diachi").ToString(), rs("Phuong").ToString(), rs("Quan").ToString(), rs("Thanhpho").ToString(), rs("Phone").ToString(), rs("Fax").ToString(), rs("Active").ToString(), rs("NgayHD").ToString()}
        '        row = New Dictionary(Of String, Object)()
        '        For Each col As DataColumn In MyDataSet.Tables(0).Columns
        '            row.Add(col.ColumnName, rs(col))
        '        Next
        '        rows.Add(row)

        '        i = i + 1
        '    Next
        'End If
        '' Return JSON data
        'Dim js As New JavaScriptSerializer()
        'Dim strJSON As String = js.Serialize(rows)
        Return MyDataSet
    End Function

    <WebMethod()>
    Public Function UpdateCustomers(ByVal Manpp As String, ByVal TuNgay As Date, ByVal DenNgay As Date, ByVal custDS As DataSet) As String
        Dim adapter As SqlDataAdapter = New SqlDataAdapter()

        Dim gsDataSQL As String = ConfigurationManager.ConnectionStrings("SSMConnectionString").ConnectionString

        Using con As New SqlConnection(gsDataSQL)
            'khachhang hang
            'Dim dtbs As DataTable = insertkh(FilePath, Session("TenDangNhap").ToString())
            'Dim d As Integer
            'd = Integer.Parse("0" + dtbs.Rows(0)(0))
            ''nhan vien
            'Dim dtbnv As DataTable = insertnv(FilePath, Session("TenDangNhap").ToString())
            'Dim d1 As Integer
            'd1 = Integer.Parse("0" + dtbnv.Rows(0)(0))

            Try
                'strSelect = "INSERT INTO  [tbllog] ([Manpp],[DateSend],[Dateupdate],[datemax],[users]) VALUES ('" & Manpp & "' , getdate() , getdate(), convert(datetime,'" & CDate(dateen.Value) & "',102) ,'" & Session("TenDangNhap").ToString & "' )"

                Using cmd As New SqlCommand(" INSERT INTO  [tbllog] ([Manpp],[DateSend],[Dateupdate],[datemax],[users]) VALUES ('" + Manpp + "' ,  getdate() ,  getdate() ,  " & DenNgay & " ,'" & Manpp & "' )", con)
                    con.Open()
                    cmd.ExecuteNonQuery()
                    con.Close()
                End Using
            Catch ex As Exception
                con.Close()
            End Try



            'Update  ton kho

            Try
                Using cmd As New SqlCommand("DELETE FROM  [SDkhachhang2] where MaNPP ='" + Manpp + "' ", con)
                    con.Open()
                    '// mo ket noi 
                    cmd.ExecuteNonQuery()
                    ' // thuc thi 
                    con.Close()
                End Using
            Catch ex As Exception
                con.Close()
            End Try
            Try
                Using cmd As New SqlCommand("DELETE FROM [SDnhanvien1] where MaNPP ='" + Manpp + "' ", con)
                    con.Open()
                    '// mo ket noi 
                    cmd.ExecuteNonQuery()
                    ' // thuc thi 
                    con.Close()
                End Using
            Catch ex As Exception
                con.Close()
            End Try

            'Try
            '    Using cmd As New SqlCommand("DELETE FROM [SSM].[dbo].[SDTonkho] where MaNPP ='" + Manpp + "'", con)
            '        con.Open()
            '        '// mo ket noi 
            '        cmd.ExecuteNonQuery()
            '        ' // thuc thi 
            '        con.Close()
            '    End Using


            'Catch ex As Exception
            '    con.Close()
            'End Try
            'tamthoi bo
            'Try
            '    Using cmd As New SqlCommand("DELETE FROM  [SDKhachhangNV] where MaNPP ='" + Manpp + "' ", con)
            '        con.Open()
            '        '// mo ket noi 
            '        cmd.ExecuteNonQuery()
            '        ' // thuc thi 
            '        con.Close()
            '    End Using

            'Catch ex As Exception
            '    con.Close()
            'End Try
        End Using
        Try


            Dim dtkh As New DataTable()

            dtkh.Columns.AddRange(New DataColumn(10) {New DataColumn("MaNPP", GetType(String)),
                New DataColumn("MaKH", GetType(String)),
                New DataColumn("Tenkh", GetType(String)),
                New DataColumn("Diachi", GetType(String)),
                New DataColumn("Phuong", GetType(String)),
                New DataColumn("Quan", GetType(String)),
                New DataColumn("Thanhpho", GetType(String)),
                New DataColumn("Phone", GetType(String)),
                New DataColumn("Fax", GetType(String)),
                New DataColumn("Active", GetType(Boolean)),
                New DataColumn("NgayHD", GetType(DateTime))
                })
            dtkh = CType(custDS.Tables("SDKhachhang"), DataTable)
            dtkh.Columns.Add("Users", GetType(String))
            dtkh.Columns.Add("Lastchange", GetType(DateTime))
            For iter As Integer = 0 To dtkh.Rows.Count - 1

                dtkh.Rows(iter)("Users") = Manpp
                dtkh.Rows(iter)("Lastchange") = Today.Date
            Next

            Using con As New SqlConnection(gsDataSQL)

                Using sqlBulkCopykh As New SqlBulkCopy(con)
                    'Set the database table name
                    sqlBulkCopykh.DestinationTableName = "dbo.SDkhachhang2"


                    sqlBulkCopykh.ColumnMappings.Add("MaNPP", "MaNPP")
                    sqlBulkCopykh.ColumnMappings.Add("MaKH", "MaKH")
                    sqlBulkCopykh.ColumnMappings.Add("Tenkh", "Tenkh")
                    sqlBulkCopykh.ColumnMappings.Add("Diachi", "Diachi")
                    sqlBulkCopykh.ColumnMappings.Add("Phuong", "Phuong")
                    sqlBulkCopykh.ColumnMappings.Add("Quan", "Quan")
                    sqlBulkCopykh.ColumnMappings.Add("Thanhpho", "Thanhpho")
                    sqlBulkCopykh.ColumnMappings.Add("Phone", "Phone")
                    sqlBulkCopykh.ColumnMappings.Add("Fax", "Fax")
                    sqlBulkCopykh.ColumnMappings.Add("Active", "Active")
                    sqlBulkCopykh.ColumnMappings.Add("NgayHD", "NgayHD")
                    sqlBulkCopykh.ColumnMappings.Add("Users", "Users")
                    sqlBulkCopykh.ColumnMappings.Add("Lastchange", "Lastchange")

                    con.Open()
                    sqlBulkCopykh.BulkCopyTimeout = 333
                    sqlBulkCopykh.WriteToServer(dtkh)
                    con.Close()
                End Using
                'Exit Sub



                Dim dtnv1 As New DataTable()



                dtnv1.Columns.AddRange(New DataColumn(11) {New DataColumn("MaNPP", GetType(String)),
                    New DataColumn("Manv", GetType(String)),
                    New DataColumn("Hoten", GetType(String)),
                    New DataColumn("Ngaysinh", GetType(Date)),
                    New DataColumn("Ngayvao", GetType(Date)),
                    New DataColumn("Diachi", GetType(String)),
                    New DataColumn("Phuong", GetType(String)),
                    New DataColumn("Quan", GetType(String)),
                    New DataColumn("Thanhpho", GetType(String)),
                    New DataColumn("Phone", GetType(String)),
                    New DataColumn("Email", GetType(String)),
                    New DataColumn("Active", GetType(String))})
                ',
                'New DataColumn("Users", GetType(String)),
                'New DataColumn("Lastchange", GetType(Date))


                dtnv1 = CType(custDS.Tables("SDNhanvien"), DataTable)
                dtnv1.Columns.Add("Users", GetType(String))
                dtnv1.Columns.Add("Lastchange", GetType(DateTime))
                For iter As Integer = 0 To dtnv1.Rows.Count - 1

                    dtnv1.Rows(iter)("Users") = Manpp
                    dtnv1.Rows(iter)("Lastchange") = Today.Date
                Next
                Using sqlBulkCopynv As New SqlBulkCopy(con)
                    'Set the database table name
                    sqlBulkCopynv.DestinationTableName = "dbo.SDNhanvien1"

                    '[OPTIONAL]: Map the Excel columns with that of the database table
                    sqlBulkCopynv.ColumnMappings.Add("MaNPP", "MaNPP")
                    sqlBulkCopynv.ColumnMappings.Add("Manv", "Manv")
                    sqlBulkCopynv.ColumnMappings.Add("Hoten", "Hoten")
                    sqlBulkCopynv.ColumnMappings.Add("Ngaysinh", "Ngaysinh")
                    sqlBulkCopynv.ColumnMappings.Add("Ngayvao", "Ngayvao")
                    sqlBulkCopynv.ColumnMappings.Add("Diachi", "Diachi")
                    sqlBulkCopynv.ColumnMappings.Add("Phuong", "Phuong")
                    sqlBulkCopynv.ColumnMappings.Add("Quan", "Quan")
                    sqlBulkCopynv.ColumnMappings.Add("Thanhpho", "Thanhpho")
                    sqlBulkCopynv.ColumnMappings.Add("Phone", "Phone")
                    sqlBulkCopynv.ColumnMappings.Add("Email", "Email")
                    sqlBulkCopynv.ColumnMappings.Add("Active", "Active")
                    sqlBulkCopynv.ColumnMappings.Add("Users", "Users")
                    sqlBulkCopynv.ColumnMappings.Add("Lastchange", "Lastchange")


                    con.Open()
                    sqlBulkCopynv.BulkCopyTimeout = 333
                    sqlBulkCopynv.WriteToServer(dtnv1)
                    con.Close()
                End Using


                Dim dtkh1 As New DataTable()
                dtkh1.Columns.AddRange(New DataColumn(14) {
             New DataColumn("MaNPP", GetType(String)),
             New DataColumn("MaXK", GetType(String)),
            New DataColumn("Ngay", GetType(DateTime)),
            New DataColumn("MaNV", GetType(String)),
            New DataColumn("MaKH", GetType(String)),
            New DataColumn("Type", GetType(String)),
            New DataColumn("MaSP", GetType(String)),
            New DataColumn("Soluong", GetType(Decimal)),
            New DataColumn("Dongia", GetType(Decimal)),
            New DataColumn("TyleCK", GetType(Decimal)),
            New DataColumn("Khuyenmai", GetType(Decimal)),
            New DataColumn("TienCK", GetType(Decimal)),
            New DataColumn("Thanhtien", GetType(Decimal)),
            New DataColumn("Loai", GetType(String)),
            New DataColumn("MaCT", GetType(String))})
                ',
                ' New DataColumn("USERs", GetType(String)),
                '  New DataColumn("dates", GetType(DateTime))

                dtkh1 = CType(custDS.Tables("SDDoanhso"), DataTable)
                Using sqlBulkCopy As New SqlBulkCopy(con)
                    'Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo.SDDoanhso_MOi"

                    '[OPTIONAL]: Map the Excel columns with that of the database table

                    'sqlBulkCopy.ColumnMappings.Add("Id", "Id")
                    sqlBulkCopy.ColumnMappings.Add("MaNPP", "MaNPP")
                    sqlBulkCopy.ColumnMappings.Add("MaXK", "MaXK")
                    sqlBulkCopy.ColumnMappings.Add("Ngay", "Ngay")
                    sqlBulkCopy.ColumnMappings.Add("MaNV", "MaNV")
                    sqlBulkCopy.ColumnMappings.Add("MaKH", "MaKH")

                    sqlBulkCopy.ColumnMappings.Add("Type", "Type")
                    sqlBulkCopy.ColumnMappings.Add("MaSP", "MaSP")

                    sqlBulkCopy.ColumnMappings.Add("Soluong", "Soluong")
                    sqlBulkCopy.ColumnMappings.Add("Dongia", "Dongia")
                    sqlBulkCopy.ColumnMappings.Add("TyleCK", "TyleCK")
                    sqlBulkCopy.ColumnMappings.Add("Khuyenmai", "Khuyenmai")
                    sqlBulkCopy.ColumnMappings.Add("TienCK", "TienCK")
                    sqlBulkCopy.ColumnMappings.Add("Thanhtien", "Thanhtien")
                    sqlBulkCopy.ColumnMappings.Add("Loai", "Loai")
                    sqlBulkCopy.ColumnMappings.Add("MaCT", "MaCT")
                    'sqlBulkCopy.ColumnMappings.Add("USERs", "USERs")
                    'sqlBulkCopy.ColumnMappings.Add("dates", "dates")

                    con.Open()
                    sqlBulkCopy.BulkCopyTimeout = 4000
                    sqlBulkCopy.WriteToServer(dtkh1)
                    con.Close()

                    'Exit Sub
                End Using
            End Using
        Catch ex As Exception
            Return ex.Message
        End Try
        Return "OK"
    End Function

    <WebMethod()>
    Public Function GetCustomers1() As DataSet


        'Dim st As String
        'st = "SELECT User, Password FROM [dbo].User"
        ''Dim arrParam As SqlParameter() = {New SqlParameter("@Manpp", SqlDbType.NVarChar)}
        ''arrParam(0).Value = Manpp

        'Return DB.GetTable(st, False)
        Dim connection As SqlConnection


        connection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())
        Dim adapter As SqlDataAdapter = New SqlDataAdapter("SELECT top 1 MaNPP,MaKH,Tenkh,Diachi,Phuong,Quan,Thanhpho,Phone,Fax,Active,NgayHD FROM  [SDKhachhang2]", connection)
        Dim custDS As DataSet = New DataSet()
        adapter.MissingSchemaAction = MissingSchemaAction.AddWithKey
        adapter.Fill(custDS, "SDKhachhang2")
        Return custDS
    End Function



    <WebMethod(Description:="Gets the table  SDNhanvien.")>
    Public Function Get_SDNhanvien(manpp As String) As DataSet
        'Dim objConnection As New OdbcConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ConnectionString)
        'Dim objCommand As New OdbcCommand("SELECT  *  FROM SDKhachhang where MaNPP = '" + manpp + "'", objConnection)
        'Dim objDataSet As New DataSet()
        'Dim objDataAdapter As New OdbcDataAdapter(objCommand)
        'objDataAdapter.Fill(objDataSet, "SDKhachhang")
        'objConnection.Close()
        Dim MyConnection As SqlConnection
        Dim MyCommand As SqlCommand
        Dim MyDataAdapter As New SqlDataAdapter()
        Dim MyDataSet As New DataSet()
        MyConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())
        MyCommand = New SqlCommand("  SELECT  *  FROM SDNhanvien where MaNPP = '" + manpp + "'", MyConnection)
        MyDataAdapter.SelectCommand = MyCommand
        MyDataAdapter.Fill(MyDataSet, "SDNhanvien")
        Return MyDataSet
        'Dim rows As New List(Of Dictionary(Of String, Object))()
        'Dim row As Dictionary(Of String, Object) = Nothing
        'Dim JaggedArray As String()() = New String(MyDataSet.Tables(0).Rows.Count - 1)() {}
        'If MyDataSet.Tables(0).Rows.Count > 0 Then
        '    Dim i As Integer = 0
        '    For Each rs As DataRow In MyDataSet.Tables(0).Rows
        '        'JaggedArray(i) = New String() {rs("MaNPP").ToString(), rs("MaKH").ToString(), rs("Tenkh").ToString(), rs("Diachi").ToString(), rs("Phuong").ToString(), rs("Quan").ToString(), rs("Thanhpho").ToString(), rs("Phone").ToString(), rs("Fax").ToString(), rs("Active").ToString(), rs("NgayHD").ToString()}
        '        row = New Dictionary(Of String, Object)()
        '        For Each col As DataColumn In MyDataSet.Tables(0).Columns
        '            row.Add(col.ColumnName, rs(col))
        '        Next
        '        rows.Add(row)

        '        i = i + 1
        '    Next
        'End If
        '' Return JSON data.0
        'Dim js As New JavaScriptSerializer()
        'Dim strJSON As String = js.Serialize(rows)
        'Return strJSON
    End Function
    '<WebMethod()> Public Function Get_SDNhanvien(ByVal manpp As String) As DataSet
    '    Dim MyConnection As SqlConnection
    '    Dim MyCommand As SqlCommand
    '    Dim MyDataAdapter As New SqlDataAdapter()
    '    Dim MyDataSet As New DataSet()
    '    MyConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())
    '    MyCommand = New SqlCommand("  SELECT  *  FROM SDNhanvien where MaNPP = '" + manpp + "'", MyConnection)
    '    MyDataAdapter.SelectCommand = MyCommand
    '    MyDataAdapter.Fill(MyDataSet, "SDNhanvien")
    '    Return MyDataSet
    'End Function
    <WebMethod()> Public Function checknpp(ByVal manpp As String) As Boolean
        Dim y As Boolean
        Dim con As SqlConnection
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())
        Try
            con.Open()
            Dim strselect As String = "select Activer from  dbo.tbCustomer where Debcode = '" + manpp + "'"
            adp = New SqlDataAdapter(strselect, con)
            dtset = New DataSet
            adp.Fill(dtset, "dbo.tbCustomer")
            con.Close()
            y = CBool(dtset.Tables(0).Rows(0)("Activer"))
            Return y
        Catch ex As Exception

            y = False
            Return y

        End Try
    End Function
    <WebMethod()> Public Function getck() As DataSet

        Dim con As SqlConnection
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())

        Try
            con.Open()
            Dim strselect As String = "select top 1 * FROM   tbWeek   Where trangthai=1"
            adp = New SqlDataAdapter(strselect, con)
            dtset = New DataSet
            adp.Fill(dtset, "tbWeek")
            con.Close()
            'NgayBD = CDate(dtset.Tables(0).Rows(0)("ngay"))
            Return dtset
        Catch ex As Exception

            con.Close()

        End Try

    End Function
    <WebMethod()> Public Function getopenck(ByVal Manpp As String) As DataSet

        Dim con As SqlConnection
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())

        Try
            con.Open()
            Dim strselect As String = "SELECT *  FROM  tbPeriodOpenH where [Ngaydong]>= getdate() and trangthai='o' and manpp= '" + Manpp + "'"
            adp = New SqlDataAdapter(strselect, con)
            dtset = New DataSet
            adp.Fill(dtset, "tbPeriodOpenH")
            con.Close()
            'NgayBD = CDate(dtset.Tables(0).Rows(0)("ngay"))
            Return dtset
        Catch ex As Exception

            con.Close()

        End Try

    End Function


    <WebMethod()>
    Public Function DSKH(ByVal Manpp As String) As DataSet


        Dim st As String
        st = "SELECT  *  FROM SDKhachhang where  Active =1 and manpp = @Manpp"
        Dim arrParam As SqlParameter() = {New SqlParameter("@Manpp", SqlDbType.NVarChar)}
        arrParam(0).Value = Manpp

        Return DB.GetTable(st, False, arrParam)

        'Dim con As SqlConnection
        'Dim adp As SqlDataAdapter
        'Dim dtset As DataSet

        'con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())

        'Try
        '    con.Open()
        '    Dim strselect As String = " SELECT  *  FROM SDKhachhang where  Active =1 and manpp= '" + Manpp + "'"
        '    adp = New SqlDataAdapter(strselect, con)
        '    dtset = New DataSet
        '    adp.Fill(dtset, "SDKhachhang")
        '    con.Close()
        '    'NgayBD = CDate(dtset.Tables(0).Rows(0)("ngay"))
        '    Return dtset
        'Catch ex As Exception

        '    con.Close()

        'End Try

    End Function

    <WebMethod()>
    Public Function CTKM(ByVal manpp As String, ByVal TuNgay As Date, ByVal DenNgay As Date) As DataSet


        '        Dim strSQL As String
        '        strSQL = "SELECT *  FROM   [tbCTKM] b where  (b.Ngaybd<=@date1 and b.ngaykt>=@date2)  or (b.Ngaybd >  @date1 and b.ngaybd<= @date2) or (b.Ngaykt >  @date1 and b.ngaykt< @date2);
        'SELECT c.*
        '  FROM [SSM2014].[dbo].[tbDoiTuongApdung] c
        '  inner join [tbCTKM] b1  on c.MS_CTKM = b1.mact 
        ' where  (b1.Ngaybd<=@date1 and b1.ngaykt>=@date2)  or (b1.Ngaybd >  @date1 and b1.ngaybd<= @date2) or (b1.Ngaykt >  @date1 and b1.ngaykt< @date2)"
        Dim arrParam As SqlParameter() = {New SqlParameter("@MaNPP", SqlDbType.NVarChar), New SqlParameter("@date1", SqlDbType.DateTime), New SqlParameter("@date2", SqlDbType.DateTime)}
        arrParam(0).Value = manpp
        arrParam(1).Value = TuNgay
        arrParam(2).Value = DenNgay

        'Return DB.GetTable(st, False, arrParam)

        Dim dt As DataSet = New DataSet()

        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())

        Try
            conn.Open()
            Dim comm As SqlCommand = New SqlCommand()
            comm.Connection = conn


            'comm.CommandType = CommandType.Text
            comm.CommandType = CommandType.StoredProcedure
            comm.CommandText = "WSV_Get_ctkm" 'strSQL


            comm.Parameters.AddRange(arrParam)

            Dim adapter As SqlDataAdapter = New SqlDataAdapter(comm)
            'adapter.TableMappings.Add("Tabel", "Table1")
            'adapter.TableMappings.Add("Tabel1", "c")
            adapter.Fill(dt)
            dt.Tables("Table").TableName = "CTKM"
            dt.Tables("Table1").TableName = "tbDoiTuongApdung"
            dt.Tables("Table2").TableName = "tbdtcombo"
            dt.Tables("Table3").TableName = "TbDQuydoi"
            dt.Tables("Table4").TableName = "tbdtKhuyenmai"
            dt.Tables("Table5").TableName = "tbSalesIN"
            dt.Tables("Table6").TableName = "tbItems"
            dt.Tables("Table7").TableName = "tbItemsGrp"
            dt.Tables("Table8").TableName = "sysSTnew"
            dt.Tables("Table9").TableName = "tbKhachhangActive"

        Catch ex As Exception
            Throw ex
        Finally
            conn.Close()
        End Try

        Return dt

    End Function
    <WebMethod()> Public Function cheklock2(ByVal Manpp As String) As DataSet
        Dim c As Integer
        Dim con As SqlConnection
        Dim cmd As SqlCommand
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())
        cmd = New SqlCommand("CHECKCHUKY2", con)
        cmd.CommandType = CommandType.StoredProcedure


        cmd.Parameters.Add("@MaNPP", SqlDbType.NVarChar).Value = Manpp
        cmd.CommandTimeout = 333
        Try
            con.Open()
            'cmd.ExecuteNonQuery()
            adp = New SqlDataAdapter(cmd)
            dtset = New DataSet
            adp.Fill(dtset)
            'Return dtset
            Return dtset

            con.Close()
        Catch ex As Exception

            con.Close()

        End Try

    End Function
    <WebMethod()> Public Function cheklock(ByVal DenNgay As Date, ByVal Manpp As String) As Integer
        Dim c As Integer
        Dim con As SqlConnection
        Dim cmd As SqlCommand
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())
        cmd = New SqlCommand("CHECKCHUKY", con)
        cmd.CommandType = CommandType.StoredProcedure

        cmd.Parameters.Add("@ngaykt", SqlDbType.SmallDateTime).Value = DenNgay
        cmd.Parameters.Add("@MaNPP", SqlDbType.NVarChar).Value = Manpp
        cmd.CommandTimeout = 333
        Try
            con.Open()
            'cmd.ExecuteNonQuery()
            adp = New SqlDataAdapter(cmd)
            dtset = New DataSet
            adp.Fill(dtset)
            'Return dtset
            c = CInt(dtset.Tables(0).Rows(0)("kt"))
            Return c
            con.Close()
        Catch ex As Exception
            c = 2
            con.Close()

        End Try

    End Function
    <WebMethod()> Public Function SSM_Getton(ByVal TuNgay As Date, ByVal DenNgay As Date, ByVal Manpp As String) As DataSet

        Dim con As SqlConnection
        Dim cmd As SqlCommand
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())
        cmd = New SqlCommand("WebGetNhapxuatTonssm", con)
        cmd.CommandType = CommandType.StoredProcedure
        'cmd.Parameters.Add("@RE", SqlDbType.NVarChar).Value = re
        cmd.Parameters.Add("@Tungay", SqlDbType.SmallDateTime).Value = TuNgay
        cmd.Parameters.Add("@Denngay", SqlDbType.SmallDateTime).Value = DenNgay
        cmd.Parameters.Add("@MaNPP", SqlDbType.NVarChar).Value = Manpp
        cmd.CommandTimeout = 333
        Try
            con.Open()
            'cmd.ExecuteNonQuery()
            adp = New SqlDataAdapter(cmd)
            dtset = New DataSet
            adp.Fill(dtset)

        Catch ex As Exception

            con.Close()

        End Try
        Return dtset
    End Function



    <WebMethod()>
    Public Function SSM_BaoPhu(ByVal TuNgay As Date, ByVal DenNgay As Date, ByVal Manpp As String) As DataSet

        Dim con As SqlConnection
        Dim cmd As SqlCommand
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())
        cmd = New SqlCommand("WebBaophuNV1", con)
        cmd.CommandType = CommandType.StoredProcedure
        'cmd.Parameters.Add("@RE", SqlDbType.NVarChar).Value = re
        cmd.Parameters.Add("@Tungay", SqlDbType.SmallDateTime).Value = TuNgay
        cmd.Parameters.Add("@Denngay", SqlDbType.SmallDateTime).Value = DenNgay
        cmd.Parameters.Add("@MaNPP", SqlDbType.NVarChar).Value = Manpp
        cmd.CommandTimeout = 333
        Try
            con.Open()
            'cmd.ExecuteNonQuery()
            adp = New SqlDataAdapter(cmd)
            dtset = New DataSet
            adp.Fill(dtset)
            Return dtset
        Catch ex As Exception

            con.Close()

        End Try

    End Function




End Class