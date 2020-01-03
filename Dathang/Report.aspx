<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="Report.aspx.vb" Inherits="WEB.SSM.Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <table style="width: 100%" >
         <tr>
                                                <td colspan="7">
                                                   <h2>Báo cáo đặt hàng</h2>
                                                </td>

         </tr>
        <tr>
            <td style="width: 250px">Ngày bắt đầu</td>

            <td style="width: 150px">
                <dx:ASPxDateEdit ID="datest" runat="server" Width="100%" Height="100%">
                </dx:ASPxDateEdit>
            </td>
            <td style="width: 250px">Ngày kết thúc</td>
            <%--             <td Width= "200px" style="text-align: right"> <a> Ngày Kết Thúc</a></td>--%>
            <td style="width: 150px">
                <dx:ASPxDateEdit ID="dateen" runat="server" Width="100%" Height="100%">
                    <ButtonStyle>
                        <Paddings PaddingLeft="1px" />
                    </ButtonStyle>
                </dx:ASPxDateEdit>
            </td>
            <td style="width:  150px">
                <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Xem">
                    <Image Url="~/Content/Images/oks.png">
                    </Image>
                </dx:ASPxButton>

            </td>
            <td style="width:  150px">
                <dx:ASPxButton ID="ASPExport" runat="server" Text="Export Detail  Excel" OnClick="ASPExport_Click" Image-Url="~/Content/Images/excel.png">
                </dx:ASPxButton>

                <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="dhs" FileName="aro"></dx:ASPxGridViewExporter>
            </td>
            <td>
                <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="ASPxPivotGrid1">
                </dx:ASPxPivotGridExporter>
                <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" Image-Url="~/Content/Images/excel.png" UseSubmitBehavior="False" OnClick="btnXlsxExport_Click" Width="165px" />
            </td>

            <td>&nbsp;</td>

            <td>&nbsp;</td>
        </tr>
    </table>
    
       <dx:ASPxPivotGrid ID="ASPxPivotGrid1"  runat="server" ClientIDMode="AutoID">
           <Fields>
               <dx:PivotGridField ID="CKUNNR" FieldName="KUNNR" Area="RowArea" Caption="Mã NPP" AreaIndex="1"> </dx:PivotGridField>
<dx:PivotGridField ID="CNAME1" FieldName="NAME1" Area="RowArea" Caption="Tên NPP" AreaIndex="2"> </dx:PivotGridField>
<dx:PivotGridField ID="CVBELN" FieldName="VBELN" Area="RowArea" Caption="SAP order" AreaIndex="5"> </dx:PivotGridField>
<dx:PivotGridField ID="CFKDAT" FieldName="FKDAT" Area="RowArea" Caption="Ngày xử lý" AreaIndex="6" TotalsVisibility="None"> </dx:PivotGridField>
<dx:PivotGridField ID="CMATNR" FieldName="MATNR" Caption="Mã SP" AreaIndex="2"> </dx:PivotGridField>
<dx:PivotGridField ID="CARKTX" FieldName="ARKTX" Caption="Tên SP" AreaIndex="3"> </dx:PivotGridField>
<dx:PivotGridField ID="CSPART" FieldName="SPART" Caption="Nhóm" AreaIndex="4"> </dx:PivotGridField>
 <dx:PivotGridField ID="CdDAT" FieldName="dDAT" Caption="Ngày đặt" AreaIndex="4" Area="RowArea" TotalsVisibility="None"> </dx:PivotGridField> 
