﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="CTKM3.aspx.vb" Inherits="WEB.SSM.CTKM3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function CloseGridLookup() {
            gridLookup.ConfirmCurrentSelection();
            gridLookup.HideDropDown();
            gridLookup.Focus();
        }
        function ClearGridLookup() {
            var grid = gridLookup.GetGridView();
            grid.UnselectRows();
        }
        function OnAllCheckedChanged(s, e) {
            if (s.GetChecked())
                gridss.SelectRows();
            else
                gridss.UnselectRows();
        }
        function CloseGridLookup1() {

            var userName = gridLookup1.GetText();


            gridLookup1.ConfirmCurrentSelection();

            gridLookup1.HideDropDown();
            gridLookup1.Focus();

        }
        function ClearGridLookup1() {
            var grid = gridLookup1.GetGridView();
            grid.UnselectRows();
        }
        function Updats() {

            checkComboBox3.SetText(gridLookup1.GetText());
        }

        function GroupSelectAll() {
            var grid = gridLookup.GetGridView();
            grid.GroupSelectAll();

        }

        function CloseGridLookup2() {
            gridLookup2.ConfirmCurrentSelection();
            gridLookup2.HideDropDown();
            gridLookup2.Focus();
        }
        function ClearGridLookup2() {
            var grid = gridLookup2.GetGridView();
            grid.UnselectRows();
        }
        function GroupSelectAll() {
            var grid = gridLookup.GetGridView();
            grid.GroupSelectAll();

        }
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
        function OnClearButtonClick(s, e) {

            pcCreateAccount1.hide();
            ASPxClientEdit.ClearEditorsInContainerById("form");
        }
        function ShowCreateAccountWindow() {
            pcCreateAccount.Show();
            tbUsername.Focus();
        }
        function Show1() {
            pcCreateAccount1.Show();
            Mact.Focus();
        }
        function hidea() {
            pcCreateAccount.hide();

        }

        var textSeparator = ";";
        function OnListBoxSelectionChanged(listBox, args) {
            //if (args.index == 0)
            //    args.isSelected ? listBox.SelectAll() : listBox.UnselectAll();
            // UpdateSelectAllItemState();
            UpdateText();
        }
        function OnListBoxSelectionChanged2(listBox, args) {
            //if (args.index == 0)
            //    args.isSelected ? listBox.SelectAll() : listBox.UnselectAll();
            //  UpdateSelectAllItemState2();
            UpdateText2();
        }
        function OnListBoxSelectionChanged1(listBox, args) {
            //if (args.index == 0)
            //    args.isSelected ? listBox.SelectAll() : listBox.UnselectAll();
            //   UpdateSelectAllItemState1();
            UpdateText1();
        }
        function OnListBoxSelectionChanged3(listBox, args) {
            //if (args.index == 0)
            //    args.isSelected ? listBox.SelectAll() : listBox.UnselectAll();
            //  UpdateSelectAllItemState3();
            UpdateText3();
        }
        function OnListBoxSelectionChanged4(listBox, args) {
            //if (args.index == 0)
            //    args.isSelected ? listBox.SelectAll() : listBox.UnselectAll();
            //   UpdateSelectAllItemState4();
            UpdateText4();
        }
        function OnListBoxSelectionChanged6(listBox, args) {
            //if (args.index == 0)
            //    args.isSelected ? listBox.SelectAll() : listBox.UnselectAll();
            //  UpdateSelectAllItemState6();
            UpdateText6();
        }

        function UpdateSelectAllItemState() {
            IsAllSelected() ? checkListBox.SelectIndices([0]) : checkListBox.UnselectIndices([0]);
        }
        function UpdateSelectAllItemState1() {
            IsAllSelected() ? checkListBox1.SelectIndices([0]) : checkListBox1.UnselectIndices([0]);
        }
        function UpdateSelectAllItemState2() {
            IsAllSelected() ? checkListBox2.SelectIndices([0]) : checkListBox2.UnselectIndices([0]);
        }
        function UpdateSelectAllItemState3() {
            IsAllSelected() ? checkListBox3.SelectIndices([0]) : checkListBox3.UnselectIndices([0]);
        }

        function UpdateSelectAllItemState4() {
            IsAllSelected() ? checkListBox4.SelectIndices([0]) : checkListBox4.UnselectIndices([0]);
        }
        function UpdateSelectAllItemState5() {
            IsAllSelected() ? checkListBox5.SelectIndices([0]) : checkListBox5.UnselectIndices([0]);
        }
        function UpdateSelectAllItemState6() {
            IsAllSelected() ? checkListBox6.SelectIndices([0]) : checkListBox6.UnselectIndices([0]);
        }
        function IsAllSelected() {
            var selectedDataItemCount = checkListBox.GetItemCount() - (checkListBox.GetItem(0).selected ? 0 : 1);
            return checkListBox.GetSelectedItems(1).length == selectedDataItemCount;
        }
        function UpdateText() {
            var selectedItems = checkListBox.GetSelectedItems();
            checkComboBox.SetText(GetSelectedItemsText1(selectedItems));

        }

        function UpdateText2() {
            var selectedItems = checkListBox2.GetSelectedItems();
            checkComboBox2.SetText(GetSelectedItemsText1(selectedItems));
        }
        function UpdateText1() {
            var selectedItems = checkListBox1.GetSelectedItems();
            checkComboBox1.SetText(GetSelectedItemsText1(selectedItems));
        }
        function UpdateText3() {
            var selectedItems = checkListBox3.GetSelectedItems();
            checkComboBox3.SetText(GetSelectedItemsText1(selectedItems));
        }
        function UpdateText4() {
            var selectedItems = checkListBox4.GetSelectedItems();
            checkComboBox4.SetText(GetSelectedItemsText1(selectedItems));
        }
        function UpdateText6() {
            var selectedItems = checkListBox6.GetSelectedItems();
            checkComboBox6.SetText(GetSelectedItemsText1(selectedItems));
        }
        function UpdateText7() {
            var selectedItems = checkListBox7.GetSelectedItems();
            checkComboBox7.SetText(GetSelectedItemsText1(selectedItems));
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
        function SynchronizeListBoxValues3(dropDown, args) {
            checkListBox3.UnselectAll();
            var texts = dropDown.GetText().split(textSeparator);
            var values = GetValuesByTexts(texts);
            checkListBox3.SelectValues(values);
            UpdateSelectAllItemState();
            UpdateText3(); // for remove non-existing texts
        }
        function SynchronizeListBoxValues1(dropDown, args) {
            checkListBox1.UnselectAll();
            var texts = dropDown.GetText().split(textSeparator);
            var values = GetValuesByTexts(texts);
            checkListBox1.SelectValues(values);
            UpdateSelectAllItemState();
            UpdateText1(); // for remove non-existing texts
        }
        function SynchronizeListBoxValues4(dropDown, args) {
            checkListBox4.UnselectAll();
            var texts = dropDown.GetText().split(textSeparator);
            var values = GetValuesByTexts(texts);
            checkListBox4.SelectValues(values);
            UpdateSelectAllItemState();
            UpdateText4(); // for remove non-existing texts
        }
        function SynchronizeListBoxValues6(dropDown, args) {
            checkListBox6.UnselectAll();
            var texts = dropDown.GetText().split(textSeparator);
            var values = GetValuesByTexts(texts);
            checkListBox6.SelectValues(values);
            UpdateSelectAllItemState();
            UpdateText6(); // for remove non-existing texts
        }
        function SynchronizeListBoxValues7(dropDown, args) {
            checkListBox7.UnselectAll();
            var texts = dropDown.GetText().split(textSeparator);
            var values = GetValuesByTexts(texts);
            checkListBox7.SelectValues(values);
            UpdateSelectAllItemState();
            UpdateText7(); // for remove non-existing texts
        }
        function GetSelectedItemsText(items) {
            var texts = [];
            for (var i = 0; i < items.length; i++)
                if (items[i].index != 0)
                    texts.push(items[i].texts);
            return texts.join(textSeparator);
        }
        function GetSelectedItemsText1(items) {
            var texts = [];
            for (var i = 0; i < items.length; i++)
                //if (items[i].index != 0)
                texts.push(items[i].texts);
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
            popup.ShowAtElement(element);
            keyValue = key;
        }
        function popup_Shown(s, e) {
            callbackPanel.PerformCallback(keyValue);
        }
        function OnEmailClick(visibleIndex) {
            popup.Show();
            //.  popup.PerformCallback(visibleIndex);
            callbackPanel.PerformCallback(visibleIndex);
        }
        function Spopup() {
            popup.Show();
            //tbUsername.Focus();
        }
        function OnGridFocusedRowChanged() {
            // Query the server for the "EmployeeID" field from the focused row  
            // The single value will be returned to the OnGetRowValues() function      
            // ASPxGridView1.GetRowValues(ASPxGridView1.GetFocusedRowIndex(), 'MaCT', OnGetRowValues);
        }
        // Value contains the "EmployeeID" field value returned from the server, not the list of values 
        function OnGetRowValues(Value) {
            // Right code 
            alert(Value);
            // This code will cause an error 
            // alert(Value[0]); 
        }
    </script>
    <table>
        <tr>
            <td> <a style="text-align: right"> Ngày Bắt Đầu</a></td>
                <td> <dx:ASPxDateEdit ID="datest" runat="server" Width= "100px"  Height ="100%"  >
                    </dx:ASPxDateEdit></td>
                <td style="text-align: right"> <a> Ngày Kết Thúc</a></td>
                <td >
                    <dx:ASPxDateEdit ID="dateen" runat="server" Width= "100px" Height ="100%"  >
                        <ButtonStyle>
                            <Paddings PaddingLeft="1px" />
                        </ButtonStyle>
                    </dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxButton ID="Btok" runat="server" Text="Tìm">
                        <Image Url="~/Content/Images/check.png">
                        </Image>
                    </dx:ASPxButton>
                </td>
            
            <td>
                <dx:ASPxButton ID="ASPExport" runat="server" Text="Export Excel">
                    <Image Url="~/Content/Images/excel.png">
                    </Image>
                  
                </dx:ASPxButton>
 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1" FileName="DSCTKM"></dx:ASPxGridViewExporter>

            </td>
            </tr>
      
        <tr>
          
             <td>
                <dx:ASPxButton ID="BtNew" runat="server" Text="Tạo mới" AutoPostBack="False">
                  <ClientSideEvents Click="function(s, e) { pcCreateAccount1.Show(); }" />
                   <Image Url="~/Content/Images/document_new.png">
                    </Image>
                </dx:ASPxButton>
 
            </td>
            <td>
                <dx:ASPxButton ID="btchays" runat="server" Text="Sao chép">
                
                    <Image Url="~/Content/Images/copy.png">
                    </Image>
                </dx:ASPxButton>
 
            </td>
            <td>
                <dx:ASPxButton ID="butsyn" runat="server" Text="Phê Duyệt">
                    <Image Url="~/Content/Images/access.png">
                    </Image> 
                </dx:ASPxButton>

            </td>
            
            <td>
                <dx:ASPxButton ID="Btsyns" runat="server" Text="Import CTKM " AutoPostBack="False">
                      <ClientSideEvents Click="function(s, e) {   window.location = '../SYSTEM/import_CTKM.aspx';}" />
                    <Image Url="~/Content/Images/file_import.png">
                    </Image> 
                </dx:ASPxButton>

            </td>
             <td>
                <dx:ASPxButton ID="btchay" runat="server" Text="Tính Cliam" Visible="False">
                     <Image Url="~/Content/Images/money_calculator.png">
                    </Image>
                </dx:ASPxButton>
  
            </td>
          
            
         
            
        </tr>
    </table>
    <dx:ASPxGridView ID="ASPxGridView1"  ClientInstanceName="gridss" runat="server" AutoGenerateColumns="False" DataSourceID="Sqlctkm" KeyFieldName="ID"  
        Width="100%"   SettingsText-ConfirmDelete="Bạn có muốn xóa CTKM" SettingsBehavior-ConfirmDelete="True">
            
        <Columns>
             
            <dx:GridViewCommandColumn  ButtonType="Image"   VisibleIndex="0" ShowSelectCheckbox="True">
                 <HeaderTemplate>
                                                                     <dx:ASPxCheckBox ID="cbAll" runat="server" ClientInstanceName="cbAll" ToolTip="Select all rows"
                                                                         BackColorr="White" OnInit="cbAll_Init">
                                                                         <ClientSideEvents CheckedChanged="OnAllCheckedChanged" />
                                                                     </dx:ASPxCheckBox>
                                                                 </HeaderTemplate>
                <EditButton Visible="True">
                    <Image ToolTip="Edit" Url="~/Content/Images/edit.png" />
                </EditButton>
             <%--   <NewButton Visible="True">
                    <Image ToolTip="New" Url="~/Content/Images/new.png" />
                </NewButton>--%>

              <DeleteButton Visible="True">
                    <Image ToolTip="xóa CTKM" Url="~/Content/Images/erase.png">
                    </Image>
                </DeleteButton> 
                <UpdateButton Text="Lưu Lại" >
   
                </UpdateButton>
                <CancelButton Text="Hủy">
          
                </CancelButton>
                <%--<CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="copy">
                        <Image ToolTip="Copy CTKM" Url="~/Content/Images/clone.png" />
                    </dx:GridViewCommandColumnCustomButton>
                     
                </CustomButtons>--%>
                 <%--<CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="btCTKM"  Visibility="Invisible">
                        <Image ToolTip="Coculator CKKM" Url="~/Content/Images/calculator-icon.png" />
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>--%>
            </dx:GridViewCommandColumn>

          <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1" Visible ="false">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="MaCT" Caption="Mã chương trình" VisibleIndex="1"  >
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataMemoColumn FieldName="TenCT" Caption="Tên chương trình" VisibleIndex="3" Width="80%" PropertiesMemoEdit-Width="100%">
<PropertiesMemoEdit Width="100%"></PropertiesMemoEdit>
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataTextColumn FieldName="NhanSP" Caption="Nhóm Sản Phẩm" VisibleIndex="4" Width="80%">
            </dx:GridViewDataTextColumn>
            <%-- <dx:GridViewDataTextColumn FieldName="LoaiCT" Caption ="Loại chương trình" VisibleIndex="5">
            </dx:GridViewDataTextColumn>--%>
            <dx:GridViewDataComboBoxColumn Caption="Loại chương trình" FieldName="LoaiCT" VisibleIndex="5" PropertiesComboBox-TextFormatString=" {0} ">
                <PropertiesComboBox DropDownStyle="DropDown">
                    <Items>
                        <dx:ListEditItem Text="KM Trực Tiếp" Value="KMTT" />
                        <dx:ListEditItem Text="KM Tặng Thêm" Value="KMTS" />
                         <dx:ListEditItem Text="KM ComBo" Value="COMB" />
                         <dx:ListEditItem Text="KM Tặng Thêm ComBo" Value="COMT" />
                        <dx:ListEditItem Text="KM Chiết Khấu" Value="KMCK" />
                        <dx:ListEditItem Text="KM Chiết Khấu Trước KM" Value="CKTR" />
                        <dx:ListEditItem Text="KM Trưng Bày" Value="KMTB" />
                        <dx:ListEditItem Text="KM Tích Lũy" Value="KMTL" />
                        <dx:ListEditItem Text="KM Khuyến Dùng" Value="KMKD" />
                         <dx:ListEditItem Text="KM Chung" Value="KMCH" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="TyleCK" Caption="Tỷ Lệ CK" VisibleIndex="6" Width="20px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Ngaybd" Caption="Từ Ngày" VisibleIndex="7">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="Ngaykt" Caption="Đến Ngày" VisibleIndex="8">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="khongapdung" Caption ="Không Áp CTKM"  VisibleIndex="9">
           
            </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="Ngansach" Caption ="Ngân Sách"  VisibleIndex="10" Width="10px">

            </dx:GridViewDataTextColumn> 
            <dx:GridViewDataComboBoxColumn Caption="Loại" FieldName="Type" VisibleIndex="11" PropertiesComboBox-TextFormatString=" {0} ">
                <PropertiesComboBox DropDownStyle="DropDown">
                    <Items>
                        <dx:ListEditItem Text="ALL NPP" Value="N" />
                        <dx:ListEditItem Text="Select NPP" Value="E" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Trạng Thái" FieldName="status" VisibleIndex="11" PropertiesComboBox-TextFormatString=" {0} ">
                 <EditFormSettings Visible="False" />
                 <PropertiesComboBox DropDownStyle="DropDown">
                    <Items>
                        <dx:ListEditItem Text="Mới" Value="A"  ImageUrl="~/Content/Images/new_icon_1.gif" />  
                        <dx:ListEditItem Text="Chỉnh sửa" Value="R"  ImageUrl="~/Content/Images/new_icon_1.gif" />  
                         <dx:ListEditItem Text="Hoàn thành" Value="C"  ImageUrl="~/Content/Images/ok.png" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
             <dx:GridViewDataTextColumn Visible="false" FieldName="lock_Pro" VisibleIndex="13">
                  <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
            <%--<dx:GridViewDataColumn Caption="Details" VisibleIndex="8" Width="15%">
                <DataItemTemplate>
                    <a href="javascript:void(0);" onclick="OnMoreInfoClick(this, '<%# Container.KeyValue %>')">
                        More Info...</a>
                </DataItemTemplate>
            </dx:GridViewDataColumn>--%>

        </Columns>

        <SettingsBehavior AllowSelectByRowClick="true" ConfirmDelete="True" />
        <SettingsPager PageSize="20">
        </SettingsPager>

<SettingsText ConfirmDelete="Bạn c&#243; muốn x&#243;a CTKM"></SettingsText>

        <SettingsLoadingPanel Text="Vui Lòng Chờ" />
        <SettingsPopup>
            <EditForm AllowResize="True" />
        </SettingsPopup>
        <Templates>
            <EditForm>
                  
             <%--   <% if(!ASPxGridView1.IsNewRowEditing) { %>
                       <td> </td>
                          <% } %>--%>
 
                    <dx:ASPxPageControl runat="server" ID="pageControl" Width="95%" ActiveTabIndex="3">
                        <TabPages>
                            <dx:TabPage Text="Thông tin chung CTKM" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl1" runat="server" Width="95%">
                                      <dx:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors"
                                            runat="server"></dx:ASPxGridViewTemplateReplacement> 
                                     

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                                    <dx:TabPage Text="Sản phẩm áp dụng" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl4" runat="server">
                                           Tên Chương trình: <b>
                    <%# Eval("TenCT")%></b> 
                <br /> 
                <br />

                                        <dx:ASPxGridView  Enabled='<%#Convert.ToBoolean(Eval("lock_Pro"))%>'   ID="ASPspa" runat="server" AutoGenerateColumns="False" DataSourceID="SqlAd" KeyFieldName="Id" OnBeforePerformDataSelect="Girlad_DataSelect" OnInitNewRow="Girlad_InitNewRow" Width="95 %">
                                            <Columns>
                                                <dx:GridViewCommandColumn VisibleIndex="0"     >
                                                    <EditButton Visible= "true">
                                                    </EditButton>
                                                    <NewButton Visible="True">
                                                    </NewButton>
                                                    <DeleteButton Visible="True">
                                                    </DeleteButton>
                                                     
                                                </dx:GridViewCommandColumn>
                                               <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn> 
                                                <dx:GridViewDataTextColumn FieldName="MS_CTKM"  VisibleIndex="2" Caption ="Mã Chương Trình">
                       
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Brand" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Nhan" VisibleIndex="4">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Mui" VisibleIndex="5" Caption ="Mùi Hương">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Size" VisibleIndex="6">
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="Loai" VisibleIndex="7" Caption ="Loại Sản Phẩm" Width="10px">
                                                </dx:GridViewDataTextColumn>
                                                
                                                <dx:GridViewDataTextColumn FieldName="MaSP" VisibleIndex="8">
                                                </dx:GridViewDataTextColumn>
 
                                               
 
                                                <dx:GridViewDataCheckColumn  FieldName="Apdung" VisibleIndex="10" Caption ="Áp Dụng"  Width="10px">

                                                </dx:GridViewDataCheckColumn>

                                            </Columns>
                                            <Settings ShowPreview="True" />
                                            <Templates>
                                                <EditForm>
 
                                                  <table class="OptionsTable"  width="100%" >
                                                        <tr>
                                                            <td width="20%">Mã Chương Trình  </td>
                                                            <td colspan ="5">
                                                                <dx:ASPxTextBox runat="server" ID="eMS_CTKM" Text='<%# Bind("MS_CTKM")%>' Width="100%">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Brand
                                                            </td>
                                                           <td colspan ="5">
                                                                <dx:ASPxDropDownEdit ID="EBrand" AutoPostBack="true" runat="server" AnimationType="None" Text='<%# Bind("Brand")%>' ClientInstanceName="checkComboBox" 
IncrementalFilteringMode = Contains  Width="100%">
                                                                    <DropDownWindowTemplate>
                                                                        <dx:ASPxListBox ID="listBox" runat="server" ClientInstanceName="checkListBox" SelectionMode="CheckColumn" Width="100%">
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />
                                                                            <Items>
                                                                                 <dx:ListEditItem Text="ALL"  Value="1" />
                                                                                <dx:ListEditItem Text="BIOESSENCE" Value="2" />
                                                                                <dx:ListEditItem Text="ROMANO" Value="5" />
                                                                                <dx:ListEditItem Text="BAT" Value="6" />
                                                                                <dx:ListEditItem Text="ENCHANTEUR" Value="7" />
                                                                                <dx:ListEditItem Text="EVERSOFT" Value="8" />
                                                                                <dx:ListEditItem Text="GERVENNE" Value="9" />
                                                                                <dx:ListEditItem Text="IZZI" Value="10" />
                                                                               <dx:ListEditItem Text="CARRIE JUNIOR" Value="11" />
                                                                                <dx:ListEditItem Text="MAXKLEEN" Value="12" />
                                                                                 <dx:ListEditItem Text="DASHING" Value="13" />
                                                                                
                                                                            </Items>
                                                                            <ValidationSettings ValidationGroup="LoginUserValidationGroup">
	        <RequiredField ErrorText="User Name is required." IsRequired="true" />
	    </ValidationSettings>
                                                                            <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged" />
                                                                        </dx:ASPxListBox>
                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="padding: 4px">
                                                                                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
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
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td>Nhãn Hàng
                                                            </td>
                                                           <td colspan ="5">
                                                                <dx:ASPxDropDownEdit ID="ENhan" AutoPostBack="true" runat="server" AnimationType="None" Text='<%# Bind("Nhan")%>' ClientInstanceName="checkComboBox1" Width="100%" Rows="20">
                                                                    <DropDownWindowTemplate>
                                                                        <dx:ASPxListBox ID="listBox" runat="server" DataSourceID="SqlDataSource2" ClientInstanceName="checkListBox1" SelectionMode ="CheckColumn"  Width="100%">
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />

                                                                            <Columns>
                                                                                <dx:ListBoxColumn FieldName="Nhan" Width="100px" />

                                                                            </Columns>

                                                                            <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged1" />
                                                                        </dx:ASPxListBox>

                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="padding: 4px">
                                                                                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
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

                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Mùi hương
                                                            </td>
                                                           <td colspan ="5">
                                                                <dx:ASPxDropDownEdit ID="ASPmui" AutoPostBack="true" runat="server" AnimationType="None" Text='<%# Bind("Mui")%>' ClientInstanceName="checkComboBox3" Width="100%" Rows="20">
                                                                    <DropDownWindowTemplate>
                                                                        <dx:ASPxListBox ID="listBox" runat="server" DataSourceID="Sqlmui" ClientInstanceName="checkListBox3" SelectionMode="CheckColumn" Width="100%">
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />

                                                                            <Columns>
                                                                                <dx:ListBoxColumn FieldName="Mui" Width="100px" />

                                                                            </Columns>

                                                                            <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged3" />
                                                                        </dx:ASPxListBox>

                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="padding: 4px">
                                                                                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
                                                                                        <ClientSideEvents Click="function(s, e){ checkComboBox3.HideDropDown(); }" />
                                                                                    </dx:ASPxButton>

                                                                                </td>
                                                                            </tr>
                                                                        </table>


                                                                    </DropDownWindowTemplate>
                                                                    <ClientSideEvents DropDown="SynchronizeListBoxValues3" TextChanged="SynchronizeListBoxValues" />
                                                                    <DropDownWindowStyle BackColor="#EDEDED">
                                                                    </DropDownWindowStyle>
                                                                </dx:ASPxDropDownEdit> 
<%--  <dx:ASPxDropDownEdit ID="ASPmui" AutoPostBack="true" runat="server" AnimationType="None" Text='<%# Bind("Mui")%>'   Width="100%" Rows="20">
                                                                    <DropDownWindowTemplate>  --%>
<%--<dx:ASPxGridLookup ID="ASPmui" AutoPostBack="true" runat="server" Text= '<%# Bind("mui")%>'    SelectionMode="Multiple" DataSourceID="Sqlmui" ClientInstanceName="gridLookup1"
                            KeyFieldName="Mui" Width="100%" TextFormatString="{0}" MultiTextSeparator=";"    >
                           
                              <Columns>
                                <dx:GridViewDataColumn FieldName="Mui" Width="100px" />
                            
                             </Columns>
                            <GridViewProperties SettingsPager-Mode="ShowPager" SettingsBehavior-ColumnResizeMode="Control">
                             
                                <Templates>
                                    <StatusBar>
                                        <table  class="OptionsTable" style="float: right">
                                            <tr>
                                                <td>
                                                    <dx:ASPxButton ID="Close" runat="server" AutoPostBack="false" Text="Close" ClientSideEvents-Click="CloseGridLookup1" />
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="clear" runat="server" AutoPostBack="false" Text="Clear" ClientSideEvents-Click="ClearGridLookup1" />
                                                </td>
                                                 
                                            </tr>
                                        </table>
                                    </StatusBar>
                                </Templates>
                                  <Settings ShowFilterRow="True" ShowStatusBar="Visible" />
                            </GridViewProperties>
                        </dx:ASPxGridLookup>--%>
                                                                        
<%--  </DropDownWindowTemplate>
 
                                                                  
                                                                     <DropDownWindowStyle BackColor="#EDEDED">
                                                                    </DropDownWindowStyle>
                                                                </dx:ASPxDropDownEdit>  --%>

                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Trọng lượng
                                                            </td>
                                                          <td colspan ="5">
                                                                <dx:ASPxDropDownEdit ID="ASPxSize" AutoPostBack="true" runat="server" AnimationType="None" Text='<%# Bind("Size")%>' ClientInstanceName="checkComboBox4" Width="100%" Rows="20">
                                                                    <DropDownWindowTemplate>
                                                                        <dx:ASPxListBox ID="listBox" runat="server" DataSourceID="Sqlsize" ClientInstanceName="checkListBox4" SelectionMode="CheckColumn" Width="100%">
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />

                                                                            <Columns>
                                                                                <dx:ListBoxColumn FieldName="Size" Width="100px" />

                                                                            </Columns>

                                                                            <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged4" />
                                                                        </dx:ASPxListBox>

                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="padding: 4px">
                                                                                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
                                                                                        <ClientSideEvents Click="function(s, e){ checkComboBox4.HideDropDown(); }" />
                                                                                    </dx:ASPxButton>

                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                      </DropDownWindowTemplate>
                                                                    <ClientSideEvents DropDown="SynchronizeListBoxValues4" TextChanged="SynchronizeListBoxValues" />
                                                                    <DropDownWindowStyle BackColor="#EDEDED">
                                                                    </DropDownWindowStyle>
                                                                </dx:ASPxDropDownEdit>

                                                            </td>
                                                        </tr>
                                                          <tr>
                                                            <td>Loại sản phẩm
                                                            </td>
                                                           <td colspan ="5">
                                                                <dx:ASPxDropDownEdit ID="ASPxloai"   runat="server" AnimationType="None" Text='<%# Bind("Loai")%>' ClientInstanceName="checkComboBox6"   Width="100%">
                                                                    <DropDownWindowTemplate>
                                                                        <dx:ASPxListBox ID="listBox" runat="server" ClientInstanceName="checkListBox6" SelectionMode="CheckColumn" Width="100%">
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />
                                                                            <Items>
                                                                                 <dx:ListEditItem Text="ALL" Value="1" />
                                                                                <dx:ListEditItem Text="Normal" Value="2" />
                                                                                <dx:ListEditItem Text="Gift" Value="3" />
                                                                                <dx:ListEditItem Text="Group" Value="4" />
                                                                                <dx:ListEditItem Text="Tray" Value="5" />
                                                                                <dx:ListEditItem Text="Free" Value="6" /> 

                                                                            </Items>
                                                                            <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged6" />
                                                                        </dx:ASPxListBox>
                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="padding: 4px">
                                                                                    <dx:ASPxButton ID="ASPxButton1" runat="server"  Style="float: right" Text="Close">
                                                                                        <ClientSideEvents Click="function(s, e){ checkComboBox6.HideDropDown(); }" />
                                                                                    </dx:ASPxButton>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </DropDownWindowTemplate>
                                                                    <ClientSideEvents DropDown="SynchronizeListBoxValues6" TextChanged="SynchronizeListBoxValues" />
                                                                    <DropDownWindowStyle BackColor="#EDEDED">
                                                                    </DropDownWindowStyle>
                                                                </dx:ASPxDropDownEdit>
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td>Sản Phẩm </td>
                                                            <td colspan ="5">
                                                                  <div class="controls">
                                        <%--  <asp:TextBox Width="97%" ID="TPIC" class="span6 typeahead" runat="server"></asp:TextBox>--%>
                                      
              <dx:ASPxGridLookup ID="GridLookup" runat="server"    Text='<%# Bind("MaSP")%>'   SelectionMode="Multiple" DataSourceID="SqlDataSource4" ClientInstanceName="gridLookup"
                            KeyFieldName="Itemcode" Width="100%" TextFormatString="{0}" MultiTextSeparator=";"   Caption="Mã chương trình">
                            <Columns>
                                <dx:GridViewDataColumn FieldName="Itemcode" Width="30%" />
                           <dx:GridViewDataColumn FieldName="Itemname" Width="100%" />
                             </Columns>
                            <GridViewProperties SettingsPager-Mode="ShowPager" SettingsBehavior-ColumnResizeMode="Control">
                                 
                                <Templates>
                                    <StatusBar>
                                        <table  class="OptionsTable" style="float: right">
                                            <tr>
                                                <td>
                                                    <dx:ASPxButton ID="Close" runat="server" AutoPostBack="false" Text="Close" ClientSideEvents-Click="CloseGridLookup" />
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="clear" runat="server" AutoPostBack="false" Text="Clear" ClientSideEvents-Click="ClearGridLookup" />
                                                </td>
                                                 
                                            </tr>
                                        </table>
                                    </StatusBar>
                                </Templates>
                                  <Settings ShowFilterRow="True" ShowStatusBar="Visible" />
                            </GridViewProperties>
                        </dx:ASPxGridLookup>
                
                                    </div>
                                                                <%--<dx:ASPxDropDownEdit ID="ASPxDropDownEdit1" AutoPostBack="true" runat="server" AnimationType="None" Text='<%# Bind("MaSP")%>' ClientInstanceName="checkComboBox2"  Width="100%" Rows="20">
                                                                    <DropDownWindowTemplate>
                                                                        <dx:ASPxListBox ID="listBox" runat="server" DataSourceID="SqlDataSource4"
                                                                            ClientInstanceName="checkListBox2" SelectionMode="CheckColumn" Width="100%">
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />

                                                                            <Columns>
                                                                                <dx:ListBoxColumn FieldName="Itemcode" Width="100px" />
                                                                              </Columns>

                                                                            <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged2" />
                                                                        </dx:ASPxListBox>

                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="padding: 4px">
                                                                                    <dx:ASPxButton ID="ASPxButton" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
                                                                                        <ClientSideEvents Click="function(s, e){ checkComboBox2.HideDropDown(); }" />
                                                                                    </dx:ASPxButton>

                                                                                </td>
                                                                            </tr>
                                                                        </table>

                                                                    </DropDownWindowTemplate>
                                                                    <ClientSideEvents DropDown="SynchronizeListBoxValues2" TextChanged="SynchronizeListBoxValues" />
                                                                    <DropDownWindowStyle BackColor="#EDEDED">
                                                                    </DropDownWindowStyle>
                                                                </dx:ASPxDropDownEdit>--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                        
                                                              <td> Áp Dụng  </td>
                                                            <td>
                                                                <dx:ASPxCheckBox runat="server" ID="ASPxTextBox3"  Checked = '<%# Bind("Apdung")%>'  Text ="Chọn để áp dụng" >
                                                                  </dx:ASPxCheckBox >
                                                            </td>
                                                            
                                                        </tr>
                                                    </table> 
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
 
                                                         Select 'ALL' as Nhan 
                                                     union all
                                                   SELECT  nhan FROM [tbItems] a  inner join  [fnCSVStr2Table] (@Brand) b
on CASE WHEN b.ValueColumn <> 'ALL' AND b.ValueColumn IS NOT NULL   THEN b.ValueColumn ELSE a.Brand  END = a.Brand   group by a.nhan 
                                                      
                                                   ">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="EBrand" Name="Brand" PropertyName="Value" Type="String" />
                                                        </SelectParameters>

                                                    </asp:SqlDataSource>
                                                    <asp:SqlDataSource ID="Sqlmui" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
                                  Select 'ALL' as Mui 
                                                     union all                  
 SELECT  mui FROM [tbItems] a  inner join  [fnCSVStr2Table] (@Brand) b
on CASE WHEN b.ValueColumn &lt;&gt;  'ALL' AND b.ValueColumn IS NOT NULL   THEN b.ValueColumn ELSE a.Brand  END = a.Brand 
 inner join  [fnCSVStr2Table] (@Nhan ) c on  CASE WHEN c.ValueColumn &lt;&gt;  'ALL' AND c.ValueColumn IS NOT NULL 
THEN c.ValueColumn ELSE a.Nhan  END = a.nhan  group by a.mui  
 
                                                   ">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="EBrand" Name="Brand" PropertyName="Value" Type="String" />
                                                            <asp:ControlParameter ControlID="ENhan" Name="Nhan" PropertyName="Value" Type="String" />
                                                        </SelectParameters>

                                                    </asp:SqlDataSource>
                                                     <asp:SqlDataSource ID="Sqlsize" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
                                 Select 'ALL' as Size 
                                                     union all                  
                               SELECT CONVERT (nvarchar, a.Volumn) AS volumn FROM tbItems AS a INNER JOIN dbo.fnCSVStr2Table(@Brand) AS b 
                                                         ON CASE WHEN b.ValueColumn &lt;&gt; 'ALL' AND b.ValueColumn IS NOT NULL THEN b.ValueColumn ELSE a.Brand END = a.Brand INNER JOIN dbo.fnCSVStr2Table(@Nhan) AS c ON CASE WHEN c.ValueColumn &lt;&gt; 'ALL' AND c.ValueColumn IS NOT NULL THEN c.ValueColumn ELSE a.Nhan END = a.Nhan GROUP BY a.Volumn
                                                   ">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="EBrand" Name="Brand" PropertyName="Value" Type="String" />
                                                            <asp:ControlParameter ControlID="ENhan" Name="Nhan" PropertyName="Value" Type="String" />
                                                        </SelectParameters>

                                                    </asp:SqlDataSource>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
                                  Select 'ALL' as Itemcode ,'Chon tất cả' as Itemname
                                                     union all                  
                                SELECT a.Itemcode, a.Itemname FROM [tbItems] a  inner join  [fnCSVStr2Table] (@Brand) b
on CASE WHEN b.ValueColumn  &lt;&gt; 'ALL' AND b.ValueColumn IS NOT NULL   THEN b.ValueColumn ELSE a.Brand  END = a.Brand 
 inner join  [fnCSVStr2Table] (@Nhan ) c on  CASE WHEN c.ValueColumn  &lt;&gt; 'ALL' AND c.ValueColumn IS NOT NULL 
THEN c.ValueColumn ELSE a.Nhan  END = a.nhan 
 inner join  [fnCSVStr2Table] (@Mui ) d on  CASE WHEN d.ValueColumn  &lt;&gt; 'ALL' AND d.ValueColumn IS NOT NULL 
THEN c.ValueColumn ELSE a.mui  END = a.mui
 inner join  [fnCSVStr2Table] (@size ) f on  CASE WHEN f.ValueColumn  &lt;&gt; 'ALL' AND f.ValueColumn IS NOT NULL 
THEN f.ValueColumn ELSE a.Volumn  END = a.Volumn
            where a.type ='Y'
 group by a.Itemcode, a.Itemname

                                                   ">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="EBrand" Name="Brand" PropertyName="Value" Type="String" />
                                                            <asp:ControlParameter ControlID="ENhan" Name="Nhan" PropertyName="Value" Type="String" />
                                                              <asp:ControlParameter ControlID="ASPxSize" Name="size" PropertyName="Value" Type="String" />
                                                         <asp:ControlParameter ControlID="ASPmui" Name="Mui" PropertyName="Text" Type="String" />  
                                                            
                                                          <%--  <asp:SessionParameter SessionField ="aspmui1" Name="mui" Type="String" />--%>
                                                        </SelectParameters>

                                                    </asp:SqlDataSource>
                                                  


                                              
                              <%--      </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>--%>
                    
                                                      <div style="text-align: right; padding: 2px">
                                                        <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                            runat="server"></dx:ASPxGridViewTemplateReplacement>
                                                        <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                            runat="server"></dx:ASPxGridViewTemplateReplacement>
                                                    </div>

                                                </EditForm>
                                            </Templates>
                                        </dx:ASPxGridView>
                                      
                                        <asp:SqlDataSource  ID="Sqlad"  runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" DeleteCommand="DELETE FROM [tbDoiTuongApdung] WHERE   [Id] = @original_Id" InsertCommand="INSERT INTO [tbDoiTuongApdung] ([MS_CTKM], [Brand], [Nhan], [Mui], [Size], [MaSP], [Loai],  [Users], [dates], [Apdung]) VALUES (@MS_CTKM, @Brand, @Nhan, @Mui, @Size, @MaSP, @Loai, @Users, getdate(), @Apdung)" SelectCommand="SELECT * FROM [tbDoiTuongApdung] WHERE ([MS_CTKM] = @MS_CTKM)" UpdateCommand="UPDATE [tbDoiTuongApdung] SET  [Brand] = @Brand, [Nhan] = @Nhan, [Mui] = @Mui, [Size] = @Size, [MaSP] = @MaSP, [Loai] = @Loai,  [Users] = @Users, [dates] = Getdate() , [Apdung] = @Apdung WHERE  [Id] = @original_Id" OldValuesParameterFormatString="original_{0}">
                                        <DeleteParameters>
                                          <asp:Parameter Name="original_Id" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="MS_CTKM" Type="String" />
                                            <asp:Parameter Name="Brand" Type="String" />
                                            <asp:Parameter Name="Nhan" Type="String" />
                                            <asp:Parameter Name="Mui" Type="String" />
                                            <asp:Parameter Name="Size" Type="String" />
                                            <asp:Parameter Name="MaSP" Type="String" />
                                            <asp:Parameter Name="Loai" Type="String" />
                                             
                                             <asp:SessionParameter Name="Users" SessionField="TenDangNhap"  Type="String" />
                                            <asp:Parameter Name="Apdung" Type="Boolean" />
                                        </InsertParameters>
                                        <SelectParameters>
                                           <asp:SessionParameter Name="MS_CTKM" SessionField="MaCT" Type="string" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="original_Id" Type="Int32" />
                                            <asp:Parameter Name="Brand" Type="String" />
                                            <asp:Parameter Name="Nhan" Type="String" />
                                            <asp:Parameter Name="Mui" Type="String" />
                                            <asp:Parameter Name="Size" Type="String" />
                                            <asp:Parameter Name="MaSP" Type="String" />
                                            <asp:Parameter Name="Loai" Type="String" />
                                           
                                           <asp:SessionParameter Name="Users" SessionField="TenDangNhap"  Type="String" />
      
                                            <asp:Parameter Name="original_MS_CTKM" Type="String" />
                                            <asp:Parameter Name="Apdung" Type="Boolean" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>






                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Khuyến mãi bộ , cặp" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl11" runat="server" Width="100%">
                          <div>
                              Áp dụng đối với những chương trình combo , mua bộ cặp rời
                          </div>                                    
    <dx:ASPxGridView ID="ASPcombo" Enabled='<%#Convert.ToBoolean(Eval("lock_Pro"))%>' runat="server" AutoGenerateColumns="False" DataSourceID="Sqlcombo" KeyFieldName="combo" OnBeforePerformDataSelect="Girlcb_DataSelect" OnInitNewRow="Girlcb_InitNewRow">
       
        <Columns>
              <dx:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
                <NewButton Visible="True">
                </NewButton>
                <DeleteButton Visible="True">
                </DeleteButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="combo" ReadOnly="True" VisibleIndex="0" >
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MS_CTKM" Caption="Mã Chương trình" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="Type" Caption="Loại " VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Brand" Caption="Nhãn Hàng" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Nhan" Caption="Nhóm Hàng" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Mui" Caption="Mùi Hương" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Loai" Caption="Loại" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Size" Caption="Trọng Lượng" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MaSP" Caption="Mã Sản Phẩm" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="soluong" Caption="Số lượng" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="Thanhtien" Caption="Giá Trị" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            
        </Columns>
        <SettingsPager PageSize="100">
        </SettingsPager>
        <Settings ShowFilterRow="True" ShowFooter="True" />
         <Templates>
                                                <EditForm>
                                                    <table  class="OptionsTable"   width="100%">
                                                        <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
                                                        <tr>
                                                            <td  width="100px">Mã Chương Trình </td>
                                                            <td colspan="4">
                                                                <dx:ASPxTextBox runat="server" ID="eMS_CTKM" Text='<% #Bind("MS_CTKM")%>' >
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                          <tr>
                                                            <td>Loại sản phẩm
                                                            </td>
                                                             <%--  Text ='<%# Bind("Type")%>'--%>
                                                              <td colspan="3">
                                                                  <dx:ASPxComboBox ID="type" runat="server" TextField ='<%# Bind("Type")%>' Text ='<%# Bind("Type")%>'  TextFormatString=" {0} " Caption="Loại"      dropdownstyle="DropDown">
                                                                       <Items>
                                                                <dx:ListEditItem Text="Hàng Bán" Value="HB" />
                                                                <dx:ListEditItem Text="KM" Value="KM" />
                                                                <dx:ListEditItem Text="MIN" Value="MIN" />
                                                                  <dx:ListEditItem Text="0MIN" Value="0MIN" />
                                                                 <dx:ListEditItem Text="Tien" Value="Tien" />
                                                            </Items>
                                                                  </dx:ASPxComboBox>

                                                                  <tr>
                                                                      <td>Brand
                                                                      </td>
                                                                      <td colspan="4">
                                                                          <dx:ASPxDropDownEdit ID="EBrand" AutoPostBack="true" runat="server" AnimationType="None" Text='<%# Bind("Brand")%>' ClientInstanceName="checkComboBox"  >
                                                                              <DropDownWindowTemplate>
                                                                                  <dx:ASPxListBox ID="listBox" runat="server" ClientInstanceName="checkListBox" SelectionMode="CheckColumn" Width="100%">
                                                                                      <Border BorderStyle="None" />
                                                                                      <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />
                                                                                      <Items>
                                                                                          <dx:ListEditItem Text="ALL" Value="1" />
                                                                                          <dx:ListEditItem Text="BIOESSENCE" Value="2" />

                                                                                          <dx:ListEditItem Text="ROMANO" Value="5" />
                                                                                          <dx:ListEditItem Text="BAT" Value="6" />
                                                                                          <dx:ListEditItem Text="ENCHANTEUR" Value="7" />
                                                                                          <dx:ListEditItem Text="EVERSOFT" Value="8" />
                                                                                          <dx:ListEditItem Text="GERVENNE" Value="9" />
                                                                                          <dx:ListEditItem Text="IZZI" Value="10" />
                                                                                          <dx:ListEditItem Text="CARRIE JUNIOR" Value="11" />
                                                                                          <dx:ListEditItem Text="MAXKLEEN" Value="12" />
                                                                                          <dx:ListEditItem Text="DASHING" Value="13" />

                                                                                      </Items>
                                                                                      <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged" />
                                                                                  </dx:ASPxListBox>
                                                                                  <table style="width: 100%">
                                                                                      <tr>
                                                                                          <td style="padding: 4px">
                                                                                              <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
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
                                                                      </td>

                                                                  </tr>
                                                                  <tr>
                                                                      <td>Nhãn Hàng
                                                                      </td>
                                                                      <td colspan="4">
                                                                          <dx:ASPxDropDownEdit ID="ENhan2" AutoPostBack="true" runat="server" AnimationType="None" Text='<%# Bind("Nhan")%>' ClientInstanceName="checkComboBox1" Width="50%" Rows="20">
                                                                              <DropDownWindowTemplate>
                                                                                  <dx:ASPxListBox ID="listBox" runat="server" DataSourceID="SqlDataSource2" ClientInstanceName="checkListBox1" SelectionMode="CheckColumn" Width="100%">
                                                                                      <Border BorderStyle="None" />
                                                                                      <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />

                                                                                      <Columns>
                                                                                          <dx:ListBoxColumn FieldName="Nhan" Width="100px" />

                                                                                      </Columns>

                                                                                      <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged1" />
                                                                                  </dx:ASPxListBox>

                                                                                  <table style="width: 100%">
                                                                                      <tr>
                                                                                          <td style="padding: 4px">
                                                                                              <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
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

                                                                      </td>
                                                                  </tr>
                                                                  <tr>
                                                                      <td>Mùi hương
                                                                      </td>
                                                                      <td colspan="4">
                                                                          <dx:ASPxDropDownEdit ID="ASPmui" AutoPostBack="true" runat="server" AnimationType="None" Text='<%# Bind("Mui")%>' ClientInstanceName="checkComboBox3" Width="50%" Rows="20">
                                                                              <DropDownWindowTemplate>
                                                                                  <dx:ASPxListBox ID="listBox" runat="server" DataSourceID="Sqlmui" ClientInstanceName="checkListBox3" SelectionMode="CheckColumn" Width="100%">
                                                                                      <Border BorderStyle="None" />
                                                                                      <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />

                                                                                      <Columns>
                                                                                          <dx:ListBoxColumn FieldName="Mui" Width="100px" />

                                                                                      </Columns>

                                                                                      <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged3" />
                                                                                  </dx:ASPxListBox>

                                                                                  <table style="width: 100%">
                                                                                      <tr>
                                                                                          <td style="padding: 4px">
                                                                                              <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
                                                                                                  <ClientSideEvents Click="function(s, e){ checkComboBox3.HideDropDown(); }" />
                                                                                              </dx:ASPxButton>

                                                                                          </td>
                                                                                      </tr>
                                                                                  </table>


                                                                              </DropDownWindowTemplate>
                                                                              <ClientSideEvents DropDown="SynchronizeListBoxValues3" TextChanged="SynchronizeListBoxValues" />
                                                                              <DropDownWindowStyle BackColor="#EDEDED">
                                                                              </DropDownWindowStyle>
                                                                          </dx:ASPxDropDownEdit>

                                                                      </td>
                                                                  </tr>
                                                                  <tr>
                                                                      <td>Trọng lượng
                                                                      </td>
                                                                      <td colspan="4">
                                                                          <dx:ASPxDropDownEdit ID="ASPxSize" AutoPostBack="true" runat="server" AnimationType="None" Text='<%# Bind("Size")%>' ClientInstanceName="checkComboBox4" Width="50%" Rows="20">
                                                                              <DropDownWindowTemplate>
                                                                                  <dx:ASPxListBox ID="listBox" runat="server" DataSourceID="Sqlsize" ClientInstanceName="checkListBox4" SelectionMode="CheckColumn" Width="100%">
                                                                                      <Border BorderStyle="None" />
                                                                                      <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />

                                                                                      <Columns>
                                                                                          <dx:ListBoxColumn FieldName="Size" Width="100px" />

                                                                                      </Columns>

                                                                                      <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged4" />
                                                                                  </dx:ASPxListBox>

                                                                                  <table style="width: 100%">
                                                                                      <tr>
                                                                                          <td style="padding: 4px">
                                                                                              <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
                                                                                                  <ClientSideEvents Click="function(s, e){ checkComboBox4.HideDropDown(); }" />
                                                                                              </dx:ASPxButton>

                                                                                          </td>
                                                                                      </tr>
                                                                                  </table>


                                                                              </DropDownWindowTemplate>
                                                                              <ClientSideEvents DropDown="SynchronizeListBoxValues4" TextChanged="SynchronizeListBoxValues" />
                                                                              <DropDownWindowStyle BackColor="#EDEDED">
                                                                              </DropDownWindowStyle>
                                                                          </dx:ASPxDropDownEdit>

                                                                      </td>
                                                                  </tr>
                                                                  <tr>
                                                                      <td>Loại sản phẩm
                                                                      </td>
                                                                      <td colspan="4">
                                                                          <dx:ASPxDropDownEdit ID="ASPxDropDownEdit2" AutoPostBack="true" runat="server" AnimationType="None" Text='<%# Bind("Loai")%>' ClientInstanceName="checkComboBox6" Width="50%">
                                                                              <DropDownWindowTemplate>
                                                                                  <dx:ASPxListBox ID="listBox" runat="server" ClientInstanceName="checkListBox6" SelectionMode="CheckColumn" Width="100%">
                                                                                      <Border BorderStyle="None" />
                                                                                      <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />
                                                                                      <Items>

                                                                                          <dx:ListEditItem Text="ALL" Value="1" />
                                                                                          <dx:ListEditItem Text="Normal" Value="2" />
                                                                                          <dx:ListEditItem Text="Gift" Value="3" />
                                                                                          <dx:ListEditItem Text="Group" Value="4" />
                                                                                          <dx:ListEditItem Text="Tray" Value="5" />
                                                                                          <dx:ListEditItem Text="Free" Value="6" />

                                                                                      </Items>
                                                                                      <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged6" />
                                                                                  </dx:ASPxListBox>
                                                                                  <table style="width: 100%">
                                                                                      <tr>
                                                                                          <td style="padding: 4px">
                                                                                              <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
                                                                                                  <ClientSideEvents Click="function(s, e){ checkComboBox6.HideDropDown(); }" />
                                                                                              </dx:ASPxButton>
                                                                                          </td>
                                                                                      </tr>
                                                                                  </table>
                                                                              </DropDownWindowTemplate>
                                                                              <ClientSideEvents DropDown="SynchronizeListBoxValues6" TextChanged="SynchronizeListBoxValues" />
                                                                              <DropDownWindowStyle BackColor="#EDEDED">
                                                                              </DropDownWindowStyle>
                                                                          </dx:ASPxDropDownEdit>
                                                                      </td>

                                                                  </tr>
                                                                  <tr>
                                                                      <td>Sản Phẩm </td>
                                                                      <td colspan="4">

                                                                          <dx:ASPxGridLookup ID="GridLookup" runat="server" Text='<%# Bind("MaSP")%>' SelectionMode="Multiple" DataSourceID="SqlDataSource4" ClientInstanceName="gridLookup"
                                                                              KeyFieldName="Itemcode" Width="50%" TextFormatString="{0}" MultiTextSeparator=";" Caption="Mã chương trình">
                                                                              <Columns>
                                                                                  <dx:GridViewDataColumn FieldName="Itemcode" Width="30%" />
                                                                                  <dx:GridViewDataColumn FieldName="Itemname" Width="100%" />
                                                                              </Columns>
                                                                              <GridViewProperties SettingsPager-Mode="ShowPager" SettingsBehavior-ColumnResizeMode="Control">

                                                                                  <Templates>
                                                                                      <StatusBar>
                                                                                          <table class="OptionsTable" style="float: right">
                                                                                              <tr>
                                                                                                  <td>
                                                                                                      <dx:ASPxButton ID="Close" runat="server" AutoPostBack="false" Text="Close" ClientSideEvents-Click="CloseGridLookup" />
                                                                                                  </td>
                                                                                                  <td>
                                                                                                      <dx:ASPxButton ID="clear" runat="server" AutoPostBack="false" Text="Clear" ClientSideEvents-Click="ClearGridLookup" />
                                                                                                  </td>

                                                                                              </tr>
                                                                                          </table>
                                                                                      </StatusBar>
                                                                                  </Templates>
                                                                                  <Settings ShowFilterRow="True" ShowStatusBar="Visible" />
                                                                              </GridViewProperties>
                                                                          </dx:ASPxGridLookup>
                                                                           
                                                            </td>
                                                        </tr>
                                                          <tr>
                                                            <td style="width:50px" >Số Lượng  </td>
                                                              <td  style="width:100px">
                                                                  <dx:ASPxTextBox runat="server" ID="ASPxTextBox4" Text='<%# Bind("soluong")%>' Width="100px">
                                                                  </dx:ASPxTextBox>
                                                              </td>
                                                              <td style="width:50px">Giá trị   </td>
                                                              <td >
                                                                  <dx:ASPxTextBox runat="server" ID="ASPxTextBox5" Text='<%# Bind("Thanhtien")%>'  Width="100px">
                                                                  </dx:ASPxTextBox>
                                                              </td>
                                                          </tr>
                                                    </table>
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
                                                       
                                                        Select 'ALL' as Nhan 
                                                     union all
                                                     SELECT Nhan FROM [tbItems] a  inner join  [fnCSVStr2Table] (@Brand ) b
                  on CASE WHEN b.ValueColumn &lt;&gt;  'ALL' AND b.ValueColumn IS NOT NULL   THEN b.ValueColumn ELSE a.Brand  END = a.Brand 
                     GROUP bY  [nhan]
                                                      
                                                   ">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="EBrand" Name="Brand" PropertyName="Value" Type="String" />
                                                        </SelectParameters>

                                                    </asp:SqlDataSource>
                                                    <asp:SqlDataSource ID="Sqlmui" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
                                  Select 'ALL' as Mui 
                                                     union all                  
                                SELECT  mui FROM [tbItems] a  inner join  [fnCSVStr2Table] (@Brand) b
on CASE WHEN b.ValueColumn &lt;&gt;  'ALL' AND b.ValueColumn IS NOT NULL   THEN b.ValueColumn ELSE a.Brand  END = a.Brand 
 inner join  [fnCSVStr2Table] (@Nhan ) c on  CASE WHEN c.ValueColumn &lt;&gt;  'ALL' AND c.ValueColumn IS NOT NULL 
THEN c.ValueColumn ELSE a.Nhan  END = a.nhan  group by a.mui
 
 
                                                   ">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="EBrand" Name="Brand" PropertyName="Value" Type="String" />
                                                            <asp:ControlParameter ControlID="ENhan2" Name="Nhan" PropertyName="Value" Type="String" />
                                                        </SelectParameters>

                                                    </asp:SqlDataSource>
                                                    <asp:SqlDataSource ID="Sqlsize" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
                                 Select 'ALL' as Size 
                                                     union all                  
                                               
                               SELECT CONVERT (nvarchar, a.Volumn) AS volumn FROM tbItems AS a INNER JOIN dbo.fnCSVStr2Table(@Brand) AS b 
                                                         ON CASE WHEN b.ValueColumn &lt;&gt; 'ALL' AND b.ValueColumn IS NOT NULL THEN b.ValueColumn ELSE a.Brand END = a.Brand INNER JOIN dbo.fnCSVStr2Table(@Nhan) AS c ON CASE WHEN c.ValueColumn &lt;&gt; 'ALL' AND c.ValueColumn IS NOT NULL THEN c.ValueColumn ELSE a.Nhan END = a.Nhan GROUP BY a.Volumn
                                                   
                                                   ">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="EBrand" Name="Brand" PropertyName="Value" Type="String" />
                                                            <asp:ControlParameter ControlID="ENhan2" Name="Nhan" PropertyName="Value" Type="String" />
                                                        </SelectParameters>

                                                    </asp:SqlDataSource>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
                                  Select 'ALL' as Itemcode ,'Chon tất cả' as Itemname
                                                     union all                  
                                              
                                SELECT a.Itemcode, a.Itemname FROM [tbItems] a  inner join  [fnCSVStr2Table] (@Brand) b
on CASE WHEN b.ValueColumn  &lt;&gt; 'ALL' AND b.ValueColumn IS NOT NULL   THEN b.ValueColumn ELSE a.Brand  END = a.Brand 
 inner join  [fnCSVStr2Table] (@Nhan ) c on  CASE WHEN c.ValueColumn  &lt;&gt; 'ALL' AND c.ValueColumn IS NOT NULL 
THEN c.ValueColumn ELSE a.Nhan  END = a.nhan 
 inner join  [fnCSVStr2Table] (@Mui ) d on  CASE WHEN d.ValueColumn  &lt;&gt; 'ALL' AND d.ValueColumn IS NOT NULL 
THEN c.ValueColumn ELSE a.mui  END = a.mui
 inner join  [fnCSVStr2Table] (@size ) f on  CASE WHEN f.ValueColumn  &lt;&gt; 'ALL' AND f.ValueColumn IS NOT NULL 
THEN f.ValueColumn ELSE a.Volumn  END = a.Volumn
            where a.type ='Y'
 group by a.Itemcode, a.Itemname 
                                                   ">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="EBrand" Name="Brand" PropertyName="Value" Type="String" />
                                                            <asp:ControlParameter ControlID="ENhan2" Name="Nhan" PropertyName="Value" Type="String" />
                                                            <asp:ControlParameter ControlID="ASPxSize" Name="size" PropertyName="Value" Type="String" />
                                                            <asp:ControlParameter ControlID="ASPmui" Name="Mui" PropertyName="Value" Type="String" />
                                                        </SelectParameters>


                                                    </asp:SqlDataSource>


                                                    <div style="text-align:center; padding: 2px">
                                                        <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                            runat="server"></dx:ASPxGridViewTemplateReplacement>
                                                        <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                            runat="server"></dx:ASPxGridViewTemplateReplacement>
                                                    </div>


                                                </EditForm>
                                            </Templates>
    </dx:ASPxGridView>


                <asp:SqlDataSource ID="Sqlcombo" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" DeleteCommand="DELETE FROM [tbdtcombo] WHERE [combo] = @combo" InsertCommand="INSERT INTO [tbdtcombo] ( Type,[MS_CTKM], [Brand], [Nhan], [Mui], [Loai], [Size], [MaSP], [soluong], [thanhtien], [Users], [dates] ) VALUES ( @Type, @MS_CTKM, @Brand, @Nhan, @Mui, @Loai, @Size, @MaSP, @soluong, @thanhtien,  @Users, Getdate() )" SelectCommand="SELECT * FROM [tbdtcombo] WHERE ([MS_CTKM] = @MS_CTKM)" UpdateCommand="UPDATE [tbdtcombo] SET Type=@Type, [MS_CTKM] = @MS_CTKM, [Brand] = @Brand, [Nhan] = @Nhan, [Mui] = @Mui, [Loai] = @Loai, [Size] = @Size, [MaSP] = @MaSP, [soluong] = @soluong, thanhtien =@thanhtien,  [Users] = @Users, [dates] = Getdate()  WHERE [combo] = @combo">
                    <DeleteParameters>
                        <asp:Parameter Name="combo" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                      <asp:Parameter Name="Type" Type="String" />
                        <asp:Parameter Name="MS_CTKM" Type="String" />
                        <asp:Parameter Name="Brand" Type="String" />
                        <asp:Parameter Name="Nhan" Type="String" />
                        <asp:Parameter Name="Mui" Type="String" />
                        <asp:Parameter Name="Loai" Type="String" />
                        <asp:Parameter Name="Size" Type="String" />
                        <asp:Parameter Name="MaSP" Type="String" />
                        <asp:Parameter Name="soluong" Type="Int32" />
                         <asp:Parameter Name="thanhtien" Type="Int32" />
                        <asp:SessionParameter  Name="Users" SessionField ="TenDangNhap" Type="String" />
                      
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="MS_CTKM" SessionField="MaCT" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Type" Type="String" />
                        <asp:Parameter Name="MS_CTKM" Type="String" />
                        <asp:Parameter Name="Brand" Type="String" />
                        <asp:Parameter Name="Nhan" Type="String" />
                        <asp:Parameter Name="Mui" Type="String" />
                        <asp:Parameter Name="Loai" Type="String" />
                        <asp:Parameter Name="Size" Type="String" />
                        <asp:Parameter Name="MaSP" Type="String" />
                        <asp:Parameter Name="soluong" Type="Int32" />
                          <asp:Parameter Name="thanhtien" Type="Int32" />
                          <asp:SessionParameter  Name="Users" SessionField ="TenDangNhap" Type="String" />
                         <asp:Parameter Name="combo" Type="Int32" />
                      
                    </UpdateParameters>
                </asp:SqlDataSource>
              
                                              
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        
                            <dx:TabPage Text="Sản phẩm Khuyến mãi" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl3" runat="server">
                                                       Tên Chương trình: <b>
                    <%# Eval("TenCT")%></b> 
                <br />
                <br />

                                        <dx:ASPxGridView Enabled='<%#Convert.ToBoolean(Eval("lock_Pro"))%>' ID="GirlKM" runat="server" AutoGenerateColumns="False" DataSourceID="Sqls" KeyFieldName="ID" OnBeforePerformDataSelect="GirlKM_DataSelect" OnInitNewRow="GirlKM_InitNewRow" Width="95%">
                                            <Columns>
                                                <dx:GridViewCommandColumn VisibleIndex="0">
                                                    <EditButton Visible="True">
                                                    </EditButton>
                                                    <NewButton Visible="True">
                                                    </NewButton>
                                                    <DeleteButton Visible="True">
                                                    </DeleteButton>
                                                    <ClearFilterButton Visible="True">
                                                    </ClearFilterButton>
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MS_CTKM"   VisibleIndex="2" Caption ="Mã Chương Trình">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Brand" VisibleIndex="3" Caption ="Nhãn">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Nhan" VisibleIndex="4" Caption ="Nhóm">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Mui" VisibleIndex="5" Caption ="Mùi Hương">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Size" VisibleIndex="6">

                                                </dx:GridViewDataTextColumn>
                                                   <dx:GridViewDataTextColumn FieldName="Loai" VisibleIndex="7" Caption ="Loại Sản Phẩm">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MaSP" VisibleIndex="8" Caption ="Sản Phẩm">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Loaimua" VisibleIndex="9">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Value" VisibleIndex="10">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="LoaiKM" VisibleIndex="11">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Valuekm" VisibleIndex="12">
                                                </dx:GridViewDataTextColumn>

                                            </Columns>
                                            
                                            <Settings ShowPreview="True" />
                                            <Templates>
                                                <EditForm>
                                                    <table  class="OptionsTable"   width="100%">
                                                        <tr>
                                                            <td  width="20%">Mã Chương Trình </td>
                                                            <td colspan="3">
                                                                <dx:ASPxTextBox runat="server" ID="eMS_CTKM" Text='<%# Bind("MS_CTKM")%>' Width="100%">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Brand
                                                            </td>
                                                            <td  colspan="3">
                                                                <dx:ASPxDropDownEdit ID="EBrand" AutoPostBack="true" runat="server" AnimationType="None" Text='<%# Bind("Brand")%>' ClientInstanceName="checkComboBox"   Width="100%">
                                                                    <DropDownWindowTemplate>
                                                                        <dx:ASPxListBox ID="listBox" runat="server" ClientInstanceName="checkListBox" SelectionMode="CheckColumn" Width="100%">
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />
                                                                            <Items>
                                                                                <dx:ListEditItem Text="ALL"  Value="1" />
                                                                                <dx:ListEditItem Text="BIOESSENCE" Value="2" />
                                                                                
                                                                                <dx:ListEditItem Text="ROMANO" Value="5" />
                                                                                <dx:ListEditItem Text="BAT" Value="6" />
                                                                                <dx:ListEditItem Text="ENCHANTEUR" Value="7" />
                                                                                <dx:ListEditItem Text="EVERSOFT" Value="8" />
                                                                                <dx:ListEditItem Text="GERVENNE" Value="9" />
                                                                                <dx:ListEditItem Text="IZZI" Value="10" />
                                                                                 <dx:ListEditItem Text="CARRIE JUNIOR" Value="11" />
                                                                                <dx:ListEditItem Text="MAXKLEEN" Value="12" />
                                                                                <dx:ListEditItem Text="DASHING" Value="13" />
                                                                            </Items>
                                                                            <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged" />
                                                                        </dx:ASPxListBox>
                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="padding: 4px">
                                                                                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
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
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td>Nhãn Hàng
                                                            </td>
                                                            <td  colspan="3">
                                                                <dx:ASPxDropDownEdit ID="ENhan2" AutoPostBack="true" runat="server" AnimationType="None" Text='<%# Bind("Nhan")%>' ClientInstanceName="checkComboBox1" Width="100%" Rows="20">
                                                                    <DropDownWindowTemplate>
                                                                        <dx:ASPxListBox ID="listBox" runat="server" DataSourceID="SqlDataSource2" ClientInstanceName="checkListBox1" SelectionMode="CheckColumn" Width="100%">
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />

                                                                            <Columns>
                                                                                <dx:ListBoxColumn FieldName="Nhan" Width="100px" />

                                                                            </Columns>

                                                                            <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged1" />
                                                                        </dx:ASPxListBox>

                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="padding: 4px">
                                                                                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
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

                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Mùi hương
                                                            </td>
                                                            <td  colspan="3">
                                                                <dx:ASPxDropDownEdit ID="ASPmui" AutoPostBack="true" runat="server" AnimationType="None" Text='<%# Bind("Mui")%>' ClientInstanceName="checkComboBox3" Width="100%" Rows="20">
                                                                    <DropDownWindowTemplate>
                                                                        <dx:ASPxListBox ID="listBox" runat="server" DataSourceID="Sqlmui" ClientInstanceName="checkListBox3" SelectionMode="CheckColumn" Width="100%">
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />

                                                                            <Columns>
                                                                                <dx:ListBoxColumn FieldName="Mui" Width="100px" />

                                                                            </Columns>

                                                                            <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged3" />
                                                                        </dx:ASPxListBox>

                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="padding: 4px">
                                                                                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
                                                                                        <ClientSideEvents Click="function(s, e){ checkComboBox3.HideDropDown(); }" />
                                                                                    </dx:ASPxButton>

                                                                                </td>
                                                                            </tr>
                                                                        </table>


                                                                    </DropDownWindowTemplate>
                                                                    <ClientSideEvents DropDown="SynchronizeListBoxValues3" TextChanged="SynchronizeListBoxValues" />
                                                                    <DropDownWindowStyle BackColor="#EDEDED">
                                                                    </DropDownWindowStyle>
                                                                </dx:ASPxDropDownEdit>

                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Trọng lượng
                                                            </td>
                                                            <td  colspan="3">
                                                                <dx:ASPxDropDownEdit ID="ASPxSize" AutoPostBack="true" runat="server" AnimationType="None" Text='<%# Bind("Size")%>' ClientInstanceName="checkComboBox4" Width="100%" Rows="20">
                                                                    <DropDownWindowTemplate>
                                                                        <dx:ASPxListBox ID="listBox" runat="server" DataSourceID="Sqlsize" ClientInstanceName="checkListBox4" SelectionMode="CheckColumn" Width="100%">
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />

                                                                            <Columns>
                                                                                <dx:ListBoxColumn FieldName="Size" Width="100px" />

                                                                            </Columns>

                                                                            <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged4" />
                                                                        </dx:ASPxListBox>

                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="padding: 4px">
                                                                                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
                                                                                        <ClientSideEvents Click="function(s, e){ checkComboBox4.HideDropDown(); }" />
                                                                                    </dx:ASPxButton>

                                                                                </td>
                                                                            </tr>
                                                                        </table>


                                                                    </DropDownWindowTemplate>
                                                                    <ClientSideEvents DropDown="SynchronizeListBoxValues4" TextChanged="SynchronizeListBoxValues" />
                                                                    <DropDownWindowStyle BackColor="#EDEDED">
                                                                    </DropDownWindowStyle>
                                                                </dx:ASPxDropDownEdit>

                                                            </td>
                                                        </tr>
                                                         <tr>
                                                            <td>Loại sản phẩm
                                                            </td>
                                                           <td  colspan="3">
                                                                <dx:ASPxDropDownEdit ID="ASPxDropDownEdit2" AutoPostBack="true" runat="server" AnimationType="None" Text='<%# Bind("Loai")%>' ClientInstanceName="checkComboBox6"   Width="100%">
                                                                    <DropDownWindowTemplate>
                                                                        <dx:ASPxListBox ID="listBox" runat="server" ClientInstanceName="checkListBox6" SelectionMode="CheckColumn" Width="100%">
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />
                                                                            <Items>
                                                                               
                                                                            <dx:ListEditItem Text="ALL" Value="1" />
                                                                                <dx:ListEditItem Text="Normal" Value="2" />
                                                                                <dx:ListEditItem Text="Gift" Value="3" />
                                                                                <dx:ListEditItem Text="Group" Value="4" />
                                                                                <dx:ListEditItem Text="Tray" Value="5" />
                                                                                <dx:ListEditItem Text="Free" Value="6" />
                                                                                 
                                                                            </Items>
                                                                            <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged6" />
                                                                        </dx:ASPxListBox>
                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="padding: 4px">
                                                                                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
                                                                                        <ClientSideEvents Click="function(s, e){ checkComboBox6.HideDropDown(); }" />
                                                                                    </dx:ASPxButton>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </DropDownWindowTemplate>
                                                                    <ClientSideEvents DropDown="SynchronizeListBoxValues6" TextChanged="SynchronizeListBoxValues" />
                                                                    <DropDownWindowStyle BackColor="#EDEDED">
                                                                    </DropDownWindowStyle>
                                                                </dx:ASPxDropDownEdit>
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td>Sản Phẩm </td>
                                                            <td colspan="3">
                    <%--                                                
              <dx:ASPxGridLookup ID="GridLookup" runat="server"    Text='<%# Bind("MaSP")%>'   SelectionMode="Multiple" DataSourceID="SqlDataSource4" ClientInstanceName="gridLookup"
                            KeyFieldName="Itemcode" Width="100%" TextFormatString="{0}" MultiTextSeparator=";"   Caption="Mã chương trình">
                            <Columns>
                                <dx:GridViewDataColumn FieldName="Itemcode" Width="30%" />
                           <dx:GridViewDataColumn FieldName="Itemname" Width="100%" />
                             </Columns>
                            <GridViewProperties SettingsPager-Mode="ShowPager" SettingsBehavior-ColumnResizeMode="Control">
                                 
                                <Templates>
                                    <StatusBar>
                                        <table  class="OptionsTable" style="float: right">
                                            <tr>
                                                <td>
                                                    <dx:ASPxButton ID="Close" runat="server" AutoPostBack="false" Text="Close" ClientSideEvents-Click="CloseGridLookup" />
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="clear" runat="server" AutoPostBack="false" Text="Clear" ClientSideEvents-Click="ClearGridLookup" />
                                                </td>
                                                 
                                            </tr>
                                        </table>
                                    </StatusBar>
                                </Templates>
                                  <Settings ShowFilterRow="True" ShowStatusBar="Visible" />
                            </GridViewProperties>
                        </dx:ASPxGridLookup> --%>
                                                            <dx:ASPxDropDownEdit ID="ASPxDropDownEdit1" AutoPostBack="true" runat="server" AnimationType="None" Text='<%# Bind("MaSP")%>' ClientInstanceName="checkComboBox2"  Width="100%" Rows="20">
                                                                    <DropDownWindowTemplate>
                                                                        <dx:ASPxListBox ID="listBox" runat="server" DataSourceID="SqlDataSource4"
                                                                            ClientInstanceName="checkListBox2" SelectionMode="CheckColumn" Width="100%">
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />

                                                                            <Columns>
                                                                                <dx:ListBoxColumn FieldName="Itemcode" Width="100px" />
                                                                           
                                                                            </Columns>

                                                                            <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged2" />
                                                                        </dx:ASPxListBox>

                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="padding: 4px">
                                                                                    <dx:ASPxButton ID="ASPxButton" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
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
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 20%">Loại Mua </td>
                                                            <td>
                                                                <dx:ASPxComboBox ID="loiamua" runat="server"   Text='<%# Bind("Loaimua")%>'  DataSourceID="Sqlloai" Width="100%" TextFormatString="{0}">
                                                                  <Columns>
                                                                      <dx:ListBoxColumn FieldName ="Value" />
                                                                      <dx:ListBoxColumn FieldName="Ten" />
                                                                  </Columns>                                                                      
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                             <td style="width: 20%">Giá trị   </td>
                                                            <td>
                                                                <dx:ASPxTextBox runat="server" ID="ASPxTextBox4" Text='<%# Bind("Value")%>' Width="100px">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                       <%-- <tr>
                                                            <td style="width: 20%">Loại Mua </td>
                                                            <td>
                                                                <dx:ASPxComboBox ID="Loaimua1" runat="server"   Text='<%# Bind("Loaimua1")%>'  DataSourceID="Sqlloai" Width="100%" TextFormatString="{0}">
                                                                  <Columns>
                                                                      <dx:ListBoxColumn FieldName ="Value" />
                                                                      <dx:ListBoxColumn FieldName="Ten" />
                                                                  </Columns>                                                                      
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                             <td style="width: 20%">Giá trị   </td>
                                                            <td>
                                                                <dx:ASPxTextBox runat="server" ID="Value1" Text='<%# Bind("Value1")%>' Width="100px">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>--%>


                                                        <tr>
                                                            <td style="width: 20%">Được khuyến mãi </td>
                                                            <td>
                                                                <%--<dx:ASPxComboBox ID="ASPxComboBox1" runat="server" ValueType="System.Int32" Text='<%# Bind("LoaiKM")%>' SelectedIndex="0"    NullText="Chọn " Width="100%">
                                                                
                                                                       <Items>
                                                                          
                                                                         <dx:ListEditItem Text="KM với số lượng" Value="1"></dx:ListEditItem>
                                                                        <dx:ListEditItem Text="KM với chiết khấu" Value="2"></dx:ListEditItem>
                                                                        <dx:ListEditItem Text="KM giá trị tiền" Value="3"></dx:ListEditItem>
                                                                       
                                                                    </Items>
                                                                     
                                                                </dx:ASPxComboBox>--%>
                                                                <dx:ASPxComboBox ID="ASPxComboBox2" runat="server"   Text='<%# Bind("LoaiKM")%>'  DataSourceID="Sqlloaikm" Width="100%" TextFormatString="{0}">
                                                                  <Columns>
                                                                      <dx:ListBoxColumn FieldName ="Value" />
                                                                      <dx:ListBoxColumn FieldName="Ten" />
                                                                  </Columns>                                                                      
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                             <td style="width: 20%">Giá trị KM  </td>
                                                            <td>
                                                                <dx:ASPxTextBox runat="server" ID="ASPxTextBox2" Text='<%# Bind("Valuekm")%>' Width="100px">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
                                                       
                                                        Select 'ALL' as Nhan 
                                                     union all
                                                     SELECT Nhan FROM [tbItems] a  inner join  [fnCSVStr2Table] (@Brand ) b
                  on CASE WHEN b.ValueColumn &lt;&gt;  'ALL' AND b.ValueColumn IS NOT NULL   THEN b.ValueColumn ELSE a.Brand  END = a.Brand 
                                                        WHERE a.Brand IS NOT NULL
                     GROUP bY  [nhan]
                                                      
                                                   ">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="EBrand" Name="Brand" PropertyName="Value" Type="String" />
                                                        </SelectParameters>

                                                    </asp:SqlDataSource>
                                                    <asp:SqlDataSource ID="Sqlmui" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
                                  Select 'ALL' as Mui 
                                                     union all                  
                                SELECT  mui FROM [tbItems] a  inner join  [fnCSVStr2Table] (@Brand) b
on CASE WHEN b.ValueColumn &lt;&gt;  'ALL' AND b.ValueColumn IS NOT NULL   THEN b.ValueColumn ELSE a.Brand  END = a.Brand 
 inner join  [fnCSVStr2Table] (@Nhan ) c on  CASE WHEN c.ValueColumn &lt;&gt;  'ALL' AND c.ValueColumn IS NOT NULL 
THEN c.ValueColumn ELSE a.Nhan  END = a.nhan  WHERE a.mui IS NOT NULL
                                                         group by a.mui
 
 
                                                   ">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="EBrand" Name="Brand" PropertyName="Value" Type="String" />
                                                            <asp:ControlParameter ControlID="ENhan2" Name="Nhan" PropertyName="Value" Type="String" />
                                                        </SelectParameters>

                                                    </asp:SqlDataSource>
                                                     <asp:SqlDataSource ID="Sqlsize" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
                                 Select 'ALL' as Size 
                                                     union all                  
                                               
                               SELECT CONVERT (nvarchar, a.Volumn) AS volumn FROM tbItems AS a INNER JOIN dbo.fnCSVStr2Table(@Brand) AS b 
                                                         ON CASE WHEN b.ValueColumn &lt;&gt; 'ALL' AND b.ValueColumn IS NOT NULL THEN b.ValueColumn ELSE a.Brand END = a.Brand INNER JOIN dbo.fnCSVStr2Table(@Nhan) AS c ON CASE WHEN c.ValueColumn &lt;&gt; 'ALL' AND c.ValueColumn IS NOT NULL THEN c.ValueColumn ELSE a.Nhan END = a.Nhan   WHERE a.Volumn IS NOT NULL  GROUP BY a.Volumn
                                                   
                                                   ">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="EBrand" Name="Brand" PropertyName="Value" Type="String" />
                                                            <asp:ControlParameter ControlID="ENhan2" Name="Nhan" PropertyName="Value" Type="String" />
                                                        </SelectParameters>

                                                    </asp:SqlDataSource>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
                                  Select 'ALL' as Itemcode ,'Chon tất cả' as Itemname
                                                     union all                  
                                              
                                SELECT a.Itemcode, a.Itemname FROM [tbItems] a  inner join  [fnCSVStr2Table] (@Brand) b
on CASE WHEN b.ValueColumn  &lt;&gt; 'ALL' AND b.ValueColumn IS NOT NULL   THEN b.ValueColumn ELSE a.Brand  END = a.Brand 
 inner join  [fnCSVStr2Table] (@Nhan ) c on  CASE WHEN c.ValueColumn  &lt;&gt; 'ALL' AND c.ValueColumn IS NOT NULL 
THEN c.ValueColumn ELSE a.Nhan  END = a.nhan 
 inner join  [fnCSVStr2Table] (@mui ) d on  CASE WHEN d.ValueColumn  &lt;&gt; 'ALL' AND d.ValueColumn IS NOT NULL 
THEN c.ValueColumn ELSE a.mui  END = a.mui
 inner join  [fnCSVStr2Table] (@size ) f on  CASE WHEN f.ValueColumn  &lt;&gt; 'ALL' AND f.ValueColumn IS NOT NULL 
THEN f.ValueColumn ELSE a.Volumn  END = a.Volumn
            where a.type ='Y'
 group by a.Itemcode, a.Itemname 
                                                   ">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="EBrand" Name="Brand" PropertyName="Value" Type="String" />
                                                            <asp:ControlParameter ControlID="ENhan2" Name="Nhan" PropertyName="Value" Type="String" />
                                                              <asp:ControlParameter ControlID="ASPxSize" Name="size" PropertyName="Value" Type="String" />
                                                              <asp:ControlParameter ControlID="ASPmui" Name="mui" PropertyName="Value" Type="String" />
                                                        </SelectParameters>
                                                 

                                                    </asp:SqlDataSource>
                                                     <asp:SqlDataSource ID="Sqlloai" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="                                                
                                                    SELECT * FROM tbbLoai  where type ='X' ">
                                                      
                                                    </asp:SqlDataSource>
                                                     <asp:SqlDataSource ID="SqlloaiKM" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="                                                
                                                    SELECT * FROM tbbLoai  where type ='KM' ">
                                                      
                                                    </asp:SqlDataSource>
                                                    <div style="text-align: right; padding: 2px">
                                                        <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                            runat="server"></dx:ASPxGridViewTemplateReplacement>
                                                        <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                            runat="server"></dx:ASPxGridViewTemplateReplacement>
                                                    </div>


                                                </EditForm>
                                            </Templates>
                                        </dx:ASPxGridView>
                                        
                                        <asp:SqlDataSource ID="Sqls" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" DeleteCommand="DELETE FROM [tbdtKhuyenmai] WHERE id = @ID " InsertCommand="INSERT INTO [tbdtKhuyenmai] ([MS_CTKM], [Brand], [Nhan], [Mui], [Size], [MaSP], [Users], [dates],Loai,LoaiMua,Value,LoaiMua1,Value1,LoaiKM,Valuekm) VALUES (@MS_CTKM, @Brand, @Nhan, @Mui, @Size, @MaSP,  @Users, getdate(),@Loai,left(@LoaiMua,1),@Value,left(@LoaiMua1,1),@Value1,left(@LoaiKM,1),@Valuekm)" SelectCommand="SELECT * FROM [tbdtKhuyenmai] where ([MS_CTKM] = @MS_CTKM)" UpdateCommand="UPDATE [tbdtKhuyenmai] SET   [Brand] = @Brand, [Nhan] = @Nhan, [Mui] = @Mui, [Size] = @Size, [MaSP] = @MaSP,  [Users] = @Users, [dates] = getdate(),loai=@Loai,LoaiMua=left(@LoaiMua,1),Value=@value,LoaiMua1=left(@LoaiMua1,1),Value1=@Value1,LoaiKM=left(@LoaiKM,1),Valuekm =@Valuekm WHERE  Id=@ID">
                                            <DeleteParameters>
                                                <asp:Parameter Name="ID" Type="String" />
                                            </DeleteParameters>
                                            <SelectParameters>
                                                <asp:SessionParameter Name="MS_CTKM" SessionField="MaCT" Type="string" />
                                            </SelectParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="MS_CTKM" Type="String" />
                                                <asp:Parameter Name="Brand" Type="String" />
                                                <asp:Parameter Name="Nhan" Type="String" />
                                                <asp:Parameter Name="Mui" Type="String" />
                                                <asp:Parameter Name="Size" Type="String" />
                                                <asp:Parameter Name="MaSP" Type="String" />
                                                  <asp:Parameter Name="Loai" Type="String" />
                                                <asp:Parameter Name="Loaimua" Type="String" />
                                                <asp:Parameter Name="Loaikm" Type="String" />
                                                <asp:Parameter Name="Valuekm" Type="Double" />
                                                   <asp:Parameter Name="Value" Type="Double" />
                                                    <asp:Parameter Name="Loaimua1" Type="String" />
                                                 <asp:Parameter Name="Value1" Type="Double" />
                                                <asp:SessionParameter Name="Users" SessionField="TenDangNhap"  Type="String" />
                                                
                                            </InsertParameters>
                                            <UpdateParameters>

                                                <asp:Parameter Name="Brand" Type="String" />
                                                <asp:Parameter Name="Nhan" Type="String" />
                                                <asp:Parameter Name="Mui" Type="String" />
                                                <asp:Parameter Name="Size" Type="String" />
                                                <asp:Parameter Name="MaSP" Type="String" />
                                               <asp:Parameter Name="Loai" Type="String" />
                                                <asp:Parameter Name="Loaimua" Type="String" />
                                                <asp:Parameter Name="Loaikm" Type="String" />
                                                <asp:Parameter Name="Valuekm" Type="Double" />
                                                   <asp:Parameter Name="Value" Type="Double" />
                                               <asp:Parameter Name="Loaimua1" Type="String" />
                                                 <asp:Parameter Name="Value1" Type="Double" />
                                                <asp:SessionParameter Name="Users" SessionField="TenDangNhap"  Type="String" />
                                               
                                               <%-- <asp:Parameter Name="MS_CTKM" Type="String" />--%>
                                                <asp:Parameter Name="ID" Type="String" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            
                            <dx:TabPage Text="Quy đổi sản phẩm" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl ID="qd" runat="server">
                                                       Tên Chương trình: <b>
                    <%# Eval("TenCT")%></b> 
                <br />
                <br />

                                        <dx:ASPxGridView ID="ASPxGridqd" Enabled='<%#Convert.ToBoolean(Eval("lock_Pro"))%>' runat="server" AutoGenerateColumns="False" DataSourceID="Sqlqd" KeyFieldName="ID" OnBeforePerformDataSelect="Girlqd_DataSelect" OnInitNewRow="Girlqd_InitNewRow" Width="95%">
                                            <Columns>
                                                <dx:GridViewCommandColumn VisibleIndex="0">
                                                    <EditButton Visible="True">
                                                    </EditButton>
                                                    <NewButton Visible="True">
                                                    </NewButton>
                                                    <DeleteButton Visible="True">
                                                    </DeleteButton>
                                                    <ClearFilterButton Visible="True">
                                                    </ClearFilterButton>
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MS_CTKM" VisibleIndex="2" Caption ="Mã Chương Trình">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Nhan" VisibleIndex="3" Caption="Nhóm hàng">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Size" VisibleIndex="4"  Caption ="Trọng lượng">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MaSP" VisibleIndex="5" Caption=" mã sản phẩm">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="SL" VisibleIndex="6" Caption="số lượng quy đổi">
                                                </dx:GridViewDataTextColumn>
                                                

                                            </Columns>
                                            
                                            <Settings ShowPreview="True" />
                                            <Templates>
                                                <EditForm>
                                                    <table class="OptionsTable" style="width: 100%">
                                                        <tr>
                                                            <td style="width: 20%">Mã Chương Trình </td>
                                                            <td>
                                                                <dx:ASPxTextBox runat="server" ID="eMS_CTKM" Text='<%# Bind("MS_CTKM")%>' Width="100%">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Nhãn Hàng
                                                            </td>
                                                            <td>
                                                                <dx:ASPxDropDownEdit ID="ENhan1" AutoPostBack="true" runat="server" AnimationType="None" Text='<%# Bind("Nhan")%>' ClientInstanceName="checkComboBox" Width="100%" Rows="20">
                                                                    <DropDownWindowTemplate>
                                                                        <dx:ASPxListBox ID="listBox" runat="server" DataSourceID="SqlDataSource2" ClientInstanceName="checkListBox" SelectionMode="CheckColumn" Width="100%">
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />

                                                                            <Columns>
                                                                                <dx:ListBoxColumn FieldName="Nhan" Width="100px" />

                                                                            </Columns>

                                                                            <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged" />
                                                                        </dx:ASPxListBox>

                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="padding: 4px">
                                                                                    <dx:ASPxButton ID="ASPxButton" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
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

                                                            </td>
                                                        </tr>
                                                        
                                                        <tr>
                                                            <td>Trọng lượng
                                                            </td>
                                                            <td>
                                                                <dx:ASPxDropDownEdit ID="Size" AutoPostBack="true" runat="server" AnimationType="None" Text='<%# Bind("Size")%>' ClientInstanceName="checkComboBox6" Width="100%" Rows="20"  >
                                                                    <DropDownWindowTemplate>
                                                                        <dx:ASPxListBox ID="listBox" runat="server" DataSourceID="Sqlsize" ClientInstanceName="checkListBox6" SelectionMode="CheckColumn" Width="100%">
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />

                                                                            <Columns>
                                                                                <dx:ListBoxColumn FieldName="Size" Width="100px" />

                                                                            </Columns>

                                                                            <ClientSideEvents SelectedIndexChanged= "OnListBoxSelectionChanged6"   />
                                                                        </dx:ASPxListBox>

                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="padding: 4px">
                                                                                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
                                                                                        <ClientSideEvents Click="function(s, e){ checkComboBox6.HideDropDown(); }" />
                                                                                    </dx:ASPxButton>

                                                                                </td>
                                                                            </tr>
                                                                        </table>


                                                                    </DropDownWindowTemplate>
                                                                    <ClientSideEvents DropDown="SynchronizeListBoxValues6" TextChanged="SynchronizeListBoxValues" />
                                                                    <DropDownWindowStyle BackColor="#EDEDED">
                                                                    </DropDownWindowStyle>
                                                                </dx:ASPxDropDownEdit>

                                                            </td>
                                                        </tr>
                                                         
                                                        <tr>
                                                            <td>Sản Phẩm </td>
                                                            <td>
                                                                
              <%--<dx:ASPxGridLookup ID="GridLookup" runat="server"    Text='<%# Bind("MaSP")%>'   SelectionMode="Multiple" DataSourceID="SqlDataSource4" ClientInstanceName="gridLookup"
                            KeyFieldName="Itemcode" Width="100%" TextFormatString="{0}" MultiTextSeparator=";"   Caption="Mã chương trình">
                            <Columns>
                                <dx:GridViewDataColumn FieldName="Itemcode" Width="30%" />
                           <dx:GridViewDataColumn FieldName="Itemname" Width="100%" />
                             </Columns>
                            <GridViewProperties SettingsPager-Mode="ShowPager" SettingsBehavior-ColumnResizeMode="Control">
                                 
                                <Templates>
                                    <StatusBar>
                                        <table  class="OptionsTable" style="float: right">
                                            <tr>
                                                <td>
                                                    <dx:ASPxButton ID="Close" runat="server" AutoPostBack="false" Text="Close" ClientSideEvents-Click="CloseGridLookup" />
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="clear" runat="server" AutoPostBack="false" Text="Clear" ClientSideEvents-Click="ClearGridLookup" />
                                                </td>
                                                 
                                            </tr>
                                        </table>
                                    </StatusBar>
                                </Templates>
                                  <Settings ShowFilterRow="True" ShowStatusBar="Visible" />
                            </GridViewProperties>
                        </dx:ASPxGridLookup>--%>
                                                                <dx:ASPxDropDownEdit ID="ASPxDropDownEdit1" AutoPostBack="true" runat="server" AnimationType="None" Text='<%# Bind("MaSP")%>' ClientInstanceName="checkComboBox2"  Width="100%" Rows="20">
                                                                    <DropDownWindowTemplate>
                                                                        <dx:ASPxListBox ID="listBox" runat="server" DataSourceID="SqlDataSource4"
                                                                            ClientInstanceName="checkListBox2" SelectionMode="CheckColumn" Width="100%" >
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />

                                                                            <Columns>
                                                                                <dx:ListBoxColumn FieldName="Itemcode" Width="100px" />
                                                                           
                                                                            </Columns>

                                                                            <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged2" />
                                                                        </dx:ASPxListBox>

                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="padding: 4px">
                                                                                    <dx:ASPxButton ID="ASPxButton" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
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
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 20%">Số lượng   </td>
                                                            <td>
                                                                <dx:ASPxTextBox runat="server" ID="ASPxTextBox1" Text='<%# Bind("SL")%>' Width="100px"  >
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        
                                                    </table>
                                                    
                                                     

                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
                                                  
     Select 'ALL' as Nhan 
                                                     union all
                                                    SELECT Nhan FROM [tbItems] a 
                                                    where nhan <> '' GROUP bY  [nhan] order by nhan
                                                      
                                                   ">
                                                      
                                                    </asp:SqlDataSource>
                                                   
                                                     <asp:SqlDataSource ID="Sqlsize" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
                                 Select 'ALL' as Size 
                                                    
                                  union all                  
                               SELECT CONVERT (nvarchar, a.Volumn) AS volumn FROM tbItems AS a   INNER JOIN dbo.fnCSVStr2Table(@Nhan) AS c ON CASE WHEN c.ValueColumn &lt;&gt; 'ALL' AND c.ValueColumn IS NOT NULL THEN c.ValueColumn ELSE a.Nhan END = a.Nhan GROUP BY a.Volumn
                                                   
 
                                                   ">
                                                        <SelectParameters>
                                                       
                                                            <asp:ControlParameter ControlID="ENhan1" Name="Nhan" PropertyName="Value" Type="String" />
                                                        </SelectParameters>

                                                    </asp:SqlDataSource>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
                                  Select 'ALL' as Itemcode ,'Chon tất cả' as Itemname
                                                     union all                  
                                    SELECT a.Itemcode, a.Itemname FROM [tbItems] a   
 inner join  [fnCSVStr2Table] (@Nhan ) c on  CASE WHEN c.ValueColumn  &lt;&gt; 'ALL' AND c.ValueColumn IS NOT NULL 
THEN c.ValueColumn ELSE a.Nhan  END = a.nhan 
 
 inner join  [fnCSVStr2Table] (@size ) f on  CASE WHEN f.ValueColumn  &lt;&gt; 'ALL' AND f.ValueColumn IS NOT NULL 
THEN f.ValueColumn ELSE a.Volumn  END = a.Volumn
            where a.type ='Y'
 group by a.Itemcode, a.Itemname
                                                   ">
                                                        <SelectParameters>
                                                         
                                                            <asp:ControlParameter ControlID="ENhan1" Name="Nhan" PropertyName="Value" Type="String" />
                                                           <asp:ControlParameter ControlID="Size" Name="size" PropertyName="Value" Type="String" />
                                                    </SelectParameters>

                                                    </asp:SqlDataSource>
                                                    <div style="text-align: right; padding: 2px">
                                                        <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                            runat="server"></dx:ASPxGridViewTemplateReplacement>
                                                        <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                            runat="server"></dx:ASPxGridViewTemplateReplacement>
                                                    </div>


                                                </EditForm>
                                            </Templates>
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="Sqlqd" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" DeleteCommand="DELETE FROM [TbDQuydoi] WHERE  ID=@ID " InsertCommand="INSERT INTO [TbDQuydoi] ([MS_CTKM],[Nhan],[Size],[MaSP],[SL]) VALUES (@MS_CTKM,@Nhan,@Size,@MaSP,@SL)" SelectCommand="SELECT * FROM [TbDQuydoi] where ([MS_CTKM] = @MS_CTKM)" UpdateCommand="UPDATE [TbDQuydoi] SET  Nhan=@Nhan,Size=@Size,MaSP=@MaSP,SL=@SL WHERE  ID=@ID">
                                            <DeleteParameters>
                                                <asp:Parameter Name="ID" Type="String" />
                                                 
                                            </DeleteParameters>
                                            <SelectParameters>
                                                <asp:SessionParameter Name="MS_CTKM" SessionField="MaCT" Type="string" />
                                            </SelectParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="MS_CTKM" Type="String" />
                                               <asp:Parameter Name="Nhan" Type="String" />
                                             
                                                <asp:Parameter Name="Size" Type="String" />
                                                <asp:Parameter Name="MaSP" Type="String" />
                                                <asp:Parameter Name="SL" Type="Double"/>
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="ID" Type="String" />
                                                <asp:Parameter Name="MS_CTKM" Type="String" />
                                               <asp:Parameter Name="Nhan" Type="String" />
                                               <asp:Parameter Name="Size" Type="String" />
                                                <asp:Parameter Name="MaSP" Type="String" />
                                                <asp:Parameter Name="SL" Type="Double" />
                                            
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Nhà Phân Phối áp dụng" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl2" runat="server">
                                     Tên Chương trình: <b>  
                    <%# Eval("TenCT")%></b>  
                <%--<br />--%>
                <br />
                                        <dx:ASPxGridView ID="GirlNpp" Enabled='<%#Convert.ToBoolean(Eval("lock_Pro"))%>' runat="server" AutoGenerateColumns="False" DataSourceID="Sqlnpp" KeyFieldName="ID" OnBeforePerformDataSelect="GirlNpp_DataSelect" OnInitNewRow="GirlNpp_InitNewRow">
                                            <Columns>
                                                <dx:GridViewCommandColumn VisibleIndex="0">
                                                    <EditButton Visible="True">
                                                    </EditButton>
                                                    <NewButton Visible="True">
                                                    </NewButton>
                                                    <DeleteButton Visible="True">
                                                    </DeleteButton>
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MS_CTKM" VisibleIndex="2"  >
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Region" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Area" VisibleIndex="4">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Customer" VisibleIndex="5">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataCheckColumn  FieldName="Trangthai" VisibleIndex="6"   >

                                                </dx:GridViewDataCheckColumn>
                                            
                                            </Columns>
                                            <Settings ShowFilterRow="True" />
                                            <Templates>
                                                <EditForm>
                                                    <table class="OptionsTable" width="100%">
                                                        <tr>
                                                            <td rowspan="8">
                                                                <div class="pcmSideSpacer">
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" AssociatedControlID="tbEmail" Text="Mã Chương Trình:">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxTextBox runat="server" ID="eMS_CTKM" Text='<%# Bind("MS_CTKM")%>' Width="100%">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>

                                                            <td>
                                                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" AssociatedControlID="tbEmail" Text="Region:">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td>

                                                                <dx:ASPxDropDownEdit ID="tbRegion" runat="server" AnimationType="None" Text='<%# Bind("Region")%>' ClientInstanceName="checkComboBox" Width="100%">
                                                                    <DropDownWindowTemplate>
                                                                        <dx:ASPxListBox ID="listBox" runat="server" ClientInstanceName="checkListBox" SelectionMode="CheckColumn" Width="100%">
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />
                                                                            <Items>

                                                                                <dx:ListEditItem Text="ALL" Value="1" />
                                                                                <dx:ListEditItem Text="NORTH1" Value="2" />
                                                                                <dx:ListEditItem Text="NORTH2" Value="3" />
                                                                                <dx:ListEditItem Text="CENTRAL" Value="4" />
                                                                                <dx:ListEditItem Text="HCM" Value="5" />
                                                                                <dx:ListEditItem Text="MEKONG" Value="6" />
                                                                                <dx:ListEditItem Text="S-EAST" Value="7" />
                                                                                <dx:ListEditItem Text="OTHER DEBTOR" Value="8" />
                                                                            </Items>
                                                                            <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged" />
                                                                        </dx:ASPxListBox>
                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="padding: 4px">
                                                                                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
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

                                                            </td>


                                                        </tr>
                                                        <tr>

                                                            <td class="auto-style5">
                                                                <dx:ASPxLabel ID="ASPxLabel3" runat="server" AssociatedControlID="tbArea" Text="Area:">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td class="auto-style6">

                                                                <dx:ASPxDropDownEdit ID="tbArea" runat="server" AnimationType="None" Text='<%# Bind("Area")%>' ClientInstanceName="checkComboBox1" Width="100%">
                                                                    <DropDownWindowTemplate>
                                                                        <dx:ASPxListBox ID="listBox" runat="server" ClientInstanceName="checkListBox1" DataSourceID="SqlDataSource3" SelectionMode="CheckColumn" Width="100%">
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />
                                                                            <Columns>
                                                                                <dx:ListBoxColumn FieldName="Area" Width="100px" />
                                                                             
                                                                            </Columns>
                                                                            <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged1" />
                                                                        </dx:ASPxListBox>
                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="padding: 4px">
                                                                                    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="true" Style="float: right" Text="Close">
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

                                                            </td>


                                                        </tr>
                                                        <tr>
                                                            <td class="auto-style1">
                                                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" AssociatedControlID="tbCtus" Text="Custormer:">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxGridLookup ID="GridLookup" runat="server" SelectionMode="Multiple" DataSourceID="Sqlsss" ClientInstanceName="gridLookup" Text='<%# Bind("Customer")%>'
                                                                    KeyFieldName="Debcode" Width="100%" TextFormatString="{0}" MultiTextSeparator=";" Caption="Tên khách hàng">
                                                                    <Columns>

                                                                        <dx:GridViewDataColumn FieldName="Debcode" Width="100px" />
                                                                        <dx:GridViewDataColumn FieldName="Debname" Width="400px" />

                                                                    </Columns>
                                                                    <GridViewProperties SettingsPager-Mode="ShowPager" SettingsBehavior-ColumnResizeMode="Control">
                                                                        <Templates>
                                                                            <StatusBar>
                                                                                <table class="OptionsTable" style="float: right" width="500Px">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <dx:ASPxButton ID="Close" runat="server" AutoPostBack="false" Text="Close" ClientSideEvents-Click="CloseGridLookup" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <dx:ASPxButton ID="clear" runat="server" AutoPostBack="false" Text="Clear" ClientSideEvents-Click="ClearGridLookup" />
                                                                                        </td>

                                                                                    </tr>
                                                                                </table>
                                                                            </StatusBar>
                                                                        </Templates>
                                                                        <Settings ShowFilterRow="True" ShowStatusBar="Visible" />
                                                                    </GridViewProperties>
                                                                </dx:ASPxGridLookup>
                                                            </td>
                                                            <asp:SqlDataSource ID="Sqlsss" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT 'ALL' as Debcode, 'Select All' as Debname 
          Union all 
          
SELECT Debcode, Debname FROM tbCustomer a  inner join  [fnCSVStr2Table] (@Region) b
 on CASE WHEN b.ValueColumn &lt;&gt; 'ALL' AND b.ValueColumn IS NOT NULL   THEN b.ValueColumn ELSE a.Region END = a.Region
 inner join  [fnCSVStr2Table] (@Area ) c on 
  CASE WHEN c.ValueColumn  &lt;&gt; 'ALL' AND c.ValueColumn IS NOT NULL   THEN c.ValueColumn ELSE a.Area END = a.Area  where a.Activer =1

">
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="tbRegion" Name="Region" PropertyName="Value" Type="String" />
                                                                    <asp:ControlParameter ControlID="tbArea" Name="Area " PropertyName="Value" Type="String" />

                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                           
                                                        </tr>
                                                        <tr>

                                                            <td>
                                                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" AssociatedControlID="tbEmail" Text="Trạng thái">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxCheckBox runat="server" ID="trangthai1" Checked='<%# Bind("Trangthai")%>' Width="100%">
                                                                </dx:ASPxCheckBox>
                                                            </td>
                                                        </tr>
                                                    </table>


                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand=" 
          SELECT 'ALL' as Area 
Union all
SELECT Area FROM tbCustomer a  inner join  [fnCSVStr2Table] (@Region) b  on CASE WHEN b.ValueColumn &lt;&gt; 'ALL' AND b.ValueColumn IS NOT NULL   THEN b.ValueColumn ELSE a.Region END = a.Region where a.area &lt;&gt; '' and  a.area IS NOT NULL   group by Area
">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="tbRegion" Name="Region" PropertyName="Value" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>

                                                    <div style="text-align: right; padding: 2px">
                                                        <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                            runat="server"></dx:ASPxGridViewTemplateReplacement>
                                                        <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                            runat="server"></dx:ASPxGridViewTemplateReplacement>
                                                    </div>

                                                </EditForm>

                                            </Templates>
                                        </dx:ASPxGridView>

                                        <asp:SqlDataSource ID="Sqlnpp" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" DeleteCommand="DELETE FROM [tbdCtkmNPP] WHERE ID=@ID" InsertCommand="INSERT INTO [tbdCtkmNPP] ([MS_CTKM], [Region], [Area], [Customer], [Trangthai]) VALUES (@MS_CTKM, @Region, @Area, @Customer, @Trangthai)" SelectCommand="SELECT * FROM [tbdCtkmNPP] WHERE MS_CTKM =@MS_CTKM" UpdateCommand="UPDATE [tbdCtkmNPP] SET  [Region] = @Region, [Area] = @Area, [Customer] = @Customer,[MS_CTKM] = @MS_CTKM , [Trangthai] = @Trangthai WHERE  [ID] = @ID  " OldValuesParameterFormatString="original_{0}">
                                            <DeleteParameters>
                                              <asp:Parameter Name="ID" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="MS_CTKM" Type="String" />
                                                <asp:Parameter Name="Region" Type="String" />
                                                <asp:Parameter Name="Area" Type="String" />
                                                <asp:Parameter Name="Customer" Type="String" />
                                                <asp:Parameter Name="Trangthai" Type="Boolean" />
                                            </InsertParameters>
                                            <SelectParameters>
                                                <asp:SessionParameter Name="MS_CTKM" SessionField="MaCT" Type="string" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="ID" Type="Int32" />
                                                <asp:Parameter Name="Region" Type="String" />
                                                <asp:Parameter Name="Area" Type="String" />
                                                <asp:Parameter Name="Customer" Type="String" />
                                                <asp:Parameter Name="MS_CTKM" Type="String" />
                                                <asp:Parameter Name="Trangthai" Type="Boolean" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>

                                        
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>
               <%-- </div>--%>
              
    
                <div style="text-align: right; padding: 2px 2px 2px 2px">
                    <table style="text-align: right; ">
                        <tr>
                            <td style='<%#If(([Boolean].Parse(Convert.ToBoolean(Eval("lock_Pro")).ToString())), " ", "display:none") %> ' >
                                <dx:ASPxGridViewTemplateReplacement    ID="UpdateButton" ReplacementType="EditFormUpdateButton" 
                                    runat="server"></dx:ASPxGridViewTemplateReplacement>
                            </td>
                            <td>
                                <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                    runat="server"></dx:ASPxGridViewTemplateReplacement>
                            </td>
                           
                        </tr>
                    </table>


              <%--  </div>--%>

            </EditForm>
        </Templates>
        <Settings ShowFilterRow="True" ShowFilterBar="Auto" />
        <Styles>
            <AlternatingRow Enabled="true" />
            <SelectedRow BackColor="#0099CC">
            </SelectedRow>
        </Styles>
    </dx:ASPxGridView>
  <dx:ASPxPopupControl ID="pcCreateAccount" ClientInstanceName="pcCreateAccount" runat="server" AllowDragging="True"
        PopupHorizontalAlign="WindowCenter" HeaderText="Thông tin chương trình khuyến mãi" PopupVerticalAlign="WindowCenter">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <dx:ASPxCallbackPanel ID="callbackPanel" ClientInstanceName="callbackPanel" runat="server"
                    Width="320px" Height="100px"   RenderMode="Table">
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent1" runat="server">
                            <table>
                                <tr>
                                    <td>Mã chương trình nguồn</td><td><dx:ASPxTextBox runat="server" ID="fMS_CTKM"   Width="100%"></dx:ASPxTextBox></td>
                                </tr>
                                   <tr>
                                    <td>Mã chương trình đích</td><td><dx:ASPxTextBox runat="server" ID="tMS_CTKM"   Width="100%"></dx:ASPxTextBox></td>
                                </tr>
                                 <tr>
                                    <td>Ngày băt đầu</td><td><dx:ASPxDateEdit ID="nbatdau" runat="server" Width= "100px"  Height ="100%"  >
                    </dx:ASPxDateEdit> </td>
                                </tr>
                                 <tr>
                                    <td>Ngày kết thúc </td><td> <dx:ASPxDateEdit ID="nketthuc" runat="server" Width= "100px"  Height ="100%"  >
                    </dx:ASPxDateEdit></td>
                                </tr>
                                <tr>
                                        <td colspan="2">
                                            <div class="pcmButton">
                                                <dx:ASPxButton ID="btCreate"   runat="server" Text="OK" Width="80px" AutoPostBack="False" OnClick ="btCreate_Click" Style="float: left; margin-right: 8px">
   <ClientSideEvents Click="function(s, e) { 
                    pcCreateAccount.Hide();
            } " />
                                                </dx:ASPxButton>
                                                <dx:ASPxButton ID="btCancel2" runat="server" Text="Cancel" Width="80px" AutoPostBack="False" Style="float: left; margin-right: 8px">
                                                    <ClientSideEvents Click="function(s, e) { pcCreateAccount.Hide(); }" />
                                                </dx:ASPxButton>
                                            </div>
                                        </td>
                                    </tr>
                            </table>
       

                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <ClientSideEvents Shown="popup_Shown" />
    </dx:ASPxPopupControl> 

     <dx:ASPxPopupControl ID="pcCreateAccount1" ClientInstanceName="pcCreateAccount1" runat="server" AllowDragging="True"
        PopupHorizontalAlign="WindowCenter" HeaderText="Thông tin chương trình khuyến mãi mới" PopupVerticalAlign="WindowCenter" Width="600px">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" ClientInstanceName="callbackPanel" runat="server"
                    Width="100%" Height="300px"   RenderMode="Table">
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent2" runat="server">
                            <table  id="form" width="100%">
                                <tr>
                                    <td style="width:100px">Mã chương trình  </td><td ><dx:ASPxTextBox runat="server" NullText="Nhập mã chương trình KM"  ID="MaCT"   Width="160px"></dx:ASPxTextBox></td>
                                </tr>
                                   <tr>
                                       <td>Tên chương trình </td>
                                       <td>
                                           <dx:ASPxMemo runat="server" NullText="Nhập tên chương trình KM" ID="TenCTs" Width="100%" Height="60px"></dx:ASPxMemo>
                                       </td>
                                   </tr>
                                <tr>
                                    <td>Nhóm Sản Phẩm </td>
                                    <td>
                                     <dx:ASPxComboBox  ID="NhanSPx" runat="server"  DropDownStyle="DropDown"  Width="160px">
                                         
                                         <Items>
                                             <dx:ListEditItem Text="ALL" Value="1" />
                                             <dx:ListEditItem Text="BIOESSENCE" Value="2" />
                                             <dx:ListEditItem Text="ROMANO" Value="5" />
                                             
                                             <dx:ListEditItem Text="ENCHANTEUR" Value="7" />
                                             <dx:ListEditItem Text="EVERSOFT" Value="8" />
                                             <dx:ListEditItem Text="GERVENNE" Value="9" />
                                             <dx:ListEditItem Text="IZZI" Value="10" />
                                              <dx:ListEditItem Text="CARRIE JUNIOR" Value="11" />
                                                                                <dx:ListEditItem Text="MAXKLEEN" Value="12" />
                                                                                    <dx:ListEditItem Text="DASHING" Value="13" />
                                         </Items>
                                         
                                     </dx:ASPxComboBox>
                                            <%--<dx:ASPxTextBox runat="server" ID="NhanSP" NullText="Nhập nhóm sản phẩm áp dụng"  Width="160px"></dx:ASPxTextBox>--%>
                                    </td>
                                  </tr>
                                <tr>
                                    <td>Loại chương trình </td>
                                    <td>
                                        <dx:ASPxComboBox runat="server" ID="LoaiCT" NullText="Nhập loại chương trình khuyến mãi" Width="160px" FieldName="LoaiCT" VisibleIndex="5"
                                            DropDownStyle="DropDown">
                                            <Items>
                                                <dx:ListEditItem Text="KM Trực Tiếp" Value="KMTT" />
                                                <dx:ListEditItem Text="KM Tặng Thêm" Value="KMTS" />
                                                <dx:ListEditItem Text="KM ComBo" Value="COMB" />
                                                <dx:ListEditItem Text="KM Tặng Thêm ComBo" Value="COMT" />
                                                <dx:ListEditItem Text="KM Chiết Khấu" Value="KMCK" />
                                                <dx:ListEditItem Text="KM Chiết Khấu Trước KM" Value="CKTR" />
                                                <dx:ListEditItem Text="KM Trưng Bày" Value="KMTB" />
                                                <dx:ListEditItem Text="KM Tích Lũy" Value="KMTL" />
                                                <dx:ListEditItem Text="KM Khuyến Dùng" Value="KMKD" />
                                            </Items>

                                        </dx:ASPxComboBox>
                                    </td>
                                  </tr>
                                <tr>
                                    <td>Tỷ Lệ CK </td>
                                    <td>
                                        <dx:ASPxTextBox ID="TyleCKS" runat="server" Width="160" NullText="Nhập tỷ lệ chương trình KM" >
                                         <MaskSettings Mask="<0..99g>.<00..99>%" IncludeLiterals="DecimalSymbol" />
                                         <ValidationSettings ErrorDisplayMode="ImageWithTooltip" />
                                         
                                     </dx:ASPxTextBox>
                                         <%--<dx:ASPxSpinEdit ID="TyleCKS" runat="server" Width="160px" DisplayFormatString="C" NullText="Nhập tỷ lệ chương trình KM" ></dx:ASPxSpinEdit>--%>
                                       <%-- <dx:ASPxTextBox runat="server" ID="TyleCKs" Width="160px"></dx:ASPxTextBox>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Từ Ngày </td>
                                    <td>
                                        <dx:ASPxDateEdit runat="server" ID="Ngaybd" Width="160px"></dx:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Đến Ngày </td>
                                    <td>
                                        <dx:ASPxDateEdit runat="server" ID="Ngaykts" Width="160px"></dx:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Không Áp CTKM </td>
                                    <td>
                                         <dx:ASPxGridLookup ID="khongapdungs" runat="server"  Width="160px"   SelectionMode="Multiple" DataSourceID="Sqlctkm" ClientInstanceName="gridLookup"
                            KeyFieldName="MaCT"   TextFormatString="{0}" MultiTextSeparator=";"   >
                            <Columns>
                                <dx:GridViewDataColumn FieldName="MaCT" Width="100%" />
                          
                             </Columns>
                            <GridViewProperties SettingsPager-Mode="ShowPager" SettingsBehavior-ColumnResizeMode="Control">
                                 
                                <Templates>
                                    <StatusBar>
                                        <table  class="OptionsTable" style="float: right">
                                            <tr>
                                                <td>
                                                    <dx:ASPxButton ID="Close" runat="server" AutoPostBack="false" Text="Close" ClientSideEvents-Click="CloseGridLookup" />
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="clear" runat="server" AutoPostBack="false" Text="Clear" ClientSideEvents-Click="ClearGridLookup" />
                                                </td>
                                                 
                                            </tr>
                                        </table>
                                    </StatusBar>
                                </Templates>
                                  <Settings ShowFilterRow="True" ShowStatusBar="Visible" />
                            </GridViewProperties>
                        </dx:ASPxGridLookup>
                                        <%--<dx:ASPxTextBox runat="server" ID="khongapdung" NullText="Nhập CTKM không áp dụng" ToolTip= "Nhập CTKM không áp dụng chung hoặc All nếu không áp bất kỳ"  Width="160px"></dx:ASPxTextBox>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Ngân Sách</td>
                                    <td>
                                          <%--<dx:ASPxSpinEdit ID="Ngansachs" runat="server" Width="160px" DisplayFormatString="C" NullText="Nhập ngân sách "  ToolTip="Nếu ngân sách 30% doanh số thì nhập 30"></dx:ASPxSpinEdit>--%>
                                     <dx:ASPxTextBox ID="Ngansachs" runat="server" Width="160">
                                         <MaskSettings Mask="<0..9999999999>.<00..99>" IncludeLiterals="DecimalSymbol" />
                                         <ValidationSettings ErrorDisplayMode="ImageWithTooltip" />
                                         
                                     </dx:ASPxTextBox>
                                        <%--<dx:ASPxTextBox runat="server" ID="Ngansachs" Width="160px"></dx:ASPxTextBox>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Loại</td>
                                    <td>
                                        <dx:ASPxComboBox runat="server" ID="Loai" Width="160px"  NullText="Nhập loai áp dụng npp" ToolTip="ALL nếu áp dụng tất cả, select Npp: tùy chọn npp"   DropDownStyle="DropDown">
                                            <Items>
                                                <dx:ListEditItem Text="ALL NPP" Value="N" />
                                                <dx:ListEditItem Text="Select NPP" Value="E" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                        <td colspan="2">
                                            <div class="pcmButton">
                                                <dx:ASPxButton ID="ASPxSV"   runat="server" Text="OK" Width="80px" AutoPostBack="False"   Style="float: left; margin-right: 8px">
  <ClientSideEvents Click="function(s, e) { pcCreateAccount1.Hide(); }" /> 
                                                </dx:ASPxButton>
                                                <dx:ASPxButton ID="ASPxBC" runat="server" Text="Cancel" Width="80px" AutoPostBack="False" Style="float: left; margin-right: 8px">
                                                    <ClientSideEvents Click="function(s, e) { pcCreateAccount1.Hide(); }" />
                                                </dx:ASPxButton>
                                            </div>
                                        </td>
                                    </tr>
                            </table>
       

                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <ClientSideEvents Shown="popup_Shown" />
    </dx:ASPxPopupControl> 

      

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Debcode, Debname, Debadd, Region, Subregion, Area, Province FROM dbo.Fn_cust(@uname) AS Fn_cust_1">
        <SelectParameters>
            <asp:SessionParameter Name="uname" SessionField="TenDangNhap" />
        </SelectParameters>
    </asp:SqlDataSource>
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Debcode, Debname, Debadd, Region, Subregion, Area, Province FROM dbo.Fn_cust(@uname) AS Fn_cust_1">
        <SelectParameters>
            <asp:SessionParameter Name="uname" SessionField="TenDangNhap" />
        </SelectParameters>
    </asp:SqlDataSource>
     <asp:SqlDataSource ID="Sqlctkm" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" DeleteCommand="DELETE FROM tbCTKM WHERE (ID = @ID)" SelectCommand="select DISTINCT b.* ,case when a.lock_Pro ='N' then 1 else 0 end as lock_Pro,s.Mact , case when s.Mact is null Then 'A' when   b.tyleck &lt;&gt; s.tyleck  or b.tenct &lt;&gt; CAST(s.tenct as nvarchar(800)) or b.nhansp &lt;&gt; s.nhansp  or b.Ngaybd &lt;&gt; s.Ngaybd  or b.ngaykt &lt;&gt; s.ngaykt then 'R' else 'C' end status from tbCTKM b

