<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Light.master" CodeBehind="Donhang_chitiet.aspx.vb" Inherits="WEB.SSM.Donhang_chitiet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div  style="float:initial; width: 95%; " align="center">
        <h3>Thông tin đơn đặt hàng</h3>
     
        <table  width="100%" >
            <tr>
                <td style="height: 23px; width: 150px"  >Ngày đặt:</td>
                <td style="height: 23px; width: 410px"  >
                     <dx:ASPxLabel runat="server" ID="dateS" />
                </td>
                <td  ></td>
                <td  >&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 150px; height: 51px;"  >Nhà phân phối</td>
                <td style="width: 410px; height: 51px;"  >
               <h4>  <asp:Label  runat="server" ID="manpp" /></h4> 

 <h4>      <dx:ASPxLabel ID="tennpp" runat="server" ClientInstanceName="ValueLabel" /></h4>

                </td>
                <td style="height: 51px"  >
                     
                </td>
               
                <td style="width: 50px"  align="right" > <dx:ASPxButton ID="ASPExport" runat="server" Text="Export Excel" Height="60%" Width="60%">
                    <Image Url="~/Content/Images/excel.png">
                    </Image>
                  
                </dx:ASPxButton>
 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="dhs" FileName="Don_hang"></dx:ASPxGridViewExporter></td>
            
            </tr>
            

        </table>
        <dx:ASPxGridView Width="100%" ID="dhs" runat="server" ClientInstanceName="dGrid" KeyFieldName="MATNR"   AutoGenerateColumns="False">
   <Settings ShowGroupPanel="True" ShowFooter="True"  ShowGroupFooter="VisibleIfExpanded" UseFixedTableLayout="True" />
            <TotalSummary>
                
                <dx:ASPxSummaryItem DisplayFormat="Tổng Slượng:###,#" FieldName="QTY" ShowInColumn="QTY" ValueDisplayFormat="###,#" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Tổng tiền RBP: ###,#" FieldName="A_RBP"  ShowInColumn="N_CUST"  SummaryType="Sum"   ValueDisplayFormat="###,#" />
             
                 <dx:ASPxSummaryItem DisplayFormat="Tổng tiền NET: ###,#" FieldName="N_CUST" ShowInColumn="N_CUST" ShowInGroupFooterColumn="N_CUST" ValueDisplayFormat="###,#" SummaryType="Sum" />
              <dx:ASPxSummaryItem DisplayFormat="Tiền thuế: ###,#" FieldName="STAX" ShowInColumn="N_CUST" ShowInGroupFooterColumn="N_CUST" ValueDisplayFormat="###,#" SummaryType="Sum" />
                  <dx:ASPxSummaryItem DisplayFormat="Chiết khấu: ###,#" FieldName="DISC"  ShowInColumn="N_CUST" ValueDisplayFormat="###,#" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Tiền Chuyển: ###,#" FieldName="FULL" ShowInColumn="N_CUST" ShowInGroupFooterColumn="N_CUST" ValueDisplayFormat="###,#" SummaryType="Sum" />
         
                <dx:ASPxSummaryItem DisplayFormat="Tổng tiền RBP: ###,#" FieldName="dRBP" ShowInColumn="sldat"  SummaryType="Sum"   ValueDisplayFormat="###,#" />
             
                 <dx:ASPxSummaryItem DisplayFormat="Tổng tiền NET:###,#" FieldName="dFull"  ShowInColumn="sldat" ValueDisplayFormat="###,#" SummaryType="Sum" />
            
            
            </TotalSummary>
           
            
            <GroupSummary>
                
                 <dx:ASPxSummaryItem DisplayFormat="Tiền RBP:: ###,#" FieldName="A_RBP" ShowInGroupFooterColumn="N_CUST"  SummaryType="Sum"   ValueDisplayFormat="###,#" />
             
                <dx:ASPxSummaryItem DisplayFormat="Tiền Net: ###,#" FieldName="N_CUST" ShowInGroupFooterColumn="N_CUST"  SummaryType="Sum"   ValueDisplayFormat="###,#" />
              <dx:ASPxSummaryItem DisplayFormat="Thuế: ###,#" FieldName="STAX"  ShowInGroupFooterColumn="N_CUST" ValueDisplayFormat="###,#" SummaryType="Sum" />
              <dx:ASPxSummaryItem DisplayFormat="Chiết khấu: #,###;Chiết khấu: -#,###"  FieldName="DISC"  ShowInGroupFooterColumn="N_CUST" ValueDisplayFormat="###,#" SummaryType="Sum" />
              
                 <dx:ASPxSummaryItem DisplayFormat="Tiền Chuyển:###,#" FieldName="FULL"  ShowInGroupFooterColumn="N_CUST" ValueDisplayFormat="###,#" SummaryType="Sum" />
               <dx:ASPxSummaryItem DisplayFormat="Tiền RBP: ###,#" FieldName="dRBP" ShowInGroupFooterColumn="sldat"  SummaryType="Sum"   ValueDisplayFormat="###,#" />
             
                 <dx:ASPxSummaryItem DisplayFormat="Tiền Net:###,#" FieldName="dFull"  ShowInGroupFooterColumn="sldat" ValueDisplayFormat="###,#" SummaryType="Sum" />
            
                 </GroupSummary>
           
            
            <Columns>
              <dx:GridViewDataTextColumn FieldName="VBELN" Caption="SAP order" VisibleIndex="1" Width="50px" GroupIndex="0" SortIndex="0" SortOrder="Ascending">
                     
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn FieldName="MATNR" Caption="Mã sản phẩm" VisibleIndex="2" Width="50px">
                     
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ARKTX" Caption="Tên sản phẩm" VisibleIndex="3" Width="200px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="P_RBP" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Đơn giá" VisibleIndex="4" Width="50px">
                    <PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                
                      <dx:GridViewDataTextColumn FieldName="sldat" PropertiesTextEdit-DisplayFormatString="###,#" Width="100px" Caption="Số lượng đặt hàng" VisibleIndex="4" >
                    <PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="QTY" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Số lượng (Ok)" VisibleIndex="4" Width="50px">
                    <PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NET_PRICE" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Đơn giá NET" VisibleIndex="6" Width="50px">
                    <PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="N_CUST" Caption="Thành tiền hóa đơn" VisibleIndex="7" Width="100px" PropertiesTextEdit-DisplayFormatString="###,#">
                    <PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                    <CellStyle HorizontalAlign="Right">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="Type" Caption="Trạng thái" VisibleIndex="9" Width="70px">
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="STAX" Visible="false" Caption="Thuế" VisibleIndex="8" Width="50px" PropertiesTextEdit-DisplayFormatString="###,#">
                  
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                  
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="DISC" Visible="false" Caption="Chiết khấu" VisibleIndex="9" Width="50px" PropertiesTextEdit-DisplayFormatString="###,#">
                  
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                  
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="FULL" Visible="false" Caption="Tiền chuyển" VisibleIndex="9" Width="50px" PropertiesTextEdit-DisplayFormatString="###,#">
                  
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                  
                </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="A_RBP" Visible="false" Caption="Tiền RBP" VisibleIndex="10" Width="50px" PropertiesTextEdit-DisplayFormatString="###,#">
                  
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                  
                </dx:GridViewDataTextColumn>
                   <dx:GridViewDataTextColumn FieldName="dFull" Visible="false" Caption="Tiền Đặt N" VisibleIndex="10" Width="50px" PropertiesTextEdit-DisplayFormatString="###,#">
                  
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                  
                </dx:GridViewDataTextColumn>
                   <dx:GridViewDataTextColumn FieldName="dRBP" Visible="false" Caption="Tiền đặt RBP" VisibleIndex="10"   PropertiesTextEdit-DisplayFormatString="###,#">
                  
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                  
                </dx:GridViewDataTextColumn>
            </Columns>

            <SettingsBehavior AutoExpandAllGroups="True" />
            <SettingsPager PageSize="50">
            </SettingsPager>
            <Settings ShowFilterRowMenuLikeItem="True" ShowFooter="True" ShowFilterRow="True" ShowGroupPanel="True" />
        </dx:ASPxGridView>
            </div>
</asp:Content>
