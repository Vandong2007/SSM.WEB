<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="WebXuatAm.aspx.vb" Inherits="WEB.SSM.WebXuatAm" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
            
                <h3>Danh sách đơn hàng bị loại do xuất kho âm</h3>
            <table style="width: 100%" frame="below">
        <tr> <td> <a>NPP</a></td>
            <td style="width: 351px">
               
                <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="SqlMnpp" TextField="Debname" ValueField="Debcode" Width="100%"
                    DropDownStyle="DropDownList" ValueType="System.String" TextFormatString="{0} ({1}) ({2})"
                    IncrementalFilteringMode="Contains">
                    <Columns>
                        <dx:ListBoxColumn FieldName="Debcode" Width="100px" />
                        <dx:ListBoxColumn FieldName="Debname" Width="300px" />
                        <dx:ListBoxColumn FieldName="Debadd" Width="300px" />

                    </Columns>

                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlMnpp" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="Select 'ALL' As Debcode, 'Tat Ca' as Debname, '' As  Debadd
Union all
SELECT Debcode, Debname, Debadd FROM dbo.Fn_cust(@user) AS a ">
                    <SelectParameters>
                        <asp:SessionParameter Name="user" SessionField="TenDangNhap" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </td>
            <td style="width: 199px"><a style="text-align: right">Ngày Bắt Đầu</a></td>
            <td width="100px">
                <dx:ASPxDateEdit ID="datest" runat="server" Width="100px" Height="100%">
                </dx:ASPxDateEdit>
            </td>
            <td width="200px" style="text-align: right"><a>Ngày Kết Thúc</a></td>
            <td width="100px">
                <dx:ASPxDateEdit ID="dateen" AutoPostBack ="true" runat="server" Width="100px" Height="100%">
                    <ButtonStyle>
                        <Paddings PaddingLeft="1px" />
                    </ButtonStyle>
                </dx:ASPxDateEdit>
            </td>
             
            <td>
                <dx:ASPxButton ID="btnupload" runat="server" Text="Trừ kho" UseSubmitBehavior="False" Width="165px" />
            </td>
            <td>
                <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False" Width="165px" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1" FileName="DS_xuatKho_am"></dx:ASPxGridViewExporter>

    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Id">
        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="Thanhtien" ShowInColumn="Thanhtien" SummaryType="Sum" ValueDisplayFormat="#,###" />
            <dx:ASPxSummaryItem DisplayFormat=" #,###" FieldName="Soluong" ShowInColumn="Soluong" ValueDisplayFormat=" #,###" />
        </TotalSummary>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
         
            <dx:GridViewDataTextColumn FieldName="Region" VisibleIndex="1" Caption="Region">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Area" VisibleIndex="1" Caption="Area">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MaNPP" VisibleIndex="1" Caption="Mã nhà phân phối">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Debname" VisibleIndex="2" Caption="Tên phân phối">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MaXK" VisibleIndex="2" Caption="Mã Xuất kho">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Ngay" VisibleIndex="3" Caption="Ngày">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="MaNV" VisibleIndex="4" Caption="Nhân Viên">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MaKH" VisibleIndex="5" Caption="Khách Hàng">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Type" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MaSP" VisibleIndex="7" Caption="Mã SP">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Soluong" VisibleIndex="8" Caption="Số lượng">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Dongia" VisibleIndex="9" Caption="Đơn giá">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TyleCK" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Khuyenmai" VisibleIndex="11" Caption="khuyến mãi">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TienCK" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Thanhtien" VisibleIndex="13" Caption="Thành tiền">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Loai" VisibleIndex="14">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MaCT" VisibleIndex="15" Caption="CT Khuyến mãi">
            </dx:GridViewDataTextColumn>

        </Columns>
        <SettingsPager PageSize="100">
        </SettingsPager>
        <Settings ShowFilterRow="True" ShowFooter="True" />

    </dx:ASPxGridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="IF @MaNPP = 'ALL' SELECT b.Id, b.MaNPP, b.MaXK, b.Ngay, b.MaNV, b.MaKH, b.Type, b.MaSP, b.Soluong, b.Dongia, b.TyleCK, b.Khuyenmai, b.TienCK, b.Thanhtien, b.Loai, b.MaCT, b.USERs, b.dates, a.Debname, a.Region, a.Area FROM SDDoanhso_am AS b INNER JOIN dbo.Fn_cust( @user ) AS a ON b.MaNPP = a.Debcode WHERE (b.Ngay &gt;= @Ngay) AND (b.Ngay &lt;= @Ngay2) ELSE SELECT b.Id, b.MaNPP, b.MaXK, b.Ngay, b.MaNV, b.MaKH, b.Type, b.MaSP, b.Soluong, b.Dongia, b.TyleCK, b.Khuyenmai, b.TienCK, b.Thanhtien, b.Loai, b.MaCT, b.USERs, b.dates, a.Debname, a.Region, a.Area FROM SDDoanhso_am AS b INNER JOIN dbo.Fn_cust( @user ) AS a ON b.MaNPP = a.Debcode WHERE ([MaNPP] = @MaNPP) AND (b.Ngay &gt;= @Ngay) AND (b.Ngay &lt;= @Ngay2)" OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:ControlParameter ControlID="ASPxComboBox1" Name="MaNPP" PropertyName="Value" Type="String" />
            <asp:SessionParameter Name="user" SessionField="TenDangNhap" />
            <asp:ControlParameter ControlID="datest" Name="Ngay" Type="DateTime" />
            <asp:ControlParameter ControlID="dateen" Name="Ngay2" Type="DateTime" />

        </SelectParameters>
    </asp:SqlDataSource>


      





                <br />

     
               


</asp:Content>
