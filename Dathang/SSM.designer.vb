﻿'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated by a tool.
'     Runtime Version:4.0.30319.42000
'
'     Changes to this file may cause incorrect behavior and will be lost if
'     the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Option Strict On
Option Explicit On

Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Data
Imports System.Data.Linq
Imports System.Data.Linq.Mapping
Imports System.Linq
Imports System.Linq.Expressions
Imports System.Reflection


<Global.System.Data.Linq.Mapping.DatabaseAttribute(Name:="SSM2014")>  _
Partial Public Class SSMDataContext
	Inherits System.Data.Linq.DataContext
	
	Private Shared mappingSource As System.Data.Linq.Mapping.MappingSource = New AttributeMappingSource()
	
  #Region "Extensibility Method Definitions"
  Partial Private Sub OnCreated()
  End Sub
  Partial Private Sub Inserttb_DMS_orderH(instance As tb_DMS_orderH)
    End Sub
  Partial Private Sub Updatetb_DMS_orderH(instance As tb_DMS_orderH)
    End Sub
  Partial Private Sub Deletetb_DMS_orderH(instance As tb_DMS_orderH)
    End Sub
  Partial Private Sub Inserttb_DMS_orderD(instance As tb_DMS_orderD)
    End Sub
  Partial Private Sub Updatetb_DMS_orderD(instance As tb_DMS_orderD)
    End Sub
  Partial Private Sub Deletetb_DMS_orderD(instance As tb_DMS_orderD)
    End Sub
  #End Region
	
	Public Sub New()
		MyBase.New(Global.WEB.SSM.My.MySettings.Default.SSM2014ConnectionString, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As String)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As System.Data.IDbConnection)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As String, ByVal mappingSource As System.Data.Linq.Mapping.MappingSource)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As System.Data.IDbConnection, ByVal mappingSource As System.Data.Linq.Mapping.MappingSource)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public ReadOnly Property tb_DMS_orderHs() As System.Data.Linq.Table(Of tb_DMS_orderH)
		Get
			Return Me.GetTable(Of tb_DMS_orderH)
		End Get
	End Property
	
	Public ReadOnly Property tb_DMS_orderDs() As System.Data.Linq.Table(Of tb_DMS_orderD)
		Get
			Return Me.GetTable(Of tb_DMS_orderD)
		End Get
	End Property
End Class

