<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="budget.aspx.vb" Inherits="WEB.SSM.budget" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" language="javascript">
        function CalculateTotal() {
            num = 0;
            var topVisibleIndex = grid.GetTopVisibleIndex();
            for (var i = topVisibleIndex; i < topVisibleIndex + grid.GetVisibleRowsOnPage() ; i++) {
                var name = "txtBox" + i;
                var txtBox = eval(name);
                num += eval(txtBox.GetValue());
            }
            lTotal.SetText(num);
        }
    </script>
     <script type="text/javascript">
         function ShowCreateAccountWindow() {


             var popupZone = document.getElementById("popupZone");
             var left = window.screen.availWidth / 4;
             var top = window.screen.availHeight / 4;
             ghang.ShowAtPos(left, top);


         }
    </script>
     <table >
                                            <tr>
                                                <td>
                                                   <a>File upload </a> <asp:FileUpload ID="FileUpload3" runat="server" /></td>
                                                <td>
                                              <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Updload">
                    </dx:ASPxButton>
                                                </td>
                                             
                                                        <td> <dx:ASPxTextBox runat="server" ID="txtNam"  > </dx:ASPxTextBox></td>
                                                        <td>
                                                            <dx:ASPxButton ID="ASPxButton6" runat="server" Text="Tìm kiếm" Image-Url="~/Content/Images/ok.png" Image-Width="50%" Image-Height="50%">
                                                                
                                                            </dx:ASPxButton>
                                                        </td>
                                                        <td>
                                                            <dx:ASPxButton ID="ASPExport" runat="server" Text="Export Excel" Image-Url="~/Content/Images/excel.png" Image-Width="50%" Image-Height="50%">
                                                            </dx:ASPxButton>
                                                            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="grid" FileName="Chi tieu"></dx:ASPxGridViewExporter>
                                                        </td>
                                            </tr> </table>


    <table style="width: 100%">
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label1" runat="server"></asp:Label>
                                            </td>
                                            <td align="right">

                                               
                                              
                                            </td>
                                        </tr>
                                    </table>
                                            <div class="yellowbox">
    Download file mẫu Upload chỉ tiêu .<br>
                                                <a href="../Excel/update_budget.xlsx">update_budget.xlsx </a>
    </div>
                              
    <dx:ASPxSplitter ID="ASPxSplitter2" FullscreenMode="True" runat="server" Height="800px" Width="100%">

        <Panes>

            <dx:SplitterPane Name="ContentCenter" AutoHeight="true" ScrollBars="Auto">
                <Separators Visible="True">
                </Separators>
                <ContentCollection>
                    <dx:SplitterContentControl runat="server">

                        <div style="width: 100%">
                            <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server"
                                Width="100%">
                                <HeaderTemplate>
                                    


                                </HeaderTemplate>
                                <PanelCollection>
                                    <dx:PanelContent ID="PanelContent2" runat="server">
                                        <dx:ASPxCallbackPanel runat="server" ID="ASPxCallbackPanel1" Height="250px" ClientInstanceName="CallbackPanel" RenderMode="Table">

                                            <PanelCollection>
                                                <dx:PanelContent ID="PanelContent3" runat="server">
                                                    <dx:ASPxGridView ID="grid" ClientInstanceName="grid" KeyFieldName="ID" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%">



                                                        <Columns>


                                                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                                                <EditButton Visible="True">
                                                                </EditButton>
                                                                <NewButton Visible="True">
                                                                </NewButton>
                                                                <DeleteButton Visible="True">
                                                                </DeleteButton>
                                                            </dx:GridViewCommandColumn>

                                                            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1" ReadOnly="True">
                                                                <EditFormSettings Visible="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <%--<dx:GridViewDataTextColumn FieldName="Brand" VisibleIndex="3" Caption="Nhãn SP" Width="50px">
            </dx:GridViewDataTextColumn>--%>
                                                            <dx:GridViewDataTextColumn FieldName="type" Caption ="Loại" VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="maintype" Caption="Giá Trị" VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="syear" Caption="Năm" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="###,#">
 
 
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
 
 
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="speriod" Caption="Tháng" VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="###,#">
 
 
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
 
 
                                                            </dx:GridViewDataTextColumn>

                                                            <dx:GridViewDataTextColumn FieldName="amount" Caption="Thành tiền" PropertiesTextEdit-DisplayFormatString="###,#" VisibleIndex="5">
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            

                                                            <dx:GridViewDataTextColumn FieldName="subbrand" Caption="Giá trị con" ShowInCustomizationForm="True" VisibleIndex="4">

                                                            </dx:GridViewDataTextColumn>
                                                             
                                                            <dx:GridViewDataCheckColumn FieldName="Status" Caption="Trạng Thái" ShowInCustomizationForm="True" VisibleIndex="12">
                                                            </dx:GridViewDataCheckColumn>
                                                        </Columns>
                                                        
                                                        <Settings ShowFooter="True" />
                                                        <Settings ShowFilterRow="True" ShowFilterRowMenuLikeItem="True" />

                                                    </dx:ASPxGridView>
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SSMConnectionString %>" DeleteCommand="UPDATE tbbudget SET Status = 0 WHERE (ID = @ID)" InsertCommand="INSERT INTO tbbudget(type, maintype, subbrand, syear, speriod, amount, users, Creates, Change, Status) VALUES (@type, @maintype, @subbrand, @syear, @speriod, @amount, @users, GETDATE(), GETDATE(), 1)" SelectCommand="SELECT tbbudget.ID, tbbudget.type, tbbudget.syear, tbbudget.speriod, tbbudget.amount,
  tbbudget.maintype, tbbudget.subbrand,  
 tbbudget.users, tbbudget.Creates, tbbudget.Change, tbbudget.Status 
 FROM (SELECT Area FROM dbo.Fn_cust(@uname) AS Fn_cust_2 GROUP BY Area) AS Fn_cust_1
  inner  JOIN tbbudget ON Fn_cust_1.Area = tbbudget.maintype where tbbudget.Status =1 and  tbbudget.syear =@year
  union all
  SELECT tbbudget.ID, tbbudget.type, tbbudget.syear, tbbudget.speriod, tbbudget.amount,
  tbbudget.maintype, tbbudget.subbrand,  
 tbbudget.users, tbbudget.Creates, tbbudget.Change, tbbudget.Status 
 FROM  tbbudget 
  inner  JOIN
