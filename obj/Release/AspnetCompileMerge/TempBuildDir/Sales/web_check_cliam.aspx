<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="web_check_cliam.aspx.vb" Inherits="WEB.SSM.web_check_cliam" %>
 <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div>
        <h4>Cliam Chi tiết của nhà phân phối</h4> 
        <hr />
        <table style="width: 100%"  frame="below" >
            <tr>
                
                <td style="width: 115px"> <a style="text-align: right"> Từ Ngày</a></td>
                <td  Width= "100px"> <dx:ASPxDateEdit ID="datest" runat="server" Width= "100px"  Height ="100%" >
                    </dx:ASPxDateEdit></td>
                <td style="text-align: right; width: 122px;"> <a>Đến Ngày </a></td>
                <td  Width= "100px">
                    <dx:ASPxDateEdit ID="dateen" runat="server" AutoPostBack ="true" Width= "100px" Height ="100%"  >
                        <ButtonStyle>
                            <Paddings PaddingLeft="1px" />
                        </ButtonStyle>
                    </dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxButton ID="Btok" runat="server" Text="OK" Width="63px">
                    </dx:ASPxButton>
                </td>
                  <td>
                    <dx:ASPxButton ID="Btchay" runat="server" Text="Tính Claim" Width="63px">
                    </dx:ASPxButton>
                </td>
                <td>  
                    <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="SqlDataSource2" AutoPostBack ="true" TextField="Debcode" ValueField="Debcode" Height="16px" Width="300px" 
      DropDownStyle="DropDownList"  ValueType="System.String" TextFormatString="{0} ({1}) "
                IncrementalFilteringMode="Contains" >
                      
                        <Columns>
                            <dx:ListBoxColumn FieldName="Debcode" Width ="100px" />
                            <dx:ListBoxColumn FieldName="Debname" Width ="300px" />
                        </Columns>
                    </dx:ASPxComboBox>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT [Debcode], [Debname] FROM dbo.Fn_cust(@unam) AS Fn_cust_1">
                         <SelectParameters>
            <asp:SessionParameter Name="unam" SessionField="TenDangNhap" />
        </SelectParameters>
                    </asp:SqlDataSource>
            
 </td>
       
        <td>     
                 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1" FileName="Du lieu goc" ></dx:ASPxGridViewExporter>
        <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False" OnClick="btnXlsxExport_Click" Width="165px" />

                </td>
            <%--     <td>     
                
        <dx:ASPxButton ID="export" runat="server" Text="Export " UseSubmitBehavior="False" OnClick="export_Click" Width="165px" />

                </td>--%>
         <%--   <td>     
                 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1" FileName="Du lieu goc" ></dx:ASPxGridViewExporter>
        <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False" OnClick="btnXlsxExport_Click" Width="165px" />
                </td>--%>
            </tr>
        </table>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="WebchekCliam" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="datest" Name="TuNgay" PropertyName="Value" Type="DateTime" />
                <asp:ControlParameter ControlID="dateen" Name="DenNgay" PropertyName="Value" Type="DateTime" />
                <asp:ControlParameter ControlID="ASPxComboBox1" Name="MaNPP" PropertyName="Value" Type="String" />

            </SelectParameters>
        </asp:SqlDataSource>

        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Font-Size="X-Small" Font-Strikeout="False"  Width="100%" >
           <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="#,###" ShowInColumn="Doanh Số" ShowInGroupFooterColumn="Doanh Số" SummaryType="Sum" FieldName="doanhso" />
                <dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="khuyenmai" ShowInColumn="Khuyễn Mãi NPP" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="#,###" ShowInColumn="Thành tiền" SummaryType="Sum" ValueDisplayFormat="#,###" FieldName="thanhtien" />
                 <dx:ASPxSummaryItem DisplayFormat="#,###" ShowInColumn="Tiền KMOK" SummaryType="Sum" ValueDisplayFormat="#,###" FieldName="TienKMok" />
                
            </TotalSummary> 
          <%--  <GroupSummary>
                <dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="Thanhtien" ShowInGroupFooterColumn="Ma KH" SummaryType="Sum" />
                <dx:ASPxSummaryItem ShowInColumn="Ma NV" ShowInGroupFooterColumn="Ma NV" SummaryType="Sum" FieldName="Thanhtien" />
            </GroupSummary>--%>
            <Columns>
              
             
               
                <dx:GridViewDataTextColumn FieldName="maxk" VisibleIndex="2" Caption="Mã XK">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="mact" VisibleIndex="3" Caption="CTKM">
                </dx:GridViewDataTextColumn>
                 
                <dx:GridViewDataDateColumn FieldName="ngay" VisibleIndex="6" Caption="Ngày">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="loaict" VisibleIndex="7" Caption="Loại CT">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TyleCK" VisibleIndex="8" Caption="Tỷ lệ">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="masp" VisibleIndex="9" Caption="Mã SP">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Itemname" VisibleIndex="10" Caption="Tên SP">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Brand" VisibleIndex="11"  Caption="Brand">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="mui" VisibleIndex="12" Caption="Mùi Hương">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Nhan" VisibleIndex="13" Caption ="Nhóm hàng">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="soluong" VisibleIndex="14" Caption="Số Lượng">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="price" VisibleIndex="15" Caption="Đơn giá">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="thanhtien" VisibleIndex="16" Caption="Thành Tiền">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="khuyenmai" VisibleIndex="17" Caption="Khuyễn Mãi NPP">
                </dx:GridViewDataTextColumn>
               <%-- <dx:GridViewDataTextColumn FieldName="slthamchieu" VisibleIndex="18">
                </dx:GridViewDataTextColumn>--%>
                <dx:GridViewDataTextColumn FieldName="slthamchieu" VisibleIndex="18" Caption="Số lượng tham chiếu" >
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="loai" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mact_KT" VisibleIndex="20"  Caption="CTKM Audit"> 
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="doanhso" VisibleIndex="21" Caption="Doanh Số">
                </dx:GridViewDataTextColumn>
                
                <dx:GridViewDataTextColumn FieldName="slquydoi" VisibleIndex="26" Caption="Quy đổi">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="KMOK" VisibleIndex="27" Caption="SlKM Ok">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Lydo" VisibleIndex="29">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TienKMok"   VisibleIndex="28" Caption="Tiền KMOK">
                </dx:GridViewDataTextColumn>
               
            </Columns>
            <SettingsBehavior ColumnResizeMode="NextColumn" />
            <SettingsPager PageSize="100">
            </SettingsPager>
            <Settings ShowGroupPanel="True" ShowFilterBar="Auto" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" ShowFooter="True" ShowGroupedColumns="True" ShowGroupFooter="VisibleIfExpanded" ShowFilterRow="True" />
            <SettingsLoadingPanel Text="Vui Lòng Chờ&amp;hellip;" />
        </dx:ASPxGridView>

        </div>
     </asp:Content>