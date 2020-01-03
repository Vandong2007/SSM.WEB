<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Light.master" CodeBehind="tao_don_hang.aspx.vb" Inherits="WEB.SSM.tao_don_hang" %>
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
            var left = window.screen.availWidth / 4;
            var top = window.screen.availHeight / 4;
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
             dgrid1.PerformCallback('');
         }

         function OnCallbackComplete(s, e) {
             dgrid.PerformCallback('');
             dgrid1.PerformCallback('');
         }

         var lastCountry = null;
         function OnCountryChanged(cmbCountry) {
             if (cmbCity.InCallback())
                 lastCountry = cmbCountry.GetValue().toString();
             else
                 cmbCity.PerformCallback(cmbCountry.GetValue().toString());
         }
         function OnEndCallback(s, e) {
             if (lastCountry) {
                 cmbCity.PerformCallback(lastCountry);
                 lastCountry = null;
             }
         }

    </script>
 
    <div style="float: left; width: 25%">
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Thông tin đơn hàng" Width="100%">
            <PanelCollection>
                <dx:PanelContent ID="PanelContent1" runat="server">
                   <dx:ASPxLabel ID="npp" ClientInstanceName="npp" runat="server" />

                    <dx:ASPxGridView  Width="100%" ID="ggiohang1" runat="server" ClientInstanceName="dGrid1" KeyFieldName="OldItemcode"   AutoGenerateColumns="False">
                                <SettingsEditing Mode="Inline" />
                                <Settings ShowFilterRow="True" ShowFilterRowMenuLikeItem="True" ShowFooter="True" />
                                <TotalSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="###,#" FieldName="TongTien" ValueDisplayFormat="###,#" ShowInColumn="Tong Tien" SummaryType="Sum" />
                                </TotalSummary>
                                <Columns>
 

                                    <dx:GridViewDataTextColumn FieldName="OldItemcode" Caption="Mã sản phẩm" VisibleIndex="1" Width ="50px">
                                    </dx:GridViewDataTextColumn>
                                 
                                    <dx:GridViewDataTextColumn FieldName="SoLuong" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Số lượng" VisibleIndex="4" Width ="50px">
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TongTien" Caption="Thành tiền" VisibleIndex="5"  Width ="50px" PropertiesTextEdit-DisplayFormatString="###,#">
                                        <PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                    <table>
                        <tr>
                            <td rowspan = 4>
  <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Xem Giỏ hàng" AutoPostBack="False" UseSubmitBehavior="false" Width="100px">
                    <ClientSideEvents Click="function(s, e) { ShowLoginWindow(); }" />
                    <Image Url="~/Content/Images/shoppingicon.png">
                    </Image>
                </dx:ASPxButton>
                            </td>
                            <td>Tổng SKU</td>
                            <td style="text-align: right">
        <dx:ASPxLabel ID="ld"  ClientInstanceName="Lsd" runat="server" />
              
                            </td>
                        </tr>
                        <tr>
                             <td>Tiền RBP:</td>
                             <td style="text-align: right"> <dx:ASPxLabel ID="lrbp" Text="" ClientInstanceName="rbp" runat="server"   /></td>

                        </tr>
                        <tr>
                          <td>Tiền Invioce:</td>
                             <td style="text-align: right"> <dx:ASPxLabel ID="lInv"  Text="" ClientInstanceName="lInv" runat="server"  /></td>

                        </tr>
                         <tr>
                            <td>Tiền Thuế:</td>
                             <td style="text-align: right"> <dx:ASPxLabel ID="ltax"  Text="" ClientInstanceName="ltax" runat="server"   /></td>

                        </tr>
                        <tr>
                            <td></td>
                             <td>Tổng tiền phải chuyển:</td>
                             <td style="text-align: right"> <dx:ASPxLabel ID="ltong"  Text="" ClientInstanceName="ltong" runat="server"   /></td>

                        </tr>
                    </table>

                
 
                         </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
    <div style="float: right; width: 75%">
        <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" HeaderText="Thông tin tồn kho"
            Width="100%">
            <PanelCollection>
                <dx:PanelContent ID="PanelContent2" runat="server">
                    <dx:ASPxCallbackPanel runat="server" ID="ASPxCallbackPanel1" Height="250px" ClientInstanceName="CallbackPanel" RenderMode="Table">
                     
                        <PanelCollection>
                            <dx:PanelContent ID="PanelContent3" runat="server">
                                <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Itemcode" OnCustomButtonCallback="grid_CustomButtonCallback">
        <ClientSideEvents EndCallback="function(s, e) {
	if (s.cp != '') 
	{   
             dGrid.PerformCallback('');
      dGrid1.PerformCallback('');
	  Lsd.SetText(  s.cps +''   );
      rbp.SetText( s.cprpb +'' );
	   lInv.SetText( s.cpinv +'' );
       ltax.SetText( s.cptax +'' );  
       ltong.SetText( s.cpfull +'' );       
   
	}

	else
	{
	  Lsd.SetText('');
	}
}" />
        <ClientSideEvents FocusedRowChanged="UpdateDetailGrid" />
                                     
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="11" ButtonType="Image" Caption="Đặt hàng">
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="DH" Text="Đặt Hàng" Image-Url="../Content/Images/shoppingadd.png">
                        
 
                        
