    <%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="Ket_qua_claim.aspx.vb" Inherits="WEB.SSM.Ket_qua_claim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
<table style="width: 100%" frame="below">
                                            <tr>
                                                <td colspan="6">
                                                   Kết quả chương trình khuyến mãi</td>
                                                
                                            </tr>
                                            <tr>
                                           
                                                    
                <td style="width: 150px"> <dx:ASPxDateEdit ID="datest"  runat="server" Width= "100%"  Height ="100%">
                    </dx:ASPxDateEdit></td>
   <%--             <td Width= "200px" style="text-align: right"> <a> Ngày Kết Thúc</a></td>--%>
                <td style="width: 150px">
                    <dx:ASPxDateEdit ID="dateen"   runat="server" Width= "100%" Height ="100%" AutoPostBack="True">
                        <ButtonStyle>
                            <Paddings PaddingLeft="1px" />
                        </ButtonStyle>
                    </dx:ASPxDateEdit>
                </td>
                                                <td style="border-style: solid; border-width: 0.5px; width: 96px;">
                                                    <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Chi tiết NPP"  >
                                                    <ClientSideEvents Click="function(s, e) { pcCreateAccount1.Show(); }" />
                   <Image Url="~/Content/Images/document_new.png">
                    </Image>
                                                   </dx:ASPxButton>
                                                </td>
                                              
                                                <td style="border-style: solid; border-width: 0.5px; width: 96px;">
                                                    <dx:ASPxButton ID="Bt_dieuChinh" runat="server" Text="Export" UseSubmitBehavior="False" />
                                                </td>
                                                <td style="border-style: solid; border-width: 0.5px">
                                                    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Upload Kết quả"   />
                                                </td>
                                            </tr>
                                        </table>
    <dx:aspxGridView ID="GridView11" runat="server" KeyFieldName ="manpp" DataSourceID="SqlDataSource1"  >
        <Columns>
            <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="manpp"  Caption="Mã NPP" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Debname"  Caption="Tên NPP" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Region"  Caption="Khu Vực" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Tienauto"  Caption="Auto Claim" VisibleIndex="5" ReadOnly="True">
                   <PropertiesTextEdit DisplayFormatString="#,###">
                 </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TienNPp"  Caption="NPP CLaim" VisibleIndex="4" ReadOnly="True">
                   <PropertiesTextEdit DisplayFormatString="#,###">
                 </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TienDS"  Caption="Doanh Số" ReadOnly="True" VisibleIndex="7">
                   <PropertiesTextEdit DisplayFormatString="#,###">
                 </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TienCTKM"  Caption="Tiền CTKM " ReadOnly="True" Visible="false"   VisibleIndex="8">
                   <PropertiesTextEdit DisplayFormatString="#,###">
                 </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="tienTT"  Caption="Thực Tế CLaim" ReadOnly="True" VisibleIndex="6">
                   <PropertiesTextEdit DisplayFormatString="#,###">
                 </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
   
        </Columns>
        <Settings ShowFilterRow="True" />
   
           
        </dx:aspxGridView>
 
       
      
        <br />
    <br />
  
       
      
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSM2014ConnectionString %>" SelectCommand="Webketquaclaim" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="datest" Name="TuNgay" PropertyName="Value" Type="DateTime" />
                <asp:ControlParameter ControlID="dateen" Name="DenNgay" PropertyName="Value" Type="DateTime" />
 
                          <asp:SessionParameter Name="Username" SessionField="TenDangNhap" />
            </SelectParameters>
    </asp:SqlDataSource>
     
</asp:Content>
