<%@ Page Language="VB" AutoEventWireup="true" MasterPageFile="~/Light.master" CodeBehind="Register.aspx.vb" Inherits="WEB.SSM.Register" %>

<asp:content id="ClientArea" contentplaceholderid="MainContent" runat="server">
    <div class="accountHeader">
    <h2>
        Đăng ký thông tin </h2>
    <p>Use the form below to create a new account.</p>
    <p>Passwords are required to be a minimum of characters in length.</p>
</div>
    <dx:ASPxLabel ID="lblBophan" runat="server" AssociatedControlID="txtmaphongban" Text="Bộ phận" />
	<div class="form-field">
	    <dx:ASPxComboBox ID="CbPhongban" runat="server">
            <Items>
                <dx:ListEditItem Text="AP&P" Value="AP&P" />
                <dx:ListEditItem Text="SALEADMIN" Value="SALEADMIN" />
                <dx:ListEditItem Text="IT" Value="IT" />
                <dx:ListEditItem Text="MAKETING" Value="MAKETING" />
                <dx:ListEditItem Text="SALESUP" Value="SALESUP" />
                <dx:ListEditItem Text="SALES HEAD" Value="HEAD " />
            </Items>
            <ValidationSettings>
                <RequiredField IsRequired="True" />
            </ValidationSettings>
        </dx:ASPxComboBox>
    </div>
    <dx:ASPxLabel ID="lblUserName" runat="server" AssociatedControlID="tbUserName" Text="Tên đăng nhập:" />
	<div class="form-field">
	    <dx:ASPxTextBox ID="tbUserName" runat="server" Width="200px" NullText="Ten.HoTenDem">
	        <ValidationSettings ValidationGroup="RegisterUserValidationGroup" RegularExpression-ErrorText="Tên Đăng Nhập Không Đúng">
	            <RegularExpression ValidationExpression="^[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+)*$" />
	            <RequiredField ErrorText="Xin mời nhập tên đăng nhập." IsRequired="true" />
	        </ValidationSettings>
	    </dx:ASPxTextBox>
    </div>
    <dx:ASPxLabel ID="ASPxLabel1" runat="server" AssociatedControlID="tbName" Text="Họ và tên:" />
	<div class="form-field">
	    <dx:ASPxTextBox ID="tbhovaten" runat="server" Width="200px">
	       
	    </dx:ASPxTextBox>
    </div>
    <dx:ASPxLabel ID="lblEmail" runat="server" AssociatedControlID="tbEmail" Text="E-mail:" />
    <div class="form-field">
		<dx:ASPxTextBox ID="tbEmail" runat="server" Width="200px" NullText="Email@wipro-unza.com">
	        <ValidationSettings ValidationGroup="RegisterUserValidationGroup">
	            <RequiredField ErrorText="Xin mời nhập Email" IsRequired="true" />
	            <RegularExpression ErrorText="Email Nhập Không Đúng" ValidationExpression="\w+([-+.']\w+)*@wipro-unza.com" />
	        </ValidationSettings>
	    </dx:ASPxTextBox>
    </div>
    <dx:ASPxLabel ID="lblPassword" runat="server" AssociatedControlID="tbPassword" Text="Password:" />
    <div class="form-field">
		<dx:ASPxTextBox ID="tbPassword" ClientInstanceName="Password" Password="true" runat="server"
	        Width="200px" AutoPostBack="False">
	        <ValidationSettings ValidationGroup="RegisterUserValidationGroup">
	            <RequiredField ErrorText="Xin mời nhập Password  " IsRequired="true" />
	        </ValidationSettings>
	    </dx:ASPxTextBox>
    </div>
    <dx:ASPxLabel ID="lblConfirmPassword" runat="server" AssociatedControlID="tbConfirmPassword"
        Text="Confirm password:" />
	<div class="form-field">
	    <dx:ASPxTextBox ID="tbConfirmPassword" Password="true" runat="server" Width="200px">
	        <ValidationSettings ValidationGroup="RegisterUserValidationGroup">
	            <RequiredField ErrorText="Xin mời nhập Lại Password  " IsRequired="true" />
	        </ValidationSettings>
	        <ClientSideEvents Validation="function(s, e) {
				var originalPasswd = Password.GetText();
				var currentPasswd = s.GetText();
				e.isValid = (originalPasswd  == currentPasswd );
				e.errorText = 'Mật khẩu không khớp, vui lòng nhập lại.';
			}" />
	    </dx:ASPxTextBox>
    </div>
    <dx:ASPxButton ID="btnCreateUser" runat="server" Text="Create User" ValidationGroup="RegisterUserValidationGroup" AutoPostBack="False">
    </dx:ASPxButton>
</asp:content>