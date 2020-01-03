<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="CTKM.aspx.vb" Inherits="WEB.SSM.CTKM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 
    <table>
        <tr><td> <a style="text-align: right"> Ngày Bắt Đầu</a></td>
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
                    <dx:ASPxButton ID="Btok" runat="server" Text="OK">
                    </dx:ASPxButton>
                </td>
            <td>
                <dx:ASPxButton ID="butsyn" runat="server" Text="Chuyển sang unzadata" >
                </dx:ASPxButton>
                
            </td>
            <td>
                <dx:ASPxButton ID="Btsyns" runat="server" Text="Import CTKM from Unzadata"  >
                </dx:ASPxButton>
                
            </td>
        </tr>
    </table>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"  KeyFieldName="ID" OnRowUpdating="ASPxGridView1_RowUpdating"
        Width="100%" OnRowInserting="ASPxGridView1_RowInserting"  OnCustomButtonCallback="ASPxGridView1_CustomButtonCallback"
        OnInitNewRow="ASPxGridView1_InitNewRow"  >
        <Columns>
            <dx:GridViewCommandColumn   ButtonType="Image" VisibleIndex="0">
                <EditButton Visible="True">
                     <Image ToolTip="Edit" Url="~/Content/Images/edit.png" />
                </EditButton>
                <NewButton>
                     <Image ToolTip="New" Url="~/Content/Images/new.png" />
                </NewButton>
                          
                 <DeleteButton>
                     <Image ToolTip="xóa CTKM" Url="~/Content/Images/erase.png">
                     </Image>
                </DeleteButton>
                          
            <%--     <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="copy">
                        <Image ToolTip="Copy CTKM" Url="~/Content/Images/clone.png" />
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>--%>
                  
                <CancelButton Text="Close">
                </CancelButton>
                  
            </dx:GridViewCommandColumn>
            
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MaCT" Caption ="Mã chương trình" VisibleIndex="2" Width="10%">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataMemoColumn FieldName="TenCT" Caption ="Tên chương trình" VisibleIndex="3" Width="100%">
            </dx:GridViewDataMemoColumn>
            <%--<dx:GridViewDataTextColumn FieldName="NhanSP" Caption ="Nhóm Sản Phẩm"  VisibleIndex="4" Width="100%">--%>
               <dx:GridViewDataComboBoxColumn Caption="Nhóm Sản Phẩm" FieldName="NhanSP" VisibleIndex="4" >
                                     <PropertiesComboBox DropDownStyle="DropDown">
                                         <Items>
                                             <dx:ListEditItem value=" "  />
                                             <dx:ListEditItem value="BIOESSENCE" />
                                                                                
                                              <dx:ListEditItem value="ROMANO"   />
                                             
                                              <dx:ListEditItem value="ENCHANTEUR"   />
                                               <dx:ListEditItem value="EVERSOFT"   />
                                               <dx:ListEditItem value="GERVENNE"   />
                                              <dx:ListEditItem value="IZZI"  />
                                         </Items>
                                     </PropertiesComboBox>
                                 </dx:GridViewDataComboBoxColumn> 
             <%--</dx:GridViewDataTextColumn>--%>
           <%-- <dx:GridViewDataTextColumn FieldName="LoaiCT" Caption ="Loại chương trình" VisibleIndex="5">
            </dx:GridViewDataTextColumn>--%>
            <dx:GridViewDataComboBoxColumn Caption="Loại chương trình" FieldName="LoaiCT" VisibleIndex="5"  PropertiesComboBox-TextFormatString=" {0} ">
                <PropertiesComboBox DropDownStyle="DropDown">
                    <Items>
                        <dx:ListEditItem Text="KM Trực Tiếp" Value="KMTT" />
                        <dx:ListEditItem Text="KM Tặng Thêm" Value="KMTS" />
                        <dx:ListEditItem Text="KM Chiết Khấu" Value="KMCK" />
                        <dx:ListEditItem Text="KM Trưng Bày" Value="KMTB" />
                         <dx:ListEditItem Text="KM Tích Lũy" Value="KMTL" />
                        <dx:ListEditItem Text="KM Khuyến Dùng" Value="KMKD" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="TyleCK" Caption ="Tỷ Lệ CK"  VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Ngaybd" Caption ="Từ Ngày"  VisibleIndex="7">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="Ngaykt" Caption ="Đến Ngày" VisibleIndex="8">
            </dx:GridViewDataDateColumn>
           <%-- <dx:GridViewDataTextColumn FieldName="Type" Caption ="Loại"  VisibleIndex="9">

            </dx:GridViewDataTextColumn>--%>
             <dx:GridViewDataComboBoxColumn Caption="Loại" FieldName="Type" VisibleIndex="9"  PropertiesComboBox-TextFormatString=" {0} ">
                <PropertiesComboBox DropDownStyle="DropDown">
                    <Items>
                        <dx:ListEditItem Text="Áp Dụng cho tất cả" Value="N" />
                        <dx:ListEditItem Text="Áp dụng cho 1 số" Value="E" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
       
        <SettingsBehavior AllowSelectByRowClick="true" ConfirmDelete="True" />
        <SettingsPager PageSize="100">
        </SettingsPager>
        <SettingsLoadingPanel Text="Vui Lòng Chờ" />
        <SettingsPopup>
            <EditForm AllowResize="True" />
        </SettingsPopup>
        <Templates>
            <EditForm>
             
                <div style="padding: 4px 4px 3px 4px">
                    <dx:ASPxPageControl runat="server" ID="pageControl" Width="100%">
                        <TabPages>
                            <dx:TabPage Text="Thông tin chung chương trình khuyến mãi" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl1" runat="server">
                                        <dx:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors"
                                            runat="server">
                                            
                                        </dx:ASPxGridViewTemplateReplacement>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Danh sách Sản Phẩm áp dụng" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl2" runat="server">
                                         <div>
        
        <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False" OnClick="btnXlsxExport_Click" />
    </div>
                                        <%--  <dx:ASPxMemo runat="server" ID="TenCTs" Text='<%# Eval("TenCT")%>' Width="100%" Height="93px">
                                        </dx:ASPxMemo>--%>
                                        <%--<dx:ASPxGridView ID="GirlNpp" Width ="50%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource11" KeyFieldName="ID" OnBeforePerformDataSelect="GirlNpp_DataSelect" OnInitNewRow="GirlNpp_InitNewRow"     >
                                            <Columns>
                                                <dx:GridViewCommandColumn VisibleIndex="0">
                                                    <NewButton Visible="True">
                                                    </NewButton>
                                                    <DeleteButton Visible="True">
                                                    </DeleteButton>
 
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1" Visible="false">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MS_CTKM" Caption="Mã CT" VisibleIndex="2">
                                                </dx:GridViewDataTextColumn>
                                        
                                                <dx:GridViewDataComboBoxColumn FieldName="MS_NPP" Width="80%" VisibleIndex="3" PropertiesComboBox-DataSourceID="SqlDataSource4" PropertiesComboBox-DropDownStyle="DropDownList" PropertiesComboBox-ValueType="System.String" PropertiesComboBox-TextFormatString="  {0} {1} "
                                                    PropertiesComboBox-IncrementalFilteringMode="Contains" PropertiesComboBox-ValueField="Debcode" Caption="Nhà phân phối">


                                                    <PropertiesComboBox DataSourceID="SqlDataSource4">
                                                        <Columns>
                                                            <dx:ListBoxColumn FieldName="Debcode" />
                                                            <dx:ListBoxColumn FieldName="Debname" />
                                                            <dx:ListBoxColumn FieldName="Region" />
                                                        </Columns>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataTextColumn FieldName="Trangthai" VisibleIndex="4">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:ASPxGridView>
                                        
                                        <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" DeleteCommand="DELETE FROM [TB_CTKM_NPP] WHERE [ID] = @ID" InsertCommand="INSERT INTO [TB_CTKM_NPP] ([MS_CTKM], [MS_NPP], [Trangthai]) VALUES (@MS_CTKM, @MS_NPP, @Trangthai)" SelectCommand="SELECT * FROM [TB_CTKM_NPP] WHERE ([MS_CTKM] = @MS_CTKM) ORDER BY [ID] DESC" UpdateCommand="UPDATE [TB_CTKM_NPP] SET [MS_CTKM] = @MS_CTKM, [MS_NPP] = @MS_NPP, [Trangthai] = @Trangthai WHERE [ID] = @ID">
                                            <DeleteParameters>
                                                <asp:Parameter Name="ID" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="MS_CTKM" Type="String" />
                                                <asp:Parameter Name="MS_NPP" Type="String" />
                                                <asp:Parameter Name="Trangthai" Type="Int32" />
                                            </InsertParameters>
                                            <SelectParameters>
                                                <asp:SessionParameter Name="MS_CTKM" SessionField="MaCT" Type="string" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="MS_CTKM" Type="String" />
                                                <asp:Parameter Name="MS_NPP" Type="String" />
                                                <asp:Parameter Name="Trangthai" Type="Int32" />
                                                <asp:Parameter Name="ID" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>--%>
                                        <dx:ASPxGridView ID="ASPdtad" runat="server" AutoGenerateColumns="False" DataSourceID="SqlCtkMSP" OnBeforePerformDataSelect="ASPdtad_DataSelect">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="mact" VisibleIndex="0" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Itemcode" VisibleIndex="1" Caption="Mã SP">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ItemnameEng" VisibleIndex="2" Caption="Tên SP">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Brand" VisibleIndex="3"  >
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Category" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Price" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Volumn" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="mui" VisibleIndex="7" Caption="Mùi hương">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="varUnit" VisibleIndex="8" Caption="Quy Cách">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Quydoi" ReadOnly="True" VisibleIndex="9" Caption="Sl Quy đổi">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Nhan" VisibleIndex="10" Caption="Nhóm hàng">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Loai" VisibleIndex="11" Caption="Loại SP">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlCtkMSP" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT vw_doituong.mact, tbItems.Itemcode, tbItems.ItemnameEng, tbItems.Brand, tbItems.Category, tbItems.Price, tbItems.Volumn, tbItems.mui, tbItems.varUnit, vw_doituong.slqd AS Quydoi, tbItems.Nhan, tbItems.Loai FROM vw_doituong INNER JOIN tbItems ON vw_doituong.MaSP = tbItems.Itemcode WHERE (tbItems.Type = 'Y') AND (vw_doituong.mact = @mact)">
        <SelectParameters>
            <asp:SessionParameter Name="mact" SessionField="MaCT" />
        </SelectParameters>
    </asp:SqlDataSource>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Danh sách Sản Phẩm Khuyến Mãi" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl3" runat="server">
                                         <div>
        
        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Export to Excel" UseSubmitBehavior="False" OnClick="btnXlsxExport1_Click" />
    </div>
                                        
                                        <dx:ASPxGridView ID="ASPKM" runat="server" AutoGenerateColumns="False" DataSourceID="SqlCtkMSPKM" OnBeforePerformDataSelect="ASPKM_DataSelect">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="mact" VisibleIndex="0" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Itemcode" VisibleIndex="1" Caption="Mã SP">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ItemnameEng" VisibleIndex="2" Caption="Tên SP">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Brand" VisibleIndex="3"  >
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Category" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Price" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Volumn" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="mui" VisibleIndex="7" Caption="Mùi hương">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="varUnit" VisibleIndex="8" Caption="Quy Cách">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Quydoi" ReadOnly="True" VisibleIndex="9" Caption="Sl Quy đổi">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Nhan" VisibleIndex="10" Caption="Nhóm hàng">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Loai" VisibleIndex="11" Caption="Loại SP">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlCtkMSPKM" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT vw_doituong.mact, tbItems.Itemcode, tbItems.ItemnameEng, tbItems.Brand, tbItems.Category, tbItems.Price, tbItems.Volumn, tbItems.mui, tbItems.varUnit, vw_doituong.slqd AS Quydoi, tbItems.Nhan, tbItems.Loai FROM vw_doituongkm as vw_doituong INNER JOIN tbItems ON vw_doituong.MaSP = tbItems.Itemcode WHERE (tbItems.Type = 'Y') AND (vw_doituong.mact = @mact)">
        <SelectParameters>
            <asp:SessionParameter Name="mact" SessionField="MaCT" />
        </SelectParameters>
    </asp:SqlDataSource>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>


                        </TabPages>
                    </dx:ASPxPageControl>
                </div>
                <%--      //theo line--%>

                <div style="text-align: right; padding: 2px 2px 2px 2px">
                    <table style="text-align: right">
                        <tr>
                            <td>
   <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                        runat="server"></dx:ASPxGridViewTemplateReplacement> 
                            </td>
                            <td>
   <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                        runat="server"></dx:ASPxGridViewTemplateReplacement>
                            </td>
                            <td>
  
