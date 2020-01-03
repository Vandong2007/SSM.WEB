 
   <%@ Page Title="" Language="vb" AutoEventWireup="false" AspCompat="true"  EnableViewStateMac ="false" EnableSessionState="True" EnableEventValidation ="false" ValidateRequest ="false" ViewStateEncryptionMode ="Never" MasterPageFile="~/homes.master" CodeBehind="Donhang.aspx.vb" Inherits="WEB.SSM.Donhang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        var isDetailRowExpanded = new Array();
        function OnRowClick(s, e) {
            if (isDetailRowExpanded[e.visibleIndex] != true)
                s.ExpandDetailRow(e.visibleIndex);
             
            else
                s.CollapseDetailRow(e.visibleIndex);
           
        }
        function OnDetailRowExpanding(s, e) {
            isDetailRowExpanded[e.visibleIndex] = true;
            _aspxClearSelection();
            //Unselect all rows
            grid._selectAllRowsOnPage(false);
            //Select the row
            grid.SelectRow(e.visibleIndex, true);
        }
        function OnDetailRowCollapsing(s, e) {
            isDetailRowExpanded[e.visibleIndex] = false;
            _aspxClearSelection();
            //Unselect all rows
            grid._selectAllRowsOnPage(false);
            //Select the row
            grid.SelectRow(e.visibleIndex, true);
        }
    </script>
<table style="width:100%" >
         <tr>
                                                <td colspan="7">
                                                    Danh sách đơn đặt hàng</td>
                                                
                                            </tr>
                                            <tr>
                                           <td style="width: 150px"> Ngày bắt đầu</td>
                                                    
                <td style="width: 150px"> <dx:ASPxDateEdit ID="datest"  runat="server" Width= "100%"  Height ="100%">
                    </dx:ASPxDateEdit></td>
                                                 <td style="width: 150px"> Ngày kết thúc</td>
   <%--             <td Width= "200px" style="text-align: right"> <a> Ngày Kết Thúc</a></td>--%>
                <td style="width: 150px">
                    <dx:ASPxDateEdit ID="dateen"   runat="server" Width= "100%" Height ="100%" AutoPostBack="True">
                        <ButtonStyle>
                            <Paddings PaddingLeft="1px" />
                        </ButtonStyle>
                    </dx:ASPxDateEdit>
                </td>
                                                <td style="width: 96px;">
                                                    <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Xem"  >
                                                      <Image Url="~/Content/Images/oks.png">
                    </Image>
                                                   </dx:ASPxButton>
                                                     
                                                </td>
                                               <td style="  width: 100px;">
                                                    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Xem tồn kho" Width="110px"  >
                                                      <Image Url="~/Content/Images/SEO-icon.png">
                    </Image>
                                                   </dx:ASPxButton>
                                                </td>
                                                <td style="  width: 150px;">
                                                    <dx:ASPxButton ID="Bt_dieuChinh" Width="100%" runat="server" Text="Đặt hàng mới" UseSubmitBehavior="False">
                                                         <Image Url="~/Content/Images/shopping-basket-icon.png">
                    </Image>
                                                    </dx:ASPxButton>
                                                </td>

                                                <td >
                                                    <dx:ASPxButton ID="ASPxButton3" runat="server" Text="Hủy đơn" UseSubmitBehavior="False" />
                                                </td>
                                               
                                                <td>
                <dx:ASPxButton ID="ASPExport" runat="server" Text="Export Excel">
                    <Image Url="~/Content/Images/excel.png">
                    </Image>
                  
                </dx:ASPxButton>
 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="G_dh" FileName="Don_hang"></dx:ASPxGridViewExporter>

            </td>
                                                  <td >
                                                    <dx:ASPxButton ID="senmail" runat="server" Text="Gửi lại Mail" UseSubmitBehavior="False" />
                                                </td>
                                            </tr>
    </table>
    <dx:ASPxGridView ID="G_dh" ClientInstanceName="grid" runat="server" AutoGenerateColumns="False" DataSourceID="Sqldh" KeyFieldName="Ordernr">
   <%--   <SettingsDetail ShowDetailRow="true" ExportMode="Expanded" /> --%>
      <ClientSideEvents RowClick="OnRowClick" DetailRowExpanding="OnDetailRowExpanding"
            DetailRowCollapsing="OnDetailRowCollapsing" /> 
        <%--<ClientSideEvents FocusedRowChanged="function(s, e) { OnGridFocusedRowChanged(); }" />--%> 
        <Columns>
        
            <dx:GridViewDataTextColumn FieldName="Ordernr" Caption="Số đơn hàng" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Dates"  Caption="Ngày đặt" VisibleIndex="2">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Debcode"  Caption="Mã NPP" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Region"  Caption="Khu Vực"  VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Debname"  Caption="Tên NPP" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="Amount" PropertiesTextEdit-DisplayFormatString ="#,###" Caption="Tiền Invioce" VisibleIndex="6">
