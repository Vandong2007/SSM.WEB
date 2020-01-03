<%@ Page Title="Bản tổng hợp mua vào bán ra" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="Tonkhotong.aspx.vb" Inherits="WEB.SSM.Tonkhotong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <P>  <h3>Bảng tổng hợp mua vào bán ra </h3> </P>
     <table style="width: 100%"  frame="below" >
            
              
            
        
                      <tr>
                <td style="width: 98px"> <a style="text-align: right"> Ngày Bắt Đầu</a></td>
                <td  Width= "100px" style="margin-left: 80px"> <dx:ASPxDateEdit ID="datest" runat="server" Width= "100px"  Height ="100%" >
                    </dx:ASPxDateEdit></td>
                <td style="text-align: right; width: 108px;"> <a> Ngày Kết Thúc</a></td>
                <td  Width= "100px">
                    <dx:ASPxDateEdit ID="dateen" runat="server" Width="100px" Height="100%" >
                        <ButtonStyle>
                            <Paddings PaddingLeft="1px" />
                        </ButtonStyle>
                    </dx:ASPxDateEdit>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    <dx:ASPxButton ID="Btok" runat="server" Text="OK">
                    </dx:ASPxButton>
                </td>
                <td> <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False"   Width="165px" />
                   <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="ASPxPivotGrid1"></dx:ASPxPivotGridExporter>   </td>
            <td> <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Export to Excel all" UseSubmitBehavior="False"   Width="165px" />
                   </td>
           
                      </tr>
              </table>
    <div>


  
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="WebGetNhapxuatNPP" SelectCommandType="StoredProcedure">
            <SelectParameters>
                
                <asp:ControlParameter ControlID="datest" Name="TuNgay" PropertyName="Value" Type="DateTime" />
                <asp:ControlParameter ControlID="dateen" Name="DenNgay" PropertyName="Value" Type="DateTime" />
                <asp:SessionParameter Name="Username" SessionField="TenDangNhap" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
         


       <%-- <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" EnableTheming="True" Theme="Glass">
            <TotalSummary>
                <dx:ASPxSummaryItem FieldName="Gia" SummaryType="Max" />
                <dx:ASPxSummaryItem FieldName="TonDK" SummaryType="Sum" />
            </TotalSummary>
            <Settings ShowFilterBar="Auto" ShowFilterRow="True" ShowGroupFooter="VisibleIfExpanded" ShowHeaderFilterButton="True" />
             <Settings ShowFooter="True" />
        <%--<TotalSummary>
            <dx:ASPxSummaryItem FieldName="CompanyName" SummaryType="Count" />
            <dx:ASPxSummaryItem FieldName="Total" SummaryType="Sum" />
            <dx:ASPxSummaryItem FieldName="Quantity" SummaryType="Min" />
            <dx:ASPxSummaryItem FieldName="Quantity" SummaryType="Average" />
            <dx:ASPxSummaryItem FieldName="Quantity" SummaryType="Max" />
        </TotalSummary>--%>
       <%-- </dx:ASPxGridView>--%>
         &nbsp;<dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" DataSourceID="SqlDataSource2">
            <Fields>
                <dx:PivotGridField ID="fieldRegion" AreaIndex="0" FieldName="Region" Area="RowArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldArea" AreaIndex="1" FieldName="Area" Area="RowArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMaNPP" AreaIndex="2" FieldName="MaNPP" Area="RowArea" Caption="Mã NPP">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTenNPP" AreaIndex="3" FieldName="TenNPP" Caption="Tên NPP" Area="RowArea" >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTonDau" AreaIndex="0" FieldName="TonDau" Caption="Tồn đầu" Area="DataArea" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNhapHB" AreaIndex="1" FieldName="NhapHB" Caption="Nhập Hàng bán" Area="DataArea" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNhapKM" AreaIndex="2" FieldName="NhapKM" Caption="Nhập KM" Area="DataArea" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldXuatHB" AreaIndex="3" FieldName="XuatHB" Caption="Xuất Hàng Bán" Area="DataArea" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldXuatKM" AreaIndex="4" FieldName="XuatKM" Area="DataArea" Caption="Xuất KM" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldXuatKhac" AreaIndex="5" FieldName="XuatKhac"  Caption="Xuất Khác" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" Area="DataArea" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTonCuoi" Area="DataArea" AreaIndex="6" FieldName="TonCuoi"  Caption="Tồn Cuối" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom">
                </dx:PivotGridField>
            </Fields>
            <OptionsView DataHeadersDisplayMode="Popup" />
            <OptionsCustomization CustomizationFormStyle="Excel2007" />
            <OptionsPager RowsPerPage="300">
            </OptionsPager>
            <Groups>
                <dx:PivotGridWebGroup Caption="Nhà phân phối" ShowNewValues="True" />
                <dx:PivotGridWebGroup Caption="Sản Phẩm" ShowNewValues="True" />
            </Groups>
        </dx:ASPxPivotGrid>
        <br />
    </div>
        
           
       
</asp:Content>
