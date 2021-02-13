<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StudentYear.aspx.cs" Inherits="Student_StudentYear" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div align="center">
    <br />
     <asp:Label ID="Label1" runat="server" Text="select Year"></asp:Label>
     <asp:SqlDataSource ID="SqlDataSourcey" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         SelectCommand="SELECT [Year_id], [Year] FROM [Year]"></asp:SqlDataSource>
    <br />
     <asp:DropDownList ID="DropDownListy" runat="server" 
         DataSourceID="SqlDataSourcey" DataTextField="Year" DataValueField="Year_id">
     </asp:DropDownList>
     <br />
     <br />
     <asp:Label ID="Label2" runat="server" Text="Select Student"></asp:Label>
     <asp:SqlDataSource ID="SqlDataSources" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         SelectCommand="SELECT [Student_id], [Student_username] FROM [Student]">
     </asp:SqlDataSource>
     <br />
     <asp:DropDownList ID="DropDownLists" runat="server" 
         DataSourceID="SqlDataSources" DataTextField="Student_username" 
         DataValueField="Student_id">
     </asp:DropDownList>
     <br />
    <br />
     <asp:Label ID="Label3" runat="server" 
         Text="Regist the seleced student in the selected year"></asp:Label>
    <br />
     <asp:Button ID="Button1" runat="server" Text="Regist" onclick="Button1_Click" />
    <br />
    <br />
    <br />
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         DeleteCommand="DELETE FROM [StudentYears] WHERE [year] = @year AND [student] = @student" 
         InsertCommand="INSERT INTO [StudentYears] ([year], [student]) VALUES (@year, @student)" 
         SelectCommand="SELECT * FROM [StudentYears]">
         <DeleteParameters>
             <asp:Parameter Name="year" Type="Int32" />
             <asp:Parameter Name="student" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:ControlParameter ControlID="DropDownListy" Name="year" 
                 PropertyName="SelectedValue" Type="Int32" />
             <asp:ControlParameter ControlID="DropDownLists" Name="student" 
                 PropertyName="SelectedValue" Type="Int32" />
         </InsertParameters>
     </asp:SqlDataSource>
    <br />
    <br />
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
         BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
         CellPadding="3" CellSpacing="2" DataKeyNames="year,student" 
         DataSourceID="SqlDataSource1">
         <Columns>
             <asp:TemplateField HeaderText="year" SortExpression="year">
                 <EditItemTemplate>
                     <asp:Label ID="Label1" runat="server" Text='<%# Eval("year") %>'></asp:Label>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:DropDownList ID="DropDownList1" runat="server" 
                         DataSourceID="SqlDataSourcey" DataTextField="Year" DataValueField="Year_id" 
                         SelectedValue='<%# Eval("year") %>'>
                     </asp:DropDownList>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="student" SortExpression="student">
                 <EditItemTemplate>
                     <asp:Label ID="Label2" runat="server" Text='<%# Eval("student") %>'></asp:Label>
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:DropDownList ID="DropDownList2" runat="server" 
                         DataSourceID="SqlDataSources" DataTextField="Student_username" 
                         DataValueField="Student_id" SelectedValue='<%# Eval("student") %>'>
                     </asp:DropDownList>
                 </ItemTemplate>
             </asp:TemplateField>
         </Columns>
         <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
         <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
         <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
         <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
         <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
         <SortedAscendingCellStyle BackColor="#FFF1D4" />
         <SortedAscendingHeaderStyle BackColor="#B95C30" />
         <SortedDescendingCellStyle BackColor="#F1E5CE" />
         <SortedDescendingHeaderStyle BackColor="#93451F" />
     </asp:GridView>
    <br />
    <br />
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
 <div align="left">

  <br />
  <asp:HyperLink ID="HyperLink5" runat="server" 
        NavigateUrl="~/Employee/Default.aspx">Home  </asp:HyperLink>
      <br />
    <br />
    <br />
    <br />
    </div>
</asp:Content>