<Global.System.Data.Linq.Mapping.TableAttribute(Name:="dbo.tb_DMS_orderH")>  _
Partial Public Class tb_DMS_orderH
	Implements System.ComponentModel.INotifyPropertyChanging, System.ComponentModel.INotifyPropertyChanged
	
	Private Shared emptyChangingEventArgs As PropertyChangingEventArgs = New PropertyChangingEventArgs(String.Empty)
	
	Private _IDs As Integer
	
	Private _id As System.Nullable(Of Integer)
	
	Private _Debcode As String
	
	Private _orderNumber As String
	
	Private _orderDate As System.Nullable(Of Date)
	
	Private _orderLines As String
	
	Private _remark As String
	
	Private _fieldForceCode As String
	
	Private _retailerCode As String
	
	Private _dateupdate As System.Nullable(Of Date)
	
	Private _Amount As System.Nullable(Of Decimal)
	
	Private _Amountfree As System.Nullable(Of Decimal)
	
	Private _status As System.Nullable(Of Char)
	
	Private _Users As String
	
	Private _DateCreate As System.Nullable(Of Date)
	
	Private _tb_DMS_orderH1 As EntityRef(Of tb_DMS_orderH)
	
	Private _tb_DMS_orderH As EntityRef(Of tb_DMS_orderH)
	
	Private _tb_DMS_orderD As EntityRef(Of tb_DMS_orderD)
	
    #Region "Extensibility Method Definitions"
    Partial Private Sub OnLoaded()
    End Sub
    Partial Private Sub OnValidate(action As System.Data.Linq.ChangeAction)
    End Sub
    Partial Private Sub OnCreated()
    End Sub
    Partial Private Sub OnIDsChanging(value As Integer)
    End Sub
    Partial Private Sub OnIDsChanged()
    End Sub
    Partial Private Sub OnidChanging(value As System.Nullable(Of Integer))
    End Sub
    Partial Private Sub OnidChanged()
    End Sub
    Partial Private Sub OnDebcodeChanging(value As String)
    End Sub
    Partial Private Sub OnDebcodeChanged()
    End Sub
    Partial Private Sub OnorderNumberChanging(value As String)
    End Sub
    Partial Private Sub OnorderNumberChanged()
    End Sub
    Partial Private Sub OnorderDateChanging(value As System.Nullable(Of Date))
    End Sub
    Partial Private Sub OnorderDateChanged()
    End Sub
    Partial Private Sub OnorderLinesChanging(value As String)
    End Sub
    Partial Private Sub OnorderLinesChanged()
    End Sub
    Partial Private Sub OnremarkChanging(value As String)
    End Sub
    Partial Private Sub OnremarkChanged()
    End Sub
    Partial Private Sub OnfieldForceCodeChanging(value As String)
    End Sub
    Partial Private Sub OnfieldForceCodeChanged()
    End Sub
    Partial Private Sub OnretailerCodeChanging(value As String)
    End Sub
    Partial Private Sub OnretailerCodeChanged()
    End Sub
    Partial Private Sub OndateupdateChanging(value As System.Nullable(Of Date))
    End Sub
    Partial Private Sub OndateupdateChanged()
    End Sub
    Partial Private Sub OnAmountChanging(value As System.Nullable(Of Decimal))
    End Sub
    Partial Private Sub OnAmountChanged()
    End Sub
    Partial Private Sub OnAmountfreeChanging(value As System.Nullable(Of Decimal))
    End Sub
    Partial Private Sub OnAmountfreeChanged()
    End Sub
    Partial Private Sub OnstatusChanging(value As System.Nullable(Of Char))
    End Sub
    Partial Private Sub OnstatusChanged()
    End Sub
    Partial Private Sub OnUsersChanging(value As String)
    End Sub
    Partial Private Sub OnUsersChanged()
    End Sub
    Partial Private Sub OnDateCreateChanging(value As System.Nullable(Of Date))
    End Sub
    Partial Private Sub OnDateCreateChanged()
    End Sub
    #End Region
	
	Public Sub New()
		MyBase.New
		Me._tb_DMS_orderH1 = CType(Nothing, EntityRef(Of tb_DMS_orderH))
		Me._tb_DMS_orderH = CType(Nothing, EntityRef(Of tb_DMS_orderH))
		Me._tb_DMS_orderD = CType(Nothing, EntityRef(Of tb_DMS_orderD))
		OnCreated
	End Sub
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_IDs", AutoSync:=AutoSync.Always, DbType:="Int NOT NULL IDENTITY", IsDbGenerated:=true)>  _
	Public Property IDs() As Integer
		Get
			Return Me._IDs
		End Get
		Set
			If ((Me._IDs = value)  _
						= false) Then
				Me.OnIDsChanging(value)
				Me.SendPropertyChanging
				Me._IDs = value
				Me.SendPropertyChanged("IDs")
				Me.OnIDsChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_id", DbType:="Int")>  _
	Public Property id() As System.Nullable(Of Integer)
		Get
			Return Me._id
		End Get
		Set
			If (Me._id.Equals(value) = false) Then
				Me.OnidChanging(value)
				Me.SendPropertyChanging
				Me._id = value
				Me.SendPropertyChanged("id")
				Me.OnidChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_Debcode", DbType:="NVarChar(20) NOT NULL", CanBeNull:=false, IsPrimaryKey:=true)>  _
	Public Property Debcode() As String
		Get
			Return Me._Debcode
		End Get
		Set
			If (String.Equals(Me._Debcode, value) = false) Then
				If (Me._tb_DMS_orderH.HasLoadedOrAssignedValue OrElse Me._tb_DMS_orderD.HasLoadedOrAssignedValue) Then
					Throw New System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException()
				End If
				Me.OnDebcodeChanging(value)
				Me.SendPropertyChanging
				Me._Debcode = value
				Me.SendPropertyChanged("Debcode")
				Me.OnDebcodeChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_orderNumber", DbType:="NVarChar(100) NOT NULL", CanBeNull:=false, IsPrimaryKey:=true)>  _
	Public Property orderNumber() As String
		Get
			Return Me._orderNumber
		End Get
		Set
			If (String.Equals(Me._orderNumber, value) = false) Then
				If (Me._tb_DMS_orderH.HasLoadedOrAssignedValue OrElse Me._tb_DMS_orderD.HasLoadedOrAssignedValue) Then
					Throw New System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException()
				End If
				Me.OnorderNumberChanging(value)
				Me.SendPropertyChanging
				Me._orderNumber = value
				Me.SendPropertyChanged("orderNumber")
				Me.OnorderNumberChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_orderDate", DbType:="DateTime")>  _
	Public Property orderDate() As System.Nullable(Of Date)
		Get
			Return Me._orderDate
		End Get
		Set
			If (Me._orderDate.Equals(value) = false) Then
				Me.OnorderDateChanging(value)
				Me.SendPropertyChanging
				Me._orderDate = value
				Me.SendPropertyChanged("orderDate")
				Me.OnorderDateChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_orderLines", DbType:="NVarChar(MAX)")>  _
	Public Property orderLines() As String
		Get
			Return Me._orderLines
		End Get
		Set
			If (String.Equals(Me._orderLines, value) = false) Then
				Me.OnorderLinesChanging(value)
				Me.SendPropertyChanging
				Me._orderLines = value
				Me.SendPropertyChanged("orderLines")
				Me.OnorderLinesChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_remark", DbType:="NVarChar(100)")>  _
	Public Property remark() As String
		Get
			Return Me._remark
		End Get
		Set
			If (String.Equals(Me._remark, value) = false) Then
				Me.OnremarkChanging(value)
				Me.SendPropertyChanging
				Me._remark = value
				Me.SendPropertyChanged("remark")
				Me.OnremarkChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_fieldForceCode", DbType:="NVarChar(8)")>  _
	Public Property fieldForceCode() As String
		Get
			Return Me._fieldForceCode
		End Get
		Set
			If (String.Equals(Me._fieldForceCode, value) = false) Then
				Me.OnfieldForceCodeChanging(value)
				Me.SendPropertyChanging
				Me._fieldForceCode = value
				Me.SendPropertyChanged("fieldForceCode")
				Me.OnfieldForceCodeChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_retailerCode", DbType:="NVarChar(100)")>  _
	Public Property retailerCode() As String
		Get
			Return Me._retailerCode
		End Get
		Set
			If (String.Equals(Me._retailerCode, value) = false) Then
				Me.OnretailerCodeChanging(value)
				Me.SendPropertyChanging
				Me._retailerCode = value
				Me.SendPropertyChanged("retailerCode")
				Me.OnretailerCodeChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_dateupdate", DbType:="DateTime")>  _
	Public Property dateupdate() As System.Nullable(Of Date)
		Get
			Return Me._dateupdate
		End Get
		Set
			If (Me._dateupdate.Equals(value) = false) Then
				Me.OndateupdateChanging(value)
				Me.SendPropertyChanging
				Me._dateupdate = value
				Me.SendPropertyChanged("dateupdate")
				Me.OndateupdateChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_Amount", DbType:="Decimal(18,0)")>  _
	Public Property Amount() As System.Nullable(Of Decimal)
		Get
			Return Me._Amount
		End Get
		Set
			If (Me._Amount.Equals(value) = false) Then
				Me.OnAmountChanging(value)
				Me.SendPropertyChanging
				Me._Amount = value
				Me.SendPropertyChanged("Amount")
				Me.OnAmountChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_Amountfree", DbType:="Decimal(18,0)")>  _
	Public Property Amountfree() As System.Nullable(Of Decimal)
		Get
			Return Me._Amountfree
		End Get
		Set
			If (Me._Amountfree.Equals(value) = false) Then
				Me.OnAmountfreeChanging(value)
				Me.SendPropertyChanging
				Me._Amountfree = value
				Me.SendPropertyChanged("Amountfree")
				Me.OnAmountfreeChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_status", DbType:="NChar(1)")>  _
	Public Property status() As System.Nullable(Of Char)
		Get
			Return Me._status
		End Get
		Set
			If (Me._status.Equals(value) = false) Then
				Me.OnstatusChanging(value)
				Me.SendPropertyChanging
				Me._status = value
				Me.SendPropertyChanged("status")
				Me.OnstatusChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_Users", DbType:="NVarChar(100)")>  _
	Public Property Users() As String
		Get
			Return Me._Users
		End Get
		Set
			If (String.Equals(Me._Users, value) = false) Then
				Me.OnUsersChanging(value)
				Me.SendPropertyChanging
				Me._Users = value
				Me.SendPropertyChanged("Users")
				Me.OnUsersChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_DateCreate", DbType:="DateTime")>  _
	Public Property DateCreate() As System.Nullable(Of Date)
		Get
			Return Me._DateCreate
		End Get
		Set
			If (Me._DateCreate.Equals(value) = false) Then
				Me.OnDateCreateChanging(value)
				Me.SendPropertyChanging
				Me._DateCreate = value
				Me.SendPropertyChanged("DateCreate")
				Me.OnDateCreateChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.AssociationAttribute(Name:="tb_DMS_orderH_tb_DMS_orderH", Storage:="_tb_DMS_orderH1", ThisKey:="Debcode,orderNumber", OtherKey:="Debcode,orderNumber", IsUnique:=true, IsForeignKey:=false)>  _
	Public Property tb_DMS_orderH1() As tb_DMS_orderH
		Get
			Return Me._tb_DMS_orderH1.Entity
		End Get
		Set
			Dim previousValue As tb_DMS_orderH = Me._tb_DMS_orderH1.Entity
			If ((Object.Equals(previousValue, value) = false)  _
						OrElse (Me._tb_DMS_orderH1.HasLoadedOrAssignedValue = false)) Then
				Me.SendPropertyChanging
				If ((previousValue Is Nothing)  _
							= false) Then
					Me._tb_DMS_orderH1.Entity = Nothing
					previousValue.tb_DMS_orderH = Nothing
				End If
				Me._tb_DMS_orderH1.Entity = value
				If (Object.Equals(value, Nothing) = false) Then
					value.tb_DMS_orderH = Me
				End If
				Me.SendPropertyChanged("tb_DMS_orderH1")
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.AssociationAttribute(Name:="tb_DMS_orderH_tb_DMS_orderH", Storage:="_tb_DMS_orderH", ThisKey:="Debcode,orderNumber", OtherKey:="Debcode,orderNumber", IsForeignKey:=true)>  _
	Public Property tb_DMS_orderH() As tb_DMS_orderH
		Get
			Return Me._tb_DMS_orderH.Entity
		End Get
		Set
			Dim previousValue As tb_DMS_orderH = Me._tb_DMS_orderH.Entity
			If ((Object.Equals(previousValue, value) = false)  _
						OrElse (Me._tb_DMS_orderH.HasLoadedOrAssignedValue = false)) Then
				Me.SendPropertyChanging
				If ((previousValue Is Nothing)  _
							= false) Then
					Me._tb_DMS_orderH.Entity = Nothing
					previousValue.tb_DMS_orderH1 = Nothing
				End If
				Me._tb_DMS_orderH.Entity = value
				If ((value Is Nothing)  _
							= false) Then
					value.tb_DMS_orderH1 = Me
					Me._Debcode = value.Debcode
					Me._orderNumber = value.orderNumber
				Else
					Me._Debcode = CType(Nothing, String)
					Me._orderNumber = CType(Nothing, String)
				End If
				Me.SendPropertyChanged("tb_DMS_orderH")
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.AssociationAttribute(Name:="tb_DMS_orderD_tb_DMS_orderH", Storage:="_tb_DMS_orderD", ThisKey:="Debcode,orderNumber", OtherKey:="Debcode,orderNumber", IsForeignKey:=true)>  _
	Public Property tb_DMS_orderD() As tb_DMS_orderD
		Get
			Return Me._tb_DMS_orderD.Entity
		End Get
		Set
			Dim previousValue As tb_DMS_orderD = Me._tb_DMS_orderD.Entity
			If ((Object.Equals(previousValue, value) = false)  _
						OrElse (Me._tb_DMS_orderD.HasLoadedOrAssignedValue = false)) Then
				Me.SendPropertyChanging
				If ((previousValue Is Nothing)  _
							= false) Then
					Me._tb_DMS_orderD.Entity = Nothing
					previousValue.tb_DMS_orderHs = Nothing
				End If
				Me._tb_DMS_orderD.Entity = value
				If ((value Is Nothing)  _
							= false) Then
					value.tb_DMS_orderHs = Me
					Me._Debcode = value.Debcode
					Me._orderNumber = value.orderNumber
				Else
					Me._Debcode = CType(Nothing, String)
					Me._orderNumber = CType(Nothing, String)
				End If
				Me.SendPropertyChanged("tb_DMS_orderD")
			End If
		End Set
	End Property
	
	Public Event PropertyChanging As PropertyChangingEventHandler Implements System.ComponentModel.INotifyPropertyChanging.PropertyChanging
	
	Public Event PropertyChanged As PropertyChangedEventHandler Implements System.ComponentModel.INotifyPropertyChanged.PropertyChanged
	
	Protected Overridable Sub SendPropertyChanging()
		If ((Me.PropertyChangingEvent Is Nothing)  _
					= false) Then
			RaiseEvent PropertyChanging(Me, emptyChangingEventArgs)
		End If
	End Sub
	
	Protected Overridable Sub SendPropertyChanged(ByVal propertyName As [String])
		If ((Me.PropertyChangedEvent Is Nothing)  _
					= false) Then
			RaiseEvent PropertyChanged(Me, New PropertyChangedEventArgs(propertyName))
		End If
	End Sub
