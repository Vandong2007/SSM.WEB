<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="Doanhso.aspx.vb" Inherits="WEB.SSM.Doanhso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
       
        <table style="width: 100%"  frame="below" >
            <tr>
                <td style="width: 339px"> <h3>Doanh Số</h3></td>
                <td style="width: 199px"> <a style="text-align: right"> Ngày Bắt Đầu</a></td>
                <td  Width= "100px"> <dx:ASPxDateEdit ID="datest" runat="server" Width= "100px"  Height ="100%"  >
                    </dx:ASPxDateEdit></td>
                <td Width= "200px" style="text-align: right"> <a> Ngày Kết Thúc</a></td>
                <td  Width= "100px">
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
                <td>   <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="ASPxPivotGrid1">
                    </dx:ASPxPivotGridExporter>
        <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False" OnClick="btnXlsxExport_Click" Width="165px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" Width="100%">
            <Fields>
                <dx:PivotGridField ID="fieldMaNPP" AreaIndex="2" FieldName="MaNPP" Area="RowArea" Caption="Mã NPP">
                </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldOlddebcode" AreaIndex="3" FieldName="Olddebcode" Area="RowArea" Caption="Mã SAP NPP">
                </dx:PivotGridField>
                
                <dx:PivotGridField ID="fieldTenNPP" AreaIndex="3" FieldName="TenNPP" Area="RowArea" Caption="Tên Nhà Phân Phối" Width="300" >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldRegion" AreaIndex="0" FieldName="Region" GroupIndex="0" InnerGroupIndex="0" Area="RowArea">
                </dx:PivotGridField>
                <%--<dx:PivotGridField ID="fieldSubregion" AreaIndex="0" FieldName="Subregion">
                </dx:PivotGridField>--%>
               <%-- <dx:PivotGridField ID="fieldSdf" AreaIndex="1" FieldName="Sdf">
                </dx:PivotGridField>--%>
                <dx:PivotGridField ID="fieldArea" AreaIndex="1" FieldName="Area" Area="RowArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNhanSP" AreaIndex="4" FieldName="NhanSP" Area="RowArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldThanhtien" AreaIndex="0" FieldName="Thanhtien" Caption="Doanh Số" RunningTotal="True" SortMode="Value" Area="DataArea" SummaryDisplayType="Default" 
                     CellFormat-FormatType="Custom"
                     CellFormat-FormatString ="#,###" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" 
                     >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldKM" Area="DataArea" AreaIndex="1" Caption="Khuyến Mãi" CellFormat-FormatString="#,###"  CellFormat-FormatType="Custom" FieldName="KM" GrandTotalCellFormat-FormatString="#,###"  GrandTotalCellFormat-FormatType="Custom" RunningTotal="True" SortMode="Value">
                </dx:PivotGridField>
            </Fields>
            
            <OptionsCustomization AllowFilterInCustomizationForm="True" />
            <OptionsPager RowsPerPage="200">
            </OptionsPager>
            <OptionsBehavior BestFitMode="FieldValue, Cell" />
            <Groups>
                <dx:PivotGridWebGroup ShowNewValues="True" />
            </Groups>
        </dx:ASPxPivotGrid>
    </div>
</asp:Content>
