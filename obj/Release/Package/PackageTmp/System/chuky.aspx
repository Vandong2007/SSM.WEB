<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="chuky.aspx.vb" Inherits="WEB.SSM.chuky" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <table>
        <tr>
            <td>
              <h4> Danh sách chu kỳ</h4> 
            </td>
            <td>
           <dx:ASPxRadioButtonList ID="radioButtonList" AutoPostBack ="true" runat="server"
            ValueField="ID" TextField="Name" RepeatColumns="4" Width="100%">
               <Items>
                   <dx:ListEditItem Text="Tháng" Value="Tháng" />
                   <dx:ListEditItem Text="Tuần" Value="Tuần" />
                   <dx:ListEditItem Text="Mở chu kỳ cho Nhà Phân phối" Value="Mở chu kỳ cho Nhà Phân phối" />
               </Items>
        </dx:ASPxRadioButtonList>
            </td>
        </tr>
    </table>



    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ID" PreviewFieldName="sPeriod">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
                <NewButton Visible="True">
                </NewButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1" ReadOnly="True" Visible="False">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="sPeriod" VisibleIndex="2" Caption="Chu kỳ">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="sYear" VisibleIndex="3" Caption="Năm">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="DateFrom" VisibleIndex="4" Caption="Ngày Bắt Đầu">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="DateTo" VisibleIndex="5" Caption="Ngày Kết Thúc">
            </dx:GridViewDataDateColumn>
          <%--  <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="6">
            </dx:GridViewDataTextColumn>--%>
              <dx:GridViewDataComboBoxColumn Caption="Chu Kỳ" FieldName="Status" VisibleIndex="6"  PropertiesComboBox-TextFormatString=" {0} ">
                <PropertiesComboBox DropDownStyle="DropDown">
                    <Items>
                        <dx:ListEditItem Text="Open" Value="O" />
                        <dx:ListEditItem Text="Close" Value="C" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        <%-- <dx:GridViewDataTextColumn FieldName="Lock"   VisibleIndex="7">
                 
            </dx:GridViewDataTextColumn> --%>
              <dx:GridViewDataComboBoxColumn Caption="Update" FieldName="Lock" VisibleIndex="7"  PropertiesComboBox-TextFormatString=" {0} ">
                <PropertiesComboBox DropDownStyle="DropDown">
                    <Items>
                        <dx:ListEditItem Text="Lock" Value="Y" />
                        <dx:ListEditItem Text="Update" Value="N" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
           <dx:GridViewDataComboBoxColumn Caption="CTKM" FieldName="Lock_pro" VisibleIndex="7"  PropertiesComboBox-TextFormatString=" {0} ">
                <PropertiesComboBox DropDownStyle="DropDown">
                    <Items>
                        <dx:ListEditItem Text="Lock" Value="Y" />
                        <dx:ListEditItem Text="Update" Value="N" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
    </dx:ASPxGridView>

   

    <br />



    <dx:ASPxGridView ID="ASPxGridView2" runat="server" KeyFieldName ="ID" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" PreviewFieldName="sPeriod">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
                <NewButton Visible="True">
                </NewButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1" ReadOnly="True" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Chuky" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Nam" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="NgayBD" VisibleIndex="4">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="NgayKT" VisibleIndex="5">
            </dx:GridViewDataDateColumn>
          <dx:GridViewDataComboBoxColumn Caption="Tình trạng" FieldName="Trangthai" VisibleIndex="7"  PropertiesComboBox-TextFormatString=" {0} ">
                <PropertiesComboBox DropDownStyle="DropDown">
                    <Items>
                        <dx:ListEditItem Text="OPEN" Value="O" />
                        <dx:ListEditItem Text="CLOSE" Value="C" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
           
        </Columns>
        <Settings ShowFilterRow="True" />
    </dx:ASPxGridView>
    <%--'--open--%>
   <dx:ASPxGridView ID="ASPxGridView3" runat="server"  AutoGenerateColumns="False" DataSourceID="SqlDataSource3"   KeyFieldName="ID">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
                <NewButton Visible="True">
                </NewButton>
                <DeleteButton Visible="True">
                </DeleteButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="true"  VisibleIndex="1">
                  <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="MaNPP" VisibleIndex="2" PropertiesComboBox-DataSourceID="SqlDataSource2" PropertiesComboBox-DropDownStyle="DropDownList" PropertiesComboBox-ValueType="System.String" PropertiesComboBox-TextFormatString="{0}  {1} "
                PropertiesComboBox-IncrementalFilteringMode="Contains" PropertiesComboBox-ValueField="Debcode" Caption="Nhà phân phối">


                <PropertiesComboBox DataSourceID="SqlDataSource4">
                    <Columns>
                        <dx:ListBoxColumn Width ="100px" FieldName="Debcode" />
                        <dx:ListBoxColumn  Width ="200px" FieldName="Debname"   />
                         <dx:ListBoxColumn  Width ="300px" FieldName="Debadd" />
                    </Columns>
                </PropertiesComboBox>


                <Settings AutoFilterCondition="Contains" />


            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn FieldName="NgayBD" VisibleIndex="3" Caption="Ngày bắt đầu ">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="NgayKT" VisibleIndex="4" Caption="Ngày kết thúc">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="Ngaymo" VisibleIndex="5" Caption="Ngày mở">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="Ngaydong" VisibleIndex="6" Caption="Ngày Đóng">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn Caption="Tình trạng" FieldName="Trangthai" VisibleIndex="7"  PropertiesComboBox-TextFormatString=" {0} ">
                <PropertiesComboBox DropDownStyle="DropDown">
                    <Items>
                        <dx:ListEditItem Text="OPEN" Value="O" />
                        <dx:ListEditItem Text="CLOSE" Value="C" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="Ghichu" VisibleIndex="8" Caption="Lý Do" >
                <PropertiesTextEdit NullDisplayText="Không có lý do" NullText="Lý do mở kỳ">
                    <MaskSettings ErrorText="Nhập Lý do" ShowHints="True" />
                    <NullTextStyle BackColor="#FF99CC">
                    </NullTextStyle>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
              
           
        </Columns>
        <Settings ShowFilterRow="True" />
    </dx:ASPxGridView>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>"  OldValuesParameterFormatString="original_{0}" InsertCommand="INSERT INTO VwOpenCK(MaNPP, NgayBD, NgayKT, Ngaymo, Ngaydong, Trangthai, Ghichu) VALUES (@MaNPP, @NgayBD, @NgayKT, @Ngaymo, @Ngaydong, @Trangthai, @Ghichu);
