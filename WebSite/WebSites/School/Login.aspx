<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align=center>
    <br />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Login as:"></asp:Label>
    <br />
 <asp:DropDownList ID="DropDownListAS" runat="server">
        <asp:ListItem>Family</asp:ListItem>
        <asp:ListItem>Student</asp:ListItem>
        <asp:ListItem>Teacher</asp:ListItem>
        <asp:ListItem>Employee</asp:ListItem>
    </asp:DropDownList>

    <br />
    <br />
    <br />

    <asp:Label ID="Label2" runat="server" Text="UserName"></asp:Label>
    <br />
    <asp:TextBox ID="TxtUsername"  runat="server"></asp:TextBox>

    <br />
    <br />
    <br />

    <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
    <br />
    <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password"></asp:TextBox>

    <br />
    <br />
    <asp:Button ID="BtnLogin" runat="server" Text="Login" 
        onclick="BtnLogin_Click" />
    <br />
    <br />

</div>
   

</asp:Content>

