<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="SaleMenActiver.aspx.vb" Inherits="WEB.SSM.SaleMenActiver" %>
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
                 &nbsp;</td>
                    </tr>
                </table>
              
            </td>
           
        </tr>
    </table>

    <div>



    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT V_DMS_FULL.Region, V_DMS_FULL.Area, V_DMS_FULL.Olddebcode, V_DMS_FULL.Debname, V_DMS_FULL.Debadd, V_DMS_FULL.Manv, V_DMS_FULL.Hoten, V_DMS_FULL.Activer, V_DMS_FULL.Act FROM (SELECT a.Debcode, a.Region, a.Area, a.Olddebcode, a.Debname, a.Debadd, a.Manv, a.Hoten, a.Activer, CONVERT (Bit, CASE WHEN fieldForceCode IS NULL THEN 'False' ELSE 'True' END) AS Act FROM (SELECT tbCustomer.Debcode, tbCustomer.Region, tbCustomer.Area, tbCustomer.Olddebcode, tbCustomer.Debname, tbCustomer.Debadd, SDNhanvien.Manv, SDNhanvien.Hoten, SDNhanvien.Active AS Activer FROM tbCustomer INNER JOIN SDNhanvien ON tbCustomer.Debcode = SDNhanvien.MaNPP AND SDNhanvien.Active = 1 	 where tbCustomer.[Activer]=1) AS a LEFT OUTER JOIN tb_DMS_orderH ON a.Manv = tb_DMS_orderH.fieldForceCode AND tb_DMS_orderH.Debcode = a.Olddebcode AND tb_DMS_orderH.orderDate &gt;= DATEADD(dd, 0, DATEDIFF(dd, 0, @tungay)) AND tb_DMS_orderH.orderDate &lt;= DATEADD(MINUTE, 1439, DATEDIFF(dd, 0, DATEADD(dd, 0, DATEDIFF(dd, 0, @denngay)))) GROUP BY a.Debcode, a.Region, a.Area, a.Olddebcode, a.Debname, a.Debadd, a.Manv, a.Hoten, a.Activer, CONVERT (Bit, CASE WHEN fieldForceCode IS NULL THEN 'False' ELSE 'True' END)) AS V_DMS_FULL INNER JOIN dbo.Fn_cust1(@uname) AS Fn_cust1_1 ON V_DMS_FULL.Debcode = Fn_cust1_1.Debcode">
            <SelectParameters>
                
                <asp:ControlParameter ControlID="datest" Name="tungay" PropertyName="Value" />
                <asp:ControlParameter ControlID="dateen" Name="denngay" PropertyName="Value" />
                
                <asp:SessionParameter Name="uname" SessionField="TenDangNhap" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

     <%--   <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT V_DMS_FULL.Region, V_DMS_FULL.Area, V_DMS_FULL.Olddebcode, V_DMS_FULL.Debname, V_DMS_FULL.Debadd, V_DMS_FULL.Manv, V_DMS_FULL.Hoten, V_DMS_FULL.Activer, V_DMS_FULL.Act FROM (SELECT a.Debcode, a.Region, a.Area, a.Olddebcode, a.Debname, a.Debadd, a.Manv, a.Hoten, a.Activer, CONVERT(Bit, CASE WHEN fieldForceCode IS NULL THEN 'False' ELSE 'True' END) AS Act FROM (SELECT tbCustomer.Debcode, tbCustomer.Region, tbCustomer.Area, tbCustomer.Olddebcode, tbCustomer.Debname, tbCustomer.Debadd, SDNhanvien.Manv, SDNhanvien.Hoten, SDNhanvien.Active AS Activer FROM tbCustomer INNER JOIN SDNhanvien ON tbCustomer.Debcode = SDNhanvien.MaNPP AND SDNhanvien.Active = 1) AS a LEFT OUTER JOIN tb_DMS_orderH ON a.Manv = tb_DMS_orderH.fieldForceCode AND tb_DMS_orderH.Debcode = a.Olddebcode AND tb_DMS_orderH.orderDate &gt;= DATEADD(dd, 0, DATEDIFF(dd, 0, @tungay)) AND tb_DMS_orderH.orderDate &lt;= DATEADD(MINUTE, 1439, DATEDIFF(dd, 0, DATEADD(dd, 1, DATEDIFF(dd, 0, @denngay)))) GROUP BY a.Debcode, a.Region, a.Area, a.Olddebcode, a.Debname, a.Debadd, a.Manv, a.Hoten, a.Activer, CONVERT(Bit, CASE WHEN fieldForceCode IS NULL THEN 'False' ELSE 'True' END)) AS V_DMS_FULL INNER JOIN dbo.Fn_cust1(@uname) AS Fn_cust1_1 ON V_DMS_FULL.Debcode = Fn_cust1_1.Debcode INNER JOIN (SELECT Debcode FROM tb_DMS_orderH AS tb_DMS_orderH_1 WHERE (orderDate &gt;= DATEADD(dd, 0, DATEDIFF(dd, 0, @tungay))) AND (orderDate &lt;= DATEADD(MINUTE, 1439, DATEDIFF(dd, 0, DATEADD(dd, 1, DATEDIFF(dd, 0, @denngay))))) GROUP BY Debcode) AS deb ON V_DMS_FULL.oldDebcode = deb.Debcode">
            <SelectParameters>
                
                <asp:ControlParameter ControlID="datest" Name="tungay" PropertyName="Value" />
                <asp:ControlParameter ControlID="dateen" Name="denngay" PropertyName="Value" />
                
                <asp:SessionParameter Name="uname" SessionField="TenDangNhap" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>--%>


      
         <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" DataSourceID="SqlDataSource1">
             <Fields>
                 <dx:PivotGridField ID="fieldRegion" AreaIndex="0" FieldName="Region" Area="RowArea">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldArea" AreaIndex="1" FieldName="Area" Area="RowArea">
                 </dx:PivotGridField>

                 <dx:PivotGridField ID="fieldOlddebcode" AreaIndex="2" FieldName="Olddebcode" Area="RowArea" Caption="Debcode">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldDebname" AreaIndex="3" FieldName="Debname" Area="RowArea">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldDebadd" AreaIndex="4" FieldName="Debadd" Area="RowArea">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldManv" AreaIndex="5" FieldName="Manv" Caption="Code SaleMan" Area="RowArea" TotalsVisibility="None">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldHoten" AreaIndex="6" FieldName="Hoten" Caption="Name  SaleMan" Area="RowArea" TotalsVisibility="None">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldActiver" Area="RowArea" AreaIndex="7" FieldName="Activer" Caption="Activated" TotalsVisibility="None">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldAct" Area="RowArea" AreaIndex="8" FieldName="Act" Caption="DMS Activated" TotalsVisibility="None">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldAct1" Area="DataArea" AreaIndex="0" Caption="Count DMS Act" FieldName="Act">
                 </dx:PivotGridField>
                 <dx:PivotGridField ID="fieldActiver1" Area="DataArea" AreaIndex="1" Caption="Count Activated" FieldName="Activer">
                 </dx:PivotGridField>
             </Fields>
             <OptionsView DataHeadersDisplayMode="Popup" />
             <OptionsCustomization CustomizationFormStyle="Excel2007" />
             <OptionsPager RowsPerPage="300">
             </OptionsPager>
         </dx:ASPxPivotGrid>
    </div>

</asp:Content>
