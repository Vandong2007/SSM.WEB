<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="Log_bao_cao.aspx.vb" Inherits="WEB.SSM.Log_bao_cao" %>
 <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <dx:ASPxPageControl runat="server" ID="pageControl" Width="100%" ActiveTabIndex="0" Height="100%">
     <TabPages>
         <dx:TabPage Text="Tình Hình Báo Cáo" Visible="true">
             <ContentCollection>
                 <dx:ContentControl ID="ContentControl1" runat="server">
                            

<table style="width: 100%"  frame="below" >
            <tr>
                <td style="width: 339px"> <h3>Log</h3></td>
                <td style="width: 199px"> <a style="text-align: right"> Ngày Bắt Đầu</a></td>
                <td  Width= "100px"> <dx:ASPxDateEdit ID="datest" runat="server" Width= "100px"  Height ="100%"  >
                    </dx:ASPxDateEdit></td>
                <td Width= "200px" style="text-align: right"> <a> Ngày Kết Thúc</a></td>
                <td  Width= "100px">
                    <dx:ASPxDateEdit ID="dateen" runat="server" Width= "100px" Height ="100%"  >
                        <ButtonStyle>
                            <Paddings PaddingLeft="1px" />
                        </ButtonStyle>
                    </dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxButton ID="Btok" runat="server" Text="OK">
                    </dx:ASPxButton>
                </td>
                <td>   
        <dx:ASPxButton ID="btnXlsxExport" runat="server" Text="Export to Excel" UseSubmitBehavior="False" Width="165px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
     <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1" FileName="Log_bao_cao" ></dx:ASPxGridViewExporter>
     <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
         <Columns>
             <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                 <ClearFilterButton Visible="True">
                 </ClearFilterButton>
             </dx:GridViewCommandColumn>
             <dx:GridViewDataTextColumn FieldName="Manpp" VisibleIndex="3">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataDateColumn FieldName="NgayguiBC" VisibleIndex="5" Caption="Ngày Gửi">
             </dx:GridViewDataDateColumn>
             <dx:GridViewDataDateColumn FieldName="NgayUpdate" VisibleIndex="6" Caption="Ngày update ">
             </dx:GridViewDataDateColumn>
             <dx:GridViewDataDateColumn FieldName="LichGui" VisibleIndex="7" Caption="Lịch Gửi">
             </dx:GridViewDataDateColumn>
             <dx:GridViewDataDateColumn FieldName="NgayCuoi" VisibleIndex="9" Caption="Ngày cuối báo cáo">
             </dx:GridViewDataDateColumn>
             <dx:GridViewDataTextColumn FieldName="ChuKy" VisibleIndex="11" Caption="Chu kỳ">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Tuan" VisibleIndex="10" Caption="Tuần">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Nam" VisibleIndex="12" Caption="Năm">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Debname" VisibleIndex="4" Caption="Tên Nhà Phân Phối">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Region" VisibleIndex="1">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Area" VisibleIndex="2">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataDateColumn FieldName="NgayBD" VisibleIndex="13" Caption="Ngày đầu tuần">
             </dx:GridViewDataDateColumn>
             <dx:GridViewDataDateColumn FieldName="NgayKT" VisibleIndex="14" Caption="Ngày kết thúc tuần">
             </dx:GridViewDataDateColumn>
             <dx:GridViewDataTextColumn FieldName="s" VisibleIndex="8" Caption="Kết Quả">
             </dx:GridViewDataTextColumn>
         </Columns>
         <Settings ShowFilterRow="True" />
     </dx:ASPxGridView>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" SelectCommand="SELECT View_guibaocao.Manpp, View_guibaocao.NgayguiBC, View_guibaocao.NgayUpdate, View_guibaocao.LichGui, View_guibaocao.NgayCuoi, View_guibaocao.users, View_guibaocao.ChuKy, View_guibaocao.Tuan, View_guibaocao.Nam, View_guibaocao.Debname, View_guibaocao.Region, View_guibaocao.Area, View_guibaocao.NgayBD, View_guibaocao.NgayKT, View_guibaocao.s FROM View_guibaocao INNER JOIN dbo.Fn_cust(@uname) AS Fn_cust_1 ON View_guibaocao.Manpp = Fn_cust_1.Debcode WHERE (View_guibaocao.NgayBD &gt;= @date1) AND (View_guibaocao.NgayKT &lt;= @date2)">
         <SelectParameters>
             <asp:SessionParameter Name="uname" SessionField="TenDangNhap" />
             <asp:ControlParameter ControlID="datest" Name="date1" PropertyName="Value" />
             <asp:ControlParameter ControlID="dateen" Name="date2" PropertyName="Value" />
         </SelectParameters>
     </asp:SqlDataSource>
      </dx:ContentControl>
             </ContentCollection>
         </dx:TabPage>
                     <dx:TabPage Text="Lịch Tuần" Visible="true">
             <ContentCollection>
                 <dx:ContentControl ID="ContentControl2" runat="server">
                     <table style="width: 100%"  frame="below" >
            <tr>
                <td style="width: 339px"> <h3>Lịch Tuần</h3></td>
                <td style="width: 199px"> <a style="text-align: right"> Ngày Bắt Đầu</a></td>
                <td  Width= "100px"> <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server" Width= "100px"  Height ="100%"  >
                    </dx:ASPxDateEdit></td>
                <td Width= "200px" style="text-align: right"> <a> Ngày Kết Thúc</a></td>
                <td  Width= "100px">
                    <dx:ASPxDateEdit ID="ASPxDateEdit2" runat="server" Width= "100px" Height ="100%"  >
                        <ButtonStyle>
                            <Paddings PaddingLeft="1px" />
                        </ButtonStyle>
                    </dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="OK">
                    </dx:ASPxButton>
                </td>
                
            </tr>
        </table>
       <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" KeyFieldName="ID">
         <Columns>
             <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                 <EditButton Visible="True">
                 </EditButton>
                 <NewButton Visible="True">
                 </NewButton>
                 <DeleteButton Visible="True">
                 </DeleteButton>
                 <ClearFilterButton Visible="True">
                 </ClearFilterButton>
             </dx:GridViewCommandColumn>
             <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                 <EditFormSettings Visible="False" />
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Tuan" ShowInCustomizationForm="True" VisibleIndex="2">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="ChuKy" ShowInCustomizationForm="True" VisibleIndex="3">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Nam" ShowInCustomizationForm="True" VisibleIndex="4">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataDateColumn FieldName="NgayBD" ShowInCustomizationForm="True" VisibleIndex="5">
             </dx:GridViewDataDateColumn>
             <dx:GridViewDataDateColumn FieldName="NgayKT" ShowInCustomizationForm="True" VisibleIndex="6">
             </dx:GridViewDataDateColumn>
             <dx:GridViewDataDateColumn FieldName="NgayGui" ShowInCustomizationForm="True" VisibleIndex="7">
             </dx:GridViewDataDateColumn>
              <dx:GridViewDataCheckColumn FieldName="Trangthai" ShowInCustomizationForm="True" VisibleIndex="8">
                  <PropertiesCheckEdit DisplayFormatString="d">
                  </PropertiesCheckEdit>
             </dx:GridViewDataCheckColumn>
         </Columns>
         <Settings ShowFilterRow="True" />
     </dx:ASPxGridView>

                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSM2014ConnectionString %>" DeleteCommand="DELETE FROM [tbWeek] WHERE [ID] = @ID" InsertCommand="INSERT INTO [tbWeek] (  [Tuan], [ChuKy], [Nam], [NgayBD], [NgayKT], [NgayGui],Trangthai) VALUES (  @Tuan, @ChuKy, @Nam, @NgayBD, @NgayKT,  DATEADD (hour , 17 ,@NgayGui ),@Trangthai)" SelectCommand="SELECT * FROM [tbWeek] WHERE (([NgayBD] &gt;= @NgayBD) AND ([NgayKT] &lt;= @NgayKT))" UpdateCommand="UPDATE [tbWeek] SET [Tuan] = @Tuan, [ChuKy] = @ChuKy, [Nam] = @Nam, [NgayBD] = @NgayBD, [NgayKT] = @NgayKT, [NgayGui] = DATEADD (hour , 17 ,@NgayGui ),Trangthai=@Trangthai WHERE [ID] = @ID">
                         <DeleteParameters>
                             <asp:Parameter Name="ID" Type="Int32" />
                         </DeleteParameters>
                         <InsertParameters>
                           
                             <asp:Parameter Name="Tuan" Type="Int16" />
                             <asp:Parameter Name="ChuKy" Type="Int16" />
                             <asp:Parameter Name="Nam" Type="Int16" />
                             <asp:Parameter Name="NgayBD" Type="DateTime" />
                             <asp:Parameter Name="NgayKT" Type="DateTime" />
                             <asp:Parameter Name="NgayGui" Type="DateTime" />
                             <asp:Parameter Name="Trangthai" Type="Boolean" />

                         </InsertParameters>
                         <SelectParameters>
                             <asp:ControlParameter ControlID="ASPxDateEdit1" Name="NgayBD" PropertyName="Value" Type="DateTime" />
                             <asp:ControlParameter ControlID="ASPxDateEdit2" Name="NgayKT" PropertyName="Value" Type="DateTime" />
                         </SelectParameters>
                         <UpdateParameters>
                             <asp:Parameter Name="Tuan" Type="Int16" />
                             <asp:Parameter Name="ChuKy" Type="Int16" />
                             <asp:Parameter Name="Nam" Type="Int16" />
                             <asp:Parameter Name="NgayBD" Type="DateTime" />
                             <asp:Parameter Name="NgayKT" Type="DateTime" />
                             <asp:Parameter Name="NgayGui" Type="DateTime" />
                            <asp:Parameter Name="Trangthai" Type="Boolean" />
                             <asp:Parameter Name="ID" Type="Int32" />
                         </UpdateParameters>
                     </asp:SqlDataSource>

                     </dx:ContentControl>
             </ContentCollection>
         </dx:TabPage>
     </TabPages>
 </dx:ASPxPageControl>

             
     </asp:Content>