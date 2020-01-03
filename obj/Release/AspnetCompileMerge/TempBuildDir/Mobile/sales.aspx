<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Mobile/mobile.Master" CodeBehind="sales.aspx.vb" Inherits="WEB.SSM.sales" %>

<asp:Content ID="Content" ContentPlaceHolderID="Content" runat="server">


    <table style="width: 100%; border-collapse: initial" cellpadding="0" cellspacing="0">
       
            <tr>
                <tdcolspan="3"><h2>Sale Out</h2></td>
            </tr> 
        <tr>
            <td><a style="text-align: right "><strong>From</strong></a> </td>
            <td>
                <dx:ASPxDateEdit ID="datest" runat="server" Width="100%" Height="40px" Theme="Glass" AutoResizeWithContainer="True" Font-Bold="True" PopupHorizontalAlign="Center">
                 
                </dx:ASPxDateEdit>
            </td>
            <td style="text-align: right; "><a><strong>To</strong></a></td>
            <td >
                <dx:ASPxDateEdit ID="dateen" runat="server" Width="100%" AutoPostBack="true" Height="40px" Theme="DevEx" Font-Bold="True">
                 
                </dx:ASPxDateEdit>
            </td>
            <td>
                <dx:ASPxButton ID="Btok" runat="server" Text="OK" Theme="DevEx" Height="40px" HorizontalAlign="Center">
                </dx:ASPxButton>
            </td>

        </tr>

    </table>
       <hr>
 
    
    <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" DataSourceID="SqlDataSource1" Width="100%">
        <Fields>
            <dx:PivotGridField ID="fieldMaNPP" AreaIndex="0" FieldName="MaNPP">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTenNPP" AreaIndex="1" Caption="Nhà Phân Phối" FieldName="TenNPP">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldRegion" Area="RowArea" AreaIndex="0" Caption="Khu Vực" FieldName="Region">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldArea" Area="RowArea" AreaIndex="1" Caption="Vùng" FieldName="Area">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldNhanSP" AreaIndex="2" Caption="Nhãn Hàng" FieldName="NhanSP">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldThanhtien" Area="DataArea" AreaIndex="0" Caption="Doanh Số" FieldName="Thanhtien" GrandTotalCellFormat-FormatString="#,###" GrandTotalCellFormat-FormatType="Custom" TotalCellFormat-FormatString="#,###" TotalCellFormat-FormatType="Custom" ValueFormat-FormatString="#,###" ValueFormat-FormatType="Custom">
            </dx:PivotGridField>
        </Fields>
    </dx:ASPxPivotGrid>
 
    
    <br />
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="WebGetDoanhso" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="datest" Name="TuNgay" PropertyName="Value" Type="DateTime" />
            <asp:ControlParameter ControlID="dateen" Name="DenNgay" PropertyName="Value" Type="DateTime" />
            <asp:SessionParameter Name="Username" SessionField="TenDangNhap" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
