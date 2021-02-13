<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageTeacher.aspx.cs" Inherits="Employee_ManageTeacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center" style="height: 531px; color: #00B300">
    
    <br />
    <br />
    <span style="color: #00B300">Insert new Teacher:</span><asp:FormView 
        ID="FormView1" runat="server" DataKeyNames="Teacher_id" 
        DataSourceID="SqlDSTeacher" DefaultMode="Insert" 
        BackColor="White" BorderColor="#CC9966" BorderWidth="1px" 
        CellPadding="4" BorderStyle="None" GridLines="Both">
        <EditItemTemplate>
            Teacher_id:
            <asp:Label ID="Teacher_idLabel1" runat="server" 
                Text='<%# Eval("Teacher_id") %>' />
            <br />
            Teacher_username:
            <asp:TextBox ID="Teacher_usernameTextBox" runat="server" 
                Text='<%# Bind("Teacher_username") %>' />
            <br />
            Teacher_password:
            <asp:TextBox ID="Teacher_passwordTextBox" runat="server" 
                Text='<%# Bind("Teacher_password") %>' />
            <br />
            Teacher_name:
            <asp:TextBox ID="Teacher_nameTextBox" runat="server" 
                Text='<%# Bind("Teacher_name") %>' />
            <br />
            Teacher_phone:
            <asp:TextBox ID="Teacher_phoneTextBox" runat="server" 
                Text='<%# Bind("Teacher_phone") %>' />
            <br />
            Salary:
            <asp:TextBox ID="SalaryTextBox" runat="server" Text='<%# Bind("Salary") %>' />
            <br />
            Teacher_job_type:
            <asp:TextBox ID="Teacher_job_typeTextBox" runat="server" 
                Text='<%# Bind("Teacher_job_type") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#FFCC66" ForeColor="#663399" Font-Bold="True" />
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <InsertItemTemplate>
            Teacher_username:
            <asp:TextBox ID="Teacher_usernameTextBox" runat="server" 
                Text='<%# Bind("Teacher_username") %>' />
            <br />
            Teacher_password:
            <asp:TextBox ID="Teacher_passwordTextBox" runat="server" 
                Text='<%# Bind("Teacher_password") %>' />
            <br />
            Teacher_name:
            <asp:TextBox ID="Teacher_nameTextBox" runat="server" 
                Text='<%# Bind("Teacher_name") %>' />
            <br />
            Teacher_phone:
            <asp:TextBox ID="Teacher_phoneTextBox" runat="server" 
                Text='<%# Bind("Teacher_phone") %>' />
            <br />
            Salary:
            <asp:DropDownList ID="DropDownList4" runat="server" 
                DataSourceID="SqlDataSourceSalary" DataTextField="Mount" 
                DataValueField="Salary_id" SelectedValue='<%# Bind("Salary") %>'>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceSalary" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [Salary_id], [Mount] FROM [Salary]">
            </asp:SqlDataSource>
            <br />
            Teacher_job_type:
            <asp:TextBox ID="Teacher_job_typeTextBox" runat="server" 
                Text='<%# Bind("Teacher_job_type") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Teacher_id:
            <asp:Label ID="Teacher_idLabel" runat="server" 
                Text='<%# Eval("Teacher_id") %>' />
            <br />
            Teacher_username:
            <asp:Label ID="Teacher_usernameLabel" runat="server" 
                Text='<%# Bind("Teacher_username") %>' />
            <br />
            Teacher_password:
            <asp:Label ID="Teacher_passwordLabel" runat="server" 
                Text='<%# Bind("Teacher_password") %>' />
            <br />
            Teacher_name:
            <asp:Label ID="Teacher_nameLabel" runat="server" 
                Text='<%# Bind("Teacher_name") %>' />
            <br />
            Teacher_phone:
            <asp:Label ID="Teacher_phoneLabel" runat="server" 
                Text='<%# Bind("Teacher_phone") %>' />
            <br />
            Salary:
            <asp:Label ID="SalaryLabel" runat="server" Text='<%# Bind("Salary") %>' />
            <br />
            Teacher_job_type:
            <asp:Label ID="Teacher_job_typeLabel" runat="server" 
                Text='<%# Bind("Teacher_job_type") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" 
            HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
    </asp:FormView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDSTeacher" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Teacher] WHERE [Teacher_id] = @Teacher_id" 
        InsertCommand="INSERT INTO [Teacher] ([Teacher_username], [Teacher_password], [Teacher_name], [Teacher_phone], [Salary], [Teacher_job_type]) VALUES (@Teacher_username, @Teacher_password, @Teacher_name, @Teacher_phone, @Salary, @Teacher_job_type)" 
        SelectCommand="SELECT * FROM [Teacher]" 
        
        
        UpdateCommand="UPDATE [Teacher] SET [Teacher_username] = @Teacher_username, [Teacher_password] = @Teacher_password, [Teacher_name] = @Teacher_name, [Teacher_phone] = @Teacher_phone, [Salary] = @Salary, [Teacher_job_type] = @Teacher_job_type WHERE [Teacher_id] = @Teacher_id">
        <DeleteParameters>
            <asp:Parameter Name="Teacher_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Teacher_username" Type="String" />
            <asp:Parameter Name="Teacher_password" Type="String" />
            <asp:Parameter Name="Teacher_name" Type="String" />
            <asp:Parameter Name="Teacher_phone" Type="Int32" />
            <asp:Parameter Name="Salary" Type="Int32" />
            <asp:Parameter Name="Teacher_job_type" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Teacher_username" Type="String" />
            <asp:Parameter Name="Teacher_password" Type="String" />
            <asp:Parameter Name="Teacher_name" Type="String" />
            <asp:Parameter Name="Teacher_phone" Type="Int32" />
            <asp:Parameter Name="Salary" Type="Int32" />
            <asp:Parameter Name="Teacher_job_type" Type="String" />
            <asp:Parameter Name="Teacher_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    Edit-Delete Teacher:<asp:GridView ID="GridView1" runat="server" 
        AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" 
        BorderWidth="1px" CellPadding="3" DataSourceID="SqlDSTeacher" 
        Height="133px" Width="418px" BorderStyle="None" CellSpacing="2" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Teacher_id" style="width:100%">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Teacher_id" HeaderText="Teacher_id" 
                InsertVisible="False" ReadOnly="True" SortExpression="Teacher_id" 
                Visible="False" />
            <asp:BoundField DataField="Teacher_username" HeaderText="Teacher_username" 
                SortExpression="Teacher_username" />
            <asp:BoundField DataField="Teacher_password" HeaderText="Teacher_password" 
                SortExpression="Teacher_password" />
            <asp:BoundField DataField="Teacher_name" HeaderText="Teacher_name" 
                SortExpression="Teacher_name" />
            <asp:BoundField DataField="Teacher_phone" HeaderText="Teacher_phone" 
                SortExpression="Teacher_phone" />
            <asp:TemplateField HeaderText="Salary" SortExpression="Salary">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList5" runat="server" 
                        DataSourceID="SqlDataSourceSalary" DataTextField="Mount" 
                        DataValueField="Salary_id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceSalary" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [Salary_id], [Mount] FROM [Salary]">
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Salary") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Teacher_job_type" HeaderText="Teacher_job_type" 
                SortExpression="Teacher_job_type" />
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
    </asp:GridView>
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

