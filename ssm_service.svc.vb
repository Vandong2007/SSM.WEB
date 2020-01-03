Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.ServiceModel
'Imports System.Runtime.Serializationrder
Imports System.ServiceModel.Activation

Namespace ssm
    Public Class ssm_service
        Implements Issm_service


        Public Function [Get_tbItem_List]() As List(Of tbItem) Implements Issm_service.Get_tbItem_List
            Using entities As New SSM2014Entities1
                Return entities.tbItems.ToList()
            End Using
        End Function

        'Public Function [Get]() As CustomerData Implements Issm_service.Get
        '    Dim constr As String = ConfigurationManager.ConnectionStrings("SSM2014ConnectionString").ConnectionString
        '    Using con As New SqlConnection(constr)
        '        Using cmd As New SqlCommand("Select Itemcode ,[ItemnameEng] ,[Itemname]  ,[Brand] ,[Category] ,[Subbrand] ,[Unit]  ,[Price] ,[Volumn] as Packsize ,[Type]  ,[OldItemcode] as Sapcode ,[Nhan] as VCategory ,[mui] as fragrance ,[varUnit] as subunit ,[Loai] as types ,[Thung] AS Carton ,[Barcode]  FROM  [tbItems] where type='y'")
        '            Using sda As New SqlDataAdapter()
        '                cmd.Connection = con
        '                sda.SelectCommand = cmd
        '                Using dt As New DataTable()
        '                    Dim customers As New CustomerData()
        '                    sda.Fill(customers.CustomersTable)
        '                    Return customers
        '                End Using
        '            End Using
        '        End Using
        '    End Using
        'End Function

        'Public Sub Insert(name As String, country As String) Implements Issm_service.Insert
        '    Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        '    Using con As New SqlConnection(constr)
        '        Using cmd As New SqlCommand("INSERT INTO Customers (Name, Country) VALUES (@Name, @Country)")
        '            cmd.Parameters.AddWithValue("@Name", name)
        '            cmd.Parameters.AddWithValue("@Country", country)
        '            cmd.Connection = con
        '            con.Open()
        '            cmd.ExecuteNonQuery()
        '            con.Close()
        '        End Using
        '    End Using
        'End Sub

        'Public Sub Update(customerId As Integer, name As String, country As String) Implements Issm_service.Update
        '    Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        '    Using con As New SqlConnection(constr)
        '        Using cmd As New SqlCommand("UPDATE Customers SET Name = @Name, Country = @Country WHERE CustomerId = @CustomerId")
        '            cmd.Parameters.AddWithValue("@CustomerId", customerId)
        '            cmd.Parameters.AddWithValue("@Name", name)
        '            cmd.Parameters.AddWithValue("@Country", country)
        '            cmd.Connection = con
        '            con.Open()
        '            cmd.ExecuteNonQuery()
        '            con.Close()
        '        End Using
        '    End Using
        'End Sub

        'Public Sub Delete(customerId As Integer) Implements Issm_service.Delete
        '    Dim constr As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
        '    Using con As New SqlConnection(constr)
        '        Using cmd As New SqlCommand("DELETE FROM Customers WHERE CustomerId = @CustomerId")
        '            cmd.Parameters.AddWithValue("@CustomerId", customerId)
        '            cmd.Connection = con
        '            con.Open()
        '            cmd.ExecuteNonQuery()
        '            con.Close()
        '        End Using
        '    End Using
        'End Sub
    End Class
End Namespace