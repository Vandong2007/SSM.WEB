<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="DSKhachhangs.aspx.vb" Inherits="WEB.SSM.DSKhachhangs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div>
         <table>
         <tr>
                 <td>      <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1" FileName="danh sach KH">  </dx:ASPxGridViewExporter>
        <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False" OnClick="btnXlsxExport_Click" Width="165px" />
                </td>
                 <td style="width: 341px">
 
                <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="SqlDataSource2" TextField="Debname" ValueField="Debcode" Height="21px" Width="347px" 
     DropDownStyle="DropDownList"  ValueType="System.String" TextFormatString="{0} ({1}) ({2})"
                IncrementalFilteringMode="Contains" >
                    <Columns>
                        <dx:ListBoxColumn FieldName="Debcode" />
                        <dx:ListBoxColumn FieldName="Debname" />
                        <dx:ListBoxColumn FieldName="Debadd" />

                    </Columns>

                    </dx:ASPxComboBox>
                 </td>
             <td>
                 <dx:ASPxButton ID="ASPxButton1" runat="server" Text="OK"></dx:ASPxButton>
             </td>
             </tr>
         </table>
   </div>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ID" Width="100%" SettingsEditing-Mode="EditForm" SettingsPager-RenderMode="Lightweight" SettingsPager-SEOFriendly="Disabled" Settings-ShowFilterBar="Auto" PreviewFieldName="MaKH">
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0">
            <EditButton Visible="True">
            </EditButton>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="MaNPP"  VisibleIndex="1" ReadOnly="True" >
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="MaKH" VisibleIndex="2" ReadOnly="True" Caption="Mã KH" >
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Tenkh" VisibleIndex="3" Caption="Tên KH" Width="50%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Diachi" VisibleIndex="4" Caption="Địa Chỉ" Width="50%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Phuong" VisibleIndex="5" Caption="Phường">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Quan" VisibleIndex="6" Caption="Quận">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Thanhpho" VisibleIndex="7" Caption="Thành Phố">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Phone" VisibleIndex="8">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Fax" VisibleIndex="9">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataCheckColumn FieldName="Active" VisibleIndex="10">
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataDateColumn FieldName="NgayHD" VisibleIndex="11">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn FieldName="Users" Visible="False" VisibleIndex="12">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="Lastchange" Visible="False" VisibleIndex="13">
        </dx:GridViewDataDateColumn>
          <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="14">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
    </Columns>

<SettingsPager RenderMode="Lightweight" PageSize="20">
    <Summary Text="Trang {0} of {1} ({2} khách hàng)" />
        </SettingsPager>

<SettingsEditing Mode="EditForm"></SettingsEditing>

    <Settings ShowFilterRow ="true"/>
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT * FROM [SDKhachhang] WHERE ([MaNPP] = @MaNPP)" >
    <%--OldValuesParameterFormatString="original_{0}" EnableCaching="True" DeleteCommand="DELETE FROM [SDKhachhang] WHERE [MaNPP] = @original_MaNPP AND [MaKH] = @original_MaKH" InsertCommand="INSERT INTO [SDKhachhang] ([MaNPP], [MaKH], [Tenkh], [Diachi], [Phuong], [Quan], [Thanhpho], [Phone], [Fax], [Active], [NgayHD], [Users], [Lastchange]) VALUES (@MaNPP, @MaKH, @Tenkh, @Diachi, @Phuong, @Quan, @Thanhpho, @Phone, @Fax, @Active, @NgayHD, @Users, @Lastchange)" UpdateCommand="UPDATE [SDKhachhang] SET [Tenkh] = @Tenkh, [Diachi] = @Diachi, [Phuong] = @Phuong, [Quan] = @Quan, [Thanhpho] = @Thanhpho, [Phone] = @Phone, [Fax] = @Fax, [Active] = @Active, [NgayHD] = @NgayHD, [Users] = @Users, [Lastchange] = @Lastchange WHERE [MaNPP] = @original_MaNPP AND [MaKH] = @original_MaKH"--%>
     <%--<FilterParameters>--%>
    <%--<asp:ControlParameter 
         --%>
         <%--<asp:ControlParameter ControlID="ASPxComboBox1" Name="MaNPP"  PropertyName="SelectedValue" Type="String" />--%>
     <%--Name="countryparam" 
     ControlID="DropDownList1" 
     PropertyName="SelectedValue" />--%>
  <%--</FilterParameters>
   
    <DeleteParameters>
        <asp:Parameter Name="original_MaNPP" Type="String" />
        <asp:Parameter Name="original_MaKH" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="MaNPP" Type="String" />
        <asp:Parameter Name="MaKH" Type="String" />
        <asp:Parameter Name="Tenkh" Type="String" />
        <asp:Parameter Name="Diachi" Type="String" />
        <asp:Parameter Name="Phuong" Type="String" />
        <asp:Parameter Name="Quan" Type="String" />
        <asp:Parameter Name="Thanhpho" Type="String" />
        <asp:Parameter Name="Phone" Type="String" />
        <asp:Parameter Name="Fax" Type="String" />
        <asp:Parameter Name="Active" Type="Boolean" />
        <asp:Parameter Name="NgayHD" Type="DateTime" />
        <asp:Parameter Name="Users" Type="String"    />
        <asp:Parameter Name="Lastchange" Type="DateTime" />
    </InsertParameters>--%>
    <SelectParameters>
        <asp:ControlParameter ControlID="ASPxComboBox1" Name="MaNPP" PropertyName="Value" Type="String" />
    </SelectParameters>
   <%--  <UpdateParameters>
         <asp:Parameter Name="Tenkh" Type="String" />
         <asp:Parameter Name="Diachi" Type="String" />
         <asp:Parameter Name="Phuong" Type="String" />
         <asp:Parameter Name="Quan" Type="String" />
         <asp:Parameter Name="Thanhpho" Type="String" />
         <asp:Parameter Name="Phone" Type="String" />
         <asp:Parameter Name="Fax" Type="String" />
         <asp:Parameter Name="Active" Type="Boolean" />
         <asp:Parameter Name="NgayHD" Type="DateTime" />
         <asp:Parameter Name="Users" Type="String"  />
         <asp:Parameter Name="Lastchange" Type="DateTime" />
         <asp:Parameter Name="original_MaNPP" Type="String" />
         <asp:Parameter Name="original_MaKH" Type="String" />
    </UpdateParameters>--%>
   
    </asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT Debcode, Debname, Debadd, Region, Subregion, Area, Province FROM dbo.Fn_cust(@unam) AS Fn_cust_1" >
        <SelectParameters>
            <asp:SessionParameter Name="unam" SessionField="TenDangNhap" />
        </SelectParameters>
    </asp:SqlDataSource>
    

</asp:Content>
