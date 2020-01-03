<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="List_User.aspx.vb" Inherits="WEB.SSM.List_User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
<style type="text/css">
         table.altrowstable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #a9c6c9;
	border-collapse: collapse;
}
table.altrowstable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
table.altrowstable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
.oddrowcolor{
	background-color:#d4e3e5;
}
.evenrowcolor{
	background-color:#c3dde0;
}
    </style>

    <script type="text/javascript">
        // <![CDATA[
        function altRows(id) {
            if (document.getElementsByTagName) {

                var table = document.getElementById(id);
                var rows = table.getElementsByTagName("tr");

                for (i = 0; i < rows.length; i++) {
                    if (i % 2 == 0) {
                        rows[i].className = "evenrowcolor";
                    } else {
                        rows[i].className = "oddrowcolor";
                    }
                }
            }
        }
        window.onload = function () {
            altRows('alternatecolor');
        }
        function ShowLoginWindow() {
            pcLogin.Show();
        }
        function ShowCreateAccountWindow() {
            pcCreateAccount.Show();
            tbUsername.Focus();
        }
        function hidea() {
            pcCreateAccount.hide();

        }

        var textSeparator = ";";
        function OnListBoxSelectionChanged(listBox, args) {
            if (args.index == 0)
                args.isSelected ? listBox.SelectAll() : listBox.UnselectAll();
            UpdateSelectAllItemState();
            UpdateText();
        }
        function OnListBoxSelectionChanged2(listBox, args) {
            if (args.index == 0)
                args.isSelected ? listBox.SelectAll() : listBox.UnselectAll();
            UpdateSelectAllItemState();
            UpdateText2();
        }
        function OnListBoxSelectionChanged1(listBox, args) {
            if (args.index == 0)
                args.isSelected ? listBox.SelectAll() : listBox.UnselectAll();
            UpdateSelectAllItemState();
            UpdateText1();
        }
        function UpdateSelectAllItemState() {
            IsAllSelected() ? checkListBox.SelectIndices([0]) : checkListBox.UnselectIndices([0]);
        }
        function IsAllSelected() {
            var selectedDataItemCount = checkListBox.GetItemCount() - (checkListBox.GetItem(0).selected ? 0 : 1);
            return checkListBox.GetSelectedItems().length == selectedDataItemCount;
        }
        function UpdateText() {
            var selectedItems = checkListBox.GetSelectedItems();
            checkComboBox.SetText(GetSelectedItemsText(selectedItems));
        }
        function UpdateText2() {
            var selectedItems = checkListBox2.GetSelectedItems();
            checkComboBox2.SetText(GetSelectedItemsText(selectedItems));
        }
        function UpdateText1() {
            var selectedItems = checkListBox1.GetSelectedItems();
            checkComboBox1.SetText(GetSelectedItemsText(selectedItems));
        }
        function SynchronizeListBoxValues(dropDown, args) {
            checkListBox.UnselectAll();
            var texts = dropDown.GetText().split(textSeparator);
            var values = GetValuesByTexts(texts);
            checkListBox.SelectValues(values);
            UpdateSelectAllItemState();
            UpdateText(); // for remove non-existing texts
        }
        function SynchronizeListBoxValues2(dropDown, args) {
            checkListBox2.UnselectAll();
            var texts = dropDown.GetText().split(textSeparator);
            var values = GetValuesByTexts(texts);
            checkListBox2.SelectValues(values);
            UpdateSelectAllItemState();
            UpdateText2(); // for remove non-existing texts
        }
        function SynchronizeListBoxValues1(dropDown, args) {
            checkListBox1.UnselectAll();
            var texts = dropDown.GetText().split(textSeparator);
            var values = GetValuesByTexts(texts);
            checkListBox1.SelectValues(values);
            UpdateSelectAllItemState();
            UpdateText1(); // for remove non-existing texts
        }
        function GetSelectedItemsText(items) {
            var texts = [];
            for (var i = 0; i < items.length; i++)
                if (items[i].index != 0)
                    texts.push(items[i].text);
            return texts.join(textSeparator);
        }
        function GetValuesByTexts(texts) {
            var actualValues = [];
            var item;
            for (var i = 0; i < texts.length; i++) {
                item = checkListBox.FindItemByText(texts[i]);
                if (item != null)
                    actualValues.push(item.value);
            }
            return actualValues;
        }
        var keyValue;
        function OnMoreInfoClick(element, key) {
            callbackPanel.SetContentHtml("");
            pcCreateAccount.ShowAtElement(element);
            keyValue = key;
        }
        function pcCreateAccount_Shown(s, e) {
            callbackPanel.PerformCallback(keyValue);
        }
        // ]]>
    </script>
    
      

      <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" KeyFieldName="Tendangnhap" Width="100%" OnCustomButtonCallback="ASPxGridView1_CustomButtonCallback" >
          <Columns>
             <%-- <dx:GridViewCommandColumn VisibleIndex="0">
                  <EditButton Visible="True">
                  </EditButton>
              </dx:GridViewCommandColumn>--%>
              <dx:GridViewCommandColumn VisibleIndex="0">
                  <EditButton Visible="True">
                  </EditButton>
                  <NewButton Visible="True">
                  </NewButton>
                  <CustomButtons>
                      <dx:GridViewCommandColumnCustomButton Text="setpass">
                      </dx:GridViewCommandColumnCustomButton>
                  </CustomButtons>
              </dx:GridViewCommandColumn>
              <dx:GridViewDataTextColumn FieldName="Tendangnhap"   VisibleIndex="3" Caption="Tên Đăng Nhập">
              </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Usid" ReadOnly="True" VisibleIndex="1" Visible="False">
                  <EditFormSettings Visible="False" />
              </dx:GridViewDataTextColumn>
            <%--  <dx:GridViewDataTextColumn FieldName="maquyen" VisibleIndex="5" Caption="Quyền">
              </dx:GridViewDataTextColumn>--%> 
               <dx:GridViewDataComboBoxColumn Caption="Loại User" FieldName="maquyen" VisibleIndex="5" PropertiesComboBox-TextFormatString=" {0} ">
                <PropertiesComboBox DropDownStyle="DropDown">
                    <Items>
                        <dx:ListEditItem Text="Admin" Value="0" />
                        <dx:ListEditItem Text="User" Value="1" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
              <dx:GridViewDataTextColumn FieldName="hovaten" VisibleIndex="2" Caption="Họ và tên">
              </dx:GridViewDataTextColumn>
             
              <dx:GridViewDataTextColumn FieldName="email" VisibleIndex="4" Caption="Email">
              </dx:GridViewDataTextColumn>
            <%--  <dx:GridViewDataTextColumn FieldName="trangthai" VisibleIndex="6" Caption="Trạng Thái">
              </dx:GridViewDataTextColumn>--%>
               <dx:GridViewDataComboBoxColumn Caption="Trạng thái" FieldName="trangthai" VisibleIndex="6" PropertiesComboBox-TextFormatString=" {0} ">
                <PropertiesComboBox DropDownStyle="DropDown">
                    <Items>
                        <dx:ListEditItem Text="LockPass" Value="0" />
                        <dx:ListEditItem Text="Activer" Value="1" />
                        <dx:ListEditItem Text="DeActiver" Value="2" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
             <%-- <dx:GridViewDataTextColumn FieldName="Bophan" VisibleIndex="8" Caption="Phòng Ban">
              </dx:GridViewDataTextColumn>--%>
               <dx:GridViewDataComboBoxColumn Caption="Bộ Phận" FieldName="MaPhongban" VisibleIndex="7" PropertiesComboBox-TextFormatString=" {0} ">
                <PropertiesComboBox DropDownStyle="DropDown">
                    <Items>
                       
                <dx:ListEditItem Text="AP&P" Value="AP&P" />
                <dx:ListEditItem Text="SALEADMIN" Value="SALEADMIN" />
                <dx:ListEditItem Text="IT" Value="IT" />
                <dx:ListEditItem Text="MAKETING" Value="MAKETING" />
                <dx:ListEditItem Text="SALESUP" Value="SALESUP" />
                <dx:ListEditItem Text="SALES HEAD" Value="HEAD " />
        <dx:ListEditItem Text="CS" Value="CS" />
                         <dx:ListEditItem Text="ADMINSD" Value="ADMINSD" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
              <dx:GridViewDataTextColumn FieldName="Region" VisibleIndex="9">
                  <EditItemTemplate>
                       <dx:ASPxDropDownEdit ID="tbRegion"  runat="server" AnimationType="None" Text='<%# Bind("Region")%>' ClientInstanceName="checkComboBox" Width="100%" DropDownWindowStyle-Wrap="True"  >
                                                <DropDownWindowTemplate >
                                                    
                                                    <dx:ASPxListBox ID="listBox" runat="server" DataSourceID="SqlDataSource4"  ClientInstanceName="checkListBox" SelectionMode="CheckColumn"  Rows="10" Width="100%" Height="300px">
                                                        <Border BorderStyle="None" />
                                                        <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />
                                                       <Columns><dx:ListBoxColumn FieldName="Region" Width="100px" /></Columns>
                                                         
                                                        <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged" />
                                                    </dx:ASPxListBox>
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="padding: 4px">
                                                                <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Style="float: right" Text="Close">
                                                                    <ClientSideEvents Click="function(s, e){ checkComboBox.HideDropDown(); }" />
                                                                </dx:ASPxButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </DropDownWindowTemplate>
                                                <ClientSideEvents DropDown="SynchronizeListBoxValues" TextChanged="SynchronizeListBoxValues" />
                                                <DropDownWindowStyle BackColor="#EDEDED">
                                                </DropDownWindowStyle>
                                            </dx:ASPxDropDownEdit>
                  </EditItemTemplate>
              </dx:GridViewDataTextColumn>
              <dx:GridViewDataMemoColumn FieldName="Area" VisibleIndex="10" Width="100px">
                  <EditItemTemplate>
                      <dx:ASPxDropDownEdit ID="tbArea" runat="server" AnimationType="None" ClientInstanceName="checkComboBox1" Text='<%# Bind("Area")%>' Width="100%">
                          <DropDownWindowTemplate>
                              <dx:ASPxListBox ID="listBox" runat="server" ClientInstanceName="checkListBox1" DataSourceID="SqlDataSource3" SelectionMode="CheckColumn" Width="100%" Rows="10"  Height="300px">
                                  <Border BorderStyle="None" />
                                  <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />
                                  <Columns>
                                      <dx:ListBoxColumn FieldName="Area" Width="100px" />
                                      <%--                        <dx:ListBoxColumn FieldName="Debname" Width="200px" />--%>
                                  </Columns>
                                  <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged1" />
                              </dx:ASPxListBox>
                              <table style="width: 100%">
                                  <tr>
                                      <td style="padding: 4px">
                                          <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Style="float: right" Text="Close">
                                              <ClientSideEvents Click="function(s, e){ checkComboBox1.HideDropDown(); }" />
                                          </dx:ASPxButton>
                                      </td>
                                  </tr>
                              </table>
                          </DropDownWindowTemplate>
                          <ClientSideEvents DropDown="SynchronizeListBoxValues1" TextChanged="SynchronizeListBoxValues" />
                          <DropDownWindowStyle BackColor="#EDEDED">
                          </DropDownWindowStyle>
                      </dx:ASPxDropDownEdit>
                  </EditItemTemplate>
              </dx:GridViewDataMemoColumn>
              <dx:GridViewDataMemoColumn FieldName="Customer" VisibleIndex="10" Width="100%">
                  <EditItemTemplate>
                      <dx:ASPxDropDownEdit ID="tbcus" runat="server" AnimationType="None" ClientInstanceName="checkComboBox2" Text='<%# Bind("Customer")%>' Width="100%">
                          <DropDownWindowTemplate>
                              <dx:ASPxListBox ID="listBox" runat="server" ClientInstanceName="checkListBox2" DataSourceID="SqlDataSource2" SelectionMode="CheckColumn"  Rows="20"  Height="300px" Width="100%">
                                  <Border BorderStyle="None" />
                                  <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />
                                  <Columns>
                                      <dx:ListBoxColumn FieldName="Debcode" Width="100px" />
                                      <%--                        <dx:ListBoxColumn FieldName="Debname" Width="200px" />--%>
                                  </Columns>
                                  <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged2" />
                              </dx:ASPxListBox>
                              <table style="width: 100%">
                                  <tr>
                                      <td style="padding: 4px">
                                          <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Style="float: right" Text="Close">
                                              <ClientSideEvents Click="function(s, e){ checkComboBox2.HideDropDown(); }" />
                                          </dx:ASPxButton>
                                      </td>
                                  </tr>
                              </table>
                          </DropDownWindowTemplate>
                          <ClientSideEvents DropDown="SynchronizeListBoxValues2" TextChanged="SynchronizeListBoxValues" />
                          <DropDownWindowStyle BackColor="#EDEDED">
                          </DropDownWindowStyle>
                      </dx:ASPxDropDownEdit>
                  </EditItemTemplate>
                  <CellStyle Wrap="True">
                  </CellStyle>
              </dx:GridViewDataMemoColumn>
              <dx:GridViewDataDateColumn FieldName="ngayactiver" VisibleIndex="11" Caption="Ngày kích hoạt">
              </dx:GridViewDataDateColumn>
              <%--<dx:GridViewDataTextColumn FieldName="channel" VisibleIndex="9" Caption="Kênh">
              </dx:GridViewDataTextColumn>--%>
               <dx:GridViewDataComboBoxColumn Caption="Kênh" FieldName="channel" VisibleIndex="8" PropertiesComboBox-TextFormatString=" {0} ">
                <PropertiesComboBox DropDownStyle="DropDown">
                    <Items>
                        <dx:ListEditItem Text="GT" Value="GT" />
                        <dx:ListEditItem Text="MT" Value="MT" />
                        <dx:ListEditItem Text="ALL" Value="AL" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataCheckColumn FieldName="xem" VisibleIndex="12" Caption="Quyền Xem">
              </dx:GridViewDataCheckColumn>
              <dx:GridViewDataCheckColumn FieldName="sua" VisibleIndex="13" Caption="Quyền sửa">
              </dx:GridViewDataCheckColumn>
              <dx:GridViewDataCheckColumn Caption="Đặt hàng" FieldName="dh" VisibleIndex="14">
              </dx:GridViewDataCheckColumn>
              <dx:GridViewDataTextColumn Caption="SAP user" FieldName="SAPus" VisibleIndex="16">
              </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn Caption="Kho" FieldName="kho"   VisibleIndex="18">
              </dx:GridViewDataTextColumn>
          </Columns>
          <SettingsPager PageSize="20">
          </SettingsPager>
          <SettingsEditing Mode="PopupEditForm" />
          <Settings ShowFilterRow="True" />
          <SettingsPopup>
              <EditForm AllowResize="True" Height="100%" HorizontalAlign="Center" Modal="True" VerticalAlign="WindowCenter" Width="60%" />
              <CustomizationWindow HorizontalAlign="Center" VerticalAlign="WindowCenter" />
          </SettingsPopup>
      </dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT TB_DangNhap.Tendangnhap, TB_DangNhap.Usid, TB_DangNhap.maquyen, TB_DangNhap.hovaten, TB_DangNhap.email, TB_DangNhap.Slandangnhap, TB_DangNhap.trangthai, TB_DangNhap.MaPhongban, TBQuyenUser.Region, TBQuyenUser.Area, TBQuyenUser.Customer, TB_DangNhap.ngayactiver, TBQuyenUser.channel, TBQuyenUser.xem, TBQuyenUser.sua, TB_DangNhap.SAPus, TBQuyenUser.dh, TBQuyenUser.checks, TBQuyenUser.aprover, TBQuyenUser.dhar, TBQuyenUser.kho FROM TB_DangNhap LEFT OUTER JOIN TBQuyenUser ON TB_DangNhap.Tendangnhap = TBQuyenUser.Tendangnhap ORDER BY TB_DangNhap.Usid DESC" InsertCommand="INSERT INTO TB_DangNhap(Tendangnhap, MaPhongban, maquyen, hovaten, email, trangthai, SAPus,ngaycreate) VALUES (@Tendangnhap, @MaPhongban, @maquyen, @hovaten, @email, @trangthai,@SAPus,getdate());
     UPDATE [TBQuyenUser] SET [channel] = @channel, [Region] = @Region, [Area] = @Area, [Customer] = @Customer, [xem] = @xem, [sua] = @sua,dh=@dh,kho=@kho WHERE [Tendangnhap] = @Tendangnhap" UpdateCommand="UPDATE [TB_DangNhap] SET [MaPhongban] = @MaPhongban, [maquyen] = @maquyen, [hovaten] = @hovaten, [email] = @email, [trangthai] = @trangthai, SAPus = @SAPus WHERE [Tendangnhap] = @Tendangnhap; UPDATE [TBQuyenUser] SET [channel] = @channel, [Region] = @Region, [Area] = @Area, [Customer] = @Customer, [xem] = @xem, [sua] = @sua, dh = @dh,kho=@kho WHERE [Tendangnhap] = @Tendangnhap">
    <InsertParameters>
        <asp:Parameter Name="Tendangnhap" />
        <asp:Parameter Name="MaPhongban" />
        <asp:Parameter Name="maquyen" />
        <asp:Parameter Name="hovaten" />
        <asp:Parameter Name="email" />
        <asp:Parameter Name="trangthai" />
        <asp:Parameter Name="SAPus" />
        <asp:Parameter Name="channel" Type="String" />
            <asp:Parameter Name="Region" Type="String" />
            <asp:Parameter Name="Area" Type="String" />
            <asp:Parameter Name="Customer" Type="String" />
            <asp:Parameter Name="xem" Type="Boolean" />
            <asp:Parameter Name="sua" Type="Boolean" />
        <asp:Parameter Name="dh" />
        <asp:Parameter Name="kho" />
    </InsertParameters>
     <UpdateParameters>
            <asp:Parameter Name="MaPhongban" Type="String" />
            <asp:Parameter Name="maquyen" Type="String" />
            <asp:Parameter Name="hovaten" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="trangthai" Type="Int32" />
            <asp:Parameter Name="SAPus" />
            <asp:Parameter Name="Tendangnhap" Type="String" />
         <asp:Parameter Name="channel" Type="String" />
            <asp:Parameter Name="Region" Type="String" />
            <asp:Parameter Name="Area" Type="String" />
            <asp:Parameter Name="Customer" Type="String" />
            <asp:Parameter Name="xem" Type="Boolean" />
            <asp:Parameter Name="sua" Type="Boolean" />
            <asp:Parameter Name="dh" />
            <asp:Parameter Name="kho" />
        </UpdateParameters>
    </asp:SqlDataSource>
  
    
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT 'Chon' as Debcode, 'Vui long chon' as Debname
          Union all 
          SELECT 'FULL' as Debcode, 'Select All' as Debname 
Union all
SELECT Debcode, Debname FROM dbo.Fn_cust_dh(@unam) AS Fn_cust_1
" >
        <SelectParameters>
            <asp:SessionParameter Name="unam" SessionField="TenDangNhap" />
        </SelectParameters>
    </asp:SqlDataSource>  
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT 'Chon' as Area 
          Union all 
          SELECT 'FULL' as Area 
Union all
SELECT Area FROM dbo.Fn_cust_dh(@unam) AS Fn_cust_1 group by Area
" >
        <SelectParameters>
            <asp:SessionParameter Name="unam" SessionField="TenDangNhap" />
        </SelectParameters>
    </asp:SqlDataSource> 
      <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT 'Chon' as Region
          Union all 
          SELECT 'FULL' as Region
Union all
SELECT Region FROM dbo.Fn_cust_dh(@unam) AS Fn_cust_1 group by Region
" >
        <SelectParameters>
            <asp:SessionParameter Name="unam" SessionField="TenDangNhap" />
        </SelectParameters>
    </asp:SqlDataSource> 
     
    <br />
  
    
     </asp:Content>