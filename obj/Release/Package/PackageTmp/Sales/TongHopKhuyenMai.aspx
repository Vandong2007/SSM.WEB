<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="TongHopKhuyenMai.aspx.vb" Inherits="WEB.SSM.TongHopKhuyenMai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div>
       
        <table style="width: 100%"  frame="below" >
            <tr>
                <td style="width: 339px"> <h3>Doanh Số</h3></td>
                <td style="width: 199px"> <a style="text-align: right"> Ngày Bắt Đầu</a></td>
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
                    <dx:ASPxButton ID="Btok" runat="server" Text="OK">
                    </dx:ASPxButton>
                </td> 
                <td>   <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="ASPxPivotGrid1">
                    </dx:ASPxPivotGridExporter>
        <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False" OnClick="btnXlsxExport_Click" Width="165px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" DataSourceID="SqlDataSource1" Width="100%">
            <Fields>
                <dx:PivotGridField ID="fieldMaNPP" AreaIndex="0" FieldName="MaNPP">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMaCT1" AreaIndex="0" FieldName="MaCT1" Area="RowArea" Caption="Mã Chương Trình">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTenCT" AreaIndex="1" FieldName="TenCT" Area="RowArea" Caption="Tên Chương Trình">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTyleCK" AreaIndex="2" FieldName="TyleCK" Area="RowArea" Caption="Tỷ Lệ CK" CellFormat-FormatString="p" CellFormat-FormatType="Custom" ValueFormat-FormatString="P" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDoanhSO" AreaIndex="1" FieldName="DoanhSO" Area="DataArea" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" Caption="Doanh Số" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldKM" AreaIndex="0" FieldName="KM" Area="DataArea" TotalCellFormat-FormatType="Custom" ValueFormat-FormatType="Custom" Caption="Chi Phí khuyến mãi" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" ValueFormat-FormatString="#,###">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTenNPP" AreaIndex="1" FieldName="TenNPP" Caption="Nhà Phân Phối">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldRegion" AreaIndex="2" FieldName="Region" SummaryDisplayType="Default" 
                     >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldArea" AreaIndex="3" FieldName="Area">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProvince" AreaIndex="4" FieldName="Province">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTyle" Area="DataArea" AreaIndex="2" Caption="Tỷ  Lệ %" FieldName="Tyle"   UnboundType="Decimal" CellFormat-FormatString="p2" CellFormat-FormatType="Numeric" UnboundExpression="[KM]/[DoanhSO]" Options-HideEmptyVariationItems="True" RunningTotal="True" SummaryType="Average" TotalsVisibility="CustomTotals">
                    <CustomTotals>
                        <dx:PivotGridCustomTotal Format-FormatString="p" Format-FormatType="Custom" SummaryType="Average" />
                    </CustomTotals>
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
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="WebGetTHCTKM" SelectCommandType="StoredProcedure">
             <SelectParameters>
                 <asp:ControlParameter ControlID="datest" Name="TuNgay" PropertyName="Value" Type="DateTime" />
                 <asp:ControlParameter ControlID="dateen" Name="DenNgay" PropertyName="Value" Type="DateTime" />
                 <asp:SessionParameter Name="Username" SessionField="TenDangNhap" Type="String" />
             </SelectParameters>
         </asp:SqlDataSource>
    </div>
</asp:Content>
