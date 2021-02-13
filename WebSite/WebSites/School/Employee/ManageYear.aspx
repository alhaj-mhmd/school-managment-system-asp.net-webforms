<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageYear.aspx.cs" Inherits="Employee_ManageYear" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center" style="height: 531px; color: #00B300">
    
    <br />
    <br />
    <span style="color: #00B300">Insert new year:</span><asp:FormView 
        ID="FormView1" runat="server" DataKeyNames="Year_id" 
        DataSourceID="SqlDSyear" DefaultMode="Insert" 
        BackColor="White" BorderColor="#CC9966" BorderWidth="1px" 
        CellPadding="4" BorderStyle="None" GridLines="Both">
        <EditItemTemplate>
            Year_id:
            <asp:Label ID="Year_idLabel1" runat="server" 
                Text='<%# Eval("Year_id") %>' />
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
            Year:
            <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Year_id:
            <asp:Label ID="Year_idLabel" runat="server" Text='<%# Eval("Year_id") %>' />
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
    <asp:SqlDataSource ID="SqlDSyear" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Year] WHERE [Year_id] = @Year_id" 
        InsertCommand="INSERT INTO [Year] ([Year]) VALUES (@Year)" 
        SelectCommand="SELECT * FROM [Year]" 
        
        UpdateCommand="UPDATE [Year] SET [Year] = @Year WHERE [Year_id] = @Year_id">
        <DeleteParameters>
            <asp:Parameter Name="Year_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Year" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Year" Type="Int32" />
            <asp:Parameter Name="Year_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    Edit-Delete year:<asp:GridView ID="GridView1" runat="server" 
        AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" 
        BorderWidth="1px" CellPadding="3" DataSourceID="SqlDSyear" Height="133px" Width="418px" 
        AutoGenerateColumns="False" 
        DataKeyNames="Year_id" BorderStyle="None" CellSpacing="2">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Year_id" HeaderText="Year_id" InsertVisible="False" 
                ReadOnly="True" SortExpression="Year_id" Visible="False" />
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

