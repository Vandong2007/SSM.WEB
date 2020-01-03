<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mobile/mobile.Master" CodeBehind="salesIn.aspx.vb" Inherits="WEB.SSM.salesIn" %>

<asp:Content ID="Content" ContentPlaceHolderID="Content" runat="server">


    <table style="width: 100%; border-collapse: initial" cellpadding="0" cellspacing="0">
       
            <tr>
                <td colspan="3"><h2>Sale Out</h2></td>
            </tr> 
        <tr>
            <td><a style="text-align: right "><strong>From</strong></a> </td>
            <td>
                <dx:ASPxDateEdit ID="datest" runat="server" Width="100%" Height="40px" Theme="DevEx" AutoResizeWithContainer="True" Font-Bold="True" PopupHorizontalAlign="Center">
                 
                </dx:ASPxDateEdit>
            </td>
            <td style="text-align: right; "><a><strong>To</strong></a></td>
            <td >
                <dx:ASPxDateEdit ID="dateen" runat="server" Width="100%" AutoPostBack="true" Height="40px" Theme="DevEx" Font-Bold="True">
                 
                </dx:ASPxDateEdit>
            </td>
            <td>
                <dx:ASPxButton ID="Btok" runat="server" Text="OK" Theme="iOS" Height="40px" HorizontalAlign="Center">
                </dx:ASPxButton>
            </td>

        </tr>

    </table>
       <hr/>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="WebGetSaleIn" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="datest" Name="TuNgay" PropertyName="Value" Type="DateTime" />
            <asp:ControlParameter ControlID="dateen" Name="DenNgay" PropertyName="Value" Type="DateTime" />
            <asp:SessionParameter Name="Username" SessionField="TenDangNhap" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
 

     
    <br />
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" Theme="DevEx" Width="100%" KeyFieldName="Region" SummaryText=" ">
       
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Debcode" VisibleIndex="0" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Debname" VisibleIndex="3" Caption="Customer Name">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Region" VisibleIndex="1" GroupIndex="0" SortIndex="0" SortOrder="Ascending">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Area" VisibleIndex="2" PropertiesTextEdit-DisplayFormatString ="#,###" GroupIndex="1" SortIndex="1" SortOrder="Ascending" >
<PropertiesTextEdit DisplayFormatString="#,###"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="RBP" ReadOnly="True" VisibleIndex="4" Caption="Sale In (RBP)">
                <PropertiesTextEdit DisplayFormatString="#,###">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="RBPfree" ReadOnly="True" VisibleIndex="5" Caption="Sale Free (RBP)">
                <PropertiesTextEdit DisplayFormatString="#,###">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="INV" ReadOnly="True" VisibleIndex="6" Caption="Sale in (Invoice)">
                <PropertiesTextEdit DisplayFormatString="#,###">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsPager PageSize="100"  >
        </SettingsPager>
        <Settings ShowGroupPanel="True" ShowFooter="True"  ShowGroupFooter="VisibleIfExpanded" />
         <TotalSummary>
             
            
            <dx:ASPxSummaryItem FieldName="RBP" ShowInColumn="Sale In (RBP)" ShowInGroupFooterColumn="Sale In (RBP)" SummaryType="Sum" ValueDisplayFormat="#,###" DisplayFormat="#,###" />
            <dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="RBPfree" ShowInColumn="Sale Free (RBP)" ShowInGroupFooterColumn="Sale Free (RBP)" SummaryType="Sum" ValueDisplayFormat="#,###" />
            <dx:ASPxSummaryItem DisplayFormat="#,###" FieldName="INV" ShowInColumn="Sale in (Invoice)" ShowInGroupFooterColumn="Sale in (Invoice)" SummaryType="Sum" ValueDisplayFormat="#,###" />
        </TotalSummary>
        <GroupSummary>
            <dx:ASPxSummaryItem DisplayFormat="Inv: #,###;Inv: -#,###" FieldName="INV"   SummaryType="Sum" ValueDisplayFormat="#,###" />
            <dx:ASPxSummaryItem DisplayFormat="Free: #,###;Free: -#,###" FieldName="RBPfree"    SummaryType="Sum" ValueDisplayFormat="#,###" />
            <dx:ASPxSummaryItem DisplayFormat="RBP: #,###;RBP: -#,###" FieldName="RBP"   SummaryType="Sum" ValueDisplayFormat="#,###" />
        </GroupSummary>
    </dx:ASPxGridView>
</asp:Content>