left join  [tbPeriod] a   on 
 (b.Ngaybd&lt;=a.datefrom and b.ngaykt&gt;=a.dateto and  a.lock_pro='N')  or (b.Ngaybd &gt; a.datefrom  and b.ngaybd&lt;= a.dateto and  a.lock_pro='N') or (b.Ngaykt &gt; a.datefrom and b.ngaykt&lt;a.dateto and  a.lock_pro='N') 
left join  [UZA]...UnCTKM s on  rtrim(ltrim(s.mact)) collate SQL_Latin1_General_CP1_CI_AS = b.mact 

where (b.Ngaybd&lt;=@date1 and b.ngaykt&gt;=@date2)  or (b.Ngaybd &gt;  @date1 and b.ngaybd&lt;= @date2) or (b.Ngaykt &gt;  @date1 and b.ngaykt&lt; @date2)" UpdateCommand="UPDATE [tbCTKM] SET  [TenCT] =CAST(@TenCT as nvarchar(800)) , [NhanSP] = @NhanSP, [LoaiCT] = @LoaiCT, [TyleCK] = @TyleCK, [Ngaybd] = @Ngaybd, [Ngaykt] = @Ngaykt, [Type] = @Type, [Ngansach] = @Ngansach, [SoluongSKu] = 0, [khongapdung] = @khongapdung, [Users] = @Users, [dates] =Getdate() WHERE ID = @ID">
                              <DeleteParameters>
                        <asp:Parameter Name="ID" />
                    </DeleteParameters>
         <SelectParameters>
            <asp:ControlParameter ControlID="datest" Name="date1" PropertyName="Value" />
            <asp:ControlParameter ControlID="dateen" Name="date2" PropertyName="Value" />
        </SelectParameters>
                    <UpdateParameters>
             
                        <asp:Parameter Name="TenCT" Type="String" />
                        <asp:Parameter Name="NhanSP" Type="String" />
                        <asp:Parameter Name="LoaiCT" Type="String" />
                        <asp:Parameter Name="TyleCK" Type="Single" />
                        <asp:Parameter Name="Ngaybd" Type="DateTime" />
                        <asp:Parameter Name="Ngaykt" Type="DateTime" />
                        <asp:Parameter Name="Type" Type="String" />
                        <asp:Parameter Name="Ngansach" Type="Double" />
                       
                        <asp:Parameter Name="khongapdung" Type="String" />
                     <asp:SessionParameter Name="Users" SessionField="TenDangNhap" />
                     
                        <asp:Parameter Name="ID" />
                    </UpdateParameters>
                </asp:SqlDataSource>

</asp:Content>