(SELECT Olddebcode FROM dbo.Fn_cust(@uname) AS Fn_cust_2 GROUP BY Olddebcode) AS Fn_cust_3
 ON Fn_cust_3.Olddebcode = rtrim(ltrim(tbbudget.maintype)) where tbbudget.Status = 1 and  tbbudget.syear =@year
   union all
  SELECT tbbudget.ID, tbbudget.type, tbbudget.syear, tbbudget.speriod, tbbudget.amount,
  tbbudget.maintype, tbbudget.subbrand,  
 tbbudget.users, tbbudget.Creates, tbbudget.Change, tbbudget.Status 
 FROM  tbbudget 
  inner  JOIN
(SELECT Region FROM dbo.Fn_cust(@uname) AS Fn_cust_2 GROUP BY Region) AS Fn_cust_3
 ON Fn_cust_3.Region = rtrim(ltrim(tbbudget.maintype)) where tbbudget.Status =1 and  tbbudget.syear =@year" UpdateCommand="UPDATE tbbudget SET type = @type, maintype = @maintype, subbrand = @subbrand, syear = @syear, speriod = @speriod, amount = @amount, users = @users, Change = GETDATE(), Status = @Status WHERE (ID = @ID)">
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="ID" Type="Int32" />
                                                        </DeleteParameters>
                                                        <InsertParameters>
                                                            <asp:Parameter Name="type" Type="String" />
                                                            <asp:Parameter Name="maintype" Type="String" />
                                                            <asp:Parameter Name="subbrand" Type="String" />
                                                            <asp:Parameter Name="syear" Type="Int32" />
                                                            <asp:Parameter Name="speriod" Type="Int32" />
                                                            <asp:Parameter Name="amount" Type="Double" />
                                                            <asp:Parameter Name="users" />
                                                        </InsertParameters>
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="uname" SessionField="TenDangNhap" />
                                                            <asp:ControlParameter ControlID="txtNam" Name="year" PropertyName="Text" />
                                                        </SelectParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="type" Type="String" />
                                                            <asp:Parameter Name="maintype" Type="String" />
                                                            <asp:Parameter Name="subbrand" Type="String" />
                                                            <asp:Parameter Name="syear" Type="Int32" />
                                                            <asp:Parameter Name="speriod" Type="Int32" />
                                                            <asp:Parameter Name="amount" Type="Double" />
                                                            <asp:Parameter Name="users" />
                                                            <asp:Parameter Name="Status" />
                                                            <asp:Parameter Name="ID" Type="Int32" />
                                                        </UpdateParameters>
                                                    </asp:SqlDataSource>
                                                </dx:PanelContent>
                                            </PanelCollection>
                                        </dx:ASPxCallbackPanel>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxRoundPanel>
                        </div>

                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
        </Panes>
    </dx:ASPxSplitter>

    
    <dx:ASPxPopupControl ID="pcCreateAccount1" ClientInstanceName="ghang" runat="server" AllowDragging="True" MaxHeight="560px" Width ="700px"
        PopupHorizontalAlign="WindowCenter" HeaderText="Thông tin file upload " PopupVerticalAlign="WindowCenter" Maximized="True" MaxWidth="800px" CloseAction="None" Height="400px" Modal="True" PopupHorizontalOffset="100" PopupVerticalOffset="100"  >
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel2" ClientInstanceName="callbackPanel" runat="server"
                    Width="100%" Height="100%" RenderMode="table">
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent4" runat="server">

                           <dx:ASPxGridView  Width="100%" ID="ggiohang" runat="server" ClientInstanceName="dGrid"  AutoGenerateColumns="False">

                               <ClientSideEvents EndCallback="function(s, e) {
	if (s.cpss != '') 
	{   
           
      dGrid1.PerformCallback('');
	  
	}
 
}" />
                                  
                                <SettingsPager PageSize="7">
                                </SettingsPager>
                                <SettingsEditing Mode="Inline" />
                                <Settings ShowFilterRowMenuLikeItem="True" ShowFooter="True" />
                                 
                                <Columns>

                                   

                                   
                                                            <dx:GridViewDataTextColumn FieldName="type" Caption ="Loại" VisibleIndex="2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="maintype" Caption="Giá Trị" VisibleIndex="3">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="syear" Caption="Năm" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="###,#">
  
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
  
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn FieldName="speriod" Caption="Tháng" VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="###,#">
  
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
  
                                                            </dx:GridViewDataTextColumn>

                                                            <dx:GridViewDataTextColumn FieldName="amount" Caption="Thành tiền" PropertiesTextEdit-DisplayFormatString="###,#" VisibleIndex="5">
<PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            

                                                            <dx:GridViewDataTextColumn FieldName="subbrand" Caption="Giá trị con" ShowInCustomizationForm="True" VisibleIndex="4">

                                                            </dx:GridViewDataTextColumn>
                                                             
                                                            <dx:GridViewDataCheckColumn FieldName="status" Caption="Trạng Thái" ShowInCustomizationForm="True" VisibleIndex="12">
                                                            </dx:GridViewDataCheckColumn>
                                   
                                </Columns>
                            </dx:ASPxGridView> 

                            <table id="form" width="100%">

                                <tr>
                                    <td>
                                        
                                            <dx:ASPxButton ID="ASPxSV" runat="server" Text="Hủy" Width="100%" AutoPostBack="True"  >
                                                <ClientSideEvents Click="function(s, e) {    ghang.Hide(); }" />
                                                  <Image Url="~/Content/Images/dele.png"></Image>
                                            </dx:ASPxButton>
</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                                <dx:ASPxButton ID="Bt_dieuChinh" runat="server" Text="Import" ClientInstanceName="d"  UseSubmitBehavior="False" > <Image Url="~/Content/Images/ok.png"></Image></dx:ASPxButton>
 
                                    </td>
                                </tr>
                            </table>


                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
 <ClientSideEvents Shown="popup_Shown" /> 
    </dx:ASPxPopupControl>

</asp:Content>
