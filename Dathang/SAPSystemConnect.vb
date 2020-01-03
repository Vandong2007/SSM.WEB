'Imports SAP.Middleware.Connector
Imports System.Collections.Generic
Imports System.Linq
Imports System.Text
'Namespace SAP_customers
'     Class SAPSystemConnect:IDestinationConfiguration
'    End Class

'End Namespace
Imports SAP.Middleware.Connector

Public Class ECCDestinationConfig
    Implements IDestinationConfiguration
    Dim DB As New dungchung
    Public Event ConfigurationChanged(ByVal destinationName As String, ByVal args As RfcConfigurationEventArgs) Implements IDestinationConfiguration.ConfigurationChanged

    Public Function GetParameters(ByVal destinationName As String) As RfcConfigParameters Implements IDestinationConfiguration.GetParameters
        Dim dts As DataSet
        Dim parms As New RfcConfigParameters
        dts = DB.getconnect(1)
        parms.Add(RfcConfigParameters.AppServerHost, dts.Tables(0).Rows(0)("AppServerHost").ToString.Trim)
        parms.Add(RfcConfigParameters.SystemNumber, dts.Tables(0).Rows(0)("SystemNumber").ToString.Trim)
        parms.Add(RfcConfigParameters.SystemID, dts.Tables(0).Rows(0)("SystemID").ToString.Trim)
        parms.Add(RfcConfigParameters.User, dts.Tables(0).Rows(0)("Users").ToString.Trim)
        parms.Add(RfcConfigParameters.Password, dts.Tables(0).Rows(0)("Password").ToString.Trim)
        parms.Add(RfcConfigParameters.Client, dts.Tables(0).Rows(0)("Client").ToString.Trim)
        parms.Add(RfcConfigParameters.Language, dts.Tables(0).Rows(0)("Language").ToString.Trim)
        parms.Add(RfcConfigParameters.PoolSize, dts.Tables(0).Rows(0)("PoolSize").ToString.Trim)
        parms.Add(RfcConfigParameters.PeakConnectionsLimit, dts.Tables(0).Rows(0)("PeakConnectionsLimit").ToString.Trim)
        'Select Case destinationName

        '    Case "DEV"

        '        parms.Add(RfcConfigParameters.AppServerHost, "192.168.100.3")
        '        parms.Add(RfcConfigParameters.SystemNumber, "00")
        '        parms.Add(RfcConfigParameters.SystemID, "SED")
        '        parms.Add(RfcConfigParameters.User, "dongtv")
        '        parms.Add(RfcConfigParameters.Password, "hanoi123")
        '        parms.Add(RfcConfigParameters.Client, "210")
        '        parms.Add(RfcConfigParameters.Language, "EN")
        '        parms.Add(RfcConfigParameters.PoolSize, "5")
        '        parms.Add(RfcConfigParameters.PeakConnectionsLimit, "10")
        '        'parms.Add(RfcConfigParameters.IdleTimeout, "600")
        '    Case "SEQ"

        '        parms.Add(RfcConfigParameters.AppServerHost, "192.168.100.3")
        '        parms.Add(RfcConfigParameters.SystemNumber, "01")
        '        parms.Add(RfcConfigParameters.SystemID, "SEQ")
        '        parms.Add(RfcConfigParameters.User, "dongtv")
        '        parms.Add(RfcConfigParameters.Password, "Hanoi123")
        '        parms.Add(RfcConfigParameters.Client, "500")
        '        parms.Add(RfcConfigParameters.Language, "EN")
        '        parms.Add(RfcConfigParameters.PoolSize, "5")
        '        parms.Add(RfcConfigParameters.PeakConnectionsLimit, "10")
        '        'parms.Add(RfcConfigParameters.IdleTimeout, "600")
        '    Case Else

        'End Select

        Return parms

    End Function

    Public Function ChangeEventsSupported() As Boolean Implements IDestinationConfiguration.ChangeEventsSupported
        Return False
    End Function


End Class