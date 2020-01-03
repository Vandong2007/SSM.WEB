<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="Default.aspx.vb" Inherits="WEB.SSM.Defail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <h3>Doanh số bán hàng DMS</h3>
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
                <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Get" Height="100%">
                </dx:ASPxButton>
            </td>
                    </tr>
                </table>
              
            </td>
           
        </tr>
    </table>

    <div>



        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="
SELECT        dbo.tb_DMS_orderH.Debcode, dbo.tb_DMS_orderH.orderDate, dbo.tb_DMS_orderH.fieldForceCode, dbo.tb_DMS_orderH.orderNumber, dbo.tb_DMS_orderH.retailerCode, dbo.tb_DMS_orderD.productCode, dbo.tb_DMS_orderD.price, 
                         SUM(dbo.tb_DMS_orderD.orderQuantity) AS orderQuantity, SUM(dbo.tb_DMS_orderD.Amount) AS Amount, dbo.tbItems.Itemname, dbo.tbItems.Brand, dbo.tb_Category.CategoryViet, tbCustomer.Debname, tbCustomer.Region, 
                         tbCustomer.Area, dbo.SDNhanvien.Hoten as TenNV
FROM            dbo.tb_DMS_orderH INNER JOIN
                         dbo.tb_DMS_orderD ON dbo.tb_DMS_orderH.Debcode = dbo.tb_DMS_orderD.Debcode AND dbo.tb_DMS_orderH.orderNumber = dbo.tb_DMS_orderD.orderNumber INNER JOIN
                         dbo.tbItems ON dbo.tb_DMS_orderD.productCode = dbo.tbItems.OldItemcode INNER JOIN
                         dbo.tb_Category ON dbo.tbItems.MATKL = dbo.tb_Category.MGR INNER JOIN
                         dbo.Fn_cust2(@uname) AS tbCustomer ON dbo.tb_DMS_orderH.Debcode = tbCustomer.Olddebcode INNER JOIN
                         dbo.SDNhanvien ON tbCustomer.Debcode = dbo.SDNhanvien.MaNPP AND dbo.tb_DMS_orderH.fieldForceCode = dbo.SDNhanvien.Manv
						 WHERE (tb_DMS_orderH.orderDate &gt;=  DATEADD(dd, 0, DATEDIFF(dd, 0,@tungay))  AND tb_DMS_orderH.orderDate &lt;= DATEADD(minute, 59, DATEADD(hour, 23, DATEDIFF(dd, 0,@denngay))))
GROUP BY dbo.tb_DMS_orderH.Debcode, dbo.tb_DMS_orderH.orderDate, dbo.tb_DMS_orderH.orderNumber, dbo.tb_DMS_orderH.fieldForceCode, dbo.tb_DMS_orderH.retailerCode, dbo.tb_DMS_orderD.productCode, dbo.tb_DMS_orderD.price, dbo.tbItems.Itemname, 
                         dbo.tbItems.Brand, dbo.tb_Category.CategoryViet, tbCustomer.Debname, tbCustomer.Region, tbCustomer.Area, dbo.SDNhanvien.Hoten
">
            <SelectParameters>
                
                <asp:SessionParameter Name="uname" SessionField="TenDangNhap" Type="String" />
                <asp:ControlParameter ControlID="datest" Name="tungay" PropertyName="Value" />
                <asp:ControlParameter ControlID="dateen" Name="denngay" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>





      
         <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" DataSourceID="SqlDataSource1">
             <Fields>
                 <dx:PivotGridField ID="fieldDebcode" AreaIndex="1" FieldName="Debcode" Area="RowArea" Caption="Mã NPP">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldorderDate" AreaIndex="0" FieldName="orderDate" Caption="Ngày đặt">
                 </dx:PivotGridField>

                 <dx:PivotGridField ID="fieldfieldForceCode" AreaIndex="3" FieldName="fieldForceCode" Area="RowArea" Caption="Mã Nhân Viên" RunningTotal="True">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldretailerCode" AreaIndex="1" FieldName="retailerCode" Caption="Mã Khách Hàng">
                 </dx:PivotGridField>
           <dx:PivotGridField ID="fieldorderNumber" AreaIndex="2" FieldName="orderNumber" Caption="Số đơn hàng">
                 </dx:PivotGridField> 
                 <dx:PivotGridField ID="fieldproductCode" AreaIndex="3" FieldName="productCode" Caption="Mã Sản Phẩm">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldprice" AreaIndex="4" FieldName="price" Caption="Đơn giá" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" GrandTotalText="Tổng Cộng" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldorderQuantity" Area="DataArea" AreaIndex="1" FieldName="orderQuantity" Caption="Số Lượng" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" GrandTotalText="Tổng Cộng" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldAmount" Area="DataArea" AreaIndex="2" FieldName="Amount" Caption="Thành tiền" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" GrandTotalText="Tổng Cộng" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom" CellFormat-FormatString="#,###" CellFormat-FormatType="Custom">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldItemname" AreaIndex="5" FieldName="Itemname" Caption="Tên Sản Phẩm">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldBrand" Area="ColumnArea" AreaIndex="0" FieldName="Brand" Caption="Nhãn Hàng">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldCategoryViet" AreaIndex="7" FieldName="CategoryViet" Caption="Nhóm hàng">
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
                 <dx:PivotGridField ID="fieldTenNV" Area="RowArea" AreaIndex="4" FieldName="TenNV" Caption="Tên Nhân Viên">
                 </dx:PivotGridField>
          
                    <dx:PivotGridField ID="fieldSd" Area="DataArea" AreaIndex="0" Caption="Số lượng đơn" FieldName="orderNumber" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" SummaryType="Custom" TotalsVisibility="CustomTotals" TotalValueFormat-FormatString="#,###" TotalValueFormat-FormatType="Custom">
                </dx:PivotGridField>
             </Fields>
             <OptionsView DataHeadersDisplayMode="Popup" />
              
             <OptionsPager RowsPerPage="300">
             </OptionsPager>
         </dx:ASPxPivotGrid>
    </div>



</asp:Content>
