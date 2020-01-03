<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="TopSKU.aspx.vb" Inherits="WEB.SSM.TopSKU" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function ShowCreateAccountWindow() {


            var popupZone = document.getElementById("popupZone");
            var left = window.screen.availWidth / 4;
            var top = window.screen.availHeight / 4;
            ghang.ShowAtPos(left, top);
    
          
        }
    </script>
     <table >
                                            <tr>
                                                <td>
                                                   <a>File upload </a> <asp:FileUpload ID="FileUpload3" runat="server" /></td>
                                                <td>
                                              <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Updload">
                    </dx:ASPxButton>
                                                </td>
                                                <td>
                                                   
                                                </td>
                                            </tr> </table>
                                            <div class="yellowbox">
    Download file mẫu top SKU .<br>
                                                <a href="../Excel/temp_import_TopSKU.xlsx">temp_import_TopSKU.xlsx </a>
    </div>
                                       
                                          <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"    KeyFieldName="Itemcode" Width="100%" SettingsEditing-Mode="EditForm" SettingsPager-RenderMode="Lightweight" SettingsPager-SEOFriendly="Disabled" Settings-ShowFilterBar="Auto" DataSourceID="SqlDataSource1">
                             <Columns>
                                 <dx:GridViewCommandColumn VisibleIndex="0">
                                     <NewButton Visible="True">
                                     </NewButton>
                                     <DeleteButton Visible="True">
                                     </DeleteButton>
                                 </dx:GridViewCommandColumn>
                                 <dx:GridViewDataTextColumn FieldName="Itemcode"   VisibleIndex="1" Caption="Mã sản phẩm">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="Itemname" VisibleIndex="3" Caption="Tên Sản Phẩm">
                                     <EditFormSettings Visible="False" />
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="Brand" VisibleIndex="4" Caption="Nhãn hàng">
                                     <EditFormSettings Visible="False" />
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="Category" VisibleIndex="5" Caption="Nhóm hàng">
                                     <EditFormSettings Visible="False" />
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="Subbrand" VisibleIndex="6" Caption="Nhãn phụ">
                                     <EditFormSettings Visible="False" />
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="Unit" VisibleIndex="7" Caption="Đơn vị tính">
                                     <EditFormSettings Visible="False" />
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="Price" VisibleIndex="8" Caption="Giá bán lẻ">
                                     <EditFormSettings Visible="False" />
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="Volumn" VisibleIndex="9">
                                     <EditFormSettings Visible="False" />
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="Type" VisibleIndex="10" Caption="Loại">
                                     <EditFormSettings Visible="False" />
                                 </dx:GridViewDataTextColumn>
                              <dx:GridViewDataTextColumn FieldName="Nhan" VisibleIndex="11" Caption="Nhóm Nhàng">
                                  <EditFormSettings Visible="False" />
                                 </dx:GridViewDataTextColumn> 

                              
                                 
                                 <dx:GridViewDataTextColumn FieldName="varUnit" VisibleIndex="14" Caption="Quy Cách">
                                     <EditFormSettings Visible="False" />
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataComboBoxColumn Caption="Loại SP" FieldName="Loai" VisibleIndex="12" >
                                     <PropertiesComboBox DropDownStyle="DropDown">
                                         <Items>
                                             <dx:ListEditItem Text="Bình thường" Value="Normal" />
                                             <dx:ListEditItem Text="Hộp quà" Value="Gift" />
                                             <dx:ListEditItem Text="Group" Value="Group" />
                                             <dx:ListEditItem Text="Tray" Value="Tray" />
                                             <dx:ListEditItem Text="Khuyến dùng" Value="Free" />
                                         </Items>
                                     </PropertiesComboBox>
                                     <EditFormSettings Visible="False" />
                                 </dx:GridViewDataComboBoxColumn>
                             </Columns>

                             <SettingsPager RenderMode="Lightweight" PageSize="40" AlwaysShowPager="True"></SettingsPager>

                             <SettingsEditing Mode="PopupEditForm"></SettingsEditing>

                             <Settings ShowFilterRow="true" ShowGroupPanel="True" />
                         </dx:ASPxGridView>





     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" DeleteCommand="DELETE FROM [Tb_DMS_topSku] WHERE [Itemcode] = @Itemcode " InsertCommand="INSERT INTO [Tb_DMS_topSku] ([Itemcode], [Activer], [Lastchange], [Users]) VALUES (@Itemcode, 1, Getdate(), @Users)" SelectCommand="SELECT Tb_DMS_topSku.Itemcode, Tb_DMS_topSku.Activer, Tb_DMS_topSku.Lastchange, Tb_DMS_topSku.Users, tbItems.Itemname, tbItems.Brand, tbItems.Category, tbItems.Subbrand, tbItems.Unit, tbItems.Price, tbItems.Volumn, tbItems.Type, tbItems.OldItemcode, tbItems.Nhan, tbItems.mui, tbItems.varUnit, tbItems.Loai, tbItems.Thung, tbItems.Barcode, tbItems.Variants FROM Tb_DMS_topSku INNER JOIN tbItems ON Tb_DMS_topSku.Itemcode = tbItems.OldItemcode ORDER BY Tb_DMS_topSku.Itemcode">
         <DeleteParameters>
             <asp:Parameter Name="Itemcode" Type="String" />
         
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="Itemcode" Type="String" />
           
                <asp:SessionParameter Name="Users" SessionField="TenDangNhap" />
         </InsertParameters>
     </asp:SqlDataSource>

    <dx:ASPxPopupControl ID="pcCreateAccount1" ClientInstanceName="ghang" runat="server" AllowDragging="True" MaxHeight="560px" Width ="700px"
        PopupHorizontalAlign="WindowCenter" HeaderText="Thông tin đơn hàng của bạn" PopupVerticalAlign="WindowCenter" Maximized="True" MaxWidth="800px" CloseAction="None" Height="400px" Modal="True" PopupHorizontalOffset="100" PopupVerticalOffset="100"  >
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel2" ClientInstanceName="callbackPanel" runat="server"
                    Width="100%" Height="100%" RenderMode="table">
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent4" runat="server">

                           <dx:ASPxGridView  Width="100%" ID="ggiohang" runat="server" ClientInstanceName="dGrid" KeyFieldName="MASP" AutoGenerateColumns="False">

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
                                 
                                <Columns>

                                    <dx:GridViewCommandColumn  VisibleIndex="0" ButtonType="Image"  Width ="40px">
                                        <EditButton Visible="True">
                                            <Image Url="~/Content/Images/edit.png">
                                            </Image>
                                        </EditButton>
                                        <DeleteButton Visible="True">
                                            <Image Url="~/Content/Images/erase.png">
                                            </Image>
                                        </DeleteButton>
                                    </dx:GridViewCommandColumn>

                                    <dx:GridViewDataTextColumn FieldName="MASP" Caption="Mã sản phẩm" VisibleIndex="1" Width ="100px" ReadOnly="True">
                                    </dx:GridViewDataTextColumn>
                                   
                                </Columns>
                            </dx:ASPxGridView> 

                            <table id="form" width="100%">

                                <tr>
                                    <td>
                                        
                                            <dx:ASPxButton ID="ASPxSV" runat="server" Text="Hủy" Width="100%" AutoPostBack="True"  >
                                                <ClientSideEvents Click="function(s, e) {    ghang.Hide(); }" />
                                                  <Image Url="~/Content/Images/dele.png"></Image>
                                            </dx:ASPxButton>
</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                                <dx:ASPxButton ID="Bt_dieuChinh" runat="server" Text="Import" ClientInstanceName="d"  UseSubmitBehavior="False" > <Image Url="~/Content/Images/ok.png"></Image></dx:ASPxButton>
 
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



</asp:Content>
