<%@ Page Title="Dữ liệu góc nhà phân phối" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="dulieuall.aspx.vb" Inherits="WEB.SSM.dulieuall" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h4>Dữ liệu xuất bán nhà phân phối</h4> 
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
                    <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="SqlDataSource2" AutoPostBack ="true" TextField="Debcode" ValueField="Debcode" Height="16px" Width="300px" 
      DropDownStyle="DropDownList"  ValueType="System.String" TextFormatString="{0} ({1}) "
                IncrementalFilteringMode="Contains" >
                      
                        <Columns>
                            <dx:ListBoxColumn FieldName="Debcode" Width ="100px" />
                            <dx:ListBoxColumn FieldName="Debname" Width="300px"/>
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

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="webGetSDDraft" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ASPxComboBox1" Name="MaNPP" PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="datest" Name="TuNgay" PropertyName="Value" Type="DateTime" />
                <asp:ControlParameter ControlID="dateen" Name="DenNgay" PropertyName="Value" Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>

        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Font-Size="X-Small" Font-Strikeout="False" Width="100%">
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="#,###" ShowInColumn="SLKM" ShowInGroupFooterColumn="SLKM" SummaryType="Sum" FieldName="SLKM" />
                <dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="SLHB" ShowInColumn="SLHB" ShowInGroupFooterColumn="SLHB" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="#,###" ShowInColumn="Thanhtien" ShowInGroupFooterColumn="Thanhtien" SummaryType="Sum" ValueDisplayFormat="#,###" FieldName="Thanhtien" />
            </TotalSummary>
            <GroupSummary>
                <dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="Thanhtien" ShowInGroupFooterColumn="Ma KH" SummaryType="Sum" />
                <dx:ASPxSummaryItem ShowInColumn="Ma NV" ShowInGroupFooterColumn="Ma NV" SummaryType="Sum" FieldName="Thanhtien" />
            </GroupSummary>
            <Columns>
                <dx:GridViewDataDateColumn FieldName="Ngay" VisibleIndex="1">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="MaXK" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MaKH" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TenKH" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MaNV" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Hoten" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MaSP" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TenSP" VisibleIndex="8" Width ="200px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NhanSP" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Dongia" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SLHB" ReadOnly="True" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Thanhtien" ReadOnly="True" VisibleIndex="12">
                    <Settings GroupInterval="Value" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SLKM" ReadOnly="True" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Khuyenmai" ReadOnly="True" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TienTU" ReadOnly="True" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MaCT" VisibleIndex="18">
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
