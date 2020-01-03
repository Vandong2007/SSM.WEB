'Public Class Customers

'End Class
Imports System.Collections.Generic
Imports System.Linq
Imports System.Text
Imports SAP.Middleware.Connector

Namespace SAP_Customers
    Class Customers
        Protected CustomerNo As String
        Protected CustomerName As String
        Protected Address As String
        Protected City As String
        Protected StateProvince As String
        Protected CountryCode As String
        Protected PostalCode As String
        Protected Region As String
        Protected Industry As String
        Protected District As String
        Protected SalesOrg As String
        Protected DistributionChannel As String
        Protected Division As String





        Public Sub GetCustomerDetails(destination As RfcDestination)


            Try
                Dim repo As RfcRepository = destination.Repository
                Dim customerList As IRfcFunction = repo.CreateFunction("BAPI_CUSTOMER_GETLIST")


                customerList.Invoke(destination)

                Dim idRange As IRfcTable = customerList.GetTable("IdRange")
                idRange.SetValue("SIGN", "I")
                idRange.SetValue("OPTION", "BT")
                idRange.SetValue("LOW", "")
                idRange.SetValue("HIGH", "999999")


                'add selection range to customerList function to search for all customers
                customerList.SetValue("idrange", idRange)


                Dim addressData As IRfcTable = customerList.GetTable("AddressData")
                customerList.Invoke(destination)

                For cuIndex As Integer = 0 To addressData.RowCount - 1

                    addressData.CurrentIndex = cuIndex
                    Dim customerHierachy As IRfcFunction = repo.CreateFunction("BAPI_CUSTOMER_GETSALESAREAS")
                    Dim customerDetail1 As IRfcFunction = repo.CreateFunction("BAPI_CUSTOMER_GETDETAIL1")
                    Dim customerDetail2 As IRfcFunction = repo.CreateFunction("BAPI_CUSTOMER_GETDETAIL2")

                    Me.CustomerNo = addressData.GetString("Customer")
                    Me.CustomerName = addressData.GetString("Name")
                    Me.Address = addressData.GetString("Street")
                    Me.City = addressData.GetString("City")
                    Me.StateProvince = addressData.GetString("Region")
                    Me.CountryCode = addressData.GetString("CountryISO")
                    Me.PostalCode = addressData.GetString("Postl_Cod1")

                    customerDetail2.SetValue("CustomerNo", Me.CustomerNo)
                    customerDetail2.Invoke(destination)
                    Dim generalDetail As IRfcStructure = customerDetail2.GetStructure("CustomerGeneralDetail")

                    Me.Region = generalDetail.GetString("Reg_Market")
                    Me.Industry = generalDetail.GetString("Industry")


                    customerDetail1.Invoke(destination)
                    Dim detail1 As IRfcStructure = customerDetail1.GetStructure("PE_CompanyData")

                    Me.District = detail1.GetString("District")


                    customerHierachy.Invoke(destination)
                    customerHierachy.SetValue("CustomerNo", Me.CustomerNo)
                    customerHierachy.Invoke(destination)

                    Dim otherDetail As IRfcTable = customerHierachy.GetTable("SalesAreas")

                    If otherDetail.RowCount > 0 Then
                        Me.SalesOrg = otherDetail.GetString("SalesOrg")
                        Me.DistributionChannel = otherDetail.GetString("DistrChn")
                        Me.Division = otherDetail.GetString("Division")
                    End If

                    customerHierachy = Nothing
                    customerDetail1 = Nothing
                    customerDetail2 = Nothing
                    GC.Collect()



                    GC.WaitForPendingFinalizers()


                Next

            Catch e As RfcCommunicationException
                ' user could not logon...
            Catch e As RfcLogonException
                ' serious problem on ABAP system side...
            Catch e As RfcAbapRuntimeException
                ' The function module returned an ABAP exception, an ABAP message
                ' or an ABAP class-based exception...
            Catch e As RfcAbapBaseException
            End Try

        End Sub
    End Class



    

End Namespace