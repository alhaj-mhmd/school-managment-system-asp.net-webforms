<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditStudentInfo.aspx.cs" Inherits="Student_EditStudentInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div align="center" style="height: 808px; color: #00B300">
 <asp:SqlDataSource ID="SqlDSstudent" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Student] WHERE [Student_id] = @Student_id" 
        InsertCommand="INSERT INTO [Student] ([Student_username], [Student_password], [Student_fname], [Student_lname], [Student_mname], [Student_birthday], [Student_address], [Student_phone], [Teacher], [Family], [Class], [Group], [Year]) VALUES (@Student_username, @Student_password, @Student_fname, @Student_lname, @Student_mname, @Student_birthday, @Student_address, @Student_phone, @Teacher, @Family, @Class, @Group, @Year)" 
        SelectCommand="SELECT * FROM [Student]" 
        
        
        
        UpdateCommand="UPDATE [Student] SET [Student_username] = @Student_username, [Student_password] = @Student_password, [Student_fname] = @Student_fname, [Student_lname] = @Student_lname, [Student_mname] = @Student_mname, [Student_birthday] = @Student_birthday, [Student_address] = @Student_address, [Student_phone] = @Student_phone, [Teacher] = @Teacher, [Family] = @Family, [Class] = @Class, [Group] = @Group, [Year] = @Year WHERE [Student_id] = @Student_id">
        <DeleteParameters>
            <asp:Parameter Name="Student_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Student_username" Type="String" />
            <asp:Parameter Name="Student_password" Type="String" />
            <asp:Parameter Name="Student_fname" Type="String" />
            <asp:Parameter Name="Student_lname" Type="String" />
            <asp:Parameter Name="Student_mname" Type="String" />
            <asp:Parameter Name="Student_birthday" DbType="Date" />
            <asp:Parameter Name="Student_address" Type="String" />
            <asp:Parameter Name="Student_phone" Type="Int32" />
            <asp:Parameter Name="Teacher" Type="Int32" />
            <asp:Parameter Name="Family" Type="Int32" />
            <asp:Parameter Name="Class" Type="Int32" />
            <asp:Parameter Name="Group" Type="Int32" />
            <asp:Parameter Name="Year" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Student_username" Type="String" />
            <asp:Parameter Name="Student_password" Type="String" />
            <asp:Parameter Name="Student_fname" Type="String" />
            <asp:Parameter Name="Student_lname" Type="String" />
            <asp:Parameter Name="Student_mname" Type="String" />
            <asp:Parameter Name="Student_birthday" DbType="Date" />
            <asp:Parameter Name="Student_address" Type="String" />
            <asp:Parameter Name="Student_phone" Type="Int32" />
            <asp:Parameter Name="Teacher" Type="Int32" />
            <asp:Parameter Name="Family" Type="Int32" />
            <asp:Parameter Name="Class" Type="Int32" />
            <asp:Parameter Name="Group" Type="Int32" />
            <asp:Parameter Name="Year" Type="Int32" />
            <asp:Parameter Name="Student_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
 Edit-Delete Student:
     <br />
    <asp:GridView ID="GridView1" runat="server" 
        AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" 
        BorderWidth="1px" CellPadding="3" DataSourceID="SqlDSstudent"
          BorderStyle="None" CellSpacing="2" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Student_id" 
            Width="100%">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Student_id" HeaderText="Student_id" 
                InsertVisible="False" ReadOnly="True" SortExpression="Student_id" 
                Visible="False" />
            <asp:BoundField DataField="Student_username" HeaderText="username" 
                SortExpression="Student_username" />
            <asp:BoundField DataField="Student_password" HeaderText="password" 
                SortExpression="Student_password" />
            <asp:BoundField DataField="Student_fname" HeaderText="fname" 
                SortExpression="Student_fname" />
            <asp:BoundField DataField="Student_lname" HeaderText="lname" 
                SortExpression="Student_lname" />
            <asp:BoundField DataField="Student_mname" HeaderText="mname" 
                SortExpression="Student_mname" />
            <asp:TemplateField HeaderText="birthday" SortExpression="Student_birthday">
                <EditItemTemplate>
                    <asp:Calendar ID="Calendar1" runat="server" 
                        SelectedDate='<%# Bind("Student_birthday") %>'></asp:Calendar>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Student_birthday") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Student_address" HeaderText="address" 
                SortExpression="Student_address" />
            <asp:BoundField DataField="Student_phone" HeaderText="phone" 
                SortExpression="Student_phone" />
            <asp:TemplateField HeaderText="Teacher" SortExpression="Teacher">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSourceteacher" DataTextField="Teacher_name" 
                        DataValueField="Teacher_id" SelectedValue='<%# Bind("Teacher") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceteacher" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [Teacher_id], [Teacher_name] FROM [Teacher]">
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Teacher") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Family" SortExpression="Family">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="SqlDataSourcefamily" DataTextField="Family_username" 
                        DataValueField="Family_id" SelectedValue='<%# Bind("Family") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourcefamily" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [Family_id], [Family_username] FROM [Family]">
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Family") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Year" SortExpression="Year">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="SqlDataSourceyear" DataTextField="Year" DataValueField="Year_id" 
                        SelectedValue='<%# Bind("Year") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceyear" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT * FROM [Year]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Year") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Class" SortExpression="Class">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Class") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Class") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Group" SortExpression="Group">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Group") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Group") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" 
            HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" ForeColor="White" Font-Bold="True" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />

<SortedAscendingCellStyle BackColor="#FFF1D4"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#B95C30"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#F1E5CE"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#93451F"></SortedDescendingHeaderStyle>
    </asp:GridView>
     <asp:SqlDataSource ID="SqlDataSourceyear" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         SelectCommand="SELECT * FROM [Year]"></asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSourceclass" runat="server"></asp:SqlDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div align="left">

  <br />
  <asp:HyperLink ID="HyperLink5" runat="server" 
        NavigateUrl="~/Employee/Default.aspx">Home </asp:HyperLink>
      <br />
    <br />
    <br />
    <br />
    </div>

</asp:Content>

