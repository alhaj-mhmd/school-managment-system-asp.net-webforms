<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Groups.aspx.cs" Inherits="Employee_Groups" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center" style="height: 531px; color: #00B300">
    
    <br />
    <br />
    <span style="color: #00B300">Insert new Group:</span><asp:FormView 
        ID="FormView1" runat="server" DataKeyNames="Group_id" 
        DataSourceID="SqlDSgroup" DefaultMode="Insert" 
        BackColor="White" BorderColor="#CC9966" BorderWidth="1px" 
        CellPadding="4" BorderStyle="None" GridLines="Both">
        <EditItemTemplate>
            Group_id:
            <asp:Label ID="Group_idLabel1" runat="server" 
                Text='<%# Eval("Group_id") %>' />
            <br />
            Class_id:
            <asp:TextBox ID="Class_idTextBox" runat="server" 
                Text='<%# Bind("Class_id") %>' />
            <br />
            Group_name:
            <asp:TextBox ID="Group_nameTextBox" runat="server" 
                Text='<%# Bind("Group_name") %>' />
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
            Class:
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSourceclass" DataTextField="Class_name" 
                DataValueField="Class_id" SelectedValue='<%# Bind("Class_id") %>'>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceclass" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [Class_id], [Class_name] FROM [Class]">
            </asp:SqlDataSource>
            <br />
            Group_name:
            <asp:TextBox ID="Group_nameTextBox" runat="server" 
                Text='<%# Bind("Group_name") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Group_id:
            <asp:Label ID="Group_idLabel" runat="server" Text='<%# Eval("Group_id") %>' />
            <br />
            Class_id:
            <asp:Label ID="Class_idLabel" runat="server" Text='<%# Bind("Class_id") %>' />
            <br />
            Group_name:
            <asp:Label ID="Group_nameLabel" runat="server" 
                Text='<%# Bind("Group_name") %>' />
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
    <asp:SqlDataSource ID="SqlDSgroup" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Group] WHERE [Group_id] = @Group_id" 
        InsertCommand="INSERT INTO [Group] ([Class_id], [Group_name]) VALUES (@Class_id, @Group_name)" 
        SelectCommand="SELECT * FROM [Group]" 
        
        UpdateCommand="UPDATE [Group] SET [Class_id] = @Class_id, [Group_name] = @Group_name WHERE [Group_id] = @Group_id">
        <DeleteParameters>
            <asp:Parameter Name="Group_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Class_id" Type="Int32" />
            <asp:Parameter Name="Group_name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Class_id" Type="Int32" />
            <asp:Parameter Name="Group_name" Type="String" />
            <asp:Parameter Name="Group_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    Edit-Delete group:<asp:GridView ID="GridView1" runat="server" 
        AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" 
        BorderWidth="1px" CellPadding="3" DataSourceID="SqlDSgroup" 
        Height="133px" Width="418px" BorderStyle="None" CellSpacing="2" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Group_id">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Group_id" HeaderText="Group_id" 
                InsertVisible="False" ReadOnly="True" SortExpression="Group_id" 
                Visible="False" />
            <asp:TemplateField HeaderText="Class" SortExpression="Class_id">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="SqlDataSourceclass" DataTextField="Class_name" 
                        DataValueField="Class_id" SelectedValue='<%# Bind("Class_id") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceclass" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [Class_id], [Class_name] FROM [Class]">
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="SqlDataSourceclass" DataTextField="Class_name" 
                        DataValueField="Class_id" SelectedValue='<%# Bind("Class_id") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceclass" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [Class_id], [Class_name] FROM [Class]">
                    </asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Group_name" HeaderText="Group_name" 
                SortExpression="Group_name" />
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

