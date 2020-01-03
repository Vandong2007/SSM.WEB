<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="SanPham.aspx.vb" Inherits="WEB.SSM.SanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <dx:ASPxPageControl runat="server" ID="pageControl" Width="100%" ActiveTabIndex="0" Height="100%">
         <TabPages>
             <dx:TabPage Text="Danh sách sản phẩm" Visible="true">
                 <ContentCollection>
                     <dx:ContentControl ID="ContentControl1" runat="server">

                         <div>
                             <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1" FileName="DSSanPham"></dx:ASPxGridViewExporter>
                             <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False" OnClick="btnXlsxExport_Click" />
                         </div>
                         <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Itemcode" Width="100%" SettingsEditing-Mode="EditForm" SettingsPager-RenderMode="Lightweight" SettingsPager-SEOFriendly="Disabled" Settings-ShowFilterBar="Auto">
                             <Columns>
                                 <dx:GridViewCommandColumn VisibleIndex="0">
                                     <EditButton Visible="True">
                                     </EditButton>
                                 </dx:GridViewCommandColumn>
                                 <dx:GridViewDataTextColumn FieldName="Itemcode" ReadOnly="True" VisibleIndex="1" Caption="Mã sản phẩm">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="Itemname" VisibleIndex="3" Caption="Tên Sản Phẩm">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="Brand" VisibleIndex="4" Caption="Nhãn hàng">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="Category" VisibleIndex="5" Caption="Nhóm hàng">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="Subbrand" VisibleIndex="6" Caption="Nhãn phụ">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="Unit" VisibleIndex="7" Caption="Đơn vị tính">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="Price" VisibleIndex="8" Caption="Giá bán lẻ">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="Volumn" VisibleIndex="9">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn FieldName="Type" VisibleIndex="10" Caption="Loại">
                                 </dx:GridViewDataTextColumn>
                                <%--  <dx:GridViewDataTextColumn FieldName="Nhan" VisibleIndex="11" Caption="Nhóm Nhàng">
                                 </dx:GridViewDataTextColumn>--%>
                                 <dx:GridViewDataComboBoxColumn FieldName="Nhan"   VisibleIndex="11" PropertiesComboBox-DataSourceID="Sqlmui" PropertiesComboBox-DropDownStyle="DropDownList" PropertiesComboBox-ValueType="System.String" PropertiesComboBox-TextFormatString="{0}"
                                                    PropertiesComboBox-IncrementalFilteringMode="Contains" PropertiesComboBox-ValueField="Nhan" Caption ="Nhóm Nhàng"> 
                                      
                                                    <PropertiesComboBox  DataSourceID="SqlNhan" >
                                                        <Columns>
                                                            <dx:ListBoxColumn FieldName="Nhan" />
                                                         
                                                        </Columns>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                               <%--   <dx:GridViewDataTextColumn FieldName="mui" VisibleIndex="12" Caption ="Mùi Hương">
                                 </dx:GridViewDataTextColumn>--%>
                                  <dx:GridViewDataComboBoxColumn FieldName="mui"   VisibleIndex="12" PropertiesComboBox-DataSourceID="Sqlmui" PropertiesComboBox-DropDownStyle="DropDownList" PropertiesComboBox-ValueType="System.String" PropertiesComboBox-TextFormatString="{0}"
                                                    PropertiesComboBox-IncrementalFilteringMode="Contains" PropertiesComboBox-ValueField="mui" Caption ="Mùi Hương"> 
                                      
                                                    <PropertiesComboBox  DataSourceID="Sqlmui" >
                                                        <Columns>
                                                            <dx:ListBoxColumn FieldName="mui" />
                                                         
                                                        </Columns>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                              

                                 <dx:GridViewDataTextColumn FieldName="OldItemcode" VisibleIndex="15">
                                 </dx:GridViewDataTextColumn>
                                 
                                 <dx:GridViewDataTextColumn FieldName="varUnit" VisibleIndex="14" Caption="Quy Cách">
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
                                 </dx:GridViewDataComboBoxColumn>
                             </Columns>

                             <SettingsPager RenderMode="Lightweight"></SettingsPager>

                             <SettingsEditing Mode="EditForm"></SettingsEditing>

                             <Settings ShowFilterRow="true" />
                         </dx:ASPxGridView>

                             <asp:SqlDataSource ID="Sqlmui" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
                                                   
 SELECT  mui FROM [tbItems] a    group by a.mui ">  </asp:SqlDataSource>

                             <asp:SqlDataSource ID="SqlNhan" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
                                                   
 SELECT  Nhan FROM [tbItems] a    group by a.Nhan ">  </asp:SqlDataSource>

                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT * FROM [tbItems] where type='Y'" OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [tbItems] WHERE [Itemcode] = @original_Itemcode" InsertCommand="INSERT INTO [tbItems] ([Itemcode], [ItemnameEng], [Itemname], [Brand], [Category], [Subbrand], [Unit], [Price], [Volumn], [Type],[Nhan]
      ,[mui], [OldItemcode],varUnit,Loai) VALUES (@Itemcode, @ItemnameEng, @Itemname, @Brand, @Category, @Subbrand, @Unit, @Price, @Volumn, @Type,@Nhan,@mui, @OldItemcode,@varUnit,@Loai)" UpdateCommand="UPDATE [tbItems] SET [ItemnameEng] = @ItemnameEng, [Itemname] = @Itemname, [Brand] = @Brand, [Category] = @Category, [Subbrand] = @Subbrand, [Unit] = @Unit, [Price] = @Price, [Volumn] = @Volumn, [Type] = @Type, [OldItemcode] = @OldItemcode , Loai=@Loai,
