<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RegistNewCourse.aspx.cs" Inherits="Student_RegistNewCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center">
    <br />
        <br />
    <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>

        <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT Class.Class_name, Year.Year, Student.Student_id, Class.Class_id, Year.Year_id FROM Class INNER JOIN Student ON Class.Class_id = Student.Class INNER JOIN StudentYears ON Student.Student_id = StudentYears.student INNER JOIN Year ON Class.Year = Year.Year_id AND StudentYears.year = Year.Year_id WHERE (Student.Student_id = @sid)">
        <SelectParameters>
            <asp:SessionParameter Name="sid" SessionField="id" />
        </SelectParameters>
    </asp:SqlDataSource>


    <br />


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" Height="118px" Width="273px">
        <Columns>
            <asp:BoundField DataField="Class_name" HeaderText="Class_name" 
                SortExpression="Class_name" />
            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            <asp:BoundField DataField="Student_id" HeaderText="Student_id" 
                InsertVisible="False" ReadOnly="True" SortExpression="Student_id" />
            <asp:BoundField DataField="Class_id" HeaderText="Class_id" 
                InsertVisible="False" ReadOnly="True" SortExpression="Class_id" />
            <asp:BoundField DataField="Year_id" HeaderText="Year_id" InsertVisible="False" 
                ReadOnly="True" SortExpression="Year_id" />
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
    <asp:Label ID="Labelc" runat="server" Text=" " Visible="False"></asp:Label>
        <asp:Label ID="Labels" runat="server" Text=" " Visible="False"></asp:Label>

    <asp:Label ID="Labely"
        runat="server" Text=" " Visible="False"></asp:Label>

    <br />
        <br />
     <asp:Label ID="Label2" runat="server" Text="اختيار المناهج المتاحة"></asp:Label>
      <br />
        <br />
    <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="Course_name" 
        DataValueField="Course_id">
    </asp:CheckBoxList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [Course] WHERE (([Class] = @Class) AND ([Year] = @Year))">
        <SelectParameters>
            <asp:ControlParameter ControlID="Labelc" Name="Class" PropertyName="Text" 
                Type="Int32" />
            <asp:ControlParameter ControlID="Labely" Name="Year" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [StudentCourse] WHERE [Course] = @Course AND [Student] = @Student" 
        InsertCommand="INSERT INTO [StudentCourse] ([Course], [Student]) VALUES (@Course, @Student)" 
        
        SelectCommand="SELECT Course.Course_name FROM StudentCourse INNER JOIN Course ON StudentCourse.Course = Course.Course_id WHERE (StudentCourse.Student = @s)">
        <DeleteParameters>
            <asp:Parameter Name="Course" Type="Int32" />
            <asp:Parameter Name="Student" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Course" Type="Int32" />
            <asp:Parameter Name="Student" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="Labels" Name="s" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="تسجيل" />
    <br />
    <br />
    <br />
    <br />
        <asp:Label ID="Label3" runat="server" Text="Your courses: "></asp:Label>

    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource3">
        <Columns>
            <asp:BoundField DataField="Course_name" HeaderText="Course_name" 
                SortExpression="Course_name" />
        </Columns>
    </asp:GridView>
</div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

<div align="left">

  <br />
  <asp:HyperLink ID="HyperLink5" runat="server" 
        NavigateUrl="~/Student/Default.aspx">Home  </asp:HyperLink>
      <br />
    <br />
    <br />
    <br />
    </div>


</asp:Content>

