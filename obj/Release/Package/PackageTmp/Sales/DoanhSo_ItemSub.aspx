<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="DoanhSo_ItemSub.aspx.vb" Inherits="WEB.SSM.DoanhSo_ItemSub" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div>
       
        <table style="width: 100%"  frame="below" >
            <tr>
                <td style="width: 339px"> Doanh Số Đã Tách Group theo Nhãn hàng </td>
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
                <td>   <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter2" runat="server" ASPxPivotGridID="ASPxPivotGrid2">
                    </dx:ASPxPivotGridExporter>
        <dx:ASPxButton ID="btnXlsxExport2" runat="server" Text="Export to Excel" UseSubmitBehavior="False" OnClick="btnXlsxExport2_Click" Width="165px" />
                </td>
                
                <td>&nbsp;</td>
            </tr>
        </table>

         <dx:ASPxPivotGrid ID="ASPxPivotGrid2" runat="server" ClientIDMode="AutoID" DataSourceID="SqlDataSource1">
            <Fields>
                <dx:PivotGridField ID="PivotGridField1" AreaIndex="3" FieldName="TenNPP" Caption="Tên Nhà Phân Phối" Area="RowArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField2" AreaIndex="0" FieldName="Region" Area="RowArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField3" AreaIndex="1" FieldName="Area" Area="RowArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField4" AreaIndex="2" FieldName="MaNPP" Caption="Mã NPP" Area="RowArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField5" AreaIndex="3" FieldName="MaSP" Caption="Mã Sản Phẩm">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField6" AreaIndex="4" FieldName="TenSP" Caption="Tên Sản Phẩm">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField7" AreaIndex="0" FieldName="GiaSP" Caption="Giá RBP">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField8" AreaIndex="5" FieldName="MaSP_Sub" SummaryDisplayType="Default" Caption="Mã Sản Phẩm Con" 
                     >
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField9" AreaIndex="6" FieldName="TenSP_Sub" Caption="Tên Sản Phẩm Con">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField10" AreaIndex="1" Caption="Giá SP Con" FieldName="GiaSP_Sub">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField11" AreaIndex="2" Caption="Loại" FieldName="Loai_SP">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField12" Area="ColumnArea" AreaIndex="0" Caption="Nhãn Hàng" FieldName="NhanSP">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField13" Area="RowArea" AreaIndex="4" FieldName="Category">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField14" AreaIndex="7" FieldName="Volumn">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField15" Area="DataArea" AreaIndex="0" Caption="Số Lượng" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" FieldName="Soluong" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField16" Area="DataArea" AreaIndex="1" Caption="Chiết Khấu" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" FieldName="ChietKhau" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField17" Area="DataArea" AreaIndex="2" Caption="Khuyến Mãi" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" FieldName="KhuyenMai" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="PivotGridField18" Area="DataArea" AreaIndex="3" Caption="Doanh Số" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" FieldName="ThanhTien" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
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
        <%-- <hr />
           <table style="width: 100%"  frame="below" >
            <tr>
                <td style="width: 339px"> Doanh Số Đã Tách Group theo Sản Phẩm</td>
                <td>   <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="ASPxPivotGrid1">
                    </dx:ASPxPivotGridExporter>
        <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False" OnClick="btnXlsxExport_Click" Width="165px" />
                </td>
                </tr>
               </table>--%>
        <%--<dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" DataSourceID="SqlDataSource1">
            <Fields>
                <dx:PivotGridField ID="fieldTenNPP" AreaIndex="0" FieldName="TenNPP" Caption="Tên Nhà Phân Phối">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldRegion" AreaIndex="1" FieldName="Region">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldArea" AreaIndex="2" FieldName="Area">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMaNPP" AreaIndex="3" FieldName="MaNPP" Caption="Mã NPP">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMaSP" AreaIndex="0" FieldName="MaSP" Area="RowArea" Caption="Mã Sản Phẩm">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTenSP" AreaIndex="1" FieldName="TenSP" Area="RowArea" Caption="Tên Sản Phẩm">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldGiaSP" AreaIndex="4" FieldName="GiaSP" Caption="Giá RBP">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMaSPSub" AreaIndex="2" FieldName="MaSP_Sub" Area="RowArea" SummaryDisplayType="Default" Caption="Mã Sản Phẩm Con" 
                     >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTenSPSub" Area="RowArea" AreaIndex="3" FieldName="TenSP_Sub" Caption="Tên Sản Phẩm Con">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldGiaSPSub" AreaIndex="5" Caption="Giá SP Con" FieldName="GiaSP_Sub">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldLoaiSP" AreaIndex="6" Caption="Loại" FieldName="Loai_SP">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNhanSP" Area="RowArea" AreaIndex="4" Caption="Nhãn Hàng" FieldName="NhanSP">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCategory" Area="RowArea" AreaIndex="5" FieldName="Category">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldVolumn" Area="RowArea" AreaIndex="6" FieldName="Volumn">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldSoluong" Area="DataArea" AreaIndex="0" Caption="Số Lượng" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" FieldName="Soluong" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldChietKhau" Area="DataArea" AreaIndex="1" Caption="Chiết Khấu" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" FieldName="ChietKhau" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldKhuyenMai" Area="DataArea" AreaIndex="2" Caption="Khuyến Mãi" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" FieldName="KhuyenMai" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldThanhTien" Area="DataArea" AreaIndex="3" Caption="Doanh Số" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom" FieldName="ThanhTien" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
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
        </dx:ASPxPivotGrid>--%>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="WebGetDS_Full" SelectCommandType="StoredProcedure">
             <SelectParameters>
                 <asp:ControlParameter ControlID="datest" Name="TuNgay" PropertyName="Value" Type="DateTime" />
                 <asp:ControlParameter ControlID="dateen" Name="DenNgay" PropertyName="Value" Type="DateTime" />
                 <asp:SessionParameter Name="Username" SessionField="TenDangNhap" Type="String" />
             </SelectParameters>
         </asp:SqlDataSource>
    </div>
</asp:Content>