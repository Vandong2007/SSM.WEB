<%@ Page Title="Tồn kho theo sản phẩm" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="Tonkho.aspx.vb" Inherits="WEB.SSM.Tonkho" %>
 <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <P>  <h3>Nhập Xuất Tồn Theo Sản Phẩm</h3> </P>
     <table style="width: 100%"  frame="below" >
            
              
            
        <tr>
             <td style="width: 98px; text-align: center;"> <a style="text-align: right"> Ngày Bắt Đầu</a></td>
            <td> </td>
             <td style="text-align: center; width: 108px;"> <a> Ngày Kết Thúc</a></td>
            <td style="text-align: center"><a>Chọn n</a>hà phân phối</td>
        </tr>
                      <tr>
               
                <td  Width= "100px" style="margin-left: 80px"> <dx:ASPxDateEdit ID="datest" runat="server" Width= "100px"  Height ="100%" >
                    </dx:ASPxDateEdit></td>
                <td> </td>
                <td  Width= "100px">
                    <dx:ASPxDateEdit ID="dateen" runat="server" Width="100px" Height="100%" >
                        <ButtonStyle>
                            <Paddings PaddingLeft="1px" />
                        </ButtonStyle>
                    </dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="SqlDataSource2" TextField="Debname" ValueField="Debcode" Height="21px" Width="100%"
                        DropDownStyle="DropDownList" ValueType="System.String" TextFormatString="{0} ({1}) ({2})"
                        IncrementalFilteringMode="Contains" ToolTip="Chọn nhà phân phối">
                        <Columns>
                            <dx:ListBoxColumn FieldName="Debcode" Width="100px"/>
                            <dx:ListBoxColumn FieldName="Debname" Width="300px" />
                            <dx:ListBoxColumn FieldName="Debadd" Width="300px" />

                        </Columns>

                    </dx:ASPxComboBox>

                </td>
                <td>
                    <dx:ASPxButton ID="Btok" runat="server" Text="OK">
                    </dx:ASPxButton>
                </td>
                <td> <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False"   Width="165px" />
                   <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="ASPxPivotGrid1"></dx:ASPxPivotGridExporter>   </td>
                           <td>     
                
        <dx:ASPxButton ID="exportmdb" runat="server" Text="Export To Access file" UseSubmitBehavior="False" Width="165px" />

                </td>
                           <td>     
                
        <dx:ASPxButton ID="btgui" runat="server" Text="Export Excel Template" UseSubmitBehavior="False" Width="165px" />

                </td>
            </tr>
              </table>
        <asp:Panel runat="server" Visible="false" ID="pnlUploadMessage">
        <p>
           Vui lòng download file
        </p>
        <p>
            <asp:HyperLink ID="lnkDownloadYourFile" runat="server"></asp:HyperLink>
        </p> </asp:Panel>
    <div>


  
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="WebGetNhapxuatTon" SelectCommandType="StoredProcedure">
            <SelectParameters>
                
                <asp:ControlParameter ControlID="datest" Name="TuNgay" PropertyName="Value" Type="DateTime" />
                <asp:ControlParameter ControlID="dateen" Name="DenNgay" PropertyName="Value" Type="DateTime" />
                <asp:ControlParameter ControlID="ASPxComboBox1" Name="MaNPP" PropertyName="Value" Type="String" />
                <asp:SessionParameter Name="Username" SessionField="TenDangNhap" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
         


       <%-- </dx:ASPxGridView>--%>
       <%-- </dx:ASPxGridView>--%>
         &nbsp;<dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" DataSourceID="SqlDataSource1">
            <Fields>
                <dx:PivotGridField ID="fieldRegion" AreaIndex="0" FieldName="Region">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProvince" AreaIndex="1" FieldName="Province">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldArea" AreaIndex="2" FieldName="Area">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMaNPP" AreaIndex="3" FieldName="MaNPP" GroupIndex="0" InnerGroupIndex="0" Caption="Mã NPP" >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTenNPP" AreaIndex="4" FieldName="TenNPP" GroupIndex="0" InnerGroupIndex="1" Caption="Tên NPP">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMaSP" Area="RowArea" AreaIndex="0" FieldName="MaSP" GroupIndex="1" InnerGroupIndex="0" Caption="Mã Sản Phẩm">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTenSP" Area="RowArea" AreaIndex="1" FieldName="TenSP" GroupIndex="1" InnerGroupIndex="1" Caption="Tên Sản Phẩm">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNhanSP" Area="RowArea" AreaIndex="2" FieldName="NhanSP" Caption="Nhãn Hàng">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDVT" Area="RowArea" AreaIndex="3" FieldName="DVT">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldGia" Area="RowArea" AreaIndex="4" FieldName="Gia"  Caption="Đơn giá" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" GrandTotalText="Tổng Cộng" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTonDK" Area="DataArea" AreaIndex="0" FieldName="TonDK"  Caption="Tồn Đầu" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" GrandTotalText="Tổng Cộng" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTonDKHB" Area="DataArea" AreaIndex="1" FieldName="TonDKHB"  Caption="Tồn Đầu HB" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom"   ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTonDKKM" Area="DataArea" AreaIndex="2" FieldName="TonDKKM"  Caption="Tồn Đầu KM" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" GrandTotalText="Tổng Cộng" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNhapHB" Area="DataArea" AreaIndex="3" FieldName="NhapHB"  Caption="Nhập HB" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" GrandTotalText="Tổng Cộng" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNhapKM" Area="DataArea" AreaIndex="4" FieldName="NhapKM"  Caption="Nhập KM" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" GrandTotalText="Tổng Cộng" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldXuatHB" Area="DataArea" AreaIndex="5" FieldName="XuatHB"  Caption="Xuất HB" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" GrandTotalText="Tổng Cộng" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldXuatKM" Area="DataArea" AreaIndex="6" FieldName="XuatKM"  Caption="Xuất KM " GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" GrandTotalText="Tổng Cộng" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldXuatDHBKM" Area="DataArea" AreaIndex="7" FieldName="XuatDHBKM"  Caption="Xuất Khác" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" GrandTotalText="Tổng Cộng" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTonCK" Area="DataArea" AreaIndex="10" FieldName="TonCK"  Caption="Tồn Cuối" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" GrandTotalText="Tổng Cộng" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTonCKHB" Area="DataArea" AreaIndex="9" FieldName="TonCKHB"  Caption="Tồn Cuối HB" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" GrandTotalText="Tổng Cộng" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom" >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTonCKKM" Area="DataArea" AreaIndex="8" FieldName="TonCKKM"  Caption="Tồn Cuối KM" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" GrandTotalText="Tổng Cộng" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
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
    </div>
        
  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="

Select 'ALL' As Debcode, 'Tat Ca' as Debname, '' As  Debadd
Union all
SELECT Debcode, Debname, Debadd FROM dbo.Fn_cust(@unam) AS Fn_cust_1" >
        <SelectParameters>
            <asp:SessionParameter Name="unam" SessionField="TenDangNhap" />
        </SelectParameters>
    </asp:SqlDataSource>
       
           
         


</asp:Content>