End Class

<Global.System.Data.Linq.Mapping.TableAttribute(Name:="dbo.tb_DMS_orderD")>  _
Partial Public Class tb_DMS_orderD
	Implements System.ComponentModel.INotifyPropertyChanging, System.ComponentModel.INotifyPropertyChanged
	
	Private Shared emptyChangingEventArgs As PropertyChangingEventArgs = New PropertyChangingEventArgs(String.Empty)
	
	Private _IDs As Integer
	
	Private _id As Integer
	
	Private _lineNumber As Integer
	
	Private _Debcode As String
	
	Private _orderNumber As String
	
	Private _notes As String
	
	Private _productCode As String
	
	Private _price As System.Nullable(Of Integer)
	
	Private _orderQuantity As System.Nullable(Of Decimal)
	
	Private _Amount As System.Nullable(Of Decimal)
	
	Private _datecreate As System.Nullable(Of Date)
	
	Private _SaleValue As System.Nullable(Of Decimal)
	
	Private _schemeCode As String
	
	Private _FreeValue As System.Nullable(Of Decimal)
	
	Private _tb_DMS_orderHs As EntityRef(Of tb_DMS_orderH)
	
    #Region "Extensibility Method Definitions"
    Partial Private Sub OnLoaded()
    End Sub
    Partial Private Sub OnValidate(action As System.Data.Linq.ChangeAction)
    End Sub
    Partial Private Sub OnCreated()
    End Sub
    Partial Private Sub OnIDsChanging(value As Integer)
    End Sub
    Partial Private Sub OnIDsChanged()
    End Sub
    Partial Private Sub OnidChanging(value As Integer)
    End Sub
    Partial Private Sub OnidChanged()
    End Sub
    Partial Private Sub OnlineNumberChanging(value As Integer)
    End Sub
    Partial Private Sub OnlineNumberChanged()
    End Sub
    Partial Private Sub OnDebcodeChanging(value As String)
    End Sub
    Partial Private Sub OnDebcodeChanged()
    End Sub
    Partial Private Sub OnorderNumberChanging(value As String)
    End Sub
    Partial Private Sub OnorderNumberChanged()
    End Sub
    Partial Private Sub OnnotesChanging(value As String)
    End Sub
    Partial Private Sub OnnotesChanged()
    End Sub
    Partial Private Sub OnproductCodeChanging(value As String)
    End Sub
    Partial Private Sub OnproductCodeChanged()
    End Sub
    Partial Private Sub OnpriceChanging(value As System.Nullable(Of Integer))
    End Sub
    Partial Private Sub OnpriceChanged()
    End Sub
    Partial Private Sub OnorderQuantityChanging(value As System.Nullable(Of Decimal))
    End Sub
    Partial Private Sub OnorderQuantityChanged()
    End Sub
    Partial Private Sub OnAmountChanging(value As System.Nullable(Of Decimal))
    End Sub
    Partial Private Sub OnAmountChanged()
    End Sub
    Partial Private Sub OndatecreateChanging(value As System.Nullable(Of Date))
    End Sub
    Partial Private Sub OndatecreateChanged()
    End Sub
    Partial Private Sub OnSaleValueChanging(value As System.Nullable(Of Decimal))
    End Sub
    Partial Private Sub OnSaleValueChanged()
    End Sub
    Partial Private Sub OnschemeCodeChanging(value As String)
    End Sub
    Partial Private Sub OnschemeCodeChanged()
    End Sub
    Partial Private Sub OnFreeValueChanging(value As System.Nullable(Of Decimal))
    End Sub
    Partial Private Sub OnFreeValueChanged()
    End Sub
    #End Region
	
	Public Sub New()
		MyBase.New
		Me._tb_DMS_orderHs = CType(Nothing, EntityRef(Of tb_DMS_orderH))
		OnCreated
	End Sub
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_IDs", AutoSync:=AutoSync.Always, DbType:="Int NOT NULL IDENTITY", IsDbGenerated:=true)>  _
	Public Property IDs() As Integer
		Get
			Return Me._IDs
		End Get
		Set
			If ((Me._IDs = value)  _
						= false) Then
				Me.OnIDsChanging(value)
				Me.SendPropertyChanging
				Me._IDs = value
				Me.SendPropertyChanged("IDs")
				Me.OnIDsChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_id", DbType:="Int NOT NULL", IsPrimaryKey:=true)>  _
	Public Property id() As Integer
		Get
			Return Me._id
		End Get
		Set
			If ((Me._id = value)  _
						= false) Then
				Me.OnidChanging(value)
				Me.SendPropertyChanging
				Me._id = value
				Me.SendPropertyChanged("id")
				Me.OnidChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_lineNumber", DbType:="Int NOT NULL", IsPrimaryKey:=true)>  _
	Public Property lineNumber() As Integer
		Get
			Return Me._lineNumber
		End Get
		Set
			If ((Me._lineNumber = value)  _
						= false) Then
				Me.OnlineNumberChanging(value)
				Me.SendPropertyChanging
				Me._lineNumber = value
				Me.SendPropertyChanged("lineNumber")
				Me.OnlineNumberChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_Debcode", DbType:="NVarChar(20) NOT NULL", CanBeNull:=false, IsPrimaryKey:=true)>  _
	Public Property Debcode() As String
		Get
			Return Me._Debcode
		End Get
		Set
			If (String.Equals(Me._Debcode, value) = false) Then
				Me.OnDebcodeChanging(value)
				Me.SendPropertyChanging
				Me._Debcode = value
				Me.SendPropertyChanged("Debcode")
				Me.OnDebcodeChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_orderNumber", DbType:="NVarChar(100) NOT NULL", CanBeNull:=false, IsPrimaryKey:=true)>  _
	Public Property orderNumber() As String
		Get
			Return Me._orderNumber
		End Get
		Set
			If (String.Equals(Me._orderNumber, value) = false) Then
				Me.OnorderNumberChanging(value)
				Me.SendPropertyChanging
				Me._orderNumber = value
				Me.SendPropertyChanged("orderNumber")
				Me.OnorderNumberChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_notes", DbType:="NVarChar(50)")>  _
	Public Property notes() As String
		Get
			Return Me._notes
		End Get
		Set
			If (String.Equals(Me._notes, value) = false) Then
				Me.OnnotesChanging(value)
				Me.SendPropertyChanging
				Me._notes = value
				Me.SendPropertyChanged("notes")
				Me.OnnotesChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_productCode", DbType:="NVarChar(16)")>  _
	Public Property productCode() As String
		Get
			Return Me._productCode
		End Get
		Set
			If (String.Equals(Me._productCode, value) = false) Then
				Me.OnproductCodeChanging(value)
				Me.SendPropertyChanging
				Me._productCode = value
				Me.SendPropertyChanged("productCode")
				Me.OnproductCodeChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_price", DbType:="Int")>  _
	Public Property price() As System.Nullable(Of Integer)
		Get
			Return Me._price
		End Get
		Set
			If (Me._price.Equals(value) = false) Then
				Me.OnpriceChanging(value)
				Me.SendPropertyChanging
				Me._price = value
				Me.SendPropertyChanged("price")
				Me.OnpriceChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_orderQuantity", DbType:="Decimal(18,0)")>  _
	Public Property orderQuantity() As System.Nullable(Of Decimal)
		Get
			Return Me._orderQuantity
		End Get
		Set
			If (Me._orderQuantity.Equals(value) = false) Then
				Me.OnorderQuantityChanging(value)
				Me.SendPropertyChanging
				Me._orderQuantity = value
				Me.SendPropertyChanged("orderQuantity")
				Me.OnorderQuantityChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_Amount", DbType:="Decimal(18,0)")>  _
	Public Property Amount() As System.Nullable(Of Decimal)
		Get
			Return Me._Amount
		End Get
		Set
			If (Me._Amount.Equals(value) = false) Then
				Me.OnAmountChanging(value)
				Me.SendPropertyChanging
				Me._Amount = value
				Me.SendPropertyChanged("Amount")
				Me.OnAmountChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_datecreate", DbType:="DateTime")>  _
	Public Property datecreate() As System.Nullable(Of Date)
		Get
			Return Me._datecreate
		End Get
		Set
			If (Me._datecreate.Equals(value) = false) Then
				Me.OndatecreateChanging(value)
				Me.SendPropertyChanging
				Me._datecreate = value
				Me.SendPropertyChanged("datecreate")
				Me.OndatecreateChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_SaleValue", AutoSync:=AutoSync.Always, DbType:="Decimal(29,0)", IsDbGenerated:=true, UpdateCheck:=UpdateCheck.Never)>  _
	Public Property SaleValue() As System.Nullable(Of Decimal)
		Get
			Return Me._SaleValue
		End Get
		Set
			If (Me._SaleValue.Equals(value) = false) Then
				Me.OnSaleValueChanging(value)
				Me.SendPropertyChanging
				Me._SaleValue = value
				Me.SendPropertyChanged("SaleValue")
				Me.OnSaleValueChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_schemeCode", DbType:="NVarChar(50)")>  _
	Public Property schemeCode() As String
		Get
			Return Me._schemeCode
		End Get
		Set
			If (String.Equals(Me._schemeCode, value) = false) Then
				Me.OnschemeCodeChanging(value)
				Me.SendPropertyChanging
				Me._schemeCode = value
				Me.SendPropertyChanged("schemeCode")
				Me.OnschemeCodeChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.ColumnAttribute(Storage:="_FreeValue", AutoSync:=AutoSync.Always, DbType:="Decimal(29,0)", IsDbGenerated:=true, UpdateCheck:=UpdateCheck.Never)>  _
	Public Property FreeValue() As System.Nullable(Of Decimal)
		Get
			Return Me._FreeValue
		End Get
		Set
			If (Me._FreeValue.Equals(value) = false) Then
				Me.OnFreeValueChanging(value)
				Me.SendPropertyChanging
				Me._FreeValue = value
				Me.SendPropertyChanged("FreeValue")
				Me.OnFreeValueChanged
			End If
		End Set
	End Property
	
	<Global.System.Data.Linq.Mapping.AssociationAttribute(Name:="tb_DMS_orderD_tb_DMS_orderH", Storage:="_tb_DMS_orderHs", ThisKey:="Debcode,orderNumber", OtherKey:="Debcode,orderNumber", IsUnique:=true, IsForeignKey:=false)>  _
	Public Property tb_DMS_orderHs() As tb_DMS_orderH
		Get
			Return Me._tb_DMS_orderHs.Entity
		End Get
		Set
			Dim previousValue As tb_DMS_orderH = Me._tb_DMS_orderHs.Entity
			If ((Object.Equals(previousValue, value) = false)  _
						OrElse (Me._tb_DMS_orderHs.HasLoadedOrAssignedValue = false)) Then
				Me.SendPropertyChanging
				If ((previousValue Is Nothing)  _
							= false) Then
					Me._tb_DMS_orderHs.Entity = Nothing
					previousValue.tb_DMS_orderD = Nothing
				End If
				Me._tb_DMS_orderHs.Entity = value
				If (Object.Equals(value, Nothing) = false) Then
					value.tb_DMS_orderD = Me
				End If
				Me.SendPropertyChanged("tb_DMS_orderHs")
			End If
		End Set
	End Property
	
	Public Event PropertyChanging As PropertyChangingEventHandler Implements System.ComponentModel.INotifyPropertyChanging.PropertyChanging
	
	Public Event PropertyChanged As PropertyChangedEventHandler Implements System.ComponentModel.INotifyPropertyChanged.PropertyChanged
	
	Protected Overridable Sub SendPropertyChanging()
		If ((Me.PropertyChangingEvent Is Nothing)  _
					= false) Then
			RaiseEvent PropertyChanging(Me, emptyChangingEventArgs)
		End If
	End Sub
	
	Protected Overridable Sub SendPropertyChanged(ByVal propertyName As [String])
		If ((Me.PropertyChangedEvent Is Nothing)  _
					= false) Then
			RaiseEvent PropertyChanged(Me, New PropertyChangedEventArgs(propertyName))
		End If
	End Sub
End Class
