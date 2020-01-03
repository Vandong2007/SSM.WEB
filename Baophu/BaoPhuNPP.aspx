<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="Baophunpp.aspx.vb" Inherits="WEB.SSM.Baophunpp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <table style="width: 100%"  frame="below" >
            <tr>
                <td Width= "200px"> <a>  Bao Phủ Theo nhân viên </a></td>
                <td style="width: 101px"> <a style="text-align: right"> Ngày Bắt Đầu</a></td>
                <td  Width= "100px"> <dx:ASPxDateEdit ID="datest" AutoPostBack="true" runat="server" Width= "100px"  Height ="100%" >
                    </dx:ASPxDateEdit></td>
                <td Width= "150px" style="text-align: right"> <a> Ngày Kết Thúc</a></td>
                <td  Width= "100px">
                    <dx:ASPxDateEdit ID="dateen" AutoPostBack="true" runat="server" Width= "100px" Height ="100%"  >
                        <ButtonStyle>
                            <Paddings PaddingLeft="1px" />
                        </ButtonStyle>
                    </dx:ASPxDateEdit>
                </td>
                <td> <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" TextField="Debcode" ValueField="Debcode" TextFormatString="{0} ({1})"
                IncrementalFilteringMode="Contains" > 
                    <Columns>
                        <dx:ListBoxColumn FieldName="Debcode" Width="100px" />
                        <dx:ListBoxColumn FieldName="Debname" Width="200px" />
                    </Columns>
                    </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT 'ALL' as Debcode, 'Select All' as Debname 
Union all
SELECT Debcode, Debname FROM dbo.Fn_cust(@unam) AS Fn_cust_1
" >
        <SelectParameters>
            <asp:SessionParameter Name="unam" SessionField="TenDangNhap" />
        </SelectParameters>
    </asp:SqlDataSource>
                </td>
               <td> <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False" OnClick="btnXlsxExport_Click" Width="165px" />
                    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="ASPxPivotGrid1">
                    </dx:ASPxPivotGridExporter>
                </td> 
               
            </tr>
        </table>
    <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID"   Width="100%" DataSourceID="SqlDataSource1">
        <Fields>
            <dx:PivotGridField ID="fieldMaNPP" AreaIndex="2" FieldName="MaNPP" Area="RowArea" Caption="Mã NPP">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTenNPP" Area="RowArea" AreaIndex="3" FieldName="TenNPP" Caption="Tên NPP">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldRegion" Area="RowArea" AreaIndex="0" FieldName="Region">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldArea" Area="RowArea" AreaIndex="1" FieldName="Area">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldMaNV" Area="RowArea" AreaIndex="4" FieldName="MaNV" Caption="Mã NV">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldHoten" Area="RowArea" AreaIndex="5" FieldName="Hoten" Caption="Tên Nhân Viên">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTongtien" Area="DataArea" AreaIndex="0" FieldName="Tongtien" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" RowValueLineCount="2" Caption="Doanh Số">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldSLDonhang" Area="DataArea" AreaIndex="1" FieldName="SLDonhang" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" RowValueLineCount="2" Caption="Đơn Hàng">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldSLKHMua" Area="DataArea" AreaIndex="2" FieldName="SLKHMua" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" RowValueLineCount="2" Caption="SL Khách Mua">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldSLKHQuanly" Area="DataArea" AreaIndex="3" FieldName="SLKHQuanly" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" RowValueLineCount="2" Caption="Bao Phủ">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldSLSKU" Area="DataArea" AreaIndex="4" FieldName="SLSKU" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" RowValueLineCount="2" Caption="Tổng SKU">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTyleKHMua" Area="DataArea" AreaIndex="5" FieldName="TyleKHMua" GrandTotalCellFormat-FormatString="#,###.##" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###.##" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###.##" ValueFormat-FormatType="Custom" RowValueLineCount="2" Caption="T.lệ Mua Hàng" SummaryType="Average">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTyleDHKH" Area="DataArea" AreaIndex="6" FieldName="TyleDH_KH" GrandTotalCellFormat-FormatString="#,###.##" GrandTotalCellFormat-FormatType="Custom" RowValueLineCount="2" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###.##" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###.##" ValueFormat-FormatType="Custom" Caption="Đơn Hàng/Khách Hàng" SummaryType="Average">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTyleDSDH" Area="DataArea" AreaIndex="7" FieldName="TyleDS_DH" GrandTotalCellFormat-FormatString="#,###.##" GrandTotalCellFormat-FormatType="Custom" RowValueLineCount="2" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###.##" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###.##" ValueFormat-FormatType="Custom" Caption="ĐoanhSố/Đơn Hàng" SummaryType="Average">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTyleSKUDH" Area="DataArea" AreaIndex="8" FieldName="TyleSKU_DH" GrandTotalCellFormat-FormatString="#,###.##" GrandTotalCellFormat-FormatType="Custom" RowValueLineCount="2" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###.##" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###.##" ValueFormat-FormatType="Custom" Caption="SKU/Đơn Hàng" SummaryType="Average">
            </dx:PivotGridField>
               <dx:PivotGridField ID="PivotGridField1" Area="DataArea" AreaIndex="9" FieldName="SLSKU_Chuatach" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" RowValueLineCount="2" Caption="Tổng SKU Chưa tách">
            </dx:PivotGridField>
        </Fields>
         <OptionsPager RowsPerPage="100">
        </OptionsPager>
        <OptionsDataField RowValueLineCount="2" />
        </dx:ASPxPivotGrid>
           
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="WebBaophuNV" SelectCommandType="StoredProcedure" OnSelecting="SqlDataSource1_Selecting">
             <SelectParameters>
                 <asp:ControlParameter ControlID="ASPxComboBox1" Name="MaNPP" PropertyName="Value" Type="String" />
                 <asp:SessionParameter Name="Username" SessionField="TenDangNhap" Type="String" />
                 <asp:ControlParameter ControlID="datest" Name="TuNgay" PropertyName="Value" Type="DateTime"  />
                 <asp:ControlParameter ControlID="dateen" Name="DenNgay" PropertyName="Value" Type="DateTime"  />
             </SelectParameters>
        </asp:SqlDataSource>
    </div>
    
</asp:Content>
