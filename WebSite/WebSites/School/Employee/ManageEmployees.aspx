<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageEmployees.aspx.cs" Inherits="Employee_ManageEmployees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center" style="height: 531px; color: #00B300">
    
    <br />
    <br />
    <span style="color: #00B300">Insert new Empolyee:</span><asp:FormView 
        ID="FormView1" runat="server" DataKeyNames="Employee_id" 
        DataSourceID="SqlDSEmployee" DefaultMode="Insert" 
        BackColor="White" BorderColor="#CC9966" BorderWidth="1px" 
        CellPadding="4" BorderStyle="None" GridLines="Both">
        <EditItemTemplate>
            Employee_id:
            <asp:Label ID="Employee_idLabel1" runat="server" 
                Text='<%# Eval("Employee_id") %>' />
            <br />
            Employee_username:
            <asp:TextBox ID="Employee_usernameTextBox" runat="server" 
                Text='<%# Bind("Employee_username") %>' />
            <br />
            Employee_password:
            <asp:TextBox ID="Employee_passwordTextBox" runat="server" 
                Text='<%# Bind("Employee_password") %>' />
            <br />
            Salary:
            <asp:TextBox ID="SalaryTextBox" runat="server" Text='<%# Bind("Salary") %>' />
            <br />
            Employee_type:
            <asp:TextBox ID="Employee_typeTextBox" runat="server" 
                Text='<%# Bind("Employee_type") %>' />
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
            Employee_username:
            <asp:TextBox ID="Employee_usernameTextBox" runat="server" 
                Text='<%# Bind("Employee_username") %>' />
            <br />
            Employee_password:
            <asp:TextBox ID="Employee_passwordTextBox" runat="server" 
                Text='<%# Bind("Employee_password") %>' />
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
            Employee_type:
            <asp:DropDownList ID="DropDownList5" runat="server">
                <asp:ListItem>admin</asp:ListItem>
                <asp:ListItem>manag</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Employee_id:
            <asp:Label ID="Employee_idLabel" runat="server" 
                Text='<%# Eval("Employee_id") %>' />
            <br />
            Employee_username:
            <asp:Label ID="Employee_usernameLabel" runat="server" 
                Text='<%# Bind("Employee_username") %>' />
            <br />
            Employee_password:
            <asp:Label ID="Employee_passwordLabel" runat="server" 
                Text='<%# Bind("Employee_password") %>' />
            <br />
            Salary:
            <asp:Label ID="SalaryLabel" runat="server" Text='<%# Bind("Salary") %>' />
            <br />
            Employee_type:
            <asp:Label ID="Employee_typeLabel" runat="server" 
                Text='<%# Bind("Employee_type") %>' />
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
    <asp:SqlDataSource ID="SqlDSEmployee" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Employee] WHERE [Employee_id] = @Employee_id" 
        InsertCommand="INSERT INTO [Employee] ([Employee_username], [Employee_password], [Salary], [Employee_type]) VALUES (@Employee_username, @Employee_password, @Salary, @Employee_type)" 
        SelectCommand="SELECT * FROM [Employee]" 
        
        UpdateCommand="UPDATE [Employee] SET [Employee_username] = @Employee_username, [Employee_password] = @Employee_password, [Salary] = @Salary, [Employee_type] = @Employee_type WHERE [Employee_id] = @Employee_id">
        <DeleteParameters>
            <asp:Parameter Name="Employee_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Employee_username" Type="String" />
            <asp:Parameter Name="Employee_password" Type="String" />
            <asp:Parameter Name="Salary" Type="Int32" />
            <asp:Parameter Name="Employee_type" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Employee_username" Type="String" />
            <asp:Parameter Name="Employee_password" Type="String" />
            <asp:Parameter Name="Salary" Type="Int32" />
            <asp:Parameter Name="Employee_type" Type="String" />
            <asp:Parameter Name="Employee_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    Edit-Delete Employee:<asp:GridView ID="GridView1" runat="server" 
        AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" 
        BorderWidth="1px" CellPadding="3" DataSourceID="SqlDSEmployee" 
        Height="133px" Width="418px" BorderStyle="None" CellSpacing="2" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Employee_id">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Employee_id" HeaderText="Employee_id" 
                InsertVisible="False" ReadOnly="True" SortExpression="Employee_id" />
            <asp:BoundField DataField="Employee_username" HeaderText="Employee_username" 
                SortExpression="Employee_username" />
            <asp:BoundField DataField="Employee_password" HeaderText="Employee_password" 
                SortExpression="Employee_password" />
            <asp:TemplateField HeaderText="Salary" SortExpression="Salary">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="SqlDataSourceSalary" DataTextField="Mount" 
                        DataValueField="Salary_id" SelectedValue='<%# Bind("Salary") %>'>
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
            <asp:TemplateField HeaderText="Employee_type" SortExpression="Employee_type">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        SelectedValue='<%# Bind("Employee_type") %>'>
                        <asp:ListItem>admin</asp:ListItem>
                        <asp:ListItem>manag</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Employee_type") %>'></asp:Label>
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

