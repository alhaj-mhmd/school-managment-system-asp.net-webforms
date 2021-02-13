<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManagePay.aspx.cs" Inherits="Employee_ManagePay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center" style="height: 531px; color: #00B300">
    
    <br />
    <br />
    <span style="color: #00B300">Insert new Pay:</span><asp:FormView 
        ID="FormView1" runat="server" DataKeyNames="Payment_id" 
        DataSourceID="SqlDSpay" DefaultMode="Insert" 
        BackColor="White" BorderColor="#CC9966" BorderWidth="1px" 
        CellPadding="4" BorderStyle="None" GridLines="Both">
        <EditItemTemplate>
            Payment_id:
            <asp:Label ID="Payment_idLabel1" runat="server" 
                Text='<%# Eval("Payment_id") %>' />
            <br />
            Mount:
            <asp:TextBox ID="MountTextBox" runat="server" 
                Text='<%# Bind("Mount") %>' />
            <br />
            Year:
            <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
            <br />
            Student_id:
            <asp:TextBox ID="Student_idTextBox" runat="server" 
                Text='<%# Bind("Student_id") %>' />
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
            Mount:
            <asp:TextBox ID="MountTextBox" runat="server" 
                Text='<%# Bind("Mount") %>' />
            <br />
            Year:
            <asp:DropDownList ID="DropDownListyear" runat="server" 
                DataSourceID="SqlDataSourceyear" DataTextField="Year" DataValueField="Year_id" 
                SelectedValue='<%# Bind("Year") %>'>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceyear" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [Year]"></asp:SqlDataSource>
            <br />
            Student_id:
            <asp:DropDownList ID="DropDownListstudent" runat="server" 
                DataSourceID="SqlDataSourcestudent" DataTextField="Student_username" 
                DataValueField="Student_id" SelectedValue='<%# Bind("Student_id") %>'>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourcestudent" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [Student_username], [Student_id] FROM [Student]">
            </asp:SqlDataSource>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Payment_id:
            <asp:Label ID="Payment_idLabel" runat="server" 
                Text='<%# Eval("Payment_id") %>' />
            <br />
            Mount:
            <asp:Label ID="MountLabel" runat="server" 
                Text='<%# Bind("Mount") %>' />
            <br />
            Year:
            <asp:Label ID="YearLabel" runat="server" Text='<%# Bind("Year") %>' />
            <br />
            Student_id:&nbsp;<asp:Label ID="Student_idLabel" runat="server" 
                Text='<%# Bind("Student_id") %>' />
            <br />
        </ItemTemplate>
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" 
            HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
    </asp:FormView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDSpay" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Payment] WHERE [Payment_id] = @Payment_id" 
        InsertCommand="INSERT INTO [Payment] ([Mount], [Student_id], [Year]) VALUES (@Mount, @Student_id, @Year)" 
        SelectCommand="SELECT * FROM [Payment]" 
        
        
        UpdateCommand="UPDATE [Payment] SET [Mount] = @Mount, [Student_id] = @Student_id, [Year] = @Year WHERE [Payment_id] = @Payment_id">
        <DeleteParameters>
            <asp:Parameter Name="Payment_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Mount" Type="String" />
            <asp:Parameter Name="Student_id" Type="Int32" />
            <asp:Parameter Name="Year" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Mount" Type="String" />
            <asp:Parameter Name="Student_id" Type="Int32" />
            <asp:Parameter Name="Year" Type="Int32" />
            <asp:Parameter Name="Payment_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    Edit-Delete Pay:<asp:GridView ID="GridView1" runat="server" 
        AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" 
        BorderWidth="1px" CellPadding="3" DataSourceID="SqlDSpay" 
        Height="133px" Width="418px" BorderStyle="None" CellSpacing="2" 
        AutoGenerateColumns="False" DataKeyNames="Payment_id" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Payment_id" HeaderText="Payment_id" 
                InsertVisible="False" ReadOnly="True" SortExpression="Payment_id" />
            <asp:BoundField DataField="Mount" HeaderText="Mount" 
                SortExpression="Mount" />
            <asp:BoundField DataField="Student_id" HeaderText="Student_id" 
                SortExpression="Student_id" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
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

