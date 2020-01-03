<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Root.master" CodeBehind="Form_dat_hang.aspx.vb" Inherits="WEB.SSM.Form_dat_hang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server" >
    
  <%-- <asp:Button runat="server" Text="Button" ></asp:Button>
        <asp:TextBox ID="TextBox1" runat="server" Height="69px" Width="944px"></asp:TextBox>  
         <dx:ASPxGridView  ID="GridView1" runat="server">
        
        </dx:ASPxGridView>--%>
    <script type="text/javascript">

        function OnShowAtPosButtonClick(s, e) {
            var popupZone = document.getElementById("popupZone");
            var left = 350;
            var top = 350;
            popup.SetHeaderText("popup.ShowAtPos(" + left + ", " + top + ")");
            popup.ShowAtPos(left, top);
        }
        function fnTruncateInt(s, e) {
            s.SetValue(Math.floor(s.GetValue()));
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
     function ShowPaste() {


         var popupZone = document.getElementById("popupZone");
         var left = window.screen.availWidth / 3;
         var top = window.screen.availHeight / 5;
         document.getElementById("<%=txtCopied.ClientID%>").value = '';
            paste.ShowAtPos(left, top);

        }
        function Showtb() {


            var popupZone = document.getElementById("popupZone");
            var left = window.screen.availWidth / 3;
            var top = window.screen.availHeight / 3;

            tb.ShowAtPos(left, top);
        }
        function UpdateDetailGrid(s, e) {
            dgrid.PerformCallback('');
            dgrid1.PerformCallback('');
        }
        function UpdateDetailGrid1(s, e) {

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
     <dx:ASPxSplitter ID="ASPxSplitter2" FullscreenMode="True" runat="server"  Height="800px" Width ="100%">
          
        <Panes> 
            <dx:SplitterPane Name="ContentLeft" AutoHeight="true"   Size="25%" ScrollBars="Auto" MaxSize="350px">
                <ContentCollection>
                    <dx:SplitterContentControl runat="server" >
  
                           
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Thông tin đơn hàng" Width="100%">
            <PanelCollection>
                <dx:PanelContent ID="PanelContent1" runat="server">
                   <dx:ASPxLabel ID="npp" ClientInstanceName="npp" runat="server" />

                    <dx:ASPxGridView  Width="100%" ID="ggiohang1" runat="server" ClientInstanceName="dGrid1" KeyFieldName="OldItemcode"   AutoGenerateColumns="False" SettingsPager-NumericButtonCount="5" SettingsPager-PageSize="16">

<SettingsPager NumericButtonCount="5"></SettingsPager>

                                <SettingsEditing Mode="Inline" />
                                <Settings ShowFilterRow="True" ShowFilterRowMenuLikeItem="True" ShowFooter="True" />
                                <TotalSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="###,#" FieldName="TongTien" ValueDisplayFormat="###,#" ShowInColumn="Tong Tien" SummaryType="Sum" />
                                </TotalSummary>
                                <Columns>
 

                                    <dx:GridViewDataTextColumn FieldName="OldItemcode" Caption="Mã sản phẩm" VisibleIndex="1" Width ="20%">
                                    </dx:GridViewDataTextColumn>
                                 
                                    <dx:GridViewDataTextColumn FieldName="SoLuong" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Số lượng" VisibleIndex="4" Width ="30%">
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TongTien" Caption="Thành tiền" VisibleIndex="5"  Width ="30%" PropertiesTextEdit-DisplayFormatString="###,#">
                                        <PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                    <table width="100%">
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

                <div class="yellowbox" style="color:red ; width:90%">
 <dx:ASPxLabel ID="erro"   Width="100%" Text=""  runat="server"     />
                    </div>
                         </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
        
                      
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
            <dx:SplitterPane Name="ContentCenter" AutoHeight="true" ScrollBars="Auto">
                <Separators Visible="True">
                </Separators>
                <ContentCollection>
                    <dx:SplitterContentControl runat="server">
                       
    <div style=" width:100%">
        <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server"  
            Width="100%">
            <HeaderTemplate>
                <table style="width:100%"><tr>
                    <td>    
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                    <td align="right">

                       <table><tr> <td>
                            <dx:ASPxButton ID="ASPxButton6"   runat="server" Text="Upload đơn hàng"  Image-Url="~/Content/Images/file_import.png" Image-Width="50%" Image-Height="50%" AutoPostBack="False">
                                   <ClientSideEvents Click="function(s, e) { ShowPaste(); }" />
                            </dx:ASPxButton></td>
                           <td>
                            <dx:ASPxButton ID="ASPExport" runat="server" Text="Export Excel" OnClick="ASPExport_Click" Image-Url="~/Content/Images/excel.png" Image-Width="50%" Image-Height="50%">
                            </dx:ASPxButton></td></tr></table>
                        </div>
                    </td>
                </tr>
                </table>


            </HeaderTemplate>
            <PanelCollection>
                <dx:PanelContent ID="PanelContent2" runat="server">
                    <dx:ASPxCallbackPanel runat="server" ID="ASPxCallbackPanel1" Height="250px" ClientInstanceName="CallbackPanel" RenderMode="Table">
                     
                        <PanelCollection>
                            <dx:PanelContent ID="PanelContent3" runat="server">
                                <dx:ASPxGridView ID="grid"  runat="server" AutoGenerateColumns="False"   KeyFieldName="MATNR" OnCustomButtonCallback="grid_CustomButtonCallback">
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
 if (s.cpMessage) { //check
            alert(s.cpMessage); //alert
            delete s.cpMessage; //delete
        }
}" />
        <ClientSideEvents FocusedRowChanged="UpdateDetailGrid" />
                                     
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="16" ButtonType="Image" Caption="Đặt hàng">
                <ClearFilterButton Visible="True" Text="Bỏ tìm kiếm">
                </ClearFilterButton>
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="DH" Text="Đặt Hàng" Image-Url="../Content/Images/shoppingadd.png">
                         
<Image Url="../Content/Images/shoppingadd.png"></Image>
                         
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
           <%-- <dx:GridViewDataTextColumn FieldName="Itemcode" ReadOnly="True" Visible ="false"  VisibleIndex="1" Caption="Mã Sản phẩm" Width="50px">
            <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>--%>

            <dx:GridViewDataTextColumn FieldName="VIET_UOM" VisibleIndex="1" Caption="Tên sản phẩm" Width="250px">
                <Settings AutoFilterCondition="Contains" ShowInFilterControl="True" />
            </dx:GridViewDataTextColumn>
            <%--<dx:GridViewDataTextColumn FieldName="Brand" VisibleIndex="3" Caption="Nhãn SP" Width="50px">
            </dx:GridViewDataTextColumn>--%>
            <dx:GridViewDataComboBoxColumn Caption="Nhãn SP" FieldName="VTEXT"  PropertiesComboBox-DataSourceID="SqlDataSource4" PropertiesComboBox-ValueField="Brand"  PropertiesComboBox-DropDownStyle="DropDownList" PropertiesComboBox-ValueType="System.String" PropertiesComboBox-TextFormatString="{0}"
                                                    PropertiesComboBox-IncrementalFilteringMode="Contains"  VisibleIndex="2" Width="50px">
                <PropertiesComboBox DataSourceID="SqlDataSource4">
                    <Columns>
                       <dx:ListBoxColumn FieldName="Brand" />
                    </Columns>
                  
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="CARTON" VisibleIndex="6" Caption="Quy cách">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="P_RBP" VisibleIndex="8" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Giá RBP">
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="P_INV" VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Giá Invioce">
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
        
            <dx:GridViewDataTextColumn FieldName="MATNR" VisibleIndex="0" Caption="SAP code" Width="50px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LGORT" VisibleIndex="11"  Caption="Kho Hàng">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AVAIL" VisibleIndex="9" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Tồn kho">
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                <CellStyle Font-Bold="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LABST" VisibleIndex="10" PropertiesTextEdit-DisplayFormatString="###,#" Visible ="false" Caption="Tồn thực tế">
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="ssl" Caption="SL đ.hàng (thùng)" ShowInCustomizationForm="True" VisibleIndex="13">
                <PropertiesTextEdit EnableClientSideAPI="True">
                </PropertiesTextEdit>
                <DataItemTemplate>
              <dx:ASPxSpinEdit ID="sl"  Height="21px"  runat="server" DisplayFormatString="###,#" Number="1"
                    Width="100%" 
          MinValue="1" MaxValue="99999">
                              
                  </dx:ASPxSpinEdit> 
    
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Nhóm SP" FieldName="Loai"  ShowInCustomizationForm="True" VisibleIndex="3">
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Mùi hương" FieldName="mui" ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Dung tích" FieldName="Volumn" ShowInCustomizationForm="True" VisibleIndex="5">
            </dx:GridViewDataTextColumn>

        </Columns>
        <Settings ShowFilterRow="True"    ShowFilterRowMenuLikeItem="True" />
                              
     </dx:ASPxGridView>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxCallbackPanel>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>

                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
         </Panes>
         </dx:ASPxSplitter>
   

     <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SSM2014ConnectionString %>" SelectCommand="SELECT Case when Brand ='BIOESSENCE' then 'BIO ESSENCE' else Brand end Brand  FROM [tbItems] WHERE ([Brand] IS not NULL) and type='Y' and price >0 group by Brand">
    </asp:SqlDataSource>
    <dx:ASPxPopupControl ID="pcCreateAccount1" ClientInstanceName="ghang" runat="server" AllowDragging="True" MaxHeight="560px" Width ="700px"
        PopupHorizontalAlign="WindowCenter" HeaderText="Thông tin đơn hàng của bạn" PopupVerticalAlign="WindowCenter" Maximized="True" MaxWidth="800px" CloseAction="None" Height="400px" Modal="True" PopupHorizontalOffset="100" PopupVerticalOffset="100"  >
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel2" ClientInstanceName="callbackPanel" runat="server"
                    Width="100%" Height="100%" RenderMode="table">
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent4" runat="server">

                           <dx:ASPxGridView  Width="100%" ID="ggiohang" runat="server" ClientInstanceName="dGrid" KeyFieldName="OldItemcode" AutoGenerateColumns="False">

                               <ClientSideEvents EndCallback="function(s, e) {
	if (s.cpss != '') 
	{   
           
      dGrid1.PerformCallback('');
	  
	}
 
}" />
                                  
                                <SettingsPager PageSize="7">
                                </SettingsPager>
                                <SettingsEditing Mode="Inline" />
                                <Settings ShowFilterRowMenuLikeItem="True" ShowFooter="True" />
                                <TotalSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="###,#" FieldName="TongTien" ValueDisplayFormat="###,#" SummaryType="Sum" />
                                 <dx:ASPxSummaryItem DisplayFormat="###,#" FieldName="TongTienIv" ValueDisplayFormat="###,#" SummaryType="Sum" />
                             </TotalSummary>
                                <Columns>

                                    <dx:GridViewCommandColumn  VisibleIndex="0" ButtonType="Image">
                                        <EditButton Visible="True">
                                            <Image Url="~/Content/Images/edit.png">
                                            </Image>
                                        </EditButton>
                                        <DeleteButton Visible="True">
                                            <Image Url="~/Content/Images/erase.png">
                                            </Image>
                                        </DeleteButton>
                                    </dx:GridViewCommandColumn>

                                    <dx:GridViewDataTextColumn FieldName="OldItemcode" Caption="Mã sản phẩm" VisibleIndex="1" Width ="40px" ReadOnly="True">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Itemname" Caption="Tên sản phẩm" VisibleIndex="2"  Width ="30%" ReadOnly="True">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Price" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Đơn giá" VisibleIndex="3" Width ="20px" ReadOnly="True">
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="SoLuong" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Số lượng" VisibleIndex="3" Width ="50px">
<PropertiesTextEdit DisplayFormatString="###,#">
    
