<%@ Page Language="VB" AutoEventWireup="true" MasterPageFile="~/Light.master" CodeBehind="ChangePassword.aspx.vb" Inherits="WEB.SSM.ChangePassword" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <div class="accountHeader">
    <h2>
        Đổi Password</h2>
    <p>Vui lòng nhập thông tin đổi pass cũ và pass mới.</p>
  
</div>

<br />
    <dx:ASPxLabel ID="lbluser" runat="server" Text="User Name" />
  <div class="form-field">
    <dx:ASPxLabel ID="lbuser" runat="server" Text=""   />
 </div>

<dx:ASPxLabel ID="lblCurrentPassword" runat="server" Text="Nhập password cũ" />
<div class="form-field">
	<dx:ASPxTextBox ID="tbCurrentPassword" runat="server" Password="True" Width="200px">
	     
	</dx:ASPxTextBox>
</div>
<dx:ASPxLabel ID="lblPassword" runat="server" AssociatedControlID="tbPassword" Text="Password Mới" />
<div class="form-field">
	<dx:ASPxTextBox ID="tbPassword" ClientInstanceName="Password" Password="true" runat="server"
	    Width="200px">
	    <ValidationSettings ValidationGroup="ChangeUserPasswordValidationGroup">
	        <RequiredField ErrorText="Password is required." IsRequired="true" />
	    </ValidationSettings>
	</dx:ASPxTextBox>
</div>
<dx:ASPxLabel ID="lblConfirmPassword" runat="server" AssociatedControlID="tbConfirmPassword"
    Text="Nhập Lại Password Mới" />
<div class="form-field">
	<dx:ASPxTextBox ID="tbConfirmPassword" Password="true" runat="server" Width="200px">
	    <ValidationSettings ValidationGroup="ChangeUserPasswordValidationGroup">
	        <RequiredField ErrorText="Confirm Password is required." IsRequired="true" />
	    </ValidationSettings>
	    <ClientSideEvents Validation="function(s, e) {
			var originalPasswd = Password.GetText();
			var currentPasswd = s.GetText();
			e.isValid = (originalPasswd  == currentPasswd );
			e.errorText = 'The Password and Confirmation Password must match.';
		}" />
	</dx:ASPxTextBox>
</div>
<dx:ASPxButton ID="btnChangePassword" runat="server" Text="Change Password"  
    OnClick="btnChangePassword_Click">
</dx:ASPxButton>
</asp:Content>