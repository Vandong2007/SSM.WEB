<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="upLoad_ketqua.aspx.vb" Inherits="WEB.SSM.upLoad_ketqua" %>
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
    
     
<table style="width: 100%" frame="below">
                                            <tr>
                                                <td colspan="6">
                                                    Update kết quả chương trình khuyến mãi</td>
                                                
                                            </tr>
                                            <tr>
                                               
                                               <%--  <td>
                                                    <a>Chọn file upload </a> </td>--%>
                                                    <td Width= "300px">  <%--<asp:FileUpload ID="FileUpload2"   runat="server" /> --%>
                                                        <dx:ASPxUploadControl ID="FileUpload3" runat ="server" ShowProgressPanel="True" NullText="Chọn file kết qủa cliam" Width="100%" ></dx:ASPxUploadControl>
                                                </td>
                                              <td Width= "100px">
                                              <dx:ASPxButton ID="Btok" runat="server" Text="Updload">
                    </dx:ASPxButton>
                                                </td>
                                                    
                <td style="width: 150px"> <dx:ASPxDateEdit ID="datest" NullText="Chọn ngày bắt đầu" runat="server" Width= "100%"  Height ="100%">
                    </dx:ASPxDateEdit></td>
   <%--             <td Width= "200px" style="text-align: right"> <a> Ngày Kết Thúc</a></td>--%>
                <td style="width: 150px">
                    <dx:ASPxDateEdit ID="dateen"  NullText="Chọn ngày kết thúc" runat="server" Width= "100%" Height ="100%">
                        <ButtonStyle>
                            <Paddings PaddingLeft="1px" />
                        </ButtonStyle>
                    </dx:ASPxDateEdit>
                </td>
                                               
                                              <td><dx:ASPxCheckBox ID="chek" runat="server" Text="Update Bổ sung" ></dx:ASPxCheckBox></td>
                                                <td>
                                                    <dx:ASPxButton ID="Bt_dieuChinh" runat="server" Text="Upload vào server" UseSubmitBehavior="False" Enabled="False" />
                                                </td>
                                            </tr>
                                        </table>
                                     
                                                     <dx:ASPxGridView ID="GrilXK" runat="server" AutoGenerateColumns="False"   Width="100%" KeyFieldName="Id"  OnCustomCallback="GrilXK_CustomCallback" ClientInstanceName="grid" OnCustomJSProperties="grid_CustomJSProperties"  >
                                            <TotalSummary>
                                                <%--<dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="thanhtien" SummaryType="Sum" ValueDisplayFormat="#,###" />--%>
                                                <dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="soluong" SummaryType="Sum" ValueDisplayFormat="#,###" />
                                                <dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="thanhtien" SummaryType="Sum" ValueDisplayFormat="#,###" />
                                            </TotalSummary>
                                                         <Columns>
                                                             <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0">
                                                                 <EditFormSettings Visible="False" />
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="MaNPP" VisibleIndex="1">
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="maxk" VisibleIndex="2">
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="mact" VisibleIndex="3">
                                                             </dx:GridViewDataTextColumn>
                                                           <%--  <dx:GridViewDataTextColumn FieldName="Mact_KT" VisibleIndex="4">
                                                             </dx:GridViewDataTextColumn>--%>
                                                             <dx:GridViewDataDateColumn FieldName="Ngay" VisibleIndex="5">
                                                             </dx:GridViewDataDateColumn>
                                                             <dx:GridViewDataTextColumn FieldName="MaSP" VisibleIndex="6">
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="soluong" VisibleIndex="7">
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="price" VisibleIndex="8">
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="thanhtien" VisibleIndex="9">
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="Lydo" VisibleIndex="10">
                                                             </dx:GridViewDataTextColumn>
                                                   <%--          <dx:GridViewDataTextColumn FieldName="Users" VisibleIndex="11">
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataDateColumn FieldName="dates" VisibleIndex="12">
                                                             </dx:GridViewDataDateColumn>
                                                             <dx:GridViewDataTextColumn FieldName="Priceinv" VisibleIndex="13">
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="Amountinv" VisibleIndex="14">
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="PriceCog" VisibleIndex="15">
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="AmountCog" VisibleIndex="16">
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="ItemnameEng" VisibleIndex="17">
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="Brand" VisibleIndex="18">
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="Region" VisibleIndex="19">
                                                             </dx:GridViewDataTextColumn>
                                                             <dx:GridViewDataTextColumn FieldName="Debname" VisibleIndex="20">
                                                             </dx:GridViewDataTextColumn>--%>
                                                         </Columns>
                                            <SettingsPager PageSize="100">
                                            </SettingsPager>
                                                         <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom" />
                                            <Settings ShowFilterRow="True" ShowFooter="True" />
                                        </dx:ASPxGridView>
                                               <%--      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSM2014ConnectionString %>" SelectCommand="SELECT top 100 tbCliam_TT.Id, tbCliam_TT.manpp, tbCliam_TT.maxk, tbCliam_TT.mact, tbCliam_TT.Mact_KT, tbCliam_TT.ngay, tbCliam_TT.masp, tbCliam_TT.soluong, tbCliam_TT.price, tbCliam_TT.thanhtien, tbCliam_TT.LYdo, tbCliam_TT.Users, tbCliam_TT.dates, tbCliam_TT.Priceinv, tbCliam_TT.Amountinv, tbCliam_TT.PriceCog, tbCliam_TT.AmountCog, tbItems.ItemnameEng, tbItems.Brand, Fn_cust_1.Region, Fn_cust_1.Debname FROM tbCliam_TT INNER JOIN dbo.Fn_cust(@uname) AS Fn_cust_1 ON tbCliam_TT.manpp = Fn_cust_1.Olddebcode INNER JOIN tbItems ON tbCliam_TT.masp = tbItems.Itemcode">
                                                         <SelectParameters>
                                                             <asp:SessionParameter Name="uname" SessionField="TenDangNhap" />
                                                         </SelectParameters>
      </asp:SqlDataSource>--%>
                                          
  
<%--                                           <asp:SqlDataSource ID="Sqlxuatkhac" runat="server" ConnectionString="<%$ ConnectionStrings:SSM2014ConnectionString %>" SelectCommand="SELECT tbItems.Price AS Expr1, tbItems.ItemnameEng, tbCustomer.Debname, tbCliam_TT.* FROM tbItems INNER JOIN tbCliam_TT ON tbItems.Itemcode = tbCliam_TT.masp INNER JOIN tbCustomer ON tbCliam_TT.manpp = tbCustomer.Olddebcode" DeleteCommand="DELETE FROM [SdxuatKhac] WHERE [Id] = @Id" InsertCommand="INSERT INTO [SdxuatKhac] ([Ngay], [MaNPP], [MaSP], [Soluong],Loai , [DienGiai], [Users], [dates]) VALUES (@Ngay, @MaNPP, @MaSP, @Soluong, @Loai,@DienGiai, @Users, @dates)" UpdateCommand="UPDATE [SdxuatKhac] SET [Ngay] = @Ngay, [MaNPP] = @MaNPP, [MaSP] = @MaSP, [Soluong] = @Soluong, Loai=@Loai,[DienGiai] = @DienGiai, [Users] = @Users, [dates] = @dates WHERE [Id] = @Id">
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
        </asp:SqlDataSource>--%>
      </asp:Content> 
