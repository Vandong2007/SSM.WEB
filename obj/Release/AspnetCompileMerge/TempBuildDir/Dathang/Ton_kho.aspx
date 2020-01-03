<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="Ton_kho.aspx.vb" Inherits="WEB.SSM.Ton_kho" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 300px" frame="below">
         <tr>
                                                <td colspan="3">
                                                    Danh sách tồn kho </td>
                                                
                                            </tr>
                                            <tr  style="width: 100px">
                                           
                                                    
                <td>   <dx:ASPxComboBox runat="server" ID="Kho"  ValueField="sdf" TextFormatString=" {1} "   Width="150px" SelectedIndex="0"  
                                            DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith"  DataSourceID="SqlDataSource3" ClientInstanceName="cmbCity" AutoPostBack="True"  >
                                           
                                            <Columns>
                                                <dx:ListBoxColumn Caption="Kho" FieldName="sdf" />
                                                <dx:ListBoxColumn Caption="Tên Kho" FieldName="Diengiai" />
                                            </Columns>
                                       
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SSM2014ConnectionString %>" SelectCommand="select a.sdf , b.Diengiai   from [dbo].[Fn_cust_dh](@uname) a
inner join [dbo].[tb_khohang] b on a.sdf=b.kho
 
group by sdf, b.Diengiai">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="uname" SessionField="TenDangNhap" />
                                               
                                            </SelectParameters>
                                        </asp:SqlDataSource></td>
   <%--             <td Width= "200px" style="text-align: right"> <a> Ngày Kết Thúc</a></td>--%>
                <td style="width: 64px">
                                                    <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Xem"  >
                                                
                                                   </dx:ASPxButton>
                                                </td>
                                                <td style="border-style: solid; border-width: 0.5px; width: 96px;">
                                                    <dx:ASPxButton ID="ASPExport" runat="server" Text="Export Excel">
                    <Image Url="~/Content/Images/excel.png">
                    </Image>
                  
                </dx:ASPxButton>
 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="grid" FileName="Tonkho"></dx:ASPxGridViewExporter>
</td>
                                              
                                            </tr>
                                        </table>
    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Itemcode" Width ="100%" SettingsPager-PageSize="100">
        
                                     
        <Columns>
         
            <dx:GridViewDataTextColumn FieldName="Itemcode" ReadOnly="True" Visible ="false"  VisibleIndex="11" Caption="Mã Sản phẩm" Width="50px">
            <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="Itemname" VisibleIndex="2" Caption="Tên sản phẩm" Width="300px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Nhãn SP" FieldName="Brand"  PropertiesComboBox-DataSourceID="SqlDataSource4" PropertiesComboBox-ValueField="Brand"  PropertiesComboBox-DropDownStyle="DropDownList" PropertiesComboBox-ValueType="System.String" PropertiesComboBox-TextFormatString="{0}"
                                                    PropertiesComboBox-IncrementalFilteringMode="Contains"  VisibleIndex="3" Width="50px">
                <PropertiesComboBox DataSourceID="SqlDataSource4">
                    <Columns>
                       <dx:ListBoxColumn FieldName="Brand" />
                    </Columns>
                  
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="Category" VisibleIndex="4" Caption="Nhóm hàng">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Thung" VisibleIndex="5" Caption="Quy cách">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Price" VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Giá RBP">
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Volumn" VisibleIndex="6" Caption="Volumn">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="OldItemcode" VisibleIndex="0" Caption="SAP code" Width="50px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Storage" VisibleIndex="1"  Caption="Kho Hàng">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ton" VisibleIndex="8" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Tồn kho còn">
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="dh" VisibleIndex="9" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Đã đặt hàng">
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Ngày cập nhật" FieldName="datestock" VisibleIndex="11" Width="50px">
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy ">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Stock" VisibleIndex="10"  PropertiesTextEdit-DisplayFormatString="###,#" Caption="Tồn thực tế">
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>

        </Columns>

<SettingsPager PageSize="100"></SettingsPager>

        <Settings ShowFilterRow="True"   ShowFilterRowMenuLikeItem="True" />
                              
     </dx:ASPxGridView>

    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSM2014ConnectionString %>" SelectCommand= "SELECT *  , Available - dh as  ton  from vw_stock  WHERE   Storage=@store  "> 
        <SelectParameters>
            <asp:ControlParameter ControlID="Kho" Name="store" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
 <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SSM2014ConnectionString %>" SelectCommand="SELECT Brand FROM [tbItems] WHERE ([Brand] IS not NULL) and type='Y' group by Brand">
    </asp:SqlDataSource>
</asp:Content>
