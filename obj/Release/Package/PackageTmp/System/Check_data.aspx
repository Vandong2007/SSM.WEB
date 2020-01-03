<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="Check_data.aspx.vb" Inherits="WEB.SSM.Check_data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
     <script type="text/javascript">
         function OnClickButtonDel(s, e) {
             grid.PerformCallback('Delete');
         }
         var _selectNumber = 0;
         var _all = false;
         var _handle = true;

         function OnAllCheckedChanged(s, e) {
             if (s.GetChecked())
                 grid.SelectRows();
             else
                 grid.UnselectRows();
         }

         function OnGridSelectionChanged(s, e) {
             cbAll.SetChecked(s.GetSelectedRowCount() == s.cpVisibleRowCount);

             if (e.isChangedOnServer == false) {
                 if (e.isAllRecordsOnPage && e.isSelected)
                     _selectNumber = s.GetVisibleRowsOnPage();
                 else if (e.isAllRecordsOnPage && !e.isSelected)
                     _selectNumber = 0;
                 else if (!e.isAllRecordsOnPage && e.isSelected)
                     _selectNumber++;
                 else if (!e.isAllRecordsOnPage && !e.isSelected)
                     _selectNumber--;

                 if (_handle) {
                     cbPage.SetChecked(_selectNumber == s.GetVisibleRowsOnPage());
                     _handle = false;
                 }
                 _handle = true;
             }
             else {
                 cbPage.SetChecked(cbAll.GetChecked());
             }
         }

         function OnPageCheckedChanged(s, e) {
             _handle = false;
             if (s.GetChecked())
                 grid.SelectAllRowsOnPage();
             else
                 grid.UnselectAllRowsOnPage();
         }

         function OnGridEndCallback(s, e) {
             _selectNumber = s.cpSelectedRowsOnPage;
         }

    </script>
    
     
                    <dx:ASPxPageControl runat="server" ID="pageControl" Width="100%" ActiveTabIndex="2" Height="100%">
                        <TabPages>
                            <dx:TabPage Text="Kiểm tra tồn kho" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl1" runat="server">
                                       <div style="text-align: right; padding: 2px 2px 2px 2px">
                    


                </div>

     
    
    
     <table style="width: 100%"  frame="below" >
            <tr>
                <td style="width: auto"> <h3>Tồn kho theo ngày</h3></td>
                <td style="width: auto"> <a style="text-align: right"> Chọn ngày tồn kho</a></td>
                <td  Width= "auto" style="margin-left: 80px"> <dx:ASPxDateEdit ID="datest" runat="server" AutoPostBack ="True" Width= "100px"  Height ="100%" style="margin-left: 0px"  >
                    </dx:ASPxDateEdit></td>
                
                <td> <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False"   Width="165px" />
                    
                    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="ASPxPivotGrid1"></dx:ASPxPivotGridExporter>
                </td>
            </tr>
              </table>
 
        <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID"  Width ="100%" DataSourceID="SqlDataSource2"   SummaryText="Tổng Cộng">
            <Fields>
                <dx:PivotGridField ID="fieldRegion" AreaIndex="0" FieldName="Region" Area="RowArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldArea" AreaIndex="1" FieldName="Area" Area="RowArea">
                </dx:PivotGridField>
                 <dx:PivotGridField ID="PivotGridField3" AreaIndex="2" FieldName="MaNPP" Caption="Mã NPP" GroupIndex="0" InnerGroupIndex="0" Area="RowArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField4" AreaIndex="3" FieldName="TenNPP" Caption="Tên Nhà Phân Phối" GroupIndex="0" InnerGroupIndex="1" Area="RowArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField5" Area="RowArea" AreaIndex="4" FieldName="MaSP" Caption="Mã Sản Phẩm"   GroupIndex="1" InnerGroupIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField6" Area="RowArea" AreaIndex="5" FieldName="TenSP" Caption="Tên Sản Phẩm" GroupIndex="1" InnerGroupIndex="1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField7"    FieldName="NhanSP" Caption="Nhãn Sản Phẩm" AreaIndex="0"   >
                </dx:PivotGridField>
               
                <dx:PivotGridField ID="fieldGia" Area="RowArea" AreaIndex="6" FieldName="Gia" Caption="Đơn Giá" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom">
                    <ValueStyle HorizontalAlign="Right">
                    </ValueStyle>
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTonCK" Area="DataArea"   AreaIndex="0" FieldName="TonCK"   Caption="SL Tồn Cuối" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" 
                     >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTonCKHB" Area="DataArea" AreaIndex="1" FieldName="TonCKHB"   Caption="SL Hàng Bán" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" 
                     >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTonCKKM" Area="DataArea" AreaIndex="2" FieldName="TonCKKM" Caption="SL Khuyến Mãi" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" 
                     >
                </dx:PivotGridField>
            </Fields>
            <OptionsPager RowsPerPage="100">
            </OptionsPager>
            <Groups>
                <dx:PivotGridWebGroup Caption="Nhà Phân Phối" ShowNewValues="True" />
                <dx:PivotGridWebGroup Caption="Sản Phẩm" ShowNewValues="True" />
            </Groups>

        </dx:ASPxPivotGrid>
 
 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="Tonkhoam" SelectCommandType="StoredProcedure" >
        <SelectParameters>
            <asp:SessionParameter Name="Username" SessionField="TenDangNhap" Type="String" />
            <asp:ControlParameter ControlID="datest" Name="DenNgay" PropertyName="Value" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Thanh lý tồn kho" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl2" runat="server">
                                        <%--  <dx:ASPxMemo runat="server" ID="TenCTs" Text='<%# Eval("TenCT")%>' Width="100%" Height="93px">
                                        </dx:ASPxMemo>--%>
                                        <table style="width: 100%" frame="below">
                                            <tr>
                                                <td style="width: auto">
                                                    <dx:ASPxComboBox ID="Manpps" runat="server" ClientIDMode="Static" DataSourceID="npp" TextField="Debname" ValueField="Debcode" Height="21px" Width="347px"
                                                        DropDownStyle="DropDownList" ValueType="System.String" TextFormatString="{0} ({1}) ({2})"
                                                        IncrementalFilteringMode="Contains">
                                                        <Columns>
                                                            <dx:ListBoxColumn FieldName="Debcode" Width="100px" />
                                                            <dx:ListBoxColumn FieldName="Debname" Width="300px" />
                                                            <dx:ListBoxColumn FieldName="Debadd" Width="300px" />

                                                        </Columns>

                                                    </dx:ASPxComboBox>
                                                </td>
                                                <td style="width: auto"><a style="text-align: right">Chọn ngày tồn kho</a></td>
                                                <td width="auto" style="margin-left: 80px">
                                                    <dx:ASPxDateEdit ID="txtngaytinh" runat="server" Width="100px" Height="100%" Style="margin-left: 0px">
                                                    </dx:ASPxDateEdit>
                                                </td>
                                                <td style="width: auto"><a style="text-align: right">Chọn ngày update</a></td>
                                                <td width="auto" style="margin-left: 80px">
                                                    <dx:ASPxDateEdit ID="txtNgayup" runat="server" Width="100px" Height="100%" Style="margin-left: 0px" AutoPostBack="True">
                                                    </dx:ASPxDateEdit>
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="btnupload" runat="server" Text="Thanh Lý tồn kho" UseSubmitBehavior="False" Width="165px" />
                                                </td>
                                            </tr>
                                        </table>
                                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%">
                                            <TotalSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="thanhtien" SummaryType="Sum" ValueDisplayFormat="#,###" />
                                                <dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="Soluong" SummaryType="Sum" ValueDisplayFormat="#,###" />
                                            </TotalSummary>
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <EditButton Visible="True">
                                                    </EditButton>
                                                    <ClearFilterButton Visible="True">
                                                    </ClearFilterButton>
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="MaNPP" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="Ngay" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="Type" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MaSP" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Soluong" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="dongia" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TyleCK" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TienCK" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Khuyenmai" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="thanhtien" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="10">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Loai" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="11">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MACT" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="12">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsPager PageSize="100">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowFooter="True" />
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="Webxoatonkho" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="Manpps" Name="MaNPP" PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="txtngaytinh" Name="DenNgay" PropertyName="Value" Type="DateTime" />
                <asp:ControlParameter ControlID="txtNgayup" Name="ngayupdate" PropertyName="Value" Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="npp" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT Debcode, Debname, Debadd FROM dbo.Fn_cust( @user ) AS Fn_cust_1">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="user" SessionField="TenDangNhap" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Điều chỉnh tồn kho" Visible="true">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl3" runat="server">
                                        <%--  <dx:ASPxMemo runat="server" ID="TenCTs" Text='<%# Eval("TenCT")%>' Width="100%" Height="93px">
                                        </dx:ASPxMemo>--%>
                                        <table style="width: 100%" frame="below">
                                            <tr>
                                                <td style="width: 351px">
                                                   <a>Chọn nhà phân phối</a>  <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID ="SqlMnpp" TextField="Debname" ValueField="Debcode" Width="100%"
                                                        DropDownStyle="DropDownList" ValueType="System.String" TextFormatString="{0} ({1}) ({2})"
                                                        IncrementalFilteringMode="Contains">
                                                        <Columns>
                                                            <dx:ListBoxColumn FieldName="Debcode" Width="100px" />
                                                            <dx:ListBoxColumn FieldName="Debname" Width="300px" />
                                                            <dx:ListBoxColumn FieldName="Debadd" Width="300px" />

                                                        </Columns>

                                                    </dx:ASPxComboBox>
                                                     <asp:SqlDataSource ID="SqlMnpp" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT Debcode, Debname, Debadd FROM dbo.Fn_cust( @user ) AS Fn_cust_1">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="user" SessionField="TenDangNhap" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                                   
                                                </td>
                                                <td style="width: 246px"><a>Chọn ngày tính tồn kho</a>
                                               <dx:ASPxDateEdit ID="ASPxDateEdit2" runat="server" Width="100px" Height="100%" Style="margin-left: 0px" AutoPostBack="True">
                                                    </dx:ASPxDateEdit>
                                                       
                                                </td>
                                                <td><a>Lý do</a><dx:ASPxTextBox runat="server" ID ="TxtLyDO" Height="22px" NullText="Vui lòng nhập lý do" style="margin-bottom: 0px" Width="200px"></dx:ASPxTextBox> </td>
                                                <td>
                                              <dx:ASPxButton ID="Btok" runat="server" Text="Updload">
                    </dx:ASPxButton>
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="Bt_dieuChinh" runat="server" Text="Điều Chỉnh" UseSubmitBehavior="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                     <a>Chọn file upload </a> <asp:FileUpload ID="FileUpload3" runat="server" />
                                                </td>
                                                <td style="width: 246px">
                                                    <a>Chọn ngày update</a><dx:ASPxDateEdit ID="txtngayupdate" runat="server" Width="100px" Height="100%" Style="margin-left: 0px">
                                                    </dx:ASPxDateEdit>
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                        <table>
                                            <tr>
                                                <%--<td>
                                                     <dx:ASPxGridView ID="GrDic" runat="server" AutoGenerateColumns="False"   Width="100%" KeyFieldName="Ngay">
                                            <TotalSummary>
                                               
                                                <dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="Soluong" SummaryType="Sum" ValueDisplayFormat="#,###" />
                                            </TotalSummary>
                                            <Columns>
                                                
                                               
                                                <dx:GridViewDataDateColumn FieldName="Ngay" ShowInCustomizationForm="True" VisibleIndex="2">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="MaNPP" ShowInCustomizationForm="True" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MaSP" ShowInCustomizationForm="True" VisibleIndex="4">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Soluong" ShowInCustomizationForm="True" VisibleIndex="5">
                                                </dx:GridViewDataTextColumn>
                                              
                                                <dx:GridViewDataTextColumn FieldName="DienGiai" ShowInCustomizationForm="True" VisibleIndex="9">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Users" ShowInCustomizationForm="True" VisibleIndex="10">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="dates" ShowInCustomizationForm="True" VisibleIndex="11">
                                                </dx:GridViewDataDateColumn>
                                                   <dx:GridViewDataDateColumn FieldName="Ngayupdate" ShowInCustomizationForm="True" VisibleIndex="12">
                                                </dx:GridViewDataDateColumn>
                                            </Columns>
                                            <SettingsPager PageSize="100">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowFooter="True" />
                                        </dx:ASPxGridView>
                                                </td>--%>
                                                <td>
                                                     <dx:ASPxGridView ID="GrilXK" runat="server" AutoGenerateColumns="False"   Width="100%" KeyFieldName="Id" DataSourceID="Sqlxuatkhac"  OnCustomCallback="GrilXK_CustomCallback" ClientInstanceName="grid" OnCustomJSProperties="grid_CustomJSProperties" >
                                            <TotalSummary>
                                                <%--<dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="thanhtien" SummaryType="Sum" ValueDisplayFormat="#,###" />--%>
                                                <dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="Soluong" SummaryType="Sum" ValueDisplayFormat="#,###" />
                                                <dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="Thanhtien" SummaryType="Sum" ValueDisplayFormat="#,###" />
                                            </TotalSummary>
                                                         <Columns>
                                                             <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" ShowSelectCheckbox="True">
                                                                 <HeaderTemplate>
                                                                     <dx:ASPxCheckBox ID="cbAll" runat="server" ClientInstanceName="cbAll" ToolTip="Select all rows"
                                                                         BackColor="White" OnInit="cbAll_Init">
                                                                         <ClientSideEvents CheckedChanged="OnAllCheckedChanged" />
                                                                     </dx:ASPxCheckBox>
                                                                 </HeaderTemplate>
                                                                 <EditButton Visible="True">
                                                                 </EditButton>
                                                                 <NewButton Visible="True">
                                                                 </NewButton>
                                                                 <DeleteButton Visible="True">
                                                                 </DeleteButton>
                                                                 <FooterTemplate>
                                                                     <dx:ASPxButton ID="buttonDel" AutoPostBack="false" runat="server" Text="Delete all">
                                                                         <ClientSideEvents Click="OnClickButtonDel" />
                                                                     </dx:ASPxButton>
                                                                 </FooterTemplate>
                                                             </dx:GridViewCommandColumn>

                                                             <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                 <EditFormSettings Visible="False" />
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataDateColumn FieldName="Ngay" ShowInCustomizationForm="True" VisibleIndex="2">
                                                             </dx:GridViewDataDateColumn>
                                                             <dx:GridViewDataTextColumn FieldName="MaNPP" ShowInCustomizationForm="True" VisibleIndex="3">
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="MaSP" ShowInCustomizationForm="True" VisibleIndex="4">
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="Price" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                 <EditFormSettings Visible="False" />
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="ItemnameEng" ShowInCustomizationForm="True" VisibleIndex="6">
                                                                 <EditFormSettings Visible="False" />
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="Soluong" ShowInCustomizationForm="True" VisibleIndex="7">
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="Thanhtien" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8">
                                                                 <EditFormSettings Visible="False" />
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="DienGiai" ShowInCustomizationForm="True" VisibleIndex="10">
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="Users" ShowInCustomizationForm="True" VisibleIndex="11">
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataDateColumn FieldName="dates" ShowInCustomizationForm="True" VisibleIndex="12">
                                                             </dx:GridViewDataDateColumn>
                                                                <dx:GridViewDataDateColumn FieldName="Ngayupdate" ShowInCustomizationForm="True" VisibleIndex="13">
                                                                    
                                                </dx:GridViewDataDateColumn>
                                                             <dx:GridViewDataTextColumn FieldName="Loai" ShowInCustomizationForm="True" VisibleIndex="9">
                                                             </dx:GridViewDataTextColumn>
                                                         </Columns>
                                            <SettingsPager PageSize="100">
                                            </SettingsPager>
                                                         <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom" />
                                            <Settings ShowFilterRow="True" ShowFooter="True" />
                                        </dx:ASPxGridView>
                                                </td>
                                            </tr>
                                        </table>
                                        
  
                                           <asp:SqlDataSource ID="Sqlxuatkhac" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT SdxuatKhac.Id, SdxuatKhac.Ngay, SdxuatKhac.MaNPP, SdxuatKhac.MaSP, tbItems.Price, tbItems.ItemnameEng, SdxuatKhac.Soluong, SdxuatKhac.Soluong * tbItems.Price AS Thanhtien, SdxuatKhac.DienGiai, SdxuatKhac.Users, SdxuatKhac.dates, SdxuatKhac.Ngayupdate, SdxuatKhac.Loai FROM SdxuatKhac LEFT OUTER JOIN tbItems ON SdxuatKhac.MaSP = tbItems.Itemcode WHERE (SdxuatKhac.MaNPP = @MaNPP) AND (SdxuatKhac.Ngay = @Ngay) AND (SdxuatKhac.Type is null)" DeleteCommand="DELETE FROM [SdxuatKhac] WHERE [Id] = @Id" InsertCommand="INSERT INTO [SdxuatKhac] ([Ngay], [MaNPP], [MaSP], [Soluong],Loai , [DienGiai], [Users], [dates]) VALUES (@Ngay, @MaNPP, @MaSP, @Soluong, @Loai,@DienGiai, @Users, @dates)" UpdateCommand="UPDATE [SdxuatKhac] SET [Ngay] = @Ngay, [MaNPP] = @MaNPP, [MaSP] = @MaSP, [Soluong] = @Soluong, Loai=@Loai,[DienGiai] = @DienGiai, [Users] = @Users, [dates] = @dates WHERE [Id] = @Id">
                                               <DeleteParameters>
                                                   <asp:Parameter Name="Id" Type="Int32" />
                                               </DeleteParameters>
                                               <InsertParameters>
                                                   <asp:Parameter Name="Ngay" Type="DateTime" />
                                                   <asp:Parameter Name="MaNPP" Type="String" />
                                                   <asp:Parameter Name="MaSP" Type="String" />
                                                   <asp:Parameter Name="Soluong" Type="Int32" />
                                                   <asp:Parameter Name="Loai" />
                                                   <asp:Parameter Name="DienGiai" Type="String" />
                                                   <asp:Parameter Name="Users" Type="String" />
                                                   <asp:Parameter Name="dates" Type="DateTime" />
                                               </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ASPxComboBox1" Name="MaNPP" PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="ASPxDateEdit2" Name="Ngay" PropertyName="Value" Type="DateTime" />
            </SelectParameters>
                                               <UpdateParameters>
                                                   <asp:Parameter Name="Ngay" Type="DateTime" />
                                                   <asp:Parameter Name="MaNPP" Type="String" />
                                                   <asp:Parameter Name="MaSP" Type="String" />
                                                   <asp:Parameter Name="Soluong" Type="Int32" />
                                                   <asp:Parameter Name="Loai" />
                                                   <asp:Parameter Name="DienGiai" Type="String" />
                                                   <asp:Parameter Name="Users" Type="String" />
                                                   <asp:Parameter Name="dates" Type="DateTime" />
                                                   <asp:Parameter Name="Id" Type="Int32" />
                                               </UpdateParameters>
        </asp:SqlDataSource>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>
                    <%--  <dx:ASPxMemo runat="server" ID="TenCTs" Text='<%# Eval("TenCT")%>' Width="100%" Height="93px">
                                        </dx:ASPxMemo>--%>                    <%--<dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="thanhtien" SummaryType="Sum" ValueDisplayFormat="#,###" />--%>

               
     
      

       
    </asp:Content>