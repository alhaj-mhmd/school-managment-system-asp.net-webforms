<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageFamily.aspx.cs" Inherits="Employee_ManageFamily" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center" style="height: 531px; color: #00B300">
    
    <br />
    <br />
    <span style="color: #00B300">Insert new Family:</span><asp:FormView 
        ID="FormView1" runat="server" DataKeyNames="Family_id" 
        DataSourceID="SqlDSfamily" DefaultMode="Insert" 
        BackColor="White" BorderColor="#CC9966" BorderWidth="1px" 
        CellPadding="4" BorderStyle="None" GridLines="Both">
        <EditItemTemplate>
            Family_id:
            <asp:Label ID="Family_idLabel1" runat="server" 
                Text='<%# Eval("Family_id") %>' />
            <br />
            Family_username:
            <asp:TextBox ID="Family_usernameTextBox" runat="server" 
                Text='<%# Bind("Family_username") %>' />
            <br />
            Family_password:
            <asp:TextBox ID="Family_passwordTextBox" runat="server" 
                Text='<%# Bind("Family_password") %>' />
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
            Family_username:
            <asp:TextBox ID="Family_usernameTextBox" runat="server" 
                Text='<%# Bind("Family_username") %>' />
            <br />
            Family_password:
            <asp:TextBox ID="Family_passwordTextBox" runat="server" 
                Text='<%# Bind("Family_password") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Family_id:
            <asp:Label ID="Family_idLabel" runat="server" Text='<%# Eval("Family_id") %>' />
            <br />
            Family_username:
            <asp:Label ID="Family_usernameLabel" runat="server" 
                Text='<%# Bind("Family_username") %>' />
            <br />
            Family_password:
            <asp:Label ID="Family_passwordLabel" runat="server" 
                Text='<%# Bind("Family_password") %>' />
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
    <asp:SqlDataSource ID="SqlDSfamily" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Family] WHERE [Family_id] = @Family_id" 
        InsertCommand="INSERT INTO [Family] ([Family_username], [Family_password]) VALUES (@Family_username, @Family_password)" 
        SelectCommand="SELECT * FROM [Family]" 
        
        
        UpdateCommand="UPDATE [Family] SET [Family_username] = @Family_username, [Family_password] = @Family_password WHERE [Family_id] = @Family_id">
        <DeleteParameters>
            <asp:Parameter Name="Family_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Family_username" Type="String" />
            <asp:Parameter Name="Family_password" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Family_username" Type="String" />
            <asp:Parameter Name="Family_password" Type="String" />
            <asp:Parameter Name="Family_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    Edit-Delete Family:<asp:GridView ID="GridView1" runat="server" 
        AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" 
        BorderWidth="1px" CellPadding="3" DataSourceID="SqlDSfamily" 
        Height="133px" Width="418px" BorderStyle="None" CellSpacing="2" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Family_id">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Family_id" HeaderText="Family_id" 
                InsertVisible="False" ReadOnly="True" SortExpression="Family_id" 
                Visible="False" />
            <asp:BoundField DataField="Family_username" HeaderText="Family_username" 
                SortExpression="Family_username" />
            <asp:BoundField DataField="Family_password" HeaderText="Family_password" 
                SortExpression="Family_password" />
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

