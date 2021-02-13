<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OldStudent.aspx.cs" Inherits="Student_OldStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div align="center">
 
 
     <asp:FormView ID="FormView1" runat="server" BackColor="White" 
         BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
         DataKeyNames="Student_id" DataSourceID="SqlDataSource1" DefaultMode="Insert" 
         GridLines="Both">
         <EditItemTemplate>
         
             <br />
             Year:
             <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
             <br />
             Group:
             <asp:TextBox ID="GroupTextBox" runat="server" Text='<%# Bind("Group") %>' />
             <br />
             Class:
             <asp:TextBox ID="ClassTextBox" runat="server" Text='<%# Bind("Class") %>' />
             <br />
             Teacher:
             <asp:TextBox ID="TeacherTextBox" runat="server" Text='<%# Bind("Teacher") %>' />
             <br />
             Student_username:
             <asp:TextBox ID="Student_usernameTextBox" runat="server" 
                 Text='<%# Bind("Student_username") %>' />
             <br />
             <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                 CommandName="Update" Text="Update" />
             &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel" Text="Cancel" />
         </EditItemTemplate>
         <EditRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
         <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
         <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
         <InsertItemTemplate>
             Student_id:
             <asp:DropDownList ID="DropDownList5" runat="server" 
                 DataSourceID="SqlDataSourcesid" DataTextField="Student_username" 
                 DataValueField="Student_id" SelectedValue='<%# Bind("Student_id") %>'>
             </asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSourcesid" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                 SelectCommand="SELECT [Student_id], [Student_username] FROM [Student]">
             </asp:SqlDataSource>
             <br />
             <br />
             Year:
             <asp:DropDownList ID="DropDownList1" runat="server" 
                 DataSourceID="SqlDataSourcey" DataTextField="Year" 
                 DataValueField="Year_id" AutoPostBack="True">
             </asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSourcey" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                 SelectCommand="SELECT * FROM [Year]"></asp:SqlDataSource>
             <br />
             Class:
             <asp:DropDownList ID="DropDownList2" runat="server" 
                 DataSourceID="SqlDataSourcec" DataTextField="Class_name" 
                 DataValueField="Class_id" SelectedValue='<%# Bind("Class") %>' 
                 AutoPostBack="True">
             </asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSourcec" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                 SelectCommand="SELECT [Class_id], [Class_name] FROM [Class] WHERE ([Year] = @Year)">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="DropDownList1" Name="Year" 
                         PropertyName="SelectedValue" Type="Int32" />
                 </SelectParameters>
             </asp:SqlDataSource>
             <br />
             <br />
             Group:
             <asp:DropDownList ID="DropDownList3" runat="server" 
                 DataSourceID="SqlDataSourceg" DataTextField="Group_name" 
                 DataValueField="Group_id">
             </asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSourceg" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                 SelectCommand="SELECT [Group_id], [Group_name] FROM [Group] WHERE ([Class_id] = @Class_id)">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="DropDownList2" Name="Class_id" 
                         PropertyName="SelectedValue" Type="Int32" />
                 </SelectParameters>
             </asp:SqlDataSource>
             <br />
             <br />
             Teacher:
             <asp:DropDownList ID="DropDownList4" runat="server" 
                 DataSourceID="SqlDataSourcet" DataTextField="Teacher_name" 
                 DataValueField="Teacher_id" SelectedValue='<%# Bind("Teacher") %>'>
             </asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSourcet" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                 SelectCommand="SELECT [Teacher_id], [Teacher_name] FROM [Teacher]">
             </asp:SqlDataSource>
             <br />
             <br />
             &nbsp;<br />&nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                 CommandName="Insert" Text="Insert" />
             &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Cancel" Text="Cancel" />
         </InsertItemTemplate>
         <ItemTemplate>
             Student_id:
             <asp:Label ID="Student_idLabel" runat="server" 
                 Text='<%# Eval("Student_id") %>' />
             <br />
             Year:
             <asp:Label ID="YearLabel" runat="server" Text='<%# Bind("Year") %>' />
             <br />
             Group:
             <asp:Label ID="GroupLabel" runat="server" Text='<%# Bind("Group") %>' />
             <br />
             Class:
             <asp:Label ID="ClassLabel" runat="server" Text='<%# Bind("Class") %>' />
             <br />
             Teacher:
             <asp:Label ID="TeacherLabel" runat="server" Text='<%# Bind("Teacher") %>' />
             <br />
             Student_username:
             <asp:Label ID="Student_usernameLabel" runat="server" 
                 Text='<%# Bind("Student_username") %>' />
             <br />
             <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                 CommandName="Edit" Text="Edit" />
             &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                 CommandName="Delete" Text="Delete" />
             &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                 CommandName="New" Text="New" />
         </ItemTemplate>
         <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
         <RowStyle BackColor="White" ForeColor="#330099" />
     </asp:FormView>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         DeleteCommand="DELETE FROM [Student] WHERE [Student_id] = @Student_id" 
         InsertCommand="INSERT INTO Student([Group], Class, Teacher, Student_username) VALUES ( @Group , @Class, @Teacher, @Student_username)" 
         SelectCommand="SELECT [Student_id], [Year], [Group], [Class], [Teacher], [Student_username] FROM [Student]" 
         
         UpdateCommand="UPDATE [Student] SET [Year] = @Year, [Group] = @Group, [Class] = @Class, [Teacher] = @Teacher, [Student_username] = @Student_username WHERE [Student_id] = @Student_id">
         <DeleteParameters>
             <asp:Parameter Name="Student_id" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="Year" Type="Int32" />
             <asp:Parameter Name="Group" Type="Int32" />
             <asp:Parameter Name="Class" Type="Int32" />
             <asp:Parameter Name="Teacher" Type="Int32" />
             <asp:Parameter Name="Student_username" Type="String" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="Year" Type="Int32" />
             <asp:Parameter Name="Group" Type="Int32" />
             <asp:Parameter Name="Class" Type="Int32" />
             <asp:Parameter Name="Teacher" Type="Int32" />
             <asp:Parameter Name="Student_username" Type="String" />
             <asp:Parameter Name="Student_id" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>
 
 
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