<PropertiesTextEdit DisplayFormatString="#,###"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="AmountRBP" PropertiesTextEdit-DisplayFormatString ="#,###"  Caption="Tiền RBP" VisibleIndex="7">
<PropertiesTextEdit DisplayFormatString="#,###"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
        
 <dx:GridViewDataTextColumn FieldName="Amountfull"  Caption="Tiền chuyển" PropertiesTextEdit-DisplayFormatString ="#,###"  VisibleIndex="10">
<PropertiesTextEdit DisplayFormatString="#,###"></PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
             <dx:GridViewDataComboBoxColumn FieldName="Type"  Caption="Tình trạng" VisibleIndex="11"  PropertiesComboBox-TextFormatString=" {0} ">
                <PropertiesComboBox DropDownStyle="DropDown" >
                    <Items>
                         <dx:ListEditItem Text="Đơn đã hủy" Value="H"  ImageUrl="~/Content/Images/dele.png" />
                        <dx:ListEditItem Text="Mới đặt hàng" Value="N" ImageUrl="~/Content/Images/new_icon_1.gif" />
                        <dx:ListEditItem Text="Đã phê duyệt" Value="A" />
                         <dx:ListEditItem Text="Đã Xử lý" Value="Y" ImageUrl="~/Content/Images/ok.png"  />
                           
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
  <dx:GridViewDataTextColumn FieldName="Storage"  Caption="Kho" VisibleIndex="13">
            </dx:GridViewDataTextColumn>

        </Columns>
         <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" />
        <SettingsPager PageSize="20">
        </SettingsPager>
        <Styles>
            <AlternatingRow Enabled="true" />
        </Styles>
         
        <Settings ShowFilterRow="True"  />
        <SettingsDetail ShowDetailRow="true"  />
         <Templates>
            <DetailRow>
                 Số đơn mua hàng: <b>
                <a href="../Dathang/Donhang_chitiet.aspx?Sodathang=<%# Eval("Ordernr")%>"  > <%# Eval("Ordernr")%></a></b>,
               Mã NPP: <b>
                    <%# Eval("Debcode")%></b>, Tên nhà phân phối: <b>
                        <%# Eval("Debname")%></b> , Người đặt: <b>
                        <%# Eval("Username")%>,
                            Số đơn đ.hàng: <b>
                        <%# Eval("OrderNumber")%>
                <br /> 
                <br /> 
                   <dx:ASPxButton ID="btnXlsxExport" runat="server" OnClick="btnXlsxExport_Click" Text="Save to Excel" UseSubmitBehavior="False"    ><Image Url="~/Content/Images/excel.png">
                        </Image></dx:ASPxButton>
                     
                                              
      
                <br /> 
                <br />
                <dx:ASPxGridView ID="detailGrid" runat="server" DataSourceID="SqlCtDH" KeyFieldName="Id"
                    Width="100%" OnBeforePerformDataSelect="detailGrid_DataSelect" OnCustomUnboundColumnData="detailGrid_CustomUnboundColumnData" AutoGenerateColumns="False">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="Id" Visible="false" VisibleIndex="0" ReadOnly="True">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Ordernr" VisibleIndex="1" Visible="false">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Itemcode"  Caption="Mã SP"  VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Price" PropertiesTextEdit-DisplayFormatString ="#,###"  Caption="Đơn Giá RBP" VisibleIndex="5">
                            <PropertiesTextEdit DisplayFormatString="#,###"></PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Quantity" PropertiesTextEdit-DisplayFormatString ="#,###" Caption="Số Lượng" VisibleIndex="6">
                            <PropertiesTextEdit DisplayFormatString="#,###"></PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="AmountRBP" PropertiesTextEdit-DisplayFormatString ="#,###"  Caption="Tiền RBP" VisibleIndex="13">
                            <PropertiesTextEdit DisplayFormatString="#,###"></PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PriceIV" PropertiesTextEdit-DisplayFormatString ="#,###"  Caption="Giá h.đơn" VisibleIndex="9">
                            <PropertiesTextEdit DisplayFormatString="#,###"></PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="AmountINV"  PropertiesTextEdit-DisplayFormatString ="#,###"   Caption="Tiền h.đơn" VisibleIndex="10">
                            <PropertiesTextEdit DisplayFormatString="#,###"></PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Transactiontype" VisibleIndex="16" Visible="false">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Itemname"  Caption="Tên hàng hóa" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Brand"  Caption="Nhãn hàng" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="AmountFull"  Caption="Tiền chuyển"  Visible="False" VisibleIndex="11">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="tax"  Caption="Thuế" Visible="False" VisibleIndex="12">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Số thùng" FieldName="chan" PropertiesTextEdit-DisplayFormatString ="#,###"  VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Chai lẻ" FieldName="le" PropertiesTextEdit-DisplayFormatString ="#,###"  VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="note" Caption="Ghi chú" VisibleIndex="17" >
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsPager PageSize="20">
                    </SettingsPager>
                    <Settings ShowFooter="True" />
                    <TotalSummary>
                        <dx:ASPxSummaryItem FieldName="Itemcode" SummaryType="Count" />
                        <dx:ASPxSummaryItem FieldName="Quantity" SummaryType="Sum" DisplayFormat="#,###" ValueDisplayFormat="#,###"   />
                        <dx:ASPxSummaryItem FieldName="AmountRBP" SummaryType="Sum" DisplayFormat="#,###" ValueDisplayFormat="#,###"   />
                        <dx:ASPxSummaryItem FieldName="AmountINV" SummaryType="Sum" ValueDisplayFormat="#,###"  />
                          <dx:ASPxSummaryItem FieldName="tax" SummaryType="Sum" ShowInColumn="AmountINV"  ValueDisplayFormat="#,###"  />
                          <dx:ASPxSummaryItem FieldName="AmountFull" SummaryType="Sum"   ValueDisplayFormat="#,###"  ShowInColumn="AmountINV"  />
                    </TotalSummary> 
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="SqlCtDH" runat="server" ConnectionString="<%$ ConnectionStrings:SSM2014ConnectionString %>" SelectCommand="SELECT Tbdathang_ct.note, Tbdathang_ct.Id, Tbdathang_ct.Ordernr, Tbdathang_ct.Itemcode, Tbdathang_ct.Price, Tbdathang_ct.Quantity, Tbdathang_ct.AmountRBP, Tbdathang_ct.AmountINV, Tbdathang_ct.Transactiontype, tbItems.Itemname, tbItems.Brand, Tbdathang_ct.kho, Tbdathang_ct.PriceIV, Tbdathang_ct.AmountFull, Tbdathang_ct.tax, tbItems.Thung, CAST(Tbdathang_ct.Quantity AS decimal(10 , 0)) % tbItems.Thung AS le, FLOOR(Tbdathang_ct.Quantity / tbItems.Thung) AS chan FROM Tbdathang_ct INNER JOIN tbItems ON Tbdathang_ct.Itemcode = tbItems.OldItemcode WHERE (Tbdathang_ct.Ordernr = @Ordernr) AND (Tbdathang_ct.Quantity <> 0)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ordernr" SessionField="Ordernr" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </DetailRow>
        </Templates>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="Sqldh" runat="server" ConnectionString="<%$ ConnectionStrings:SSM2014ConnectionString %>" SelectCommand="SELECT tbDatHangs.Ordernr, tbDatHangs.Dates, tbDatHangs.Debcode, Fn_cust_1.Region, Fn_cust_1.Debname, tbDatHangs.Username, tbDatHangs.Amount, tbDatHangs.AmountRBP, tbDatHangs.Type, tbDatHangs.Storage, tbDatHangs.dateAP, tbDatHangs.UserApr, tbDatHangs.UserCp, tbDatHangs.dateCom, tbDatHangs.OrderNumber, tbDatHangs.Amountfull FROM tbDatHangs INNER JOIN dbo.Fn_cust_dh(@uname) AS Fn_cust_1 ON tbDatHangs.Debcode = Fn_cust_1.Olddebcode WHERE (tbDatHangs.Dates &gt;=  DATEADD(dd, 0, DATEDIFF(dd, 0,@datefrom))) AND ( DATEADD(dd, 0, DATEDIFF(dd, 0,tbDatHangs.Dates ))&lt;=   DATEADD(dd, 0, DATEDIFF(dd, 0,@dateto))) ORDER BY tbDatHangs.Ordernr DESC">
        <SelectParameters>
            <asp:SessionParameter Name="uname" SessionField="TenDangNhap" />
            <asp:ControlParameter ControlID="datest" Name="datefrom" PropertyName="Value" />
            <asp:ControlParameter ControlID="dateen" Name="dateto" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>