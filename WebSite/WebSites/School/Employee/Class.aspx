<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Class.aspx.cs" Inherits="Employee_Class" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center" style="height: 531px; color: #00B300">
    
    <br />
    <br />
    <span style="color: #00B300">Insert new Class:</span><asp:FormView 
        ID="FormView1" runat="server" DataKeyNames="Class_id" 
        DataSourceID="SqlDSclass" DefaultMode="Insert" 
        BackColor="White" BorderColor="#CC9966" BorderWidth="1px" 
        CellPadding="4" BorderStyle="None" GridLines="Both">
        <EditItemTemplate>
            Class_id:
            <asp:Label ID="Class_idLabel1" runat="server" 
                Text='<%# Eval("Class_id") %>' />
            <br />
            Class_name:
            <asp:TextBox ID="Class_nameTextBox" runat="server" 
                Text='<%# Bind("Class_name") %>' />
            <br />
            Year:
            <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
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
            Class_name:
            <asp:TextBox ID="Class_nameTextBox" runat="server" 
                Text='<%# Bind("Class_name") %>' />
            <br />
            Year:
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSourceYear" DataTextField="Year" DataValueField="Year_id" 
                SelectedValue='<%# Bind("Year") %>'>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceYear" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [Year]"></asp:SqlDataSource>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Class_id:
            <asp:Label ID="Class_idLabel" runat="server" Text='<%# Eval("Class_id") %>' />
            <br />
            Class_name:
            <asp:Label ID="Class_nameLabel" runat="server" 
                Text='<%# Bind("Class_name") %>' />
            <br />
            Year:
            <asp:Label ID="YearLabel" runat="server" Text='<%# Bind("Year") %>' />
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
    <asp:SqlDataSource ID="SqlDSclass" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Class] WHERE [Class_id] = @Class_id" 
        InsertCommand="INSERT INTO [Class] ([Class_name], [Year]) VALUES (@Class_name, @Year)" 
        SelectCommand="SELECT * FROM [Class]" 
        
        UpdateCommand="UPDATE [Class] SET [Class_name] = @Class_name, [Year] = @Year WHERE [Class_id] = @Class_id">
        <DeleteParameters>
            <asp:Parameter Name="Class_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Class_name" Type="String" />
            <asp:Parameter Name="Year" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Class_name" Type="String" />
            <asp:Parameter Name="Year" Type="Int32" />
            <asp:Parameter Name="Class_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    Edit-Delete class:<asp:GridView ID="GridView1" runat="server" 
        AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" 
        BorderWidth="1px" CellPadding="3" DataSourceID="SqlDSclass" 
        Height="133px" Width="418px" BorderStyle="None" CellSpacing="2" 
        AutoGenerateColumns="False" DataKeyNames="Class_id">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Class_id" HeaderText="Class_id" 
                InsertVisible="False" ReadOnly="True" SortExpression="Class_id" 
                Visible="False" />
            <asp:BoundField DataField="Class_name" HeaderText="Class_name" 
                SortExpression="Class_name" />
            <asp:TemplateField HeaderText="Year" SortExpression="Year">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="SqlDataSourceYear" DataTextField="Year" DataValueField="Year_id" 
                        SelectedValue='<%# Bind("Year") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceYear" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [Year_id], [Year] FROM [Year]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="SqlDataSourceYear" DataTextField="Year" DataValueField="Year_id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceYear" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [Year_id], [Year] FROM [Year]"></asp:SqlDataSource>
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

