

Imports System.Data
Imports System.Configuration
Imports System.Linq
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
'Imports System.Xml.Linq
Imports System.Data.SqlClient

''' <summary>
''' Summary description for DungChung
''' </summary>
Public Class dungchung

    Private da As SqlDataAdapter
    Private dt As New DataTable()
    Private namesp As String = ""
    Private giaban As Double

   
    Public Function taoketnoi() As SqlConnection
        Return New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())

        'Return New SqlConnection("Data Source=192.168.100.46;Initial Catalog=SSM2014;Persist Security Info=True;User ID=sqlupdate;Password=sqlupdate")
    End Function
    Public Function LayTenSP(masp As String) As String
        da = New SqlDataAdapter("select * from SanPham Where MaSP='" & masp & "'", taoketnoi())
        da.Fill(dt)
        namesp = dt.Rows(0)("TenSP").ToString()
        Return namesp
    End Function
    Public Function themsp(masp As String) As DataSet
        da = New SqlDataAdapter("SELECT isnull([Barcode],'')as  Barcode, isnull([Category],'')as Category,isnull([Volumn],'') as  Volumn,isnull([mui],'') as mui  FROM  [tbItems] where OldItemcode='" & masp & "'", taoketnoi())

        Dim dtset = New DataSet
        da.Fill(dtset, "tbItems")

        Return dtset
    End Function

    Public Function laysp(masp As String) As DataSet
        da = New SqlDataAdapter("SELECT * FROM  [tbItems] where OldItemcode='" & masp & "'", taoketnoi())

        Dim dtset = New DataSet
        da.Fill(dtset, "tbItems")

        Return dtset
    End Function

    Public Function getconnect(masp As Integer) As DataSet
        da = New SqlDataAdapter("SELECT TOP 1  *   FROM [ConnectSAP] where  [Acti] =  " & masp & " ", taoketnoi())

        Dim dtset = New DataSet
        da.Fill(dtset, "ConnectSAP")

        Return dtset
    End Function
    Public Function Layloai(masp As String) As String
      

        Try
            da = New SqlDataAdapter("select Category from tbItems Where OldItemcode='" & masp & "'", taoketnoi())
            da.Fill(dt)
            namesp = dt.Rows(0)("Category").ToString()
            Return namesp
        Catch ex As Exception
            Return "Orther"
        End Try



    End Function
    Public Function LayGiaSP(masp As String) As Double
        da = New SqlDataAdapter("select * from SanPham Where MaSP='" & masp & "'", taoketnoi())
        da.Fill(dt)
        giaban = CDbl(dt.Rows(0)("DonGia"))
        Return giaban
    End Function
    Public Function TenNPP(debcode As String) As String
        da = New SqlDataAdapter("SELECT [Debname] FROM [tbCustomer] Where Olddebcode='" & debcode & "'", taoketnoi())
        da.Fill(dt)

        Return dt.Rows(0)("Debname").ToString
    End Function
    Public Function dem(debcode As String) As Integer
        da = New SqlDataAdapter("SELECT isnull (count(*),0) as k FROM  [Tbdathangs] where  type='N' and [Debcode] = '" & debcode & "'", taoketnoi())
        da.Fill(dt)

        Return CInt(dt.Rows(0)("k"))
    End Function
    Public Function diachi(debcode As String) As DataSet
        da = New SqlDataAdapter("SELECT * FROM [tbCustomer] Where Olddebcode='" & debcode & "'", taoketnoi())

        Dim dtset = New DataSet
        da.Fill(dtset, "tbCustomer")

        Return dtset
    End Function
    '// lấy ton kho
    Public Function laykho(kho As String, masp As String) As Integer
        Dim dt1 As New DataTable()
        Try
            '            da = New SqlDataAdapter("SELECT isnull (SUM(bb.Quantity),0) AS dh FROM (SELECT [kho],[Itemcode] ,isnull (SUM(a.Quantity),0) AS Quantity FROM  dbo.Tbdathang_ct a INNER JOIN dbo.tbDatHangs b ON a.Ordernr = b.Ordernr WHERE         b.Type = 'N' " & _
            '" group  by [kho],[Itemcode]   " & _
            ' "           union all  " & _
            '" SELECT [Kho],[Itemcode], sum (case when Quantity = 0 then 99999999 else ([Quantity]) end ) as qt  " & _
            '" FROM  [tbdh_lock_kho] where [Dateform] <= getdate()     and [dateto] >=getdate() and type=1  group by  [Kho]  " & _
            '"      ,[Itemcode]) bb  WHERE    bb.kho='" & kho & "' and bb.Itemcode='" & masp & "'  )   ", taoketnoi())
            '            da.Fill(dt1)
            '            Return CInt(dt1.Rows(0)("dh"))

            Dim arrParam As SqlParameter() = {New SqlParameter("@KHO", SqlDbType.NVarChar), New SqlParameter("@item", SqlDbType.NVarChar)}
            arrParam(0).Value = kho
            arrParam(1).Value = masp


            Return Integer.Parse("0" + ThucThiStore_DataSets("getdonhang", arrParam).Tables(0).Rows(0)(0))



        Catch ex As Exception
            Return 0
        End Try



    End Function


    Public Function thongtinnpp(sodonhang As String, nam As String) As String
        Dim dt1 As New DataTable()
        Try
            da = New SqlDataAdapter("SELECT  D.Debcode  as Debcode FROM  [tbDatHangs] d  inner JOIN   Fn_cust_dh('" + nam + "')  c on d.Debcode = c.[Olddebcode] where d.Ordernr ='" + sodonhang + "'", taoketnoi())
            da.Fill(dt1)
            Return dt1.Rows(0)("Debcode")
        Catch ex As Exception
            Return 0
        End Try



    End Function

    Public Function listdhs(ByVal TuNgay As Date, ByVal DenNgay As Date, d As String) As DataTable
        Dim dt1s As New DataTable()

        'da = New SqlDataAdapter("SELECT d.Ordernr, D.Debcode  as Debcode,c.Region,c.Area,d.Type FROM  [tbDatHangs] d  inner JOIN   Fn_cust_dh('" + d + "')  c on d.Debcode = c.[Olddebcode] where d.Dates >= '" + TuNgay + "' and d.Dates <= '" + DenNgay + "'", taoketnoi())
        'da.Fill(dt1s)
        'Return dt1s

        Dim con As SqlConnection
        Dim cmd As SqlCommand
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString())
        cmd = New SqlCommand("listdondathang", con)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.Add("@uname", SqlDbType.NVarChar).Value = d
        cmd.Parameters.Add("@Tungay", SqlDbType.SmallDateTime).Value = TuNgay
        cmd.Parameters.Add("@Denngay", SqlDbType.SmallDateTime).Value = DenNgay
        '    con.Open()
        '    'cmd.ExecuteNonQuery()
        '    adp = New SqlDataAdapter(cmd)
        '    dtset = New DataTable
        '    adp.Fill(dtset)
        '    con.Close()
        '    Return dtset
        'Catch ex As Exception

        'End Try
        cmd.CommandTimeout = 333
        Try
            con.Open()
            'cmd.ExecuteNonQuery()
            adp = New SqlDataAdapter(cmd)
            dtset = New DataSet
            adp.Fill(dtset)
            dt1s = dtset.Tables(0)
            Return dt1s
        Catch ex As Exception

            con.Close()

        End Try







    End Function
    Public Function thongtindh(sodonhang As String) As DataTable
        Dim dt1s As New DataTable()
        Try
            da = New SqlDataAdapter("SELECT a.*,b.Itemname,d.Debcode,d.Dates,CASE WHEN d.Type='Y' THEN  'Confirm' when d.type='H' then 'Cancel' else 'Order' end as Type, c.[Debname] ,c.Region,c.Area FROM Tbdathang_ct a INNER JOIN tbItems b ON a.Itemcode = b.OldItemcode " & _
" inner JOIN [tbDatHangs] d on a.ordernr = d.ordernr  " & _
" inner JOIN [tbCustomer] c on d.Debcode = c.[Olddebcode]   WHERE  a.Ordernr ='" + sodonhang + "'", taoketnoi())
            da.Fill(dt1s)
            Return dt1s
        Catch ex As Exception

        End Try



    End Function

    Public Function ThucThiStore_DataSets(StoredProcedure As String, ParamArray Parameters As SqlParameter()) As DataSet
        ' Dim ConnectionString As String = "SSMConnectionString"

        '"Server =.\SQL2005;Initial Catalog=DatabaseName;User ID=sa;Password=***"
        Dim Conn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ToString())
        Dim Command As New SqlCommand(StoredProcedure, Conn)
        If Parameters IsNot Nothing Then
            Command.Parameters.Clear()
            Command.Parameters.AddRange(Parameters)
        End If
        Dim ds As New DataSet()
        Dim da As New SqlDataAdapter(StoredProcedure, Conn)
        Command.CommandType = CommandType.StoredProcedure
        da.SelectCommand = Command
        Command.CommandTimeout = 3333
        Try
            Conn.Open()
            da.Fill(ds)
        Finally
            If Conn.State = ConnectionState.Open Then
                Conn.Close()
            End If
            Conn.Dispose()
        End Try
        Return ds
    End Function
End Class