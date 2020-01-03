<%@ Page Language="VB" AutoEventWireup="true" MasterPageFile="~/light.master" CodeBehind="Login.aspx.vb" Inherits="WEB.SSM.Login" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server" >
    <div class="accountHeader" >
                     <h2 style="width: 310px">Đăng Nhập </h2>

          <p style="width: 310px">
        Vui lòng nhập thông tin  tên đăng nhập và mật khẩu. Chọn 
		<a href="Register.aspx">Đăng Ký</a> Nếu bạn muốn chưa có thông tin.</p>

                    </div>
    
     
<dx:ASPxLabel ID="lblUserName" runat="server" AssociatedControlID="tbUserName" Text="Tên Đăng Nhập" />
<div class="form-field" style="width: 310px">
	        
	<dx:ASPxTextBox ID="tbUserName" runat="server" Width="310px" NullText="User Name" Height="40px" Theme="Glass" Font-Bold="True" Font-Size="Large">
	    <ValidationSettings ValidationGroup="LoginUserValidationGroup">
	        <RequiredField ErrorText="User Name is required." IsRequired="true" />
	    </ValidationSettings>
	</dx:ASPxTextBox>
</div>
<dx:ASPxLabel ID="lblPassword" runat="server" AssociatedControlID="tbPassword" Text="Mật Khẩu" />
<div class="form-field" style="width: 310px">
	<dx:ASPxTextBox ID="tbPassword" runat="server" Password="true" Width="310px" NullText="Password" Height="40px" Font-Bold="True" Font-Size="Large">
	    <ValidationSettings ValidationGroup="LoginUserValidationGroup">
	        <RequiredField ErrorText="Password is required." IsRequired="true" />
	    </ValidationSettings>
	</dx:ASPxTextBox>
</div>
<dx:ASPxButton ID="btnLogin" runat="server" Text="Đăng Nhập" ValidationGroup="LoginUserValidationGroup"
    OnClick="btnLogin_Click" Font-Size="Large" Height="40px" Width="310px">
</dx:ASPxButton> 

</asp:Content>