<Image Url="../Content/Images/shoppingadd.png"></Image>
                        
 
                        
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Itemcode" ReadOnly="True" Visible ="false"  VisibleIndex="1" Caption="Mã Sản phẩm" Width="50px">
            <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="Itemname" VisibleIndex="2" Caption="Tên sản phẩm" Width="250px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <%--<dx:GridViewDataTextColumn FieldName="Brand" VisibleIndex="3" Caption="Nhãn SP" Width="50px">
            </dx:GridViewDataTextColumn>--%>
            <dx:GridViewDataComboBoxColumn Caption="Nhãn SP" FieldName="Brand"  PropertiesComboBox-DataSourceID="SqlDataSource4" PropertiesComboBox-ValueField="Brand"  PropertiesComboBox-DropDownStyle="DropDownList" PropertiesComboBox-ValueType="System.String" PropertiesComboBox-TextFormatString="{0}"
                                                    PropertiesComboBox-IncrementalFilteringMode="Contains"  VisibleIndex="3" Width="50px">
                <PropertiesComboBox DataSourceID="SqlDataSource4">
                    <Columns>
                       <dx:ListBoxColumn FieldName="Brand" />
                    </Columns>
                  
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="Thung" VisibleIndex="4" Caption="Quy cách">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Price" VisibleIndex="8" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Giá RBP">
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Volumn" VisibleIndex="6" Caption="Volumn">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="OldItemcode" VisibleIndex="0" Caption="SAP code" Width="50px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Storage" VisibleIndex="12" Visible ="false"  Caption="Kho Hàng">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ton" VisibleIndex="9" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Tồn kho">
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Stock" VisibleIndex="10" PropertiesTextEdit-DisplayFormatString="###,#" Visible ="false" Caption="Tồn thực tế">
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>

        </Columns>
        <Settings ShowFilterRow="True"   ShowFilterRowMenuLikeItem="True" />
                              
     </dx:ASPxGridView>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxCallbackPanel>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
     <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SSM2014ConnectionString %>" SelectCommand="SELECT Brand FROM [tbItems] WHERE ([Brand] IS not NULL) and type='Y' and price >0 group by Brand">
    </asp:SqlDataSource>
    <dx:ASPxPopupControl ID="pcCreateAccount1" ClientInstanceName="ghang" runat="server" AllowDragging="True" Width ="722px"
        PopupHorizontalAlign="WindowCenter" HeaderText="Thông tin đơn hàng của bạn" PopupVerticalAlign="WindowCenter" Maximized="True" MaxWidth="500px" CloseAction="None" Height="400px" Modal="True" PopupHorizontalOffset="100" PopupVerticalOffset="100"  >
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel2" ClientInstanceName="callbackPanel" runat="server"
                    Width="100%" Height="100%" RenderMode="table">
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent4" runat="server">

                           <dx:ASPxGridView  Width="100%" ID="ggiohang" runat="server" ClientInstanceName="dGrid" KeyFieldName="OldItemcode" OnCustomCallback="ggiohang_CustomCallback" AutoGenerateColumns="False">
                                <SettingsPager PageSize="7">
                                </SettingsPager>
                                <SettingsEditing Mode="Inline" />
                                <Settings ShowFilterRowMenuLikeItem="True" ShowFooter="True" />
                                <TotalSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="###,#" FieldName="TongTien" ValueDisplayFormat="###,#" SummaryType="Sum" />
                                 <dx:ASPxSummaryItem DisplayFormat="###,#" FieldName="TongTienIv" ValueDisplayFormat="###,#" SummaryType="Sum" />
                             </TotalSummary>
                                <Columns>

                                    <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image">
                                        <EditButton Visible="True">
                                            <Image Url="~/Content/Images/edit.png">
                                            </Image>
                                        </EditButton>
                                        <DeleteButton Visible="True">
                                            <Image Url="~/Content/Images/erase.png">
                                            </Image>
                                        </DeleteButton>
                                    </dx:GridViewCommandColumn>

                                    <dx:GridViewDataTextColumn FieldName="OldItemcode" Caption="Mã sản phẩm" VisibleIndex="1" Width ="50px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Itemname" Caption="Tên sản phẩm" VisibleIndex="2"  Width ="300px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Price" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Đơn giá" VisibleIndex="3" Width ="20px">
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="SoLuong" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Số lượng" VisibleIndex="3" Width ="50px">
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TongTien" Caption="Thành tiền" VisibleIndex="4"  Width ="50px" PropertiesTextEdit-DisplayFormatString="###,#">
                                        <PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Priceiv" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Đơn giá hđ" VisibleIndex="5" Width ="20px">
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn FieldName="TongTienIv" Caption="Thành tiền hóa đơn" VisibleIndex="5"  Width ="50px" PropertiesTextEdit-DisplayFormatString="###,#">
                                        <PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView> 

                            <table id="form" width="100%">

                                <tr>
                                    <td colspan="2">
                                        <div class="pcmButton">
                                            <dx:ASPxButton ID="ASPxSV" runat="server" Text="Tiếp tục" Width="80px" AutoPostBack="True" Style="float: left; margin-right: 8px">
                                                <ClientSideEvents Click="function(s, e) {    ghang.Hide(); }" />
                                            </dx:ASPxButton>
                                            <dx:ASPxButton ID="ASPxBC" runat="server" Text="Hủy bỏ" Width="80px" AutoPostBack="False" Style="float: left; margin-right: 8px">
                                                <ClientSideEvents Click="function(s, e) {  ghang.Hide(); }" />
                                            </dx:ASPxButton>

                                            <dx:ASPxButton ID="ASPxButton1" Text="Lưu đơn Đặt Hàng" runat="server" ClientInstanceName="d" />


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
         HeaderText="Vui lòng chọn thông tin đặt hàng"  ShowPageScrollbarWhenModal="False" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"   AllowResize="false" EnableAnimation="False" CloseAction="CloseButton" PopupAction="None" Height="149px" Width="406px">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel3" ClientInstanceName="callbackPanel" runat="server"
                  RenderMode="Table">
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent5" runat="server">


                            <table id="Table1" style="width: 100%">
                                <tr>
                                    <td style="width: 100%">Chọn nhà phân phối</td>
                                    <td style="width: 100%">
                                           <div class="form-field">
                                        <dx:ASPxComboBox ID="ASPMnpp" runat="server" DataSourceID="SqlDataSource2" ClientInstanceName="d" Width="300px" SelectedIndex="0"
                                            ValueField="Olddebcode" IncrementalFilteringMode="StartsWith" TextFormatString=" {1} " >
                                            <Columns>
                                                <dx:ListBoxColumn FieldName="Olddebcode" Width="50px" />
                                                <dx:ListBoxColumn FieldName="Debname" Width="300px" />
                                                <dx:ListBoxColumn FieldName="Region" Width="100px" />
                                            </Columns>
                                              <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCountryChanged(s); }" />
                                      <ValidationSettings ValidationGroup="RegisterUserValidationGroup" RegularExpression-ErrorText="chọn lại nhà phân phối" EnableCustomValidation="True">
	            <RegularExpression ValidationExpression="^[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+)*$" />
	            <RequiredField ErrorText="chọn lại nhà phân phối." IsRequired="true" />
	        </ValidationSettings>
                                            <%-- <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCountryChanged(s); }" />--%>
                                        </dx:ASPxComboBox>

                                               </div>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSM2014ConnectionString %>" SelectCommand="SELECT * FROM  Fn_cust_dh(@uname) AS Fn_cust_1 where Olddebcode is not null  and Discount &gt;0">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="uname" SessionField="TenDangNhap" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                    </td>

                                </tr>
                                <tr>
                                    <td style="width: 100%">Chọn kho</td>
                                    <td>
                                           <div class="form-field">
                                        <dx:ASPxComboBox runat="server" ID="Kho"  ValueField="sdf" TextFormatString=" {1} "   Width="300px" SelectedIndex="0"  
                                            DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith"  DataSourceID="SqlDataSource3" ClientInstanceName="cmbCity" OnCallback="CmbCity_Callback">
                                           <ValidationSettings ValidationGroup="RegisterUserValidationGroup" RegularExpression-ErrorText="Kho hàng không đúng" EnableCustomValidation="True">
	            <RegularExpression ValidationExpression="^[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+)*$" />
	            <RequiredField ErrorText="Chọn kho hàng." IsRequired="true" />
	        </ValidationSettings>
                                            <Columns>
                                                <dx:ListBoxColumn Caption="Kho" FieldName="sdf" />
                                                <dx:ListBoxColumn Caption="Tên Kho" FieldName="Diengiai" />
                                            </Columns>
                                       <ClientSideEvents EndCallback=" OnEndCallback"/>
                                        </dx:ASPxComboBox>
                                               </div>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SSM2014ConnectionString %>" SelectCommand="select a.sdf , b.Diengiai   from [dbo].[Fn_cust_dh](@uname) a
inner join [dbo].[tb_khohang] b on a.sdf=b.kho
where a.Olddebcode = @cus
group by sdf, b.Diengiai">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="uname" SessionField="TenDangNhap" />
                                                <asp:ControlParameter ControlID="ASPMnpp" Name="cus" PropertyName="Value" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">

                                        <div class="pcmButton">
                                            <dx:ASPxButton ID="ASPxButton3" runat="server" Text="OK" Width="80px" Style="float: left; margin-right: 8px" ValidationGroup="RegisterUserValidationGroup"  AutoPostBack="False">
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


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSM2014ConnectionString %>" SelectCommand="SELECT *  , Available - dh as  ton  from vw_stock  WHERE   Storage=@store and Price &gt;0 and  Available - dh &gt;0">
        <SelectParameters>
            <asp:SessionParameter Name="store" SessionField="Store" />
        </SelectParameters>
    </asp:SqlDataSource>
     
    </asp:Content>
 