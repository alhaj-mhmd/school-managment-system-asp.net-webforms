<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Family_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
  <div align="left">
 <asp:HyperLink ID="HyperLink6" runat="server" 
        NavigateUrl="~/Teacher/insertmark.aspx">Insert Mark </asp:HyperLink>
  <br />
   <asp:HyperLink ID="HyperLink1" runat="server" 
        NavigateUrl="~/Teacher/viewmark.aspx">view Mark </asp:HyperLink>
  <br />

  </div>
</asp:Content>

