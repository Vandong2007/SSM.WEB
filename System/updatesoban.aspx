<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="updatesoban.aspx.vb" Inherits="WEB.SSM.updatesoban" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <table style="width: 100%"  frame="below" >
         <tr>
             <td style="width: 284px">   <asp:FileUpload ID="FileUpload3" runat="server" /> </td>
                  <td style="width: 107px">
                    
                    <dx:ASPxButton ID="Btok" runat="server" Text="OK">
                    </dx:ASPxButton>
                </td>
                <td>   <dx:ASPxButton ID="btupdload" runat="server" Text="Upload to server" Width="135px" Enabled="False">
                    </dx:ASPxButton></td>
         </tr>
            <tr>
               
                <td style="width: 284px">
                    <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="100px" Enabled="False"> </dx:ASPxTextBox> 
                      
                </td>
                <td style="width: 107px"> <a style="text-align: right"> Ngày Bắt Đầu</a>
                </td>
                
                <td style="width: 76px"> <dx:ASPxDateEdit ID="datest" runat="server" Width= "100px"  Height ="100%" Date="10/14/2014" Enabled="False">
                    </dx:ASPxDateEdit></td>
                <td Width= "200px" style="text-align: right"> <a> Ngày Kết Thúc</a></td>
                <td  Width= "100px">
                    <dx:ASPxDateEdit ID="dateen" runat="server" Width= "100px" Height ="100%" Date="10/14/2014" Enabled="False">
                        <ButtonStyle>
                            <Paddings PaddingLeft="1px" />
                        </ButtonStyle>
                    </dx:ASPxDateEdit>
                </td>
              
              
            </tr>
        </table>
    <div>


        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"   KeyFieldName="Id"   Settings-ShowFilterBar="Auto" Settings-ShowFilterRow="True" Settings-ShowFooter="True" SettingsPager-PageSize="100">
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="Thanhtien" ShowInColumn="Thanhtien" ShowInGroupFooterColumn="Ma XK" SummaryType="Sum" ValueDisplayFormat="#,###" />
                <dx:ASPxSummaryItem FieldName="Khuyenmai" SummaryType="Sum" ValueDisplayFormat="#,###" />
                  <dx:ASPxSummaryItem FieldName="MANPP" SummaryType="Custom" ShowInColumn="Ma NPP" />
                <dx:ASPxSummaryItem FieldName="Ngay" ShowInColumn="Ngay" SummaryType="Custom" ValueDisplayFormat=" " />
            </TotalSummary>
            <GroupSummary>
                 <dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="Thanhtien" ShowInColumn="Thanhtien" ShowInGroupFooterColumn="Ma XK" SummaryType="Sum" ValueDisplayFormat="#,###" />
                <%--<dx:ASPxSummaryItem FieldName="Khuyenmai" ShowInGroupFooterColumn="Ma XK"  SummaryType="Sum" ValueDisplayFormat="#,###" />--%>
            </GroupSummary>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MaNPP" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MaXK" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Ngay" VisibleIndex="3">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="MaNV" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MaKH" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Type" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MaSP" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Soluong" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Dongia" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TyleCK" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Khuyenmai" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TienCK" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Thanhtien" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Loai" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MaCT" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="USERs" VisibleIndex="16" Visible ="false">
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="dates" VisibleIndex="17" Visible ="false">
                </dx:GridViewDataTextColumn>
                
                       
            </Columns>

<SettingsPager PageSize="100"></SettingsPager>

            <Settings ShowFilterRow="True" ShowFilterRowMenuLikeItem="True" ShowFooter="True" ShowGroupPanel="True" />
            <SettingsCookies Enabled="True" />
        </dx:ASPxGridView>
         

       
         

    </div>
</asp:Content>