<dx:PivotGridField ID="CQTY" FieldName="QTY"   Caption="Số lượng"  RunningTotal="True"    SortMode="Value"    Area="DataArea"    SummaryDisplayType="Default"    CellFormat-FormatType="Custom"    CellFormat-FormatString ="#,###"    GrandTotalCellFormat-FormatType="Custom"    GrandTotalCellFormat-FormatString="#,###" AreaIndex="3"    >   </dx:PivotGridField>
<dx:PivotGridField ID="CP_RBP" FieldName="P_RBP"   Caption="Giá RBP"  RunningTotal="True"    SortMode="Value"    SummaryDisplayType="Default"    CellFormat-FormatType="Custom"    CellFormat-FormatString ="#,###"    GrandTotalCellFormat-FormatType="Custom"    GrandTotalCellFormat-FormatString="#,###" AreaIndex="5"    >   </dx:PivotGridField>
<dx:PivotGridField ID="CNET_PRICE" FieldName="NET_PRICE"   Caption="Giá NET"  RunningTotal="True"    SortMode="Value"    SummaryDisplayType="Default"    CellFormat-FormatType="Custom"    CellFormat-FormatString ="#,###"    GrandTotalCellFormat-FormatType="Custom"    GrandTotalCellFormat-FormatString="#,###" AreaIndex="6"    >   </dx:PivotGridField>
<dx:PivotGridField ID="CN_CUST" FieldName="N_CUST"   Caption="Tiền NET"  RunningTotal="True"    SortMode="Value"    Area="DataArea"    SummaryDisplayType="Default"    CellFormat-FormatType="Custom"    CellFormat-FormatString ="#,###"    GrandTotalCellFormat-FormatType="Custom"    GrandTotalCellFormat-FormatString="#,###" AreaIndex="6"    >   </dx:PivotGridField>
<%--<dx:PivotGridField ID="CAUART" FieldName="AUART"    SummaryDisplayType="Default" AreaIndex="0"    >   </dx:PivotGridField>--%>
<dx:PivotGridField ID="CREASON" FieldName="Types" Caption="Lý do" AreaIndex="7"> </dx:PivotGridField>
<%--<dx:PivotGridField ID="CSD_DOC" FieldName="SD_DOC" Caption="" AreaIndex="10"> </dx:PivotGridField>--%>
<dx:PivotGridField ID="CPURCH_NO" FieldName="PURCH_NO" Area="RowArea" Caption="Đơn đặt hàng" AreaIndex="3"> </dx:PivotGridField>
<dx:PivotGridField ID="CA_RBP" FieldName="A_RBP"   Caption="Tiền RBP"    Area="DataArea"     SummaryDisplayType="Default"    CellFormat-FormatType="Custom"    CellFormat-FormatString ="#,###"    GrandTotalCellFormat-FormatType="Custom"    GrandTotalCellFormat-FormatString="#,###" AreaIndex="4"    >   </dx:PivotGridField>
<dx:PivotGridField ID="Csldat" FieldName="sldat"   Caption="SL Đặt hàng"    Area="DataArea"      SummaryDisplayType="Default"    CellFormat-FormatType="Custom"    CellFormat-FormatString ="#,###"    GrandTotalCellFormat-FormatType="Custom"    GrandTotalCellFormat-FormatString="#,###" AreaIndex="0"    >   </dx:PivotGridField>
<dx:PivotGridField ID="CType" FieldName="Type" Caption="Loại" AreaIndex="0"> </dx:PivotGridField>
<dx:PivotGridField ID="CFULL" FieldName="FULL"   Caption="Tiền chuyển"    Area="DataArea"    SummaryDisplayType="Default"    CellFormat-FormatType="Custom"    CellFormat-FormatString ="#,###"    GrandTotalCellFormat-FormatType="Custom"    GrandTotalCellFormat-FormatString="#,###"  AreaIndex="5"    >   </dx:PivotGridField>
<dx:PivotGridField ID="CRegion" FieldName="Region" Area="RowArea" Caption="Region" AreaIndex="0"> </dx:PivotGridField>
<dx:PivotGridField ID="CArea" FieldName="Area" Caption="Area" AreaIndex="1"> </dx:PivotGridField>
      <dx:PivotGridField ID="cdRBP"  FieldName ="dRBP" Caption="Tiền đặt RBP"  RunningTotal="True"    SortMode="Value"    SummaryDisplayType="Default"    CellFormat-FormatType="Custom"    CellFormat-FormatString ="#,###"    GrandTotalCellFormat-FormatType="Custom"    GrandTotalCellFormat-FormatString="#,###" AreaIndex="1" Area="DataArea"    >   </dx:PivotGridField>
      <dx:PivotGridField ID="cdFull"  FieldName ="dFull"  Caption="Tiền đặt NET"  RunningTotal="True"    SortMode="Value"    SummaryDisplayType="Default"    CellFormat-FormatType="Custom"    CellFormat-FormatString ="#,###"    GrandTotalCellFormat-FormatType="Custom"    GrandTotalCellFormat-FormatString="#,###" AreaIndex="2" Area="DataArea"    >   </dx:PivotGridField>
          </Fields>
                <OptionsPager RenderMode="Lightweight" RowsPerPage="100">
           </OptionsPager>
    </dx:ASPxPivotGrid>
    
       <dx:ASPxGridView Width="100%" ID="dhs" Visible="False" runat="server" ClientInstanceName="dGrid" KeyFieldName="Ordernr" AutoGenerateColumns="False" >
   <Settings ShowGroupPanel="True" ShowFooter="True"  ShowGroupFooter="VisibleIfExpanded" UseFixedTableLayout="True" />
        
            
            <Columns>
             <dx:GridViewDataTextColumn FieldName="KUNNR" Caption= "Mã NPP"  VisibleIndex= "4" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="NAME1" Caption= "Tên NPP"  VisibleIndex= "5" ></dx:GridViewDataTextColumn>