</PropertiesTextEdit>
                                        <EditItemTemplate>
                                               <dx:ASPxSpinEdit ID="sl"  Value='<%#Bind("SoLuong")%>' runat="server"   DisplayFormatString="###,#" Number="1"
                    Width="100%" 
          MinValue="1" MaxValue="99999">
                           
                  </dx:ASPxSpinEdit>
                                        </EditItemTemplate>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TongTien" Caption="Thành tiền" VisibleIndex="4"  Width ="50px" PropertiesTextEdit-DisplayFormatString="###,#" ReadOnly="True">
                                        <PropertiesTextEdit DisplayFormatString="###,#" DisplayFormatInEditMode="True"></PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Priceiv" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Đơn giá hđ" VisibleIndex="5" Width ="20px" ReadOnly="True">
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn FieldName="TongTienIv" Caption="Thành tiền hóa đơn" VisibleIndex="7"  Width ="50px" PropertiesTextEdit-DisplayFormatString="###,#" ReadOnly="True">
                                        <PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView> 

                            <table id="form" width="100%">

                                <tr>
                                    <td>
                                        
                                            <dx:ASPxButton ID="ASPxSV" runat="server" Text="Tiếp tục mua hàng" Width="100%" AutoPostBack="True"  >
                                                <ClientSideEvents Click="function(s, e) {    ghang.Hide(); }" />
                                                  <Image Url="~/Content/Images/shopping-basket-icon.png"></Image>
                                            </dx:ASPxButton>
