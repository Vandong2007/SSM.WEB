<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="khachhang.aspx.vb" Inherits="WEB.SSM.khachhang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1" FileName="danh sach san pham"></dx:ASPxGridViewExporter>
        <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False" OnClick="btnXlsxExport_Click" />
    </div>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Debcode" Width="100%" SettingsEditing-Mode="EditForm" SettingsPager-RenderMode="Lightweight" SettingsPager-SEOFriendly="Disabled" Settings-ShowFilterBar="Auto">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Debcode" ReadOnly="True" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Debname" VisibleIndex="2">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Debadd" VisibleIndex="3">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Olddebcode" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Channel" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
           <dx:GridViewDataComboBoxColumn FieldName="Region" VisibleIndex="6">
            <PropertiesComboBox DataSourceID="SqlDataSource2" TextField="Region" ValueField="Region">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="Subregion" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Sdf" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
         <dx:GridViewDataComboBoxColumn FieldName="Area" VisibleIndex="9">
              <PropertiesComboBox  DataSourceID ="SqlDataSource3" TextField="Area" ValueField="Area" >
                    </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="Province" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Territory" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Activer" VisibleIndex="12">
            </dx:GridViewDataCheckColumn>
        </Columns>
       
        <SettingsPager RenderMode="Lightweight"></SettingsPager>

        <SettingsEditing Mode="EditForm"></SettingsEditing>

        <Settings ShowFilterRow="true" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT tbCustomer.Debcode, tbCustomer.Debname, tbCustomer.Debadd, tbCustomer.Classid, tbCustomer.Channel, tbCustomer.Region, tbCustomer.Subregion, tbCustomer.Sdf, tbCustomer.Area, tbCustomer.Province, tbCustomer.Territory, tbCustomer.Activer, tbCustomer.Olddebcode FROM tbCustomer INNER JOIN dbo.Fn_cust1( @use ) AS Fn_cust1_1 ON tbCustomer.Debcode = Fn_cust1_1.Debcode" DeleteCommand="DELETE FROM [tbCustomer] WHERE [Debcode] = @original_Debcode" InsertCommand="INSERT INTO [tbCustomer] ([Debcode], [Debname], [Debadd], [Classid], [Channel], [Region], [Subregion], [Sdf], [Area], [Province], [Territory], [Activer], [Lastchange], [datechange], [Olddebcode]) VALUES (@Debcode, @Debname, @Debadd, @Classid, @Channel, @Region, @Subregion, @Sdf, @Area, @Province, @Territory, @Activer,@use, = Getdate() )" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [tbCustomer] SET [Debname] = @Debname, [Debadd] = @Debadd, [Classid] = @Classid, [Channel] = @Channel, [Region] = @Region, [Subregion] = @Subregion, [Sdf] = @Sdf, [Area] = @Area, [Province] = @Province, [Territory] = @Territory, [Activer] = @Activer, [Lastchange] = @use, [datechange] = Getdate()    WHERE [Debcode] = @original_Debcode

  if EXISTS(SELECT a.* from [UZA]...tbKhachhangActive a inner join  [tbCustomer]   b  on b.[Debcode] collate SQL_Latin1_General_CP1_CI_AS = a.Debcode where b.[Debcode] = @original_Debcode )
 begin
 

EXEC	@return_value = [dbo].[at]
		@de =@original_Debcode end ">
        <DeleteParameters>
            <asp:Parameter Name="original_Debcode" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Debcode" Type="String" />
            <asp:Parameter Name="Debname" Type="String" />
            <asp:Parameter Name="Debadd" Type="String" />
            <asp:Parameter Name="Classid" Type="String" />
            <asp:Parameter Name="Channel" Type="String" />
            <asp:Parameter Name="Region" Type="String" />
            <asp:Parameter Name="Subregion" Type="String" />
            <asp:Parameter Name="Sdf" Type="String" />
            <asp:Parameter Name="Area" Type="String" />
            <asp:Parameter Name="Province" Type="String" />
            <asp:Parameter Name="Territory" Type="String" />
            <asp:Parameter Name="Activer" Type="Boolean" />
            <asp:Parameter Name="use" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="use" SessionField="TenDangNhap" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Debname" Type="String" />
            <asp:Parameter Name="Debadd" Type="String" />
            <asp:Parameter Name="Classid" Type="String" />
            <asp:Parameter Name="Channel" Type="String" />
            <asp:Parameter Name="Region" Type="String" />
            <asp:Parameter Name="Subregion" Type="String" />
            <asp:Parameter Name="Sdf" Type="String" />
            <asp:Parameter Name="Area" Type="String" />
            <asp:Parameter Name="Province" Type="String" />
            <asp:Parameter Name="Territory" Type="String" />
            <asp:Parameter Name="Activer" Type="Boolean" />
            <asp:Parameter Name="use" />
            <asp:Parameter Name="original_Debcode" Type="String" />
            <asp:Parameter Name="return_value" />
            <asp:Parameter Name="de" />
        </UpdateParameters>

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT region FROM [tbCustomer] group by region "></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT Area FROM tbCustomer   GROUP BY Area"></asp:SqlDataSource>
</asp:Content>
