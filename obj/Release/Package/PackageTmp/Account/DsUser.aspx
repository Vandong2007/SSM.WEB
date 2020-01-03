<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Light.master" CodeBehind="DsUser.aspx.vb" Inherits="WEB.SSM.DsUser" %>
 	 
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

        // ]]>
    </script>
    
        <div>
            <h2>Danh sách người dùng</h2>
        </div>
       <%-- <table class="gridtable">--%>
    <div >
             <table class="altrowstable" id="alternatecolor">
      <thead>
                <tr>
                    <th style="height: 23px">STT</th>
                    <th style="height: 23px">Tên đăng nhập</th>
                    <th style="height: 23px">Email</th>
                    <th style="height: 23px">Họ Và Tên</th>
                    <th style="height: 23px">Bộ phận</th>
                    <th style="height: 23px">Kích hoạt</th>
                    <th style="height: 23px">Actions</th>
                </tr>
            </thead> 
            <tbody>
                <asp:ListView ID="lstDanhSach" runat="server" DataSourceID="SqlDataSource1">
                    <LayoutTemplate>
                      <%--  <span runat="server" id="itemplaceholders"></span>--%>
                         <table runat="server" id="itemplaceholder">
      <tr runat="server" id="Tr1">  </tr>
      
    </table>
                         <asp:DataPager runat="server" ID="DataPager" PageSize="9">
                  <Fields>
                    <asp:NumericPagerField ButtonCount="9"
                         CurrentPageLabelCssClass="CurrentPage"
                         NumericButtonCssClass="PageNumbers"
                         NextPreviousButtonCssClass="PageNumbers" NextPageText=" > "
                         PreviousPageText=" < " />
                  </Fields>
            </asp:DataPager>
                    </LayoutTemplate>

                    <ItemTemplate>

                        <tr>
                            <td class="center"><%# Container.DataItemIndex+1 %></td>
                            <td class="center"><%#Eval("Tendangnhap")%></td>
                            <td class="center"><%#Eval("Email") %></td>
                            <td class="center"><%#Eval("HovaTen")%></td>
                            <td class="center"><%#Eval("Maphongban")%></td>

                            <td class="center">

                                <span class="label">
                                    <%# GetState(Eval("trangthai")) %>
                                </span>
                            </td>

                            <td class="center">

                                <asp:Button title="" Visible='<%# IIf(GetState(Eval("trangthai")) = "no", True, False)%>' data-rel="tooltip" data-original-title="Click vào đây để kích hoạt tài khoản" CommandArgument='<%#Eval("Tendangnhap") + "," + Eval("Email")%>' OnClick="btnActive_Click" ID="btnActive" runat="server" Text="Active" />
                                <asp:Button title="" Visible='<%# IIf(GetState(Eval("trangthai")) = "yes", True, False)%>' data-rel="tooltip" data-original-title="Click vào đây để khoá tài khoản" CommandArgument='<%#Eval("Tendangnhap")%>' OnClick="btndeActive_Click" ID="btnDeActive" runat="server" Text="DeActive" />
                                 <asp:Button title="" Visible='<%# IIf(GetState(Eval("trangthai")) = "no", True, False)%>' data-rel="tooltip" data-original-title="Click vào đây để Xóa tài khoản" CommandArgument='<%#Eval("Email")%>' OnClick="BtnDel_Click" ID="BtnDel" runat="server" Text="Delete" />
                                <asp:Button title="" Visible='<%# IIf(GetState(Eval("trangthai")) = "yes", True, False)%>' data-rel="tooltip" data-original-title="Click vào cập nhật tài khoản" CommandArgument='<%#Eval("Tendangnhap") + "," + Eval("Email") + "," + Eval("HovaTen") + "," + Eval("Maphongban") + "," + Eval("Region") + "," + Eval("Area") + "," + Eval("Customer")%>' OnClick="btncn_Click" ID="btncn" runat="server" Text="Edit" />
                                </div>
                             <%--  <asp:Button title="" data-rel="tooltip" data-original-title="Click vào đây để cập nhật dữ liệu" CommandArgument='<%#Eval("MS_Nhanvien") %>' OnClick="btnCapNhat_Click" class="btn btn-info" ID="btnCapNhat" runat="server" Text="Cập nhật" />

                                            <asp:Button title="" data-rel="tooltip" data-original-title="Click vào đây để xoá dữ liệu" OnClientClick="return messDelete();" OnClick="btnXoa_Click" CommandArgument='<%#Eval("MS_Nhanvien") %>' class="btn btn-danger" ID="btnXoa" runat="server" Text="Xoá" />--%>
                            </td>
                        </tr>
                        
                    </ItemTemplate>

                </asp:ListView>
               
            </tbody>
        </table>
        </div>
        <dx:ASPxPopupControl ID="pcCreateAccount" runat="server" CloseAction="CloseButton"
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="pcCreateAccount"
            HeaderText="Create Account" AllowDragging="True" Modal="True" PopupAnimationType="Fade"
            EnableViewState="False" PopupHorizontalOffset="40" PopupVerticalOffset="40" Height="304px" Width="358px">
            <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('createAccountGroup'); }" />
            <SizeGripImage Width="11px" />
            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                    <dx:ASPxPanel ID="Panel2" runat="server" DefaultButton="btCreate" Height="185px" Width="336px">
                        <PanelCollection>
                            <dx:PanelContent ID="PanelContent2" runat="server">
                                <table>
                                    <tr>
                                        <td rowspan="5">
                                            <div class="pcmSideSpacer">
                                            </div>
                                        </td>
                                        <td class="auto-style1">
                                            <dx:ASPxLabel ID="lblUsername2" runat="server" Text="Username:" AssociatedControlID="tbUsername">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td class="auto-style2">
                                            <dx:ASPxTextBox ID="tbUsername" runat="server" Width="200px" ClientInstanceName="tbUsername" ReadOnly="True">
                                            </dx:ASPxTextBox>
                                        </td>
                                         
                                    </tr>
                                     <tr>
                                        <td class="auto-style1">
                                            <dx:ASPxLabel ID="lblPass2" runat="server" Text="Password:" AssociatedControlID="tbPass1">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td class="auto-style2">
                                            <dx:ASPxTextBox ID="tbPass1" runat="server" Width="200px" ClientInstanceName="pass1"
                                                Password="True">
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">
                                            <dx:ASPxLabel ID="lblConfPass2" runat="server" Text="Họ Tên" AssociatedControlID="tbConfPass2">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td class="auto-style2">
                                            <dx:ASPxTextBox ID="tbhovaten" runat="server" Width="200px">
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1">
                                            <dx:ASPxLabel ID="lblEmail" runat="server" Text="Email:" AssociatedControlID="tbEmail">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td class="auto-style2">
                                            <dx:ASPxTextBox ID="tbEmail" runat="server" Width="200px">
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style3">
                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Bộ Phân:" AssociatedControlID="tbEmail">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td class="auto-style4">
                                            <dx:ASPxTextBox ID="tbbophan" runat="server" Width="200px">
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td rowspan="5">
                                            <div class="pcmSideSpacer">
                                            </div>
                                        </td>
                                        <td class="auto-style5">
                                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" AssociatedControlID="tbEmail" Text="Region:">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td class="auto-style6">
                                             
                                            <dx:ASPxDropDownEdit ID="tbRegion" runat="server" AnimationType="None" ClientInstanceName="checkComboBox" Width="200px">
                                                <DropDownWindowTemplate>
                                                    <dx:ASPxListBox ID="listBox" runat="server" ClientInstanceName="checkListBox" SelectionMode="CheckColumn" Width="100%">
                                                        <Border BorderStyle="None" />
                                                        <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />
                                                        <Items>
                                                            <dx:ListEditItem Text="(Select all)" />
                                                             <dx:ListEditItem Text="FULL" Value="1" />
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
                                             
                                        </td>
                                        </td>
 
                                    </tr>
                                  <tr>
                                        
                                        <td class="auto-style5">
                                            <dx:ASPxLabel ID="ASPxLabel3" runat="server" AssociatedControlID="tbArea" Text="Area:">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td class="auto-style6">
                                             
                                            <dx:ASPxDropDownEdit ID="tbArea" runat="server" AnimationType="None" ClientInstanceName="checkComboBox1" Width="200px">
                                                <DropDownWindowTemplate>
                                                    <dx:ASPxListBox ID="listBox" runat="server" ClientInstanceName="checkListBox1" DataSourceID="SqlDataSource3" SelectionMode="CheckColumn" Width="100%">
                                                        <Border BorderStyle="None" />
                                                        <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid"  BorderWidth="1px" />
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
                                             
                                        </td>
                                      
 
                                    </tr>
                                    
                               
                                     <tr>
                                         
                                        <td class="auto-style1">
                                            <dx:ASPxLabel ID="ASPxLabel4" runat="server" AssociatedControlID="tbCtus" Text="Custormer">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td class="auto-style2">
                                             
                                            <dx:ASPxDropDownEdit ID="tbcus" runat="server" AnimationType="None" ClientInstanceName="checkComboBox2" Width="200px">
                                                <DropDownWindowTemplate>
                                                    <dx:ASPxListBox ID="listBox" runat="server" ClientInstanceName="checkListBox2"  DataSourceID="SqlDataSource2"   SelectionMode="CheckColumn"  Width="100%">
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

                                        </td>
                                 
 
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
                    </dx:ASPxPanel>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT TB_DangNhap.Tendangnhap, TB_DangNhap.Usid, TB_DangNhap.maquyen, TB_DangNhap.hovaten, TB_DangNhap.email, TB_DangNhap.Slandangnhap, TB_DangNhap.trangthai, TB_DangNhap.MaPhongban, TBQuyenUser.Bophan, TBQuyenUser.Region, TBQuyenUser.Area, TBQuyenUser.Customer, TB_DangNhap.ngayactiver, TBQuyenUser.channel FROM TB_DangNhap LEFT OUTER JOIN TBQuyenUser ON TB_DangNhap.Tendangnhap = TBQuyenUser.Tendangnhap ORDER BY TB_DangNhap.trangthai DESC"></asp:SqlDataSource>

      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT 'Chon' as Debcode, 'Vui long chon' as Debname
          Union all 
          SELECT 'FULL' as Debcode, 'Select All' as Debname 
Union all
SELECT Debcode, Debname FROM dbo.Fn_cust(@unam) AS Fn_cust_1
" >
        <SelectParameters>
            <asp:SessionParameter Name="unam" SessionField="TenDangNhap" />
        </SelectParameters>
    </asp:SqlDataSource>  
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT 'Chon' as Area 
          Union all 
          SELECT 'FULL' as Area 
Union all
SELECT Area FROM dbo.Fn_cust(@unam) AS Fn_cust_1 group by Area
" >
        <SelectParameters>
            <asp:SessionParameter Name="unam" SessionField="TenDangNhap" />
        </SelectParameters>
    </asp:SqlDataSource> 
   
    <!--/row-->
   
</asp:Content>