</td>
                                        <td>
                                            <dx:ASPxButton ID="ASPxBC" runat="server" Text="Hủy bỏ" Width="100%" AutoPostBack="False"  >
                                                <ClientSideEvents Click="function(s, e) {  ghang.Hide(); }" />
                                                 <Image Url="~/Content/Images/shoppingremove.png"></Image>
                                            </dx:ASPxButton>
                                            </td>
                                        <td>
                                            <dx:ASPxButton ID="ASPxButton1" Text="Lưu đơn Hàng" Width="100%" runat="server" ClientInstanceName="d" >  <Image Url="~/Content/Images/Save.png"></Image></dx:ASPxButton>

 
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


    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="grid" FileName="Ton_kho_hang"></dx:ASPxGridViewExporter>

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
                                            ValueField="Olddebcode" IncrementalFilteringMode="Contains" TextFormatString="{0} {1} " >
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
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSM2014ConnectionString %>" SelectCommand="SELECT * FROM  Fn_cust_dh(@uname) AS Fn_cust_1 where Olddebcode is not null ">
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
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SSM2014ConnectionString %>" SelectCommand="select a.sdf , b.Diengiai   from [dbo].[Fn_cust_dh1](@uname) a
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
      <%--  <ClientSideEvents Shown="popup_Shown" />--%>
    </dx:ASPxPopupControl>

    <dx:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="tb" runat="server" Modal="true" AllowDragging="True"
         HeaderText="Thông báo"  ShowPageScrollbarWhenModal="False" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"   AllowResize="false" EnableAnimation="False" CloseAction="CloseButton" PopupAction="None" Height="149px" Width="406px">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel4" ClientInstanceName="callbackPanel" runat="server"
                  RenderMode="Table">
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent6" runat="server">


                         <div align="center"> <p>
