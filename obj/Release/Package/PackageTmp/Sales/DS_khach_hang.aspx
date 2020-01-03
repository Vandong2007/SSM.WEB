<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="DS_khach_hang.aspx.vb" Inherits="WEB.SSM.DS_khach_hang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
    //function CloseGridLookup() {
    //    gridLookup.ConfirmCurrentSelection();
    //    gridLookup.HideDropDown();
    //    gridLookup.Focus();
    //}
    //function ClearGridLookup() {
    //    var grid = gridLookup.GetGridView();
    //    grid.UnselectRows();
    //}
    //function GroupSelectAll() {
    //    var grid = gridLookup.GetGridView();
    //    grid.GroupSelectAll();

    //}

    function CloseGridLookup() {
        gridLookup.ConfirmCurrentSelection();
        gridLookup.HideDropDown();
        gridLookup.Focus();
    }
    function ClearGridLookup() {
        var grid = gridLookup.GetGridView();
        grid.UnselectRows();
    }
    function GroupSelectAll() {
        var grid = gridLookup.GetGridView();
        grid.GroupSelectAll();

    }

    function CloseGridLookup() {
        gridLookup.ConfirmCurrentSelection();
        gridLookup.HideDropDown();
        gridLookup.Focus();
    }
    function ClearGridLookup() {
        var grid = gridLookup.GetGridView();
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
    function ShowCreateAccountWindow() {
        pcCreateAccount.Show();
     
        checkComboBox.SetText("ALL");
        checkComboBox1.SetText("ALL");
        checkComboBox2.SetText("ALL");
        checkComboBox3.SetText("ALL");
        checkComboBox4.SetText("ALL");
        checkComboBox6.SetText("ALL");
        checkComboBox.Focus();
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

    </script>

   
    
    <div>
        <h2>Doanh số theo khách hàng</h2>

        <hr />
            <table style="width: 100%"  frame="below" >
            <tr>
                
                <td  Width= "100px" > Từ Ngày</td>
                <td > <dx:ASPxDateEdit ID="datest" runat="server" Width= "100%"  Height ="100%"   >
                    </dx:ASPxDateEdit></td>
                <td  Width= "100px" > <a> Đến Ngày</a></td>
                <td>
                    <dx:ASPxDateEdit ID="dateen" runat="server" Width= "100%" Height ="100%"  >
                        <ButtonStyle>
                            <Paddings PaddingLeft="1px" />
                        </ButtonStyle>
                    </dx:ASPxDateEdit>
                </td>
                 
                    
                <td>
                    <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export Select" Width="100%" UseSubmitBehavior="False" OnClick="btnXlsxExport_Click"  Image-Url="~/Content/Images/excel.png" />
                    
                </td>
                <td>

                    &nbsp;</td>
                <td></td>
                </tr>
                <tr>
                 <td  Width= "100px" >
                        <a>Chọn Region</a>
                    </td>
                <td colspan="2">
                        <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" NullText="Chọn Region" DataSourceID="SqlDataSource2" TextField="Region" ValueField="Region" Height="29px" Width="100%">
                            <Columns>
                                <dx:ListBoxColumn FieldName="Region" />
                            </Columns>
                        </dx:ASPxComboBox>
                    </td>
             
                       <td>
                    <dx:ASPxButton ID="Btok" runat="server" Text="Lấy số" Width="100%"   >
                        <Image Url="~/Content/Images/oks.png">
                        </Image>
                    </dx:ASPxButton>
                         </td>
                    <td colspan="3">
                    <%--    pcCreateAccount.Show(); --%>
                        <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Tùy chọn sản phẩm" Width="100%"  >
                              <ClientSideEvents Click="function(s, e) { ShowCreateAccountWindow(); }" />
                        <Image Url="~/Content/Images/oks.png">
                        </Image>
                    </dx:ASPxButton>
                    </td>
                </tr>
                <tr>
                    <td>
                       
                    </td>
                   
                   
                </tr>
        </table>
     <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="ASPxPivotGrid1">
                    </dx:ASPxPivotGridExporter>
          
        <hr /><%--DataSourceID="SqlDataSource1"--%>
         <%--oncustomsummary="ASPxPivotGrid1_CustomSummary"--%>
        <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID"  oncustomsummary="ASPxPivotGrid1_CustomSummary" >
            <Fields>
                <dx:PivotGridField ID="fieldMaNPP" Area="RowArea" AreaIndex="1" FieldName="MaNPP" Caption ="Mã Npp"    >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTenNPP" Area="RowArea" AreaIndex="2" FieldName="TenNPP" Caption="Tên Nhà Phân Phối">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldRegion" Area="RowArea" AreaIndex="0" FieldName="Region">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMaKH" AreaIndex="0" FieldName="MaKH"  Caption="Mã KH" >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTenKH" AreaIndex="1" FieldName="TenKH" Caption="Tên Khách Hàng"   >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMaNV" AreaIndex="3" FieldName="MaNV" Area="RowArea" Caption="Mã Nhân Viên">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldHoten" AreaIndex="4" FieldName="Hoten" Area="RowArea" Caption ="Tên Nhân Viên">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldSldh" AreaIndex="1" FieldName="Sldh" Area="DataArea" CellFormat-FormatType="Custom"
                     CellFormat-FormatString ="#,###.##" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###.##" Caption ="SL Đơn Hàng">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldSLHB" AreaIndex="2" FieldName="SLHB" Area="DataArea" CellFormat-FormatType="Custom"
                     CellFormat-FormatString ="#,###.##" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###.##" Caption ="Số Lượng">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldThanhtien" AreaIndex="3" FieldName="Thanhtien" Area="DataArea" CellFormat-FormatType="Custom"
                     CellFormat-FormatString ="#,###.##" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###.##" Caption="Thành Tiền">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldSLKM" AreaIndex="4" FieldName="SLKM" Area="DataArea" CellFormat-FormatType="Custom"
                     CellFormat-FormatString ="#,###.##" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###.##" Caption="SL KM">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldKhuyenmai" Area="DataArea" AreaIndex="5" FieldName="Khuyenmai" CellFormat-FormatType="Custom"
                     CellFormat-FormatString ="#,###.##" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" Caption ="Khuyến Mãi">
                </dx:PivotGridField>
 
                <dx:PivotGridField ID="fieldmakhh" Area="DataArea" AreaIndex="0" Caption="Số lượng KH" FieldName="makhh" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" SummaryType="Custom" TotalsVisibility="CustomTotals" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom">
                </dx:PivotGridField>
 
                <dx:PivotGridField ID="fieldThang" Area="ColumnArea" AreaIndex="0" Caption="Tháng" FieldName="thang">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldnam" AreaIndex="2" Caption="Năm" FieldName="nam">
                </dx:PivotGridField>
 
            </Fields>
            <OptionsPager RowsPerPage="100" ShowDefaultImages="False">
            </OptionsPager>
        </dx:ASPxPivotGrid>
        <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="WebDoanhsoKH" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ASPxComboBox1" Name="re" PropertyName="Value" Type="String" />
                <asp:SessionParameter Name="Username" SessionField="TenDangNhap" Type="String" />
                <asp:ControlParameter ControlID="datest" Name="TuNgay" PropertyName="Value" Type="DateTime" />
                <asp:ControlParameter ControlID="dateen" Name="DenNgay" PropertyName="Value" Type="DateTime" />
                <asp:SessionParameter Name="Brand" SessionField="Brand" Type="String" /> 
               <asp:SessionParameter Name="Nhan" SessionField="Nhan" Type="String" />
                <asp:SessionParameter Name="Mui" SessionField="Mui" Type="String" />
                <asp:SessionParameter Name="size" SessionField="size" Type="String" />
                <asp:SessionParameter Name="Masp" SessionField="Masp" Type="String" />
               <asp:SessionParameter Name="loai" SessionField="loai" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource> --%>

    </div>
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
select 'ALL' as Region
union all
SELECT region FROM  dbo.Fn_cust(@Username) group by region  order by region 
" >
         <SelectParameters>
             <asp:SessionParameter Name="Username" SessionField="TenDangNhap" />
         </SelectParameters>
    </asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand=" Select '_ALL' As Itemcode, 'Select All' as Itemname, '' as Brand, '' AS Price
 union all
SELECT tbItems.Itemcode, tbItems.Itemname, tbItems.Brand, MAX(tbItems.Price) AS Price FROM tbItems INNER JOIN SdDoanhso_full ON tbItems.Itemcode = SdDoanhso_full.MaSP GROUP BY tbItems.Itemcode, tbItems.Itemname, tbItems.Brand  order by  Itemcode"  >
                              

                         </asp:SqlDataSource>

     <dx:ASPxPopupControl ID="pcCreateAccount" runat="server" CloseAction="CloseButton"
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="pcCreateAccount"
            HeaderText="Create Account" AllowDragging="True" Modal="True" PopupAnimationType="Fade"
            EnableViewState="False" PopupHorizontalOffset="40" PopupVerticalOffset="40" Height="304px" Width="800px">
            <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('createAccountGroup'); }" />
            <SizeGripImage Width="11px" />
            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                    <dx:ASPxPanel ID="Panel2" runat="server" DefaultButton="btCreate" Height="185px" Width="800px">
                        <PanelCollection>
                            <dx:PanelContent ID="PanelContent2" runat="server">
                                 <table class="OptionsTable"  width="100%" >
                                                       
                                                        <tr>
                                                            <td style="width: 132px">Nhóm hàng</td>
                                                           <td>
                                                                <dx:ASPxDropDownEdit ID="EBrand" AutoPostBack="false" runat="server" AnimationType="None"  ClientInstanceName="checkComboBox"   Width="100%">
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
                                                            <td style="width: 132px">Nhãn Hàng
                                                            </td>
                                                           <td >
                                                                <dx:ASPxDropDownEdit ID="ENhan" AutoPostBack="false" runat="server" AnimationType="None"   ClientInstanceName="checkComboBox1" Width="100%" Rows="20">
                                                                    <DropDownWindowTemplate>
                                                                        <dx:ASPxListBox ID="listBox" runat="server" DataSourceID="SqlNhan" ClientInstanceName="checkListBox1" SelectionMode ="CheckColumn"  Width="100%">
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
                                                            <td style="height: 25px; width: 132px;">Mùi hương
                                                            </td>
                                                           <td style="height: 25px" >
                                                                <dx:ASPxDropDownEdit ID="ASPmui" AutoPostBack="false" runat="server" AnimationType="None"  ClientInstanceName="checkComboBox3" Width="100%" Rows="20">
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
                                                            <td style="width: 132px">Trọng lượng
                                                            </td>
                                                          <td >
                                                                <dx:ASPxDropDownEdit ID="ASPxSize" AutoPostBack="false" runat="server" AnimationType="None"   ClientInstanceName="checkComboBox4" Width="100%" Rows="20">
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
                                                            <td style="width: 132px">Loại sản phẩm
                                                            </td>
                                                           <td >
                                                                <dx:ASPxDropDownEdit ID="ASPxloai"   runat="server" AnimationType="None"  ClientInstanceName="checkComboBox6"   Width="100%">
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
                                                            <td style="width: 132px">Sản Phẩm </td>
                                                            <td  >
                                                                <dx:ASPxDropDownEdit ID="ASPxItem" AutoPostBack="false" runat="server" AnimationType="None"   ClientInstanceName="checkComboBox2"  Width="100%" Rows="20">
                                                                    <DropDownWindowTemplate>
                                                                        <dx:ASPxListBox ID="listBox" runat="server" DataSourceID="SqlItem"
                                                                            ClientInstanceName="checkListBox2" SelectionMode="CheckColumn" Width="100%">
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />

                                                                            <Columns>
                                                                                <dx:ListBoxColumn FieldName="Itemcode" Width="100px" />
                                                                                <%-- <dx:ListBoxColumn FieldName="Itemname" Width="100px" />--%>
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
                                        <td style="width: 132px" >
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
                                 <asp:SqlDataSource ID="SqlNhan" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand=" Select 'ALL' as Nhan  union all
                                                   SELECT   Category FROM [tbItems] a  inner join  [fnCSVStr2Table] (@Brand) b
on CASE WHEN b.ValueColumn &lt;&gt; 'ALL' AND b.ValueColumn IS NOT NULL   THEN b.ValueColumn ELSE a.Brand  END = a.Brand  where a.Category &lt;&gt;'' group by a.Category 
                                                      
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
THEN c.ValueColumn ELSE a.Category  END = a.Category  group by a.mui  
 
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
                                                         ON CASE WHEN b.ValueColumn &lt;&gt; 'ALL' AND b.ValueColumn IS NOT NULL THEN b.ValueColumn ELSE a.Brand END = a.Brand INNER JOIN dbo.fnCSVStr2Table(@Nhan) AS c ON CASE WHEN c.ValueColumn &lt;&gt; 'ALL' AND c.ValueColumn IS NOT NULL THEN c.ValueColumn ELSE a.Category END = a.Category GROUP BY a.Volumn
                                                   ">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="EBrand" Name="Brand" PropertyName="Value" Type="String" />
                                                            <asp:ControlParameter ControlID="ENhan" Name="Nhan" PropertyName="Value" Type="String" />
                                                        </SelectParameters>

                                                    </asp:SqlDataSource>
                                                    <asp:SqlDataSource ID="SqlItem" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
                                  Select 'ALL' as Itemcode ,'Chon tất cả' as Itemname
                                                     union all                  
                                SELECT a.Itemcode, a.Itemname FROM [tbItems] a  inner join  [fnCSVStr2Table] (@Brand) b
on CASE WHEN b.ValueColumn  &lt;&gt; 'ALL' AND b.ValueColumn IS NOT NULL   THEN b.ValueColumn ELSE a.Brand  END = a.Brand 
 inner join  [fnCSVStr2Table] (@Nhan ) c on  CASE WHEN c.ValueColumn  &lt;&gt; 'ALL' AND c.ValueColumn IS NOT NULL 
THEN c.ValueColumn ELSE a.Category  END = a.Category
 inner join  [fnCSVStr2Table] (@mui ) d on  CASE WHEN d.ValueColumn  &lt;&gt; 'ALL' AND d.ValueColumn IS NOT NULL 
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
                                                              <asp:ControlParameter ControlID="ASPmui" Name="mui" PropertyName="Value" Type="String" />
                                                        </SelectParameters>

                                                    </asp:SqlDataSource>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>


</asp:Content>