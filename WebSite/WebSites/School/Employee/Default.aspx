<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Family_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
    <br />
    <br />
    <asp:Label ID="LblUsername" runat="server"></asp:Label>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div align="left">
 <asp:HyperLink ID="HyperLink6" runat="server" 
        NavigateUrl="~/Employee/Manageyear.aspx">Manage Years </asp:HyperLink>
  <br />
   <asp:HyperLink ID="HyperLink2" runat="server" 
        NavigateUrl="~/Employee/Class.aspx">Manage Classes </asp:HyperLink>
         <br />
         <asp:HyperLink ID="HyperLink3" runat="server" 
        NavigateUrl="~/Employee/Groups.aspx">Manage Groups </asp:HyperLink>
         <br />
  <asp:HyperLink ID="HyperLink5" runat="server" 
        NavigateUrl="~/Employee/ManageSalary.aspx">Manage Salary </asp:HyperLink>
      <br />
       
 
     
    
    <asp:HyperLink ID="LinkNewSchool" runat="server" 
        NavigateUrl="~/Employee/ManageEmployees.aspx">Manage Employee </asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" 
        NavigateUrl="~/Employee/ManageTeacher.aspx">Manage Teacher</asp:HyperLink>
         <br />
         <asp:HyperLink ID="HyperLink4" runat="server" 
        NavigateUrl="~/Employee/ManageFamily.aspx">Manage Family </asp:HyperLink>
      <br />
       Students:

      <br />
      <asp:HyperLink ID="HyperLink7" runat="server" 
        NavigateUrl="~/Student/NewStudent.aspx">Register New Student</asp:HyperLink>
      <br />
      <asp:HyperLink ID="HyperLink8" runat="server" 
        NavigateUrl="~/Student/OldStudent.aspx">Register Old Student</asp:HyperLink>
      <br />
      <asp:HyperLink ID="HyperLink11" runat="server" 
        NavigateUrl="~/Student/StudentYear.aspx"> Student Year</asp:HyperLink>
      <br />
    <asp:HyperLink ID="HyperLink9" runat="server" 
        NavigateUrl="~/Student/EditStudentInfo.aspx">Edit Student Info</asp:HyperLink>
      <br />
       <asp:HyperLink ID="HyperLink10" runat="server" 
        NavigateUrl="~/Employee/ManagePay.aspx"> Manage Pay  </asp:HyperLink>
      <br />
     
   <%-- 
  
       
 

     
 
      
      --%>
    
</div>

</asp:Content>

