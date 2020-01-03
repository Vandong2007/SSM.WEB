<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="tonkhosku.aspx.vb" Inherits="WEB.SSM.tonkhosku" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <table style="width: 100%"  frame="below" >
            <tr>
                <td style="width: auto"> <h3>Tồn kho theo ngày</h3></td>
                <td style="width: auto"> <a style="text-align: right"> Chọn ngày tồn kho</a></td>
                <td  Width= "auto" style="margin-left: 80px"> <dx:ASPxDateEdit ID="datest" runat="server" AutoPostBack ="true" Width= "100px"  Height ="100%" style="margin-left: 0px"  >
                    </dx:ASPxDateEdit></td>
                
                <td> <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False"   Width="165px" />
                    
                    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="ASPxPivotGrid1"></dx:ASPxPivotGridExporter>
                </td>
            </tr>
              </table>
    <div>

        <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID"  Width ="100%" DataSourceID="SqlDataSource1"   SummaryText="Tổng Cộng">
            <Fields>
                <dx:PivotGridField ID="fieldRegion" AreaIndex="0" FieldName="Region">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldArea" AreaIndex="1" FieldName="Area">
                </dx:PivotGridField>
                 <dx:PivotGridField ID="PivotGridField3" AreaIndex="2" FieldName="MaNPP" Caption="Mã NPP" GroupIndex="0" InnerGroupIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField4" AreaIndex="3" FieldName="TenNPP" Caption="Tên Nhà Phân Phối" GroupIndex="0" InnerGroupIndex="1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField5" Area="RowArea" AreaIndex="0" FieldName="MaSP" Caption="Mã Sản Phẩm"   GroupIndex="1" InnerGroupIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField6" Area="RowArea" AreaIndex="1" FieldName="TenSP" Caption="Tên Sản Phẩm" GroupIndex="1" InnerGroupIndex="1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField7" Area="RowArea" AreaIndex="2" FieldName="NhanSP" Caption="Nhãn Sản Phẩm"   >
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField8" AreaIndex="4" FieldName="DVT" Caption="ĐVT">
                </dx:PivotGridField>
               
                <dx:PivotGridField ID="fieldGia" Area="RowArea" AreaIndex="3" FieldName="Gia" Caption="Đơn Giá" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom">
                    <ValueStyle HorizontalAlign="Right">
                    </ValueStyle>
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTonCK" Area="DataArea"   AreaIndex="0" FieldName="TonCK"   Caption="SL Tồn Cuối" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" 
                     >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTienCK" Area="DataArea" AreaIndex="1" FieldName="TienCK"   Caption="Tiền Tồn Cuối" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" 
                     >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTonCKHB" Area="DataArea" AreaIndex="2" FieldName="TonCKHB" Caption="SL Hàng Bán" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" 
                     >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTienCKHB" Area="DataArea" AreaIndex="3" FieldName="TienCKHB" Caption="Tiền Hàng Bán" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom"  TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTonCKKM" Area="DataArea" AreaIndex="4" FieldName="TonCKKM"  Caption="SL Khuyến Mãi" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom"  TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTienCKKM" Area="DataArea" AreaIndex="5" FieldName="TienCKKM" Caption="Tiền Khuyễn Mãi" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom"  TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom">
                </dx:PivotGridField>
            </Fields>
            <OptionsPager RowsPerPage="100">
            </OptionsPager>
            <Groups>
                <dx:PivotGridWebGroup Caption="Nhà Phân Phối" ShowNewValues="True" />
                <dx:PivotGridWebGroup Caption="Sản Phẩm" ShowNewValues="True" />
            </Groups>

        </dx:ASPxPivotGrid>

      <%--  
        <dx:ASPxPivotGrid ID="ASPxPivotGrid2" runat="server" ClientIDMode="AutoID"  Width ="100%" DataSourceID="SqlDataSource1"   SummaryText="Tổng Cộng">
            <Fields>
                <dx:PivotGridField ID="PivotGridField1" AreaIndex="0" FieldName="Region">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField2" AreaIndex="1" FieldName="Area">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField3" AreaIndex="2" FieldName="MaNPP" Caption="Mã NPP" GroupIndex="0" InnerGroupIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField4" AreaIndex="3" FieldName="TenNPP" Caption="Tên Nhà Phân Phối" GroupIndex="0" InnerGroupIndex="1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField5" Area="RowArea" AreaIndex="0" FieldName="MaSP" Caption="Mã Sản Phẩm"   GroupIndex="1" InnerGroupIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField6" Area="RowArea" AreaIndex="1" FieldName="TenSP" Caption="Tên Sản Phẩm" GroupIndex="1" InnerGroupIndex="1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField7" Area="RowArea" AreaIndex="2" FieldName="NhanSP" Caption="Nhãn Sản Phẩm"   >
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField8" AreaIndex="4" FieldName="DVT" Caption="ĐVT">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField9" Area="RowArea" AreaIndex="3" FieldName="Gia" Caption="Đơn Giá" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" RunningTotal="True" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                    <ValueStyle HorizontalAlign="Right">
                    </ValueStyle>
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField10" Area="DataArea"   AreaIndex="0" FieldName="TonCK" Caption="SL Tồn Cuối"  
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" 
                     >
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField11" Area="DataArea" AreaIndex="1" FieldName="TienCK" Caption="Tiền Tồn Cuối"  
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" 
                     >
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField12" Area="DataArea" AreaIndex="2" FieldName="TonCKHB" Caption="SL Hàng Bán" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" 
                     >
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField13" Area="DataArea" AreaIndex="3" FieldName="TienCKHB" Caption="Tiền Hàng Bán" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom"  TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField14" Area="DataArea" AreaIndex="4" FieldName="TonCKKM" Caption="SL Khuyến Mãi" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom"  TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField15" Area="DataArea" AreaIndex="5" FieldName="TienCKKM" Caption="Tiền Khuyễn Mãi" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom"  TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom">
                </dx:PivotGridField>
            </Fields>
            <OptionsPager RowsPerPage="100">
            </OptionsPager>
            <Groups>
                <dx:PivotGridWebGroup Caption="Nhà Phân Phối" ShowNewValues="True" />
                <dx:PivotGridWebGroup Caption="Sản Phẩm" ShowNewValues="True" />
            </Groups>

        </dx:ASPxPivotGrid>--%>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="Webtonkhongay" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="datest" Name="DenNgay" PropertyName="Value" Type="DateTime" />
                <asp:SessionParameter Name="Username" SessionField="TenDangNhap" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>


</asp:Content>