<%--<dx:GridViewDataTextColumn FieldName="POSNR" Caption= "Số"  VisibleIndex= "3" ></dx:GridViewDataTextColumn>--%>
<dx:GridViewDataTextColumn FieldName="VBELN" Caption= "Mã SAP ĐH"  VisibleIndex= "6" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="FKDAT" Caption= "Ngày xử lý"  VisibleIndex= "8" ></dx:GridViewDataTextColumn>
 <dx:GridViewDataTextColumn  FieldName="dDAT" Caption="Ngày đặt" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="MATNR" Caption= "Mã Sản Phẩm"  VisibleIndex= "9" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="ARKTX" Caption= "Tên Sản Phẩm"  VisibleIndex= "10" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="SPART" Caption= "Nhóm sản phẩm"  VisibleIndex= "11" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="CARTON" Caption= "Quy cách"  VisibleIndex= "12" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="QTY" Caption= "Số lượng"  VisibleIndex= "13" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="P_RBP" Caption= "Giá RBP"  VisibleIndex= "14" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="NET_PRICE" Caption= "Giá NET"  VisibleIndex= "16" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="NET_VALE" Caption= "Tiền VAT"  VisibleIndex= "17" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="DISC" Caption= "Tiền Chiết khấu"  VisibleIndex= "21" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="N_CUST" Caption= "Tiền Hóa Đơn"  VisibleIndex= "22" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="STAX" Caption= "Thuế"  VisibleIndex= "23" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="sldat" Caption= "Số lượng đặt"  VisibleIndex= "25" ></dx:GridViewDataTextColumn>
<%--<dx:GridViewDataTextColumn FieldName="AUART" Caption= ""  VisibleIndex= "18" ></dx:GridViewDataTextColumn>--%>
<%--<dx:GridViewDataTextColumn FieldName="REASON" Caption= "Lý do"  VisibleIndex= "19" ></dx:GridViewDataTextColumn>--%>
<%--<dx:GridViewDataTextColumn FieldName="SD_DOC" Caption= ""  VisibleIndex= "20" ></dx:GridViewDataTextColumn>--%>
<dx:GridViewDataTextColumn FieldName="PURCH_NO" Caption= "Số đơn đặt hàng"  VisibleIndex= "7" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Region" Caption= "Khu Vực"  VisibleIndex= "1" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Area" Caption= "Vùng"  VisibleIndex= "2" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="REASON" Caption= "Lý do"  VisibleIndex= "28" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="dRBP" Caption= "Tiền Đặt RBP"  VisibleIndex= "26" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="dFull" Caption= "Tiền Đặt Hóa đơn"  VisibleIndex= "27" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="A_RBP" Caption= "Tiền RBP"  VisibleIndex= "15" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Type" Caption= "Loai"  VisibleIndex= "29" ></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="FULL" Caption= "Tiền Chuyển"  VisibleIndex= "24" ></dx:GridViewDataTextColumn>

            </Columns> 
            <SettingsBehavior AutoExpandAllGroups="True" />
            <SettingsPager PageSize="50">
            </SettingsPager>
            <Settings ShowFilterRowMenuLikeItem="True" ShowFooter="True" ShowFilterRow="True" ShowGroupPanel="True" />
        </dx:ASPxGridView>

</asp:Content>
