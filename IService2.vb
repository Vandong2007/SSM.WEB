Imports System.ServiceModel

' NOTE: You can use the "Rename" command on the context menu to change the interface name "IService2" in both code and config file together.
<ServiceContract()>
Public Interface IService2

    <OperationContract()>
    Sub DoWork()

End Interface