[Nhan] = @Nhan,[mui] =@mui,varUnit =@varUnit
WHERE [Itemcode] = @original_Itemcode">
                             <DeleteParameters>
                                 <asp:Parameter Name="original_Itemcode" Type="String" />
                             </DeleteParameters>
                             <InsertParameters>
                                 <asp:Parameter Name="Itemcode" Type="String" />
                                 <asp:Parameter Name="ItemnameEng" Type="String" />
                                 <asp:Parameter Name="Itemname" Type="String" />
                                 <asp:Parameter Name="Brand" Type="String" />
                                 <asp:Parameter Name="Category" Type="String" />
                                 <asp:Parameter Name="Subbrand" Type="String" />
                                 <asp:Parameter Name="Unit" Type="String" />
                                 <asp:Parameter Name="Price" Type="Double" />
                                 <asp:Parameter Name="Volumn" Type="Double" />
                                 <asp:Parameter Name="Type" Type="String" />
                                 <asp:Parameter Name="Nhan" Type="String" />
                                 <asp:Parameter Name="mui" Type="String" />
                                 <asp:Parameter Name="OldItemcode" Type="String" />
                                 <asp:Parameter Name="varUnit"  Type="Double" />
                                 <asp:Parameter Name="Loai" Type="String"  />
                             </InsertParameters>
                             <UpdateParameters>
                                 <asp:Parameter Name="ItemnameEng" Type="String" />
                                 <asp:Parameter Name="Itemname" Type="String" />
                                 <asp:Parameter Name="Brand" Type="String" />
                                 <asp:Parameter Name="Category" Type="String" />
                                 <asp:Parameter Name="Subbrand" Type="String" />
                                 <asp:Parameter Name="Unit" Type="String" />
                                 <asp:Parameter Name="Price" Type="Double" />
                                 <asp:Parameter Name="Volumn" Type="Double" />
                                 <asp:Parameter Name="Type" Type="String" />
                                 <asp:Parameter Name="OldItemcode" Type="String" />
                                   <asp:Parameter Name="Nhan" Type="String" />
                                 <asp:Parameter Name="mui" Type="String" />
                                 <asp:Parameter Name="varUnit"  Type="Double" />
                                 <asp:Parameter Name="Loai" Type="String"  />
                                 <asp:Parameter Name="original_Itemcode" Type="String" />
                             </UpdateParameters>

                         </asp:SqlDataSource>
                         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT Brand FROM [tbItems] group by Brand "></asp:SqlDataSource>
                                                       </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Danh sách sản phẩm Group">
                                <ContentCollection>
                                    <dx:ContentControl runat="server"  >
                                          <div>
                             <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" GridViewID="ASPxGridView2" FileName="DSSanPhamGroup"></dx:ASPxGridViewExporter>
                             <dx:ASPxButton ID="btnXlsxExport2" runat="server" Text="Export to Excel" UseSubmitBehavior="False" OnClick="btnXlsxExport2_Click"  />
                         </div>
                                        <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlItemGrp" KeyFieldName="CompositeKey" OnCustomUnboundColumnData="ASPxGridView2_CustomUnboundColumnData">
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <EditButton Visible="True">
                                                    </EditButton>
                                                    <NewButton Visible="True">
                                                    </NewButton>
                                                    <DeleteButton Visible="True">
                                                    </DeleteButton>
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="ItemGrp"   ShowInCustomizationForm="True" VisibleIndex="1" Caption="Mã Sản Phẩm">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Itemcode"  ShowInCustomizationForm="True" VisibleIndex="4" Caption="Mã SP Con">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ItemQu" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Số lượng SP Con">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Type"  ShowInCustomizationForm="True" VisibleIndex="8" Caption="Loại">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="GrpRBP" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Giá Sản Phẩm">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="itemRRBP" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Giá SP con">
                                                <EditFormSettings Visible="False" />
                                                     </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="tyle" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Tỷ lệ">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Vesion"   ShowInCustomizationForm="True" VisibleIndex="10" Caption="Vesion">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Itemname" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Tên Sản Phẩm Con">
                                                <EditFormSettings Visible="False" />
                                                     </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Groupname" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Tên SP ">
                                                    <EditFormSettings Visible="False" />
                                                     <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Nhãn SP" FieldName="Brand" ShowInCustomizationForm="True" VisibleIndex="11">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Nhóm SP" FieldName="category" ShowInCustomizationForm="True" VisibleIndex="12">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                           <dx:GridViewDataColumn FieldName="CompositeKey"  Visible="False" ReadOnly="True" VisibleIndex="13" UnboundType="String">
                                               <EditFormSettings Visible="False" />
           </dx:GridViewDataColumn> </Columns>
                                            <Settings ShowFilterRow="True" />
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlItemGrp" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" DeleteCommand="DELETE FROM [tbItemsGrp] WHERE [ItemGrp] = @ItemGrp AND [Itemcode] = @Itemcode AND [Type] = @Type AND [Vesion] = @Vesion" InsertCommand="INSERT INTO [tbItemsGrp] ([ItemGrp], [GroupQu], [Itemcode], [ItemQu], [Tyle], [Type], [Vesion], [newcode]) VALUES (@ItemGrp, @GroupQu, @Itemcode, @ItemQu, @Tyle, @Type, @Vesion, @newcode)" SelectCommand="SELECT ItemGrp, Itemcode, ItemQu, Type, GrpRBP, itemRRBP, tyle, Vesion, Itemname, Groupname, Brand, category FROM View_Itemfull" UpdateCommand="UPDATE [tbItemsGrp] SET   [GroupQu] = @GroupQu, [ItemQu] = @ItemQu, [Tyle] = @Tyle, [newcode] = @newcode WHERE [ItemGrp] = @ItemGrp AND [Itemcode] = @Itemcode AND [Type] = @Type AND [Vesion] = @Vesion">
                                            <DeleteParameters>
                                                <asp:Parameter Name="ItemGrp" Type="String" />
                                                <asp:Parameter Name="Itemcode" Type="String" />
                                                <asp:Parameter Name="Type" Type="String" />
                                                <asp:Parameter Name="Vesion" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="ItemGrp" Type="String" />
                                                <asp:Parameter Name="GroupQu" Type="Int32" />
                                                <asp:Parameter Name="Itemcode" Type="String" />
                                                <asp:Parameter Name="ItemQu" Type="Int32" />
                                                <asp:Parameter Name="Tyle" Type="Decimal" />
                                                <asp:Parameter Name="Type" Type="String" />
                                                <asp:Parameter Name="Vesion" Type="Int32" />
                                                <asp:Parameter Name="newcode" Type="String" />
                                            </InsertParameters>
                                            <UpdateParameters>
                                               
                                                <asp:Parameter Name="GroupQu" Type="Int32" />
                                                <asp:Parameter Name="ItemQu" Type="Int32" />
                                                <asp:Parameter Name="Tyle" Type="Decimal" />
                                                <asp:Parameter Name="newcode" Type="String" />
                                                <asp:Parameter Name="ItemGrp" Type="String" />
                                                <asp:Parameter Name="Itemcode" Type="String" />
                                                <asp:Parameter Name="Type" Type="String" />
                                                <asp:Parameter Name="Vesion" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>

      <%--  <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT Area FROM tbCustomer   GROUP BY Area" >
      
        </asp:SqlDataSource>--%>
</asp:Content>
