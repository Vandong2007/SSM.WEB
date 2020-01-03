

Imports System
Imports System.Collections.Generic
Imports Newtonsoft.Json
Imports Newtonsoft.Json.Linq
Imports System.Data.SqlClient

Public Class Roottoken

    Public Property username() As String
        Get
            Return m_username
        End Get
        Set(value As String)
            m_username = value
        End Set
    End Property
    Private m_username As String
    Public Property roles() As List(Of String)
        Get
            Return m_roles
        End Get
        Set(value As List(Of String))
            m_roles = value
        End Set
    End Property
    Private m_roles As List(Of String)
    Public Property access_token() As String
        Get
            Return m_access_token
        End Get
        Set(value As String)
            m_access_token = value
        End Set
    End Property
    Private m_access_token As String
    Public Property token_type() As String
        Get
            Return m_token_type
        End Get
        Set(value As String)
            m_token_type = value
        End Set
    End Property
    Private m_token_type As String
End Class



Public Class dms

    <JsonProperty("data")>
    Public Data As data()

    <JsonProperty("metaData")>
    Public MetaData As metaData
End Class


Public Class OrderLine

    <JsonProperty("id")>
    Public Id As Integer

    <JsonProperty("lineNumber")>
    Public LineNumber As Integer

    <JsonProperty("note")>
    Public Note As Object

    <JsonProperty("orderQuantity")>
    Public OrderQuantity As Integer

    <JsonProperty("productCode")>
    Public ProductCode As String

    <JsonProperty("schemeCode")>
    Public schemeCode As String

End Class

Public Class data

    <JsonProperty("fieldForceCode")>
    Public FieldForceCode As String

    <JsonProperty("id")>
    Public Id As Integer

    <JsonProperty("orderDate")>
    Public OrderDate As String

    <JsonProperty("orderLines")>
    Public OrderLines As OrderLine()

    <JsonProperty("orderNumber")>
    Public OrderNumber As String

    <JsonProperty("remark")>
    Public Remark As Object

    <JsonProperty("retailerCode")>
    Public RetailerCode As String
End Class

Public Class metaData

    <JsonProperty("list")>
    Public List As Boolean

    <JsonProperty("total")>
    Public Total As Integer
End Class

Friend Class testAccessToken

    <JsonProperty("access_token")>
    Public Property AccessToken As String

    <JsonProperty("token_type")>
    Public Property TokenType As String

    <JsonProperty("expires_in")>
    Public Property ExpiresIn As Integer

    <JsonProperty("userName")>
    Public Property UserName As String

    <JsonProperty(".issued")>
    Public Property Issued As String

    <JsonProperty(".expires")>
    Public Property Expires As String
End Class


