<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewmark.aspx.cs" Inherits="Teacher_viewmark" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center">
   <br />
        <br />
    <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
     <br />
        <br />
           
        Year:
    <asp:DropDownList ID="DropDownListyear" runat="server" DataSourceID="year" 
      AutoPostBack="True"  DataTextField="Year" DataValueField="Year_id">
    </asp:DropDownList>
    <asp:SqlDataSource ID="year" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [Year_id], [Year] FROM [Year]"></asp:SqlDataSource>


    <br />
    <br />
    Class
    <asp:DropDownList ID="DropDownListclass" runat="server" 
       
        DataSourceID="Class" DataTextField="Class_name" DataValueField="Class_id" 
        AutoPostBack="True">
    </asp:DropDownList>
    <asp:SqlDataSource ID="Class" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [Class_name], [Class_id] FROM [Class] WHERE ([Year] = @Year)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListyear" Name="Year" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    Group
    <asp:DropDownList ID="DropDownListgroup" runat="server" DataSourceID="Group" 
        DataTextField="Group_name" DataValueField="Group_id" AutoPostBack="True">
    </asp:DropDownList>
    <asp:SqlDataSource ID="Group" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [Group_id], [Group_name] FROM [Group] WHERE ([Class_id] = @Class_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListclass" Name="Class_id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    Student
    <asp:DropDownList ID="DropDownListstudent" runat="server" AutoPostBack="True" 
        DataSourceID="Student" DataTextField="Student_username" 
        DataValueField="Student_id" >
    </asp:DropDownList>
    <asp:SqlDataSource ID="Student" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [Student_id], [Student_username] FROM [Student] WHERE ([Group] = @Group)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListgroup" Name="Group" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

                    <br />


    <asp:SqlDataSource ID="mark" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Mark] WHERE [Mark_id] = @Mark_id" 
        InsertCommand="INSERT INTO [Mark] ([Mark], [Course], [Student], [Staus]) VALUES (@Mark, @Course, @Student, @Staus)" 
        SelectCommand="SELECT * FROM [Mark] WHERE ([Student] = @Student)" 
        
        UpdateCommand="UPDATE [Mark] SET [Mark] = @Mark, [Course] = @Course, [Student] = @Student, [Staus] = @Staus WHERE [Mark_id] = @Mark_id">
        <DeleteParameters>
            <asp:Parameter Name="Mark_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Mark" Type="Int32" />
            <asp:Parameter Name="Course" Type="Int32" />
            <asp:Parameter Name="Student" Type="Int32" />
            <asp:Parameter Name="Staus" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListstudent" Name="Student" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Mark" Type="Int32" />
            <asp:Parameter Name="Course" Type="Int32" />
            <asp:Parameter Name="Student" Type="Int32" />
            <asp:Parameter Name="Staus" Type="String" />
            <asp:Parameter Name="Mark_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <br />


    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" DataKeyNames="Mark_id" DataSourceID="mark">
        <Columns>
            <asp:BoundField DataField="Mark_id" HeaderText="Mark_id" InsertVisible="False" 
                ReadOnly="True" SortExpression="Mark_id" />
            <asp:BoundField DataField="Mark" HeaderText="Mark" SortExpression="Mark" />
            <asp:BoundField DataField="Course" HeaderText="Course" 
                SortExpression="Course" />
            <asp:BoundField DataField="Student" HeaderText="Student" 
                SortExpression="Student" />
            <asp:BoundField DataField="Staus" HeaderText="Staus" SortExpression="Staus" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
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
        NavigateUrl="~/Teacher/Default.aspx">Home  </asp:HyperLink>
      <br />
    <br />
    <br />
    <br />
    </div>

</asp:Content>

