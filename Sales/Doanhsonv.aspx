<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="Doanhsonv.aspx.vb" Inherits="WEB.SSM.DoanhSONV" %>
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
        <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" DataSourceID="SqlDataSource1">
            <Fields>
                <dx:PivotGridField ID="fieldMaNPP" AreaIndex="2" FieldName="MaNPP" Area="RowArea" GroupIndex="0" InnerGroupIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTenNPP" AreaIndex="3" FieldName="TenNPP" Area="RowArea" GroupIndex="0" InnerGroupIndex="1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldRegion" AreaIndex="0" FieldName="Region" Area="RowArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldSubregion" AreaIndex="0" FieldName="Subregion">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMaNV" AreaIndex="4" FieldName="MaNV" Area="RowArea" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" GroupIndex="1" InnerGroupIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldHotenNV" AreaIndex="5" FieldName="HotenNV" Area="RowArea" CellFormat-FormatType="Custom" TotalCellFormat-FormatType="Custom" ValueFormat-FormatType="Custom" GroupIndex="1" InnerGroupIndex="1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldArea" AreaIndex="1" FieldName="Area" Area="RowArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNhanSP" AreaIndex="0" FieldName="NhanSP" Area="ColumnArea" SummaryDisplayType="Default" 
                     >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldThanhtien" Area="DataArea" AreaIndex="0" FieldName="Thanhtien" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
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
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="WebGetDoanhsonv" SelectCommandType="StoredProcedure">
             <SelectParameters>
                 <asp:ControlParameter ControlID="datest" Name="TuNgay" PropertyName="Value" Type="DateTime" />
                 <asp:ControlParameter ControlID="dateen" Name="DenNgay" PropertyName="Value" Type="DateTime" />
                 <asp:SessionParameter Name="Username" SessionField="TenDangNhap" Type="String" />
             </SelectParameters>
         </asp:SqlDataSource>
    </div>
</asp:Content>