Public Class luu
    Dim cmdSelect As SqlCommand
    Dim conStr As SqlConnection
    Dim strSelect As String
    Dim adp As SqlDataAdapter
    Dim dtset As DataSet
    Dim drRead As SqlDataReader
    'Public gsDataSQL As String = "Data Source=ADMINPC\SQLEXPRESS;Initial Catalog=Webapi;Integrated Security=True"

    Public gsDataSQL As String = System.Configuration.ConfigurationManager.ConnectionStrings("SSMConnectionString").ToString()

    Function GetTHFullData(ByVal id As Integer, Debcode As String, orderDate As Date, orderNumber As String, orderLines As String, fieldForceCode As String, retailerCode As String, remark As String) As DataSet
        conStr = New SqlConnection(gsDataSQL)
        cmdSelect = New SqlCommand("DMS_Insert_orderH", conStr)
        cmdSelect.CommandType = CommandType.StoredProcedure
        With cmdSelect

            .Parameters.Add(New SqlParameter("@id", SqlDbType.Int)).Value = id
            .Parameters.Add(New SqlParameter("@Debcode", SqlDbType.NVarChar)).Value = Debcode
            .Parameters.Add(New SqlParameter("@orderNumber", SqlDbType.NVarChar)).Value = orderNumber
            .Parameters.Add(New SqlParameter("@orderDate", SqlDbType.DateTime)).Value = orderDate
            .Parameters.Add(New SqlParameter("@orderLines", SqlDbType.NVarChar)).Value = orderLines
            .Parameters.Add(New SqlParameter("@remark", SqlDbType.NVarChar)).Value = remark
            .Parameters.Add(New SqlParameter("@fieldForceCode", SqlDbType.NVarChar)).Value = fieldForceCode
            .Parameters.Add(New SqlParameter("@retailerCode", SqlDbType.NVarChar)).Value = retailerCode


        End With
        cmdSelect.CommandTimeout = 333
        Try
            conStr.Open()
            adp = New SqlDataAdapter
            adp.SelectCommand = cmdSelect
            dtset = New DataSet
            adp.Fill(dtset)
        Catch ex As SqlException
            'MsgBox("Not connect database", MsgBoxStyle.Critical, "Error")
        Finally
            conStr.Close()
        End Try
        cmdSelect = Nothing
        Return dtset
    End Function
    Function insetdt2(ByVal id As Integer, lineNumber As Integer, Debcode As String, orderNumber As String, notes As String, productCode As String, orderQuantity As Integer, schemeCode As String) As DataSet
        conStr = New SqlConnection(gsDataSQL)
        cmdSelect = New SqlCommand("DMS_Insert_orderD", conStr)
        cmdSelect.CommandType = CommandType.StoredProcedure
        With cmdSelect

            .Parameters.Add(New SqlParameter("@id", SqlDbType.Int)).Value = id
            .Parameters.Add(New SqlParameter("@lineNumber", SqlDbType.Int)).Value = lineNumber
            .Parameters.Add(New SqlParameter("@Debcode", SqlDbType.NVarChar)).Value = Debcode
            .Parameters.Add(New SqlParameter("@orderNumber", SqlDbType.NVarChar)).Value = orderNumber

            .Parameters.Add(New SqlParameter("@notes", SqlDbType.NVarChar)).Value = notes
            .Parameters.Add(New SqlParameter("@productCode", SqlDbType.NVarChar)).Value = productCode
            .Parameters.Add(New SqlParameter("@orderQuantity", SqlDbType.Real)).Value = orderQuantity
            .Parameters.Add(New SqlParameter("@schemeCode", SqlDbType.Real)).Value = schemeCode


        End With
        cmdSelect.CommandTimeout = 333
        Try
            conStr.Open()
            adp = New SqlDataAdapter
            adp.SelectCommand = cmdSelect
            dtset = New DataSet
            adp.Fill(dtset)
        Catch ex As SqlException
            'MsgBox("Not connect database", MsgBoxStyle.Critical, "Error")
        Finally
            conStr.Close()
        End Try
        cmdSelect = Nothing
        Return dtset
    End Function

    Function Megedms(Debcode As String) As Integer
        conStr = New SqlConnection(gsDataSQL)
        cmdSelect = New SqlCommand("ChayDMS_copy", conStr)
        cmdSelect.CommandType = CommandType.StoredProcedure
        With cmdSelect


            .Parameters.Add(New SqlParameter("@manpp", SqlDbType.NVarChar)).Value = Debcode


        End With
        cmdSelect.CommandTimeout = 333
        Try
            conStr.Open()
            adp = New SqlDataAdapter
            adp.SelectCommand = cmdSelect
            dtset = New DataSet
            adp.Fill(dtset)
        Catch ex As SqlException
            'MsgBox("Not connect database", MsgBoxStyle.Critical, "Error")
        Finally
            conStr.Close()
        End Try
        cmdSelect = Nothing
        Return 1
    End Function
    Public Function GetNpp() As DataSet
        Dim con As SqlConnection
        Dim adp As SqlDataAdapter
        Dim dtset As DataSet

        con = New SqlConnection(gsDataSQL)
        con.Open()
        Dim strselect As String = "select * from   tbActive where type = 1 "
        adp = New SqlDataAdapter(strselect, con)
        dtset = New DataSet
        adp.Fill(dtset, "dbo.tbActive")
        con.Close()
        Return dtset
    End Function
End Class


Public Class tbCustomers

    <JsonProperty("debcode")>
    Public Property Debcode As String

    <JsonProperty("debname")>
    Public Property Debname As String

    <JsonProperty("debadd")>
    Public Property Debadd As String

    <JsonProperty("classid")>
    Public Property Classid As String

    <JsonProperty("channel")>
    Public Property Channel As String

    <JsonProperty("region")>
    Public Property Region As String

    <JsonProperty("subregion")>
    Public Property Subregion As String

    <JsonProperty("sdf")>
    Public Property Sdf As String

    <JsonProperty("area")>
    Public Property Area As String

    <JsonProperty("province")>
    Public Property Province As String

    <JsonProperty("territory")>
    Public Property Territory As String

    <JsonProperty("activer")>
    Public Property Activer As Boolean

    <JsonProperty("lastchange")>
    Public Property Lastchange As Object

    <JsonProperty("datechange")>
    Public Property Datechange As String

    <JsonProperty("olddebcode")>
    Public Property Olddebcode As String
End Class
