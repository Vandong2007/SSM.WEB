<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="DanhsachNV.aspx.vb" Inherits="WEB.SSM.DanhsachNV" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div>
         <table>
         <tr>
                 <td>      <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1" FileName="Du lieu goc">  </dx:ASPxGridViewExporter>
        <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False" OnClick="btnXlsxExport_Click" Width="165px" />
                </td>
                 <td style="width: 341px">
 
                <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="SqlDataSource2" TextField="Debname" ValueField="Debcode" Height="21px" Width="347px"  DropDownStyle="DropDownList"  ValueType="System.String" TextFormatString="{0} ({1}) ({2})"
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
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ID" Width="100%" SettingsEditing-Mode="EditForm" SettingsPager-RenderMode="Lightweight" SettingsPager-SEOFriendly="Disabled" Settings-ShowFilterBar="Auto">
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0"  >
            <EditButton Visible="True">
            </EditButton>
        <%--    <NewButton Visible="True">
            </NewButton>--%>
           <%-- <DeleteButton Visible="True">
            </DeleteButton>--%>
           
        </dx:GridViewCommandColumn>
         <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Manv"  VisibleIndex="2" ReadOnly="True">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Hoten" VisibleIndex="3">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="Ngaysinh" VisibleIndex="4">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn FieldName="Ngayvao" VisibleIndex="5">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn FieldName="Diachi" VisibleIndex="6">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Phuong" VisibleIndex="7">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Quan" VisibleIndex="8">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Thanhpho" VisibleIndex="9">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Phone" VisibleIndex="10">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="11">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataCheckColumn FieldName="Active" VisibleIndex="12">
        </dx:GridViewDataCheckColumn>
 <dx:GridViewDataTextColumn FieldName="MaNPP" Visible ="False" VisibleIndex="13" ReadOnly="True" >
 <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
    </Columns>

<SettingsPager RenderMode="Lightweight" PageSize="30"></SettingsPager>

<SettingsEditing Mode="EditForm"></SettingsEditing>

    <Settings ShowFilterRow ="true"/>
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT * FROM [SDNhanvien] WHERE ([MaNPP] = @MaNPP)" OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [SDNhanvien] WHERE [MaNPP] = @original_MaNPP AND [Manv] = @original_Manv AND (([Hoten] = @original_Hoten) OR ([Hoten] IS NULL AND @original_Hoten IS NULL)) AND (([Ngaysinh] = @original_Ngaysinh) OR ([Ngaysinh] IS NULL AND @original_Ngaysinh IS NULL)) AND (([Ngayvao] = @original_Ngayvao) OR ([Ngayvao] IS NULL AND @original_Ngayvao IS NULL)) AND (([Diachi] = @original_Diachi) OR ([Diachi] IS NULL AND @original_Diachi IS NULL)) AND (([Phuong] = @original_Phuong) OR ([Phuong] IS NULL AND @original_Phuong IS NULL)) AND (([Quan] = @original_Quan) OR ([Quan] IS NULL AND @original_Quan IS NULL)) AND (([Thanhpho] = @original_Thanhpho) OR ([Thanhpho] IS NULL AND @original_Thanhpho IS NULL)) AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND [Active] = @original_Active" InsertCommand="INSERT INTO [SDNhanvien] ([MaNPP], [Manv], [Hoten], [Ngaysinh], [Ngayvao], [Diachi], [Phuong], [Quan], [Thanhpho], [Phone], [Email], [Active]) VALUES (@MaNPP, @Manv, @Hoten, @Ngaysinh, @Ngayvao, @Diachi, @Phuong, @Quan, @Thanhpho, @Phone, @Email, @Active)" UpdateCommand="UPDATE [SDNhanvien] SET [Hoten] = @Hoten, [Ngaysinh] = @Ngaysinh, [Ngayvao] = @Ngayvao, [Diachi] = @Diachi, [Phuong] = @Phuong, [Quan] = @Quan, [Thanhpho] = @Thanhpho, [Phone] = @Phone, [Email] = @Email, [Active] = @Active , [Users] = @user  , [Lastchange] =getdate() WHERE [MaNPP] = @MaNPP AND [Manv] = @Manv" EnableCaching="True">
    <DeleteParameters>
        <asp:Parameter Name="original_MaNPP" Type="String" />
        <asp:Parameter Name="original_Manv" Type="String" />
        <asp:Parameter Name="original_Hoten" Type="String" />
        <asp:Parameter Name="original_Ngaysinh" Type="DateTime" />
        <asp:Parameter Name="original_Ngayvao" Type="DateTime" />
        <asp:Parameter Name="original_Diachi" Type="String" />
        <asp:Parameter Name="original_Phuong" Type="String" />
        <asp:Parameter Name="original_Quan" Type="String" />
        <asp:Parameter Name="original_Thanhpho" Type="String" />
        <asp:Parameter Name="original_Phone" Type="String" />
        <asp:Parameter Name="original_Email" Type="String" />
        <asp:Parameter Name="original_Active" Type="Boolean" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="MaNPP" Type="String" />
        <asp:Parameter Name="Manv" Type="String" />
        <asp:Parameter Name="Hoten" Type="String" />
        <asp:Parameter Name="Ngaysinh" Type="DateTime" />
        <asp:Parameter Name="Ngayvao" Type="DateTime" />
        <asp:Parameter Name="Diachi" Type="String" />
        <asp:Parameter Name="Phuong" Type="String" />
        <asp:Parameter Name="Quan" Type="String" />
        <asp:Parameter Name="Thanhpho" Type="String" />
        <asp:Parameter Name="Phone" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Active" Type="Boolean" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="ASPxComboBox1" Name="MaNPP" PropertyName="Value" Type="String" />
    </SelectParameters>
     <%--<FilterParameters>--%>
    <%--<asp:ControlParameter 
         --%>
         <%--<asp:ControlParameter ControlID="ASPxComboBox1" Name="MaNPP"  PropertyName="SelectedValue" Type="String" />--%>
     <%--Name="countryparam" 
     ControlID="DropDownList1" 
     PropertyName="SelectedValue" />--%>
  <%--</FilterParameters>--%>
    <UpdateParameters>
        <asp:Parameter Name="Hoten" Type="String" />
        <asp:Parameter Name="Ngaysinh" Type="DateTime" />
        <asp:Parameter Name="Ngayvao" Type="DateTime" />
        <asp:Parameter Name="Diachi" Type="String" />
        <asp:Parameter Name="Phuong" Type="String" />
        <asp:Parameter Name="Quan" Type="String" />
        <asp:Parameter Name="Thanhpho" Type="String" />
        <asp:Parameter Name="Phone" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Active" Type="Boolean" />
     
         <asp:SessionParameter Name="user" SessionField="TenDangNhap" />
        <asp:Parameter Name="MaNPP" Type="String" />
        <asp:Parameter Name="Manv" Type="String" />
       
    </UpdateParameters>
   
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT Debcode, Debname, Debadd, Region, Subregion, Area, Province FROM dbo.Fn_cust(@unam) AS Fn_cust_1" >
        <SelectParameters>
            <asp:SessionParameter Name="unam" SessionField="TenDangNhap" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
