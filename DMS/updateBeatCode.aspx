<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="updateBeatCode.aspx.vb" Inherits="WEB.SSM.updateBeatCode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <table style="width: 100%"  frame="below" >
         <tr>
             <td style="width: 284px">   <asp:FileUpload ID="FileUpload3" runat="server" /> </td>
                  <td style="width: 107px">
                    
                    <dx:ASPxButton ID="Btok" runat="server" Text="OK">
                    </dx:ASPxButton>
                </td>
             <td>
                 <dx:ASPxComboBox  ID="Loai" runat="server" Width="100%">
                     <Border BorderStyle="None" />
                     <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />
                     <Items>
                         <dx:ListEditItem Text="beat_format" Value="1" />
                         <dx:ListEditItem Text="beat schedule " Value="2" />
                         <dx:ListEditItem Text="beat_retailer_mapping" Value="3" />


                     </Items>

                 </dx:ASPxComboBox>
             </td>
                <td>   <dx:ASPxButton ID="btupdload" runat="server" Text="Upload to server" Width="135px" Enabled="False">
                    </dx:ASPxButton></td>
         </tr>
            <tr>
               
                <td style="width: 284px">
                    <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="100px"  > </dx:ASPxTextBox> 
                      
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


        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="true"     Settings-ShowFilterBar="Auto" Settings-ShowFilterRow="True" Settings-ShowFooter="True" SettingsPager-PageSize="100">
           
             

            <Settings ShowFilterRow="True" ShowFilterRowMenuLikeItem="True" ShowFooter="True" ShowGroupPanel="True" />
            <SettingsCookies Enabled="True" />
        </dx:ASPxGridView>
         

       
         

    </div>
</asp:Content>
