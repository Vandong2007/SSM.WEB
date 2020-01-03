<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Light.master" CodeBehind="Danh_sach_san_pham.aspx.vb" Inherits="WEB.SSM.Danh_sach_san_pham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">
 
        function OnShowAtPosButtonClick(s, e) {
            var popupZone = document.getElementById("popupZone");
            var left = 350;
            var top = 350;
            popup.SetHeaderText("popup.ShowAtPos(" + left + ", " + top + ")");
            popup.ShowAtPos(left, top);
        }

        function gridView_EndCallback() {
            var gridView = document.getElementById("<%#ggiohang.ClientID%>");
             var cellPerRow = gridView.getElementsByTagName("tr")[0].getElementsByTagName("th").length;
             var totalCells = gridView.getElementsByTagName("td").length;
             document.getElementById("<%#ld.ClientID%>").innerHTML = (totalCells / cellPerRow);
             document.getElementById("divRowsCount").style.visibility = "visible";
             return false;
         }
         function ShowLoginWindow() {
             
             var popupZone = document.getElementById("popupZone");
             var left = window.screen.availWidth / 3;
             var top = window.screen.availHeight / 3;
             ghang.ShowAtPos(left, top);
         }
         function ShowNppss() {
            
         
             var popupZone = document.getElementById("popupZone");
             var left = window.screen.availWidth / 3;
             var top = window.screen.availHeight / 3;
            
             Nppss.ShowAtPos(left, top);
         }
         function UpdateDetailGrid(s, e) {
             dgrid.PerformCallback('');
         }

         function OnCallbackComplete(s, e) {
             dgrid.PerformCallback('');
         }
    </script>
    <%--<dx:ASPxDockManager runat="server" ID="ASPxDockManager" ClientInstanceName="dockManager">
    </dx:ASPxDockManager>--%>

    <table style="width: 100%" frame="below">
        <tr>
            <td style="height: 23px">Danh sách sản phẩm </td>

        </tr>
        <tr>


            <%--         <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True"></dx:PanelContent>
</PanelCollection>--%>



            <td style="border-style: solid; border-width: 0.5px">
                <%-- <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCountryChanged(s); }" />--%>
 <div class="pcmButton">

                <dx:ASPxLabel ID="ld" ClientInstanceName="Lsd" runat="server" />
                <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Xem Giỏ hàng" AutoPostBack="False" UseSubmitBehavior="false" Width="100px">
                    <ClientSideEvents Click="function(s, e) { ShowLoginWindow(); }" />
                </dx:ASPxButton>
     </div>

            </td>
        </tr>
    </table>



    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Itemcode" OnCustomButtonCallback="grid_CustomButtonCallback">
        <ClientSideEvents EndCallback="function(s, e) {
	if (s.cp != '') 
	{  
	  Lsd.SetText('Tổng số SKU: '+s.cps +'' );
	   Lsd.GetMainElement().style.backgroundColor = 'green';
	  Lsd.GetMainElement().style.color = 'white';
             
     dGrid.PerformCallback('');
	}

	else
	{
	  Lsd.SetText('');
	}
}" />
        <ClientSideEvents FocusedRowChanged="UpdateDetailGrid" />
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="12">
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="DH" Text="Đặt Hàng">
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Itemcode" ReadOnly="True" VisibleIndex="1" Caption="Mã Sản phẩm" Width="50px">
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="Itemname" VisibleIndex="2" Caption="Tên sản phẩm" Width="200px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Brand" VisibleIndex="3" Caption="Nhãn SP" Width="50px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Thung" VisibleIndex="4" Caption="Quy cách">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Price" VisibleIndex="6" Caption="Giá RBP">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Volumn" VisibleIndex="8" Caption="Volumn">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="OldItemcode" VisibleIndex="0" Caption="SAP code" Width="50px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Storage" VisibleIndex="9" Caption="Kho Hàng">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Available" VisibleIndex="10" Caption="Tồn kho">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Stock" VisibleIndex="11" Caption="Tồn thực tế">
            </dx:GridViewDataTextColumn>

        </Columns>
        <Settings ShowFilterRow="True" ShowFilterRowMenuLikeItem="True" />

    </dx:ASPxGridView>