<%--                    <dx:ASPxButton ID="btCTKM" runat="server" Text="Nhà phân phối"  RenderMode = "Link">
                      
                    </dx:ASPxButton>--%>
                            </td>
                        </tr>
                    </table>
                  
                 
                </div>
                 
            </EditForm>
        </Templates>
        <Settings ShowFilterRow="True" />
    </dx:ASPxGridView>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPdtad" FileName="DS_san_pham_ap"></dx:ASPxGridViewExporter>
       <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" GridViewID="ASPKM" FileName="DS_san_pham_Km"></dx:ASPxGridViewExporter>

<%--    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [tbCTKM] ORDER BY [Ngaybd] DESC" DeleteCommand="DELETE FROM [tbCTKM] WHERE [ID] = @original_ID" InsertCommand="INSERT INTO [tbCTKM] ([MaCT], [TenCT], [NhanSP], [LoaiCT], [TyleCK], [Ngaybd], [Ngaykt], [Type]) VALUES (@MaCT, @TenCT, @NhanSP, @LoaiCT, @TyleCK, @Ngaybd, @Ngaykt, @Type)" UpdateCommand="UPDATE [tbCTKM] SET [MaCT] = @MaCT, [TenCT] = @TenCT, [NhanSP] = @NhanSP, [LoaiCT] = @LoaiCT, [TyleCK] = @TyleCK, [Ngaybd] = @Ngaybd, [Ngaykt] = @Ngaykt, [Type] = @Type WHERE [ID] = @original_ID">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MaCT" Type="String" />
            <asp:Parameter Name="TenCT" Type="String" />
            <asp:Parameter Name="NhanSP" Type="String" />
            <asp:Parameter Name="LoaiCT" Type="String" />
            <asp:Parameter Name="TyleCK" Type="Single" />
            <asp:Parameter Name="Ngaybd" Type="DateTime" />
            <asp:Parameter Name="Ngaykt" Type="DateTime" />
            <asp:Parameter Name="Type" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MaCT" Type="String" />
            <asp:Parameter Name="TenCT" Type="String" />
            <asp:Parameter Name="NhanSP" Type="String" />
            <asp:Parameter Name="LoaiCT" Type="String" />
            <asp:Parameter Name="TyleCK" Type="Single" />
            <asp:Parameter Name="Ngaybd" Type="DateTime" />
            <asp:Parameter Name="Ngaykt" Type="DateTime" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="original_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>--%>
        
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand=" select  b.ID,b.[MaCT],[TenCT],[NhanSP],[LoaiCT],[TyleCK],[Ngaybd] ,[Ngaykt],[Type],[Ngansach],[SoluongSKu],[khongapdung]  from ( select * FROM tbCTKM Where ngaybd &lt;=@date1  and ngaykt&gt;= @date2 union all select * FROM tbCTKM Where ngaybd &gt; @date1  and ngaybd&lt;= @date2 union all select * FROM tbCTKM Where ngaykt &gt;@date1 and ngaykt&lt; @date2 ) b 
group by  b.id,b.[MaCT],[TenCT],[NhanSP],[LoaiCT],[TyleCK],[Ngaybd] ,[Ngaykt],[Type],[Ngansach],[SoluongSKu],[khongapdung] ORDER BY [Ngaybd] DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="datest" Name="date1" PropertyName="Value" />
            <asp:ControlParameter ControlID="dateen" Name="date2" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Debcode, Debname, Debadd, Region, Subregion, Area, Province FROM dbo.Fn_cust(@uname) AS Fn_cust_1">
        <SelectParameters>
            <asp:SessionParameter Name="uname" SessionField="TenDangNhap" />
        </SelectParameters>
    </asp:SqlDataSource>
        
    
        
</asp:Content>
