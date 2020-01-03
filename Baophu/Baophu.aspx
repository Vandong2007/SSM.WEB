<%@ Page Title="Bao phu nha phan phoi" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="Baophu.aspx.vb" Inherits="WEB.SSM.Baophu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <table style="width: 100%"  frame="below" >
            <tr style=" height =  20px">
                <td Width= "300px"> <a> <h3>Bao phủ nhà phân phối</h3></a></td>
                <td style="width: 109px"> <a style="text-align: right"> Ngày Bắt Đầu</a></td>
                <td  Width= "100px"> <dx:ASPxDateEdit ID="datest" runat="server" Width= "100px"  Height ="100%">
                    </dx:ASPxDateEdit></td>
                <td style="text-align: right; width: 113px;"> <a> Ngày Kết Thúc</a></td>
                <td  Width= "100px">
                    <dx:ASPxDateEdit ID="dateen" runat="server" Width= "100px" Height ="100%">
                        <ButtonStyle>
                            <Paddings PaddingLeft="1px" />
                        </ButtonStyle>
                    </dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxButton ID="Btok" runat="server" Text="OK">
                    </dx:ASPxButton>
                </td>

                <td> <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False" OnClick="btnXlsxExport_Click" Width="165px" />
                    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="ASPxPivotGrid1">
                    </dx:ASPxPivotGridExporter>
                </td>
                <td> &nbsp;</td>
            </tr>
        </table>
    <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID"   Width="100%" OptionsDataField-Area="None" DataSourceID="SqlDataSource1">
        <Fields>
               <dx:PivotGridField ID="fieldRregion" Area="RowArea" AreaIndex="0" FieldName="Region" >
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldArea" Area="RowArea" AreaIndex="1" FieldName="Area">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldProvince" AreaIndex="0" FieldName="Province">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldMaNPP" Area="RowArea" AreaIndex="2" FieldName="MaNPP" Caption="Mã NPP" Width ="85">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTenNPP" Area="RowArea" AreaIndex="3" FieldName="TenNPP" Caption="Tên Nhà Phân Phối" Width ="370">
            </dx:PivotGridField>
         
            <dx:PivotGridField ID="fieldTongtien" Area="DataArea" AreaIndex="0" FieldName="Tongtien" RunningTotal="True" UnboundType="Integer" CellFormat-FormatType="Custom"
                     CellFormat-FormatString ="#,###.##" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" Caption="Doanh Số">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldSLNV" Area="DataArea" AreaIndex="1" FieldName="SLNV" RunningTotal="True" UnboundType="Integer" CellFormat-FormatType="Custom"
                     CellFormat-FormatString ="#,###.##" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" Caption ="Số lượng nhân viên">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldSLDonhang" Area="DataArea" AreaIndex="2" FieldName="SLDonhang" RunningTotal="True" UnboundType="Integer" CellFormat-FormatType="Custom"
                     CellFormat-FormatString ="#,###.##" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" Caption ="Số lượng đơn hàng">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldSLKHMua" Area="DataArea" AreaIndex="3" FieldName="SLKHMua" RunningTotal="True" UnboundType="Integer" CellFormat-FormatType="Custom"
                     CellFormat-FormatString ="#,###.##" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" Caption ="số lượng khách mua">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldSLKHQuanly" Area="DataArea" AreaIndex="4" FieldName="SLKHQuanly" RunningTotal="True" UnboundType="Integer" CellFormat-FormatType="Custom"
                     CellFormat-FormatString ="#,###.##" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" Caption =" Bao Phủ">
            </dx:PivotGridField> 
            <dx:PivotGridField ID="fieldSLSKU" Area="DataArea" AreaIndex="5" FieldName="SLSKU" RunningTotal="True" UnboundType="Integer" CellFormat-FormatType="Custom"
                     CellFormat-FormatString ="#,###.##" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" Caption="Số lượng SKU">
            </dx:PivotGridField>
             <dx:PivotGridField ID="fieldSLSKU_chua" Area="DataArea" AreaIndex="10" FieldName="SLSKU_Chuatach" RunningTotal="True" UnboundType="Integer" CellFormat-FormatType="Custom"
                     CellFormat-FormatString ="#,###.##" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" Caption="SL SKU chua tách">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTyleKHMua" Area="DataArea" AreaIndex="6" FieldName="TyleKHMua" RunningTotal="True" UnboundType="Integer" CellFormat-FormatType="Custom"
                     CellFormat-FormatString ="#,###.##" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString= "#,###.##"  Caption="Hoạt động/Bao phủ" SummaryType="Average"    >
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTyleDHKH" Area="DataArea" AreaIndex="7" FieldName="TyleDH_KH" RunningTotal="True" UnboundType="Integer" CellFormat-FormatType="Custom"
                     CellFormat-FormatString ="#,###.##" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###.##" Caption="Đơn hàng/Hoạt động" SummaryType="Average">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTyleDSDH" Area="DataArea" AreaIndex="8" FieldName="TyleDS_DH" RunningTotal="True" UnboundType="Integer" CellFormat-FormatType="Custom"
                     CellFormat-FormatString ="#,###.##" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" Caption="Doanh số/Đơn hàng" SummaryType="Average">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTyleSKUDH" Area="DataArea" AreaIndex="9" FieldName="TyleSKU_DH" RunningTotal="True" UnboundType="Integer" CellFormat-FormatType="Custom"
                     CellFormat-FormatString ="#,###.##" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###.##" Caption="SKU/Đơn hàng" SummaryType="Average">
           
            </dx:PivotGridField>
        </Fields>
        <OptionsView ShowDataHeaders="False" />
        <OptionsPager RowsPerPage="100">
        </OptionsPager>
        <Styles>
          <%--  <RowAreaStyle Wrap="True">
            </RowAreaStyle>--%>
            <DataAreaStyle Wrap="True">

            </DataAreaStyle>
            <CustomizationFieldsHeaderStyle Wrap="True">
            </CustomizationFieldsHeaderStyle>
        </Styles>
        </dx:ASPxPivotGrid>
     
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSM2014ConnectionString %>" SelectCommand="WebGetBaophuNPP" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="datest" Name="TuNgay" PropertyName="Value" Type="DateTime" />
                <asp:ControlParameter ControlID="dateen" Name="DenNgay" PropertyName="Value" Type="DateTime" />
                <asp:SessionParameter Name="Username" SessionField="TenDangNhap" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
     
    </div>
    
</asp:Content>
