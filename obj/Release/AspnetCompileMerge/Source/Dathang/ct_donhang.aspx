<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="ct_donhang.aspx.vb" Inherits="WEB.SSM.ct_donhang" %>
 
   
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 

 
        <h3>Thông tin đơn hàng</h3>
        <br />
        <br />

        <table class="auto-style1">
            <tr>
                <td class="auto-style4">Ngày đặt:</td>
                <td class="auto-style5">
                    <dx:ASPxDateEdit ID="ngaydat" runat="server"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style4">Nhà phân phối</td>
                <td class="auto-style5">
                    <dx:ASPxLabel runat="server" ID="manpp" />



                </td>
                <td class="auto-style2">
                    <dx:ASPxLabel ID="tennpp" runat="server" ClientInstanceName="ValueLabel" />
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style4">Kho hàng</td>
                <td class="auto-style5">
                    <%--   <dx:ASPxComboBox runat="server" ID="Kho"   Width="160px"    
                                            DropDownStyle="DropDown">
                                            <Items>
                                                <dx:ListEditItem Text="Kho Bắc Ninh" Value="BNWH" />
                                                <dx:ListEditItem Text="Kho Đà Nẵng" Value="DNWH" />
                                                <dx:ListEditItem Text="Kho Bình Dương" Value="FGWH" />
                                              
                                            </Items>

                                        </dx:ASPxComboBox>--%>
                    <dx:ASPxLabel ID="tKho" runat="server" ClientInstanceName="ValueLabel1" />
                </td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
            </tr>

        </table>
        <dx:ASPxGridView Width="100%" ID="ggiohang" runat="server" ClientInstanceName="dGrid" KeyFieldName="OldItemcode" OnCustomCallback="ggiohang_CustomCallback" AutoGenerateColumns="False">
            <SettingsPager PageSize="17">
            </SettingsPager>

            <SettingsEditing Mode="Inline" />
            <Settings ShowFilterRowMenuLikeItem="True" ShowFooter="True" />
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="###,#" FieldName="TongTien" ShowInColumn="TongTien" ValueDisplayFormat="###,#" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="###,#" FieldName="TongTienIv" ShowInColumn="TongTien" ValueDisplayFormat="###,#" SummaryType="Sum" />
            </TotalSummary>
           
            
            <Columns>

                <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image" Width="5%">
                    <EditButton Visible="True">
                        <Image Url="~/Content/Images/edit.png">
                        </Image>
                    </EditButton>
                    <DeleteButton Visible="True">
                        <Image Url="~/Content/Images/erase.png">
                        </Image>
                    </DeleteButton>
                </dx:GridViewCommandColumn>

                <dx:GridViewDataTextColumn FieldName="OldItemcode" Caption="Mã sản phẩm" VisibleIndex="1" Width="50px">
                    <EditItemTemplate>
                        <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource2" DropDownStyle="DropDownList" Height="16px" IncrementalFilteringMode="Contains" TextField="Debcode" TextFormatString="{0}) " ValueField="OldItemcode" ValueType="System.String" Width="300px">
                            <Columns>
                                <dx:ListBoxColumn FieldName="OldItemcode" Width="100px" />
                                <dx:ListBoxColumn FieldName="Itemname" Width="300px" />
                            </Columns>
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SSM2014ConnectionString %>" SelectCommand="SELECT tbItems.Itemcode, tbItems.Itemname, tbItems.Brand, tbItems.Price, tbItems.Volumn, tbItems.OldItemcode, tbItems.Thung, tbStock.Storage, tbStock.Stock, tbStock.Available FROM tbItems INNER JOIN tbStock ON tbItems.OldItemcode = tbStock.Itemcode WHERE (tbItems.Thung IS NOT NULL) and tbStock.Storage=@store and tbItems.Price &gt;0 and tbStock.Available &gt;0">
        <SelectParameters>
            <asp:SessionParameter Name="store" SessionField="Store" />
        </SelectParameters>
    </asp:SqlDataSource>
                    </EditItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Itemname" Caption="Tên sản phẩm" VisibleIndex="2" Width="300px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Price" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Đơn giá" VisibleIndex="3" Width="20px">
                    <PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SoLuong" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Số lượng" VisibleIndex="3" Width="50px">
                    <PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TongTien" Caption="Thành tiền" VisibleIndex="4" Width="50px" PropertiesTextEdit-DisplayFormatString="###,#">
                    <PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Priceiv" PropertiesTextEdit-DisplayFormatString="###,#" Caption="Đơn giá hđ" VisibleIndex="5" Width="20px">
                    <PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TongTienIv" Caption="Thành tiền hóa đơn" VisibleIndex="5" Width="50px" PropertiesTextEdit-DisplayFormatString="###,#">
                    <PropertiesTextEdit DisplayFormatString="###,#"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    <asp:TextBox ID="txtCopied" runat="server" TextMode="MultiLine" AutoPostBack="true"
        OnTextChanged="PasteToGridView" Height="200" Width="100%" />
    <script type="text/javascript">
        window.onload = function () {
            document.getElementById("<%=txtCopied.ClientID %>").onpaste = function () {
                var txt = this;
                setTimeout(function () {
                    __doPostBack(txt.name, '');
                }, 100);
            }
        };
    </script>

        <dx:ASPxButton ID="dathang" runat="server" Text="Đặt Hàng" UseSubmitBehavior="false" Width="100px">

            <Image Url="~/Content/Images/shoppingicon.png">
            </Image>
        </dx:ASPxButton>
        <dx:ASPxLabel ID="lrbp" Text=""   runat="server"   />
 
</asp:Content>
