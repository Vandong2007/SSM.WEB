<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="Du_lieu_goc_nhap.aspx.vb" Inherits="WEB.SSM.Du_lieu_goc_nhap" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      
 <table style="width:100%;border-collapse:initial" cellpadding="0" cellspacing="0">
   
 
            <tr>
                <td style="width: 200px; text-align: Left;"> Doanh số Mua vào</td>
                <td style="width: 98px"> <a style="text-align: right"> Ngày Bắt Đầu</a></td>
                <td  Width= "100px"> <dx:ASPxDateEdit ID="datest" runat="server" Width= "100px"  >
                  <%--    <ClientSideEvents Init="function(s, e) {
	dateEd.GetCalendar().SetVisibleDate(new Date());}" />--%>
                    </dx:ASPxDateEdit></td>
                <td style="text-align: right; width: 108px;"> <a> Ngày Kết Thúc</a></td>
                <td  Width= "100px">
                    <dx:ASPxDateEdit ID="dateen" runat="server" Width= "100px" >
                        <ButtonStyle>
                            <Paddings PaddingLeft="1px" />
                        </ButtonStyle>
                    </dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxButton ID="Btok" runat="server" Text="OK">
                    </dx:ASPxButton>
                </td>
                <td> <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False" OnClick="btnXlsxExport_Click" Width="116px" Height="23px" />
                   
                 </td>
            </tr>
        
               </table>
     <dx:ASPxGridView ID="ASPxNhap" runat="server" AutoGenerateColumns="False" DataSourceID="Sqlnhap" KeyFieldName="UNID">
         <TotalSummary>
             <dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="AmountINV" SummaryType="Sum" ValueDisplayFormat="#,###" />
             <dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="AmountRBP" SummaryType="Sum" ValueDisplayFormat="#,###" />
         </TotalSummary>
         <Columns>
             <dx:GridViewCommandColumn VisibleIndex="0">
                 <ClearFilterButton Visible="True">
                 </ClearFilterButton>
             </dx:GridViewCommandColumn>
             <dx:GridViewDataTextColumn FieldName="Area" VisibleIndex="2">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Region" VisibleIndex="1">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Tên NPP" FieldName="Debname" VisibleIndex="4">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Mã Npp" FieldName="Debcode" VisibleIndex="3">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataDateColumn Caption="Ngày" FieldName="Datum" VisibleIndex="6">
             </dx:GridViewDataDateColumn>
             <dx:GridViewDataTextColumn Caption="Số đơn hàng" FieldName="Ordernr" VisibleIndex="7">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Số Hóa Đơn" FieldName="Invnr" VisibleIndex="8">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Mã Sản Phẩm" FieldName="Itemcode" VisibleIndex="10">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Nhóm" FieldName="Brand" VisibleIndex="12">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Tên Sản Phẩm" FieldName="Itemname" VisibleIndex="11">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Giá Bán Lẻ" FieldName="Price" VisibleIndex="13">
                 <PropertiesTextEdit DisplayFormatString="#,###">
                 </PropertiesTextEdit>
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Số Lượng" FieldName="Quantity" VisibleIndex="14">
                 <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="#,###">
                 </PropertiesTextEdit>
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Doanh Số RBP" FieldName="AmountRBP" ReadOnly="True" VisibleIndex="15">
                 <PropertiesTextEdit DisplayFormatString="#,###">
                 </PropertiesTextEdit>
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="DS Hóa đơn" FieldName="AmountINV" VisibleIndex="16">
                 <PropertiesTextEdit DisplayFormatString="#,###">
                 </PropertiesTextEdit>
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn Caption="Loại đơn hàng" FieldName="Transactiontype" VisibleIndex="17">
             </dx:GridViewDataTextColumn>
         </Columns>
         <SettingsPager PageSize="100">
         </SettingsPager>
         <Settings ShowFilterRow="True" ShowFooter="True" />
     </dx:ASPxGridView>
      <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxNhap" FileName="Du lieu goc nhap"></dx:ASPxGridViewExporter>
     
     <asp:SqlDataSource ID="Sqlnhap" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT   Fn_cust_1.Area, Fn_cust_1.Region, Fn_cust_1.Debname, tbSalesIN.Debcode, tbSalesIN.UNID, tbSalesIN.Datum, tbSalesIN.Ordernr, tbSalesIN.Invnr, tbSalesIN.Description, tbSalesIN.Itemcode, tbItems.Brand, tbItems.Itemname, tbItems.Price, tbSalesIN.Quantity, tbSalesIN.AmountRBP, tbSalesIN.AmountINV, tbSalesIN.Transactiontype FROM tbSalesIN INNER JOIN tbItems ON tbSalesIN.Itemcode = tbItems.Itemcode INNER JOIN dbo.Fn_cust1(@Username) AS Fn_cust_1 ON tbSalesIN.Debcode = Fn_cust_1.Debcode WHERE (tbSalesIN.Datum BETWEEN DATEADD(dd, 0, DATEDIFF(dd, 0, @TuNgay)) AND DATEADD(dd, 0, DATEDIFF(dd, 0, @DenNgay))) ORDER BY Fn_cust_1.Area, Fn_cust_1.Region, tbSalesIN.Debcode, tbSalesIN.Datum, tbSalesIN.Ordernr, tbSalesIN.Itemcode">
         <SelectParameters>
             <asp:SessionParameter Name="Username" SessionField="TenDangNhap" />
             <asp:ControlParameter ControlID="datest" Name="TuNgay" PropertyName="Value" />
             <asp:ControlParameter ControlID="dateen" Name="DenNgay" PropertyName="Value" />
         </SelectParameters>
     </asp:SqlDataSource>
     <hr>
     
 
</asp:Content>