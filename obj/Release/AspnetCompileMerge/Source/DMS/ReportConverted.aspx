<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="ReportConverted.aspx.vb" Inherits="WEB.SSM.ReportConverted" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <h3>Report DMS</h3>
    </p>
    <table style="width: 100%" frame="below">




        <tr>

            <td width="110px" style="margin-left: 80px">
                <a style="text-align: right">Ngày Bắt Đầu</a>
                <br />
                <dx:ASPxDateEdit ID="datest" runat="server" Width="100px" Height="100%">
                </dx:ASPxDateEdit>
            </td>
            <td></td>
            <td width="110px" style="margin-left: 80px">
                <a>Ngày Kết Thúc</a><br />
                <dx:ASPxDateEdit ID="dateen" runat="server" Width="100px" Height="100%">
                    <ButtonStyle>
                        <Paddings PaddingLeft="1px" />
                    </ButtonStyle>
                </dx:ASPxDateEdit>
            </td>

            <td>
                <table>
                    <tr>
                        <td>  <dx:ASPxButton ID="Btok" runat="server" Text="OK" Height="100%">
                </dx:ASPxButton> </td>
                         <td>
                <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False" Width="165px" Height="100%" />
                <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="ASPxPivotGrid1"></dx:ASPxPivotGridExporter>
            </td>
                     
             <td>
              <%--  <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Get" Height="100%">
                </dx:ASPxButton>--%>
            </td>
                    </tr>
                </table>
              
            </td>
           
        </tr>
    </table>

    <div>



        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="Chuyendoidonhang" SelectCommandType="StoredProcedure">
            <SelectParameters>
                
                <asp:SessionParameter Name="Username" SessionField="TenDangNhap" Type="String" />
                <asp:ControlParameter ControlID="datest" Name="Tungay" PropertyName="Value" />
                <asp:ControlParameter ControlID="dateen" Name="DenNgay" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>





      
         <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" DataSourceID="SqlDataSource1">
             <Fields>
                 <dx:PivotGridField ID="fieldDebcode" AreaIndex="1" FieldName="Debcode" Area="RowArea" Caption="Mã NPP">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldOlddebcode" AreaIndex="0" FieldName="Olddebcode" Caption="Sapcode">
                 </dx:PivotGridField>

                 <dx:PivotGridField ID="fieldManv" AreaIndex="3" FieldName="Manv" Area="RowArea" Caption="Mã Nhân Viên" RunningTotal="True">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldHoten" AreaIndex="1" FieldName="Hoten" Caption="Họ Tên">
                 </dx:PivotGridField>
           <dx:PivotGridField ID="fieldActive" AreaIndex="2" FieldName="Active" Caption="Hoạt động">
                 </dx:PivotGridField> 
                
          
                 <dx:PivotGridField ID="fieldamountdms" Area="DataArea" AreaIndex="1" FieldName="amountdms" Caption="Thành tiền DMS" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" GrandTotalText="Tổng Cộng" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldsodhang" Area="DataArea" AreaIndex="2" FieldName="sodhang" Caption="Đơn hàng DMS" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" GrandTotalText="Tổng Cộng" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom">
                 </dx:PivotGridField>
                  <dx:PivotGridField ID="fieldAmountEVS" Area="DataArea" AreaIndex="3" FieldName="AmountEVS" Caption="Thành tiền EVS" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" GrandTotalText="Tổng Cộng" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom">
                 </dx:PivotGridField>
                   <dx:PivotGridField ID="fielddonhangeve" Area="DataArea" AreaIndex="4" FieldName="donhangeve" Caption="Đơn hàng EVS" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" GrandTotalText="Tổng Cộng" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom">
                 </dx:PivotGridField>
                  <dx:PivotGridField ID="fieldthanhcong" Area="DataArea" AreaIndex="5" FieldName="thanhcong" Caption="Chuyển đổi thành công" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" GrandTotalText="Tổng Cộng" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldchuyendoi" Area="DataArea" AreaIndex="6" FieldName="chuyendoi" Caption="Chuyển đổi " GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" GrandTotalText="Tổng Cộng" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldDebname" Area="RowArea" AreaIndex="2" FieldName="Debname" Caption="Tên NPP">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldRegion" Area="RowArea" AreaIndex="0" FieldName="Region"  >
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldArea" AreaIndex="6" FieldName="Area"  >
                 </dx:PivotGridField>

              <%--   <dx:PivotGridField ID="fieldTenkh" AreaIndex="6" FieldName="Tenkh" Caption="Tên Khách Hàng">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldDiachi" AreaIndex="7" FieldName="Diachi" Caption="Địa chỉ KH">
                 </dx:PivotGridField>--%>
                 <dx:PivotGridField ID="fieldTenNV" Area="RowArea" AreaIndex="4" FieldName="Hoten" Caption="Tên Nhân Viên"> </dx:PivotGridField>
                 
             </Fields>
             <OptionsView DataHeadersDisplayMode="Popup" />
              
             <OptionsPager RowsPerPage="300">
             </OptionsPager>
         </dx:ASPxPivotGrid>
    </div>



</asp:Content>
