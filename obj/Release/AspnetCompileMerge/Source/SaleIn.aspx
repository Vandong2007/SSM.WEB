<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="SaleIn.aspx.vb" Inherits="WEB.SSM.defauldt" %>
 
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
               
            </tr>
        
               </table>

     <hr>
    <div><h4>Doanh số nhập vào theo nhóm sản phẩm</h4></div>
      
 <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False" Width="116px" Height="23px" />
                   
        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter2" runat="server" ASPxPivotGridID="ASPxPivotGrid2">
                    </dx:ASPxPivotGridExporter>
         
      
    <hr>
      <dx:ASPxPivotGrid ID="ASPxPivotGrid2" runat="server" ClientIDMode="AutoID" Width="100%" DataSourceID="SqlDataSource1">
            <Fields>
                <dx:PivotGridField ID="fieldDebcode1" AreaIndex="0"  Caption="Debcode" FieldName="Debcode">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDebname1" AreaIndex="1" Caption="Debname"  FieldName="Debname">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldRegion1" AreaIndex="2" FieldName="Region">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldArea1" AreaIndex="3" FieldName="Area">
                </dx:PivotGridField>
           
                <dx:PivotGridField ID="fieldBrand1" AreaIndex="0" FieldName="Brand" Caption="Brand" Area="ColumnArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldcategory1" AreaIndex="0" Caption="Category"  FieldName="category" Area="RowArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldRBP1" AreaIndex="0" FieldName="RBP" Caption="RBP"  Area="DataArea"
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###"  TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom"
                     >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldINV1" AreaIndex="5" Caption="Invioce" FieldName="INV"
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###"  TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom"
                    >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldRBPfree1" AreaIndex="4" FieldName="RBPfree"
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom"
                    >
                </dx:PivotGridField>
            </Fields>
            <OptionsChartDataSource ProvideColumnGrandTotals="True" ProvideColumnTotals="True" ProvideRowTotals="True" />
            <OptionsPager RowsPerPage="200">
            </OptionsPager>
            <Groups>
                <dx:PivotGridWebGroup ShowNewValues="True" />
            </Groups>
        </dx:ASPxPivotGrid>


    <hr>

  
          <hr>
    <div><h4>Doanh số nhập vào theo nhà phân phối</h4></div>
     <hr>
     <dx:ASPxButton ID="btnXlsxExport0" runat="server" Text="Export to Excel" UseSubmitBehavior="False" OnClick="btnXlsxExport_Click" Width="116px" Height="23px" />
    
        <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" Width="100%" DataSourceID="SqlDataSource1">
            <Fields>
                <dx:PivotGridField ID="fieldDebcode" AreaIndex="2" FieldName="Debcode" Area="RowArea" Caption="Distributor">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDebname" AreaIndex="3" FieldName="Debname" Area="RowArea" Caption="Distributor Name">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldRegion" AreaIndex="0" FieldName="Region" Area="RowArea" Caption="Region">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldArea" AreaIndex="1" FieldName="Area" Area="RowArea">
                </dx:PivotGridField>
               <dx:PivotGridField ID="PBrand" AreaIndex="0" FieldName="Brand" Caption="Brand" >
                </dx:PivotGridField>
                <dx:PivotGridField ID="Category" AreaIndex="1" Caption="Category"  FieldName="category"  >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldRBP" AreaIndex="0" FieldName="RBP" Area="DataArea" Caption="Sale RBP" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldRBPfree" AreaIndex="1" FieldName="RBPfree" Area="DataArea" Caption="Sale Free" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldINV" AreaIndex="2" FieldName="INV" Area="DataArea" 
                    GrandTotalCellFormat-FormatType="Custom"
                    GrandTotalCellFormat-FormatString="#,###" Caption="Sale Invioce" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom"
                     >
                </dx:PivotGridField>
            </Fields>
            <OptionsChartDataSource ProvideColumnGrandTotals="True" ProvideColumnTotals="True" ProvideRowTotals="True" />
            <OptionsPager RowsPerPage="200">
            </OptionsPager>
            <Groups>
                <dx:PivotGridWebGroup ShowNewValues="True" />
            </Groups>
        </dx:ASPxPivotGrid>
        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="ASPxPivotGrid1">
                    </dx:ASPxPivotGridExporter>
                      
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="WebGetSaleIn" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="datest" Name="TuNgay" PropertyName="Value" Type="DateTime" />
            <asp:ControlParameter ControlID="dateen" Name="DenNgay" PropertyName="Value" Type="DateTime" />
            <asp:SessionParameter Name="Username" SessionField="TenDangNhap" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
 
</asp:Content>