<%--    <dx:ASPxCallbackPanel ID="ASPxCallbackPanel2" runat="server" Width="200px" ClientInstanceName="callback">

        <ClientSideEvents EndCallback="OnCallbackComplete" />
        <%--         <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True"></dx:PanelContent>
 
    </dx:ASPxCallbackPanel>--%>


    <dx:ASPxPopupControl ID="pcCreateAccount1" ClientInstanceName="ghang" runat="server" AllowDragging="True"
        PopupHorizontalAlign="WindowCenter" HeaderText="Thông tin đơn hàng của bạn" PopupVerticalAlign="WindowCenter"  >
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" ClientInstanceName="callbackPanel" runat="server"
                    Width="100%" Height="100%" RenderMode="Table">
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent2" runat="server">

                              <dx:ASPxGridView ID="ggiohang" runat="server" ClientInstanceName="dGrid" KeyFieldName="OldItemcode" OnCustomCallback="ggiohang_CustomCallback" AutoGenerateColumns="False">
                                <SettingsEditing Mode="Inline" />
                                <Settings ShowFilterRow="True" ShowFilterRowMenuLikeItem="True" ShowFooter="True" />
                                <TotalSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="###,#" FieldName="TongTien" ValueDisplayFormat="###,#" ShowInColumn="Tong Tien" SummaryType="Sum" />
                                </TotalSummary>
                                <Columns>

                                    <dx:GridViewCommandColumn VisibleIndex="0">
                                        <EditButton Visible="True">
                                        </EditButton>
                                        <DeleteButton Visible="True">
                                        </DeleteButton>
                                    </dx:GridViewCommandColumn>

                                    <dx:GridViewDataTextColumn FieldName="OldItemcode" Caption="Mã sản phẩm" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Itemname" Caption="Tên sản phẩm" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Price" Caption="Đơn giá" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="SoLuong" Caption="Số lượng" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TongTien" Caption="Thành tiền" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="###,#">
                                        <PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>

                            <table id="form" width="100%">

                                <tr>
                                    <td colspan="2">
                                        <div class="pcmButton">
                                            <dx:ASPxButton ID="ASPxSV" runat="server" Text="Tiếp tục" Width="80px" AutoPostBack="False" Style="float: left; margin-right: 8px">
                                                <ClientSideEvents Click="function(s, e) { ghang.Hide(); }" />
                                            </dx:ASPxButton>
                                            <dx:ASPxButton ID="ASPxBC" runat="server" Text="Hủy bỏ" Width="80px" AutoPostBack="False" Style="float: left; margin-right: 8px">
                                                <ClientSideEvents Click="function(s, e) { ghang.Hide(); }" />
                                            </dx:ASPxButton>

                                            <dx:ASPxButton ID="ASPxButton1" Text="Đặt Hàng" runat="server" ClientInstanceName="d" />


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



    <dx:ASPxPopupControl ID="Npps" ClientInstanceName="Nppss" runat="server" Modal="true" AllowDragging="True"
         HeaderText="Vui lòng chọn thông tin khách hàng"  ShowPageScrollbarWhenModal="False" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"   AllowResize="True" EnableAnimation="False" CloseAction="CloseButton" PopupAction="None">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel3" ClientInstanceName="callbackPanel" runat="server"
                  RenderMode="Table">
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent1" runat="server">


                            <table id="Table1" style="width: 100%">
                                <tr>
                                    <td>Nhà phân phối</td>
                                    <td>

                                        <dx:ASPxComboBox ID="ASPMnpp" runat="server" DataSourceID="SqlDataSource2" ClientInstanceName="d"
                                            ValueField="Olddebcode" TextFormatString=" {1} " Width="100%">
                                            <Columns>
                                                <dx:ListBoxColumn FieldName="Olddebcode" Width="50px" />
                                                <dx:ListBoxColumn FieldName="Debname" Width="300px" />
                                                <dx:ListBoxColumn FieldName="Region" Width="100px" />
                                            </Columns>
                                            <%-- <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCountryChanged(s); }" />--%>
                                        </dx:ASPxComboBox>


                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSM2014ConnectionString %>" SelectCommand="SELECT Debname, Debadd, Region, Olddebcode FROM dbo.Fn_cust(@uname) AS Fn_cust_1 where Olddebcode is not null ">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="uname" SessionField="TenDangNhap" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                    </td>

                                </tr>
                                <tr>
                                    <td style="width: 109px">Kho hàng</td>
                                    <td>
                                        <dx:ASPxComboBox runat="server" ID="Kho"   Width="160px"   
                                            DropDownStyle="DropDown">
                                            <Items>
                                                <dx:ListEditItem Text="Kho Bắc Ninh" Value="BNWH" />
                                                <dx:ListEditItem Text="Kho Đà Nẵng" Value="DNWH" />
                                                <dx:ListEditItem Text="Kho Bình Dương" Value="FGWH" />

                                            </Items>

                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="pcmButton">
                                            <dx:ASPxButton ID="ASPxButton3" runat="server" Text="OK" Width="80px" Style="float: left; margin-right: 8px" AutoPostBack="False">
                                                <ClientSideEvents Click="function(s, e) { Nppss.Hide(); }" />
                                            </dx:ASPxButton>
                                            <dx:ASPxButton ID="ASPxButton4" runat="server" Text="Cancel" Width="80px" AutoPostBack="False" Style="float: left; margin-right: 8px">
                                                <%-- <ClientSideEvents Click="function(s, e) { Npps.Hide(); }" />--%>
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


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSM2014ConnectionString %>" SelectCommand="SELECT tbItems.Itemcode, tbItems.Itemname, tbItems.Brand, tbItems.Price, tbItems.Volumn, tbItems.OldItemcode, tbItems.Thung, tbStock.Storage, tbStock.Stock, tbStock.Available FROM tbItems INNER JOIN tbStock ON tbItems.OldItemcode = tbStock.Itemcode WHERE (tbItems.Thung IS NOT NULL) and tbStock.Storage=@store">
        <SelectParameters>
            <asp:SessionParameter Name="store" SessionField="Store" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
