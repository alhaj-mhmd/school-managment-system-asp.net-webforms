<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageCourses.aspx.cs" Inherits="Employee_ManageCourses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center" style="height: 531px; color: #00B300">
    
    <br />
    <br />
    <span style="color: #00B300">Insert new Class:</span><asp:FormView 
        ID="FormView1" runat="server" DataKeyNames="Course_id" 
        DataSourceID="SqlDScourse" DefaultMode="Insert" 
        BackColor="White" BorderColor="#CC9966" BorderWidth="1px" 
        CellPadding="4" BorderStyle="None" GridLines="Both">
        <EditItemTemplate>
            Course_id:
            <asp:Label ID="Course_idLabel1" runat="server" 
                Text='<%# Eval("Course_id") %>' />
            <br />
            Course_name:
            <asp:TextBox ID="Course_nameTextBox" runat="server" 
                Text='<%# Bind("Course_name") %>' />
            <br />
            Teacher:
            <asp:TextBox ID="TeacherTextBox" runat="server" Text='<%# Bind("Teacher") %>' />
            <br />
            Class:
            <asp:TextBox ID="ClassTextBox" runat="server" Text='<%# Bind("Class") %>' />
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
            Course_name:
            <asp:TextBox ID="Course_nameTextBox" runat="server" 
                Text='<%# Bind("Course_name") %>' />
            <br />
            <br />
            Teacher:
            <asp:DropDownList ID="DropDownListT" runat="server" 
                DataSourceID="SqlDataSourceT" DataTextField="Teacher_name" 
                DataValueField="Teacher_id" SelectedValue='<%# Bind("Teacher") %>'>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceT" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [Teacher_id], [Teacher_name] FROM [Teacher]">
            </asp:SqlDataSource>
            <br />
            <br />
            Year:
            <asp:DropDownList ID="DropDownListY" runat="server" 
                DataSourceID="SqlDataSourceY" DataTextField="Year" DataValueField="Year_id" 
                SelectedValue='<%# Bind("Year") %>'>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceY" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [Year]"></asp:SqlDataSource>
            <br />
            <br />
            Class:
            <asp:DropDownList ID="DropDownListC" runat="server" 
                DataSourceID="SqlDataSourceC" DataTextField="Class_name" 
                DataValueField="Class_id" SelectedValue='<%# Bind("Class") %>'>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceC" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [Class] WHERE ([Year] = @Year)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListY" Name="Year" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Course_id:
            <asp:Label ID="Course_idLabel" runat="server" Text='<%# Eval("Course_id") %>' />
            <br />
            Course_name:
            <asp:Label ID="Course_nameLabel" runat="server" 
                Text='<%# Bind("Course_name") %>' />
            <br />
            Teacher:
            <asp:Label ID="TeacherLabel" runat="server" Text='<%# Bind("Teacher") %>' />
            <br />
            Class:
            <asp:Label ID="ClassLabel" runat="server" Text='<%# Bind("Class") %>' />
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
    <asp:SqlDataSource ID="SqlDScourse" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Course] WHERE [Course_id] = @Course_id" 
        InsertCommand="INSERT INTO [Course] ([Course_name], [Teacher], [Class], [Year]) VALUES (@Course_name, @Teacher, @Class, @Year)" 
        SelectCommand="SELECT * FROM [Course]" 
        
        
        UpdateCommand="UPDATE [Course] SET [Course_name] = @Course_name, [Teacher] = @Teacher, [Class] = @Class, [Year] = @Year WHERE [Course_id] = @Course_id">
        <DeleteParameters>
            <asp:Parameter Name="Course_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Course_name" Type="String" />
            <asp:Parameter Name="Teacher" Type="Int32" />
            <asp:Parameter Name="Class" Type="Int32" />
            <asp:Parameter Name="Year" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Course_name" Type="String" />
            <asp:Parameter Name="Teacher" Type="Int32" />
            <asp:Parameter Name="Class" Type="Int32" />
            <asp:Parameter Name="Year" Type="Int32" />
            <asp:Parameter Name="Course_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    Edit-Delete class:<asp:GridView ID="GridView1" runat="server" 
        AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" 
        BorderWidth="1px" CellPadding="3" DataSourceID="SqlDScourse" 
        Height="133px" Width="418px" BorderStyle="None" CellSpacing="2" 
        AutoGenerateColumns="False" DataKeyNames="Course_id" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Course_id" HeaderText="Course_id" 
                InsertVisible="False" ReadOnly="True" SortExpression="Course_id" />
            <asp:BoundField DataField="Course_name" HeaderText="Course_name" 
                SortExpression="Course_name" />
            <asp:BoundField DataField="Teacher" HeaderText="Teacher" 
                SortExpression="Teacher" />
            <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" />
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