select @original_ID = ID from  VwOpenCK where 
MaNPP= @MaNPP and  NgayBD = @NgayBD and NgayKT= @NgayKT and  Ngaymo =@Ngaymo and  Ngaydong=@Ngaydong and Trangthai= @Trangthai
INSERT INTO  tbPeriodOpenH (MaNPP, NgayBD, NgayKT, Ngaymo, Ngaydong, Trangthai, Ghichu,NguoiMo,ngay,IDs) VALUES (@MaNPP, @NgayBD, @NgayKT, @Ngaymo, @Ngaydong, @Trangthai, @Ghichu,@NguoiMo,GetDate(),@original_ID)" UpdateCommand="UPDATE VwOpenCK SET MaNPP =@MaNPP, NgayBD=@NgayBD, NgayKT=@NgayKT, Ngaymo=@Ngaymo, Ngaydong=@Ngaydong, Trangthai=@Trangthai, Ghichu=@Ghichu WHERE [ID] = @original_ID;

UPDATE tbPeriodOpenH SET MaNPP =@MaNPP, NgayBD=@NgayBD, NgayKT=@NgayKT, Ngaymo=@Ngaymo, Ngaydong=@Ngaydong, Trangthai=@Trangthai, Ghichu=@Ghichu , NguoiMo = @NguoiMo , ngay = GetDate() WHERE [IDs] = @original_ID;" SelectCommand="SELECT ID, MaNPP, NgayBD, NgayKT, Ngaymo, Ngaydong, Trangthai, Ghichu FROM VwOpenCK ORDER BY Ngaydong DESC">
        <InsertParameters>
            <asp:Parameter Name="MaNPP" Type="String"  />
            <asp:Parameter Name="NgayBD" Type="DateTime"  />
            <asp:Parameter Name="NgayKT" Type="DateTime" />
            <asp:Parameter Name="Ngaymo" Type="DateTime"  />
            <asp:Parameter Name="Ngaydong" Type="DateTime" />
            <asp:Parameter Name="Trangthai" Type="String"  />
            <asp:Parameter Name="Ghichu" Type="String" />
            <asp:Parameter Name="original_ID"  Type="Int32" />
            <asp:SessionParameter Name="NguoiMo" SessionField="TenDangNhap" />
            
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MaNPP" Type="String"   />
            <asp:Parameter Name="NgayBD" Type="DateTime" />
            <asp:Parameter Name="NgayKT" Type="DateTime"/>
            <asp:Parameter Name="Ngaymo" Type="DateTime"/>
            <asp:Parameter Name="Ngaydong" Type="DateTime"/>
            <asp:Parameter Name="Trangthai" Type="String"  />
            <asp:Parameter Name="Ghichu" Type="String"  />
            <asp:Parameter Name="original_id" Type="Int32"  />
            <asp:SessionParameter Name="NguoiMo"  SessionField="TenDangNhap" />
            
            
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>"  InsertCommand="INSERT INTO [tbPeriod] ([sPeriod], [sYear], [DateFrom], [DateTo], [Status], [Lock]) VALUES (@sPeriod, @sYear, @DateFrom, @DateTo, @Status, @Lock)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [tbPeriod] ORDER BY [DateFrom] DESC" UpdateCommand="UPDATE tbPeriod SET sPeriod = @sPeriod, sYear = @sYear, DateFrom = @DateFrom, DateTo = @DateTo, Status = @Status, Lock = @Lock, Lock_pro = @Lock_pro WHERE (ID = @original_ID)" DeleteCommand="DELETE FROM [tbPeriod] WHERE [ID] = @original_ID">
       
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
        </DeleteParameters>
       
        <InsertParameters>
            <asp:Parameter Name="sPeriod" Type="Int16" />
            <asp:Parameter Name="sYear" Type="Int16" />
            <asp:Parameter Name="DateFrom" Type="DateTime" />
            <asp:Parameter Name="DateTo" Type="DateTime" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Lock" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="sPeriod" Type="Int16" />
            <asp:Parameter Name="sYear" Type="Int16" />
            <asp:Parameter Name="DateFrom" Type="DateTime" />
            <asp:Parameter Name="DateTo" Type="DateTime" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Lock" Type="String" />
            <asp:Parameter Name="Lock_pro" />
            <asp:Parameter Name="original_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

   

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>"  InsertCommand="INSERT INTO [UZA]...UnChuky  ([chuky], [nam], [ngaybd], [ngaykt], [trangthai] ) VALUES (@chuky , @nam , @ngaybd , @ngaykt , @trangthai )" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [UZA]...UnChuky ORDER BY [ngaybd] DESC" UpdateCommand="UPDATE  [UZA]...UnChuky SET [chuky] = @chuky, [nam] = @nam, [ngaybd] = @ngaybd, [ngaykt] = @ngaykt, [trangthai] = @trangthai  WHERE [ID] = @original_ID" DeleteCommand="DELETE FROM  [UZA]...UnChuky WHERE [ID] = @original_ID">
       
        <DeleteParameters>
            <asp:Parameter  Name="original_ID" Type="Int32" />
        </DeleteParameters>
       
        <InsertParameters>
            <asp:Parameter Name="chuky"  Type="Int16" />
            <asp:Parameter Name="nam" Type="Int16" />
            <asp:Parameter Name="ngaybd" Type="DateTime" />
            <asp:Parameter Name="ngaykt" Type="DateTime" />
            <asp:Parameter Name="trangthai" Type="String" />
        </InsertParameters>
        <UpdateParameters>
             <asp:Parameter Name="chuky"  Type="Int16" />
            <asp:Parameter Name="nam" Type="Int16" />
            <asp:Parameter Name="ngaybd" Type="DateTime" />
            <asp:Parameter Name="ngaykt" Type="DateTime" />
            <asp:Parameter Name="trangthai" Type="String" />
            <asp:Parameter Name="original_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT Debcode, Debname, Debadd, Region, Subregion, Area, Province FROM dbo.Fn_cust_at(@unam) AS Fn_cust_1" >
        <SelectParameters>
            <asp:SessionParameter Name="unam" SessionField="TenDangNhap" />
        </SelectParameters>
    </asp:SqlDataSource>

     
</asp:Content>
