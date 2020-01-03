<%@ Page Language="vb"  MasterPageFile="~/homes.master"  AutoEventWireup="false" CodeBehind="Cliam.aspx.vb" Inherits="WEB.SSM.Cliam" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div>
       <h3>Đề nghị thanh toán khuyến mãi</h3>
        <table style="width: 100%"  frame="below" >
         <%--   <tr>
                <td> </td>
                </tr>--%>
   <tr>
                <td > <a style="text-align: right"> Ngày Bắt Đầu</a></td>
                <td  Width= "100px"> <dx:ASPxDateEdit ID="datest" runat="server" Width= "100px"  Height ="100%"  >
                    </dx:ASPxDateEdit></td>
                <td style="text-align: right; width: 227px;"> <a> Ngày Kết Thúc</a></td>
                <td  Width= "100px">
                    <dx:ASPxDateEdit ID="dateen" AutoPostBack ="true" runat="server" Width= "100px" Height ="100%"  >
                        <ButtonStyle>
                            <Paddings PaddingLeft="1px" />
                        </ButtonStyle>
                    </dx:ASPxDateEdit>
                </td>
                 <td>
                        <a>Chọn Region</a>
                    </td>
                <td>
                        <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" NullText="Chọn Region" DataSourceID="SqlDataSource2" TextField="Region" ValueField="Region" Height="29px" Width="100%">
                            <Columns>
                                <dx:ListBoxColumn FieldName="Region" />
                            </Columns>
                        </dx:ASPxComboBox>
                    </td>
                <td>
                    <dx:ASPxButton ID="Btok" runat="server" Text="OK">
                    </dx:ASPxButton>
                </td> 
                <td>   <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="ASPxPivotGrid1">
                    </dx:ASPxPivotGridExporter>
        <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False" OnClick="btnXlsxExport_Click" Width="165px" />
                </td>
                <td>  

                    <dx:ASPxButton ID="export1" runat="server" Text="Export ALL" UseSubmitBehavior="False" OnClick="export1_Click" Width="100%"   />

                </td> 
            </tr>
        </table>
            <asp:Panel runat="server" Visible="false" ID="pnlUploadMessage">
        <p>
           vui long download file
        </p>
        <p>
            <asp:HyperLink ID="lnkDownloadYourFile" runat="server"></asp:HyperLink>
        </p>
    </asp:Panel>


        <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" DataSourceID="SqlDataSource1">
            <Fields>
                <dx:PivotGridField ID="fieldmanpp" AreaIndex="2" FieldName="manpp" Area="RowArea" Caption="Mã Npp">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDebname" AreaIndex="3" FieldName="Debname" Area="RowArea" Caption="Tên Nhà Phân phối">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldRegion" AreaIndex="0" FieldName="Region" Area="RowArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldArea" AreaIndex="1" FieldName="Area" Area="RowArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldmact" AreaIndex="4" FieldName="mact" Area="RowArea" Caption="Mã CT">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldtenCT" AreaIndex="2" FieldName="tenCT" Caption="Tên CT">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldloaict" AreaIndex="5" FieldName="loaict" Area="RowArea" Caption="Loại CT">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMactKT" AreaIndex="6" FieldName="Mact_KT" Area="RowArea" SummaryDisplayType="Default" Caption="Mã CT kiểm tra" 
                     >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldtyleck" Area="RowArea" AreaIndex="7" FieldName="tyleck" Caption="Tỷ Lệ CK">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldtyle" AreaIndex="0" FieldName="tyle" Caption="Tỷ Lệ thực">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldthanhtien" Area="DataArea" AreaIndex="0" FieldName="thanhtien" Caption="Thành tiền" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldkm" Area="DataArea" AreaIndex="1" FieldName="km" Caption="NPP cliam" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDS" Area="DataArea" AreaIndex="2" FieldName="DS" Caption="Doanh Số" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldkmok" Area="DataArea" AreaIndex="3" FieldName="kmok" Caption="KM Sau Khi KT" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldtencts" AreaIndex="1" FieldName="tencts" Caption="NgàyCT">
                </dx:PivotGridField>
            </Fields>
            
            <OptionsCustomization AllowFilterInCustomizationForm="True" />
            <OptionsPager RowsPerPage="200">
            </OptionsPager>
            <OptionsBehavior BestFitMode="FieldValue, Cell" />
            <Groups>
                <dx:PivotGridWebGroup ShowNewValues="True" Caption="NPP" />
                <dx:PivotGridWebGroup Caption="NV" ShowNewValues="True" />
            </Groups>
        </dx:ASPxPivotGrid>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="GetCliamNpp" SelectCommandType="StoredProcedure">
             <SelectParameters>
                 <asp:SessionParameter Name="Username" SessionField="TenDangNhap" Type="String" />
                 <asp:ControlParameter ControlID="ASPxComboBox1" Name="Re" PropertyName="Value" Type="String" />
                 <asp:ControlParameter ControlID="datest" Name="TuNgay" PropertyName="Value" Type="DateTime" />
                 <asp:ControlParameter ControlID="dateen" Name="DenNgay" PropertyName="Value" Type="DateTime" />
             </SelectParameters>
         </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
select 'ALL' as Region
union all
SELECT region FROM  dbo.Fn_cust(@Username) group by region  order by region 
" >
         <SelectParameters>
             <asp:SessionParameter Name="Username" SessionField="TenDangNhap" />
         </SelectParameters>
    </asp:SqlDataSource>
    </div>
</asp:Content>