Số lượng đơn hàng chưa xử lý của bạn vượt quá số lượng cho phép
                             vui lòng liên hệ với Bộ phận CS của WUVL để được hỗ trợ
                               </p>  
                              <div class="pcmButton" align="center">
                                            <dx:ASPxButton ID="ASPxButton5" runat="server" Text="OK" Width="80px" Style="float: left; margin-right: 8px" ValidationGroup="RegisterUserValidationGroup"  AutoPostBack="False">
                                                <ClientSideEvents Click="function(s, e) { tb.Hide(); }" />
                                            </dx:ASPxButton>
                                     
                                        </div></div>

                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
      <%--  <ClientSideEvents Shown="popup_Shown" />--%>
    </dx:ASPxPopupControl>

    <dx:ASPxPopupControl ID="PPA" ClientInstanceName="paste" runat="server" Modal="true" AllowDragging="True"
         HeaderText="Nhập đơn hàng từ excel"  ShowPageScrollbarWhenModal="False" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"   AllowResize="false" EnableAnimation="False" CloseAction="CloseButton" PopupAction="None" Height="400px" Width="406px">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl4" runat="server">
                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel5" ClientInstanceName="callbackPanel" runat="server"
                  RenderMode="Table" Height="100%" Width="100%">
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent7"  Width="100%"  runat="server">
                            <div class="yellowbox">
    Download file mẫu đơn hàng.<br>
    <a href="../Excel/Form_dat_hang.xls">Form_dat_hang.xls</a>
    </div>
                      <%--     <dx:ASPxTextBox ID ="txtCopied"  ClientInstanceName="texts" AutoPostBack="true" TextMode="MultiLine"  OnTextChanged="PasteToGridView" runat="server" NullText="Vui lòng copy và Paste từ excel vào" Height="350px" Width="100%"></dx:ASPxTextBox>--%>
 <asp:TextBox ID="txtCopied"  ClientInstanceName="texts" runat="server" TextMode="MultiLine" OnTextChanged="PasteToGridView"     placeholder="Copy (Ctrl+C) từ excel và Paste (Ctrl+V)  vào đây &nbsp; Không gõ trực tiếp vào đây" Height="350px" Width="100%" ToolTip="Copy từ excel và Paste vào đây &nbsp; Không gõ trực tiếp vào đây" /> 
   <script type="text/javascript">
       window.onload = function () {
           document.getElementById("<%=txtCopied.ClientID %>").onpaste = function () {
               var txt = this;
               setTimeout(function () {
                   __doPostBack(txt.name, '');
               }, 100);
           }

       };
    </script> 
                              <div class="pcmButton" align="center">
                                            <dx:ASPxButton ID="ASPxButton7" runat="server" Text="OK" Width="80px" Style="float: left; margin-right: 8px" ValidationGroup="RegisterUserValidationGroup"           AutoPostBack="False"     >
                                    <ClientSideEvents Click="function(s, e) { paste.Hide(); }" /> 
                                            </dx:ASPxButton>
                                      
                                        </div> 

                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
  <%--      <ClientSideEvents Shown="popup_Shown" />--%>
    </dx:ASPxPopupControl>


 
     
</asp:Content>
