<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/homes.master" CodeBehind="import_CTKM.aspx.vb" Inherits="WEB.SSM.import_CTKM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <table >
                                            <tr>
                                                <td>
                                                   <a>File upload </a> <asp:FileUpload ID="FileUpload3" runat="server" /></td>
                                                <td>
                                              <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Updload">
                    </dx:ASPxButton>
                                                </td>
                                                <td>
                                                    <dx:ASPxButton ID="Bt_dieuChinh" runat="server" Text="Import" UseSubmitBehavior="False" />
                                                </td>
                                            </tr> </table>
                                            <div class="yellowbox">
    Download file mẫu chương trình khuyến mãi.<br>
                                                <a href="../Excel/temp_import_ctkm.xlsx">temp_import_ctkm.xlsx </a>
    </div>
                                       
                                         <dx:ASPxGridView ID="GrilXK" runat="server"   Width="100%"   ClientInstanceName="grid" KeyFieldName= "MaCT"   AutoGenerateColumns="False"  >
                                            <Columns>
                                                <dx:GridViewCommandColumn VisibleIndex="0">
                                                    <EditButton Visible="True">
                                                    </EditButton>
                                                    <DeleteButton Visible="True">
                                                    </DeleteButton>
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn     FieldName="MaCT"  Caption="Mã chương trình" VisibleIndex="2" Width="10%" PropertiesTextEdit-DisplayFormatInEditMode="False" ReadOnly="True">
                                                    
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataMemoColumn FieldName="TenCT" Caption="Tên chương trình" VisibleIndex="3" Width="100%">
                                                </dx:GridViewDataMemoColumn>
                                                <%--<dx:GridViewDataTextColumn FieldName="NhanSP" Caption ="Nhóm Sản Phẩm"  VisibleIndex="4" Width="100%">--%>
                                                <dx:GridViewDataComboBoxColumn Caption="Nhóm Sản Phẩm" FieldName="NhanSP" VisibleIndex="4">
                                                    <PropertiesComboBox DropDownStyle="DropDown">
                                                        <Items>
                                                            <dx:ListEditItem Value=" " />
                                                            <dx:ListEditItem Value="BIOESSENCE" />

                                                            <dx:ListEditItem Value="ROMANO" />

                                                            <dx:ListEditItem Value="ENCHANTEUR" />
                                                            <dx:ListEditItem Value="EVERSOFT" />
                                                            <dx:ListEditItem Value="GERVENNE" />
                                                            <dx:ListEditItem Value="IZZI" />
                                                        </Items>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>

                                                <dx:GridViewDataComboBoxColumn Caption="Loại chương trình" FieldName="LoaiCT" VisibleIndex="5" PropertiesComboBox-TextFormatString=" {0} ">
                                                    <PropertiesComboBox DropDownStyle="DropDown">
                                                        <Items>
                                                            <dx:ListEditItem Text="KM Trực Tiếp" Value="KMTT" />
                                                            <dx:ListEditItem Text="KM Tặng Thêm" Value="KMTS" />
                                                            <dx:ListEditItem Text="KM Chiết Khấu" Value="KMCK" />
                                                            <dx:ListEditItem Text="KM Trưng Bày" Value="KMTB" />
                                                            <dx:ListEditItem Text="KM Tích Lũy" Value="KMTL" />
                                                            <dx:ListEditItem Text="KM Khuyến Dùng" Value="KMKD" />
                                                        </Items>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataTextColumn FieldName="TyleCK" Caption="Tỷ Lệ CK" VisibleIndex="6">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="Ngaybd" Caption="Từ Ngày" VisibleIndex="7">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataDateColumn FieldName="Ngaykt" Caption="Đến Ngày" VisibleIndex="8">
                                                </dx:GridViewDataDateColumn>
                                                <%-- <dx:GridViewDataTextColumn FieldName="Type" Caption ="Loại"  VisibleIndex="9">

            </dx:GridViewDataTextColumn>--%>
                                                <dx:GridViewDataTextColumn Caption="Loại" FieldName="Type" VisibleIndex="9"  >
                                                    
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="khongapdung" Caption="Không Áp CTKM" VisibleIndex="10">
                                                </dx:GridViewDataTextColumn>
                                               
                                            </Columns>
                                             <SettingsPager PageSize="100">
                                             </SettingsPager>
                                             <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom" />

                                         </dx:ASPxGridView>





</asp:Content>
