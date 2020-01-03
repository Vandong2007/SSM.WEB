
Imports System.Data
Imports System.ServiceModel
Imports System.Configuration
Imports System.Runtime.Serialization
Imports System.ServiceModel.Web
Namespace ssm
    ' NOTE: You can use the "Rename" command on the context menu to change the interface name "IService" in both code and config file together.

    <ServiceContract()> _
    Public Interface Issm_service
        '<OperationContract()> _
        'Function [Get]() As CustomerData


        <OperationContract> _
    <WebInvoke(Method:="GET", ResponseFormat:=WebMessageFormat.Json, UriTemplate:="Items")> _
        Function Get_tbItem_List() As List(Of tbItem)


        ''<OperationContract()> _
        ''Sub Insert(name As String, country As String)

        ''<OperationContract()> _
        ''Sub Update(customerId As Integer, name As String, country As String)

        ''<OperationContract()> _
        ''Sub Delete(customerId As Integer)
    End Interface
End Namespace
'<DataContract()> _
'Public Class CustomerData
'    Public Sub New()
'        Me.CustomersTable = New DataTable("CustomersData")
'    End Sub

'    <DataMember()> _
'    Public Property CustomersTable() As DataTable
'End Class
