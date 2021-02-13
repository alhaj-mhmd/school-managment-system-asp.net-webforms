<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewStudent.aspx.cs" Inherits="Student_NewStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <div align="center" style="height:inherit">
    
    <br />
     
    <span style="color: #00B300">Insert new Student:</span><asp:FormView 
        ID="FormView1" runat="server" DataKeyNames="Student_id" 
        DataSourceID="SqlDSstudent" DefaultMode="Insert" 
        BackColor="White" BorderColor="#CC9966" BorderWidth="1px" 
        CellPadding="4" BorderStyle="None" GridLines="Both" Height="483px" 
            Width="251px">
        <EditItemTemplate>
            Student_id:
            <asp:Label ID="Student_idLabel1" runat="server" 
                Text='<%# Eval("Student_id") %>' />
            <br />
            Student_username:
            <asp:TextBox ID="Student_usernameTextBox" runat="server" 
                Text='<%# Bind("Student_username") %>' />
            <br />
            Student_password:
            <asp:TextBox ID="Student_passwordTextBox" runat="server" 
                Text='<%# Bind("Student_password") %>' />
            <br />
            Student_fname:
            <asp:TextBox ID="Student_fnameTextBox" runat="server" 
                Text='<%# Bind("Student_fname") %>' />
            <br />
            Student_lname:
            <asp:TextBox ID="Student_lnameTextBox" runat="server" 
                Text='<%# Bind("Student_lname") %>' />
            <br />
            Student_mname:
            <asp:TextBox ID="Student_mnameTextBox" runat="server" 
                Text='<%# Bind("Student_mname") %>' />
            <br />
            Student_birthday:
            <asp:TextBox ID="Student_birthdayTextBox" runat="server" 
                Text='<%# Bind("Student_birthday") %>' />
            <br />
            Student_address:
            <asp:TextBox ID="Student_addressTextBox" runat="server" 
                Text='<%# Bind("Student_address") %>' />
            <br />
            Student_phone:
            <asp:TextBox ID="Student_phoneTextBox" runat="server" 
                Text='<%# Bind("Student_phone") %>' />
            <br />
            Teacher:
            <asp:DropDownList ID="DropDownList9" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="Teacher_username" 
                DataValueField="Teacher_id" SelectedValue='<%# Bind("Teacher") %>'>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [Teacher_id], [Teacher_username] FROM [Teacher]">
            </asp:SqlDataSource>
            <br />
            Family:
            <asp:DropDownList ID="DropDownList10" runat="server" 
                DataSourceID="SqlDataSource2" DataTextField="Family_username" 
                DataValueField="Family_id" SelectedValue='<%# Bind("Family") %>'>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [Family_id], [Family_username] FROM [Family]">
            </asp:SqlDataSource>
            Year:<asp:DropDownList ID="DropDownListyear" runat="server" AutoPostBack="True" 
                DataSourceID="SqlDataSource3" DataTextField="Year" DataValueField="Year_id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [Year_id], [Year] FROM [Year]"></asp:SqlDataSource>
            <br />
            Class:
            <asp:DropDownList ID="DropDownListclass" runat="server" AutoPostBack="True" 
                DataSourceID="SqlDataSource4" DataTextField="Class_name" 
                DataValueField="Class_id" SelectedValue='<%# Bind("Class") %>'>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [Class_id], [Class_name] FROM [Class] WHERE ([Year] = @Year)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListyear" Name="Year" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            Group:
            <asp:DropDownList ID="DropDownList11" runat="server" 
                DataSourceID="SqlDataSource5" DataTextField="Group_name" 
                DataValueField="Group_id" SelectedValue='<%# Bind("Group") %>'>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [Group_id], [Group_name] FROM [Group] WHERE ([Class_id] = @Class_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListclass" Name="Class_id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
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
            Student_username:
            <asp:TextBox ID="Student_usernameTextBox" runat="server" 
                Text='<%# Bind("Student_username") %>' />
            <br />
            Student_password:
            <asp:TextBox ID="Student_passwordTextBox" runat="server" 
                Text='<%# Bind("Student_password") %>' />
            <br />
            Student_fname:
            <asp:TextBox ID="Student_fnameTextBox" runat="server" 
                Text='<%# Bind("Student_fname") %>' />
            <br />
            Student_lname:
            <asp:TextBox ID="Student_lnameTextBox" runat="server" 
                Text='<%# Bind("Student_lname") %>' />
            <br />
            Student_mname:
            <asp:TextBox ID="Student_mnameTextBox" runat="server" 
                Text='<%# Bind("Student_mname") %>' />
            <br />
            Student_birthday:
            <asp:Calendar ID="Calendar1" runat="server" 
                SelectedDate='<%# Bind("Student_birthday") %>'></asp:Calendar>
            <br />
            Student_address:
            <asp:TextBox ID="Student_addressTextBox" runat="server" 
                Text='<%# Bind("Student_address") %>' />
            <br />
            Student_phone:
            <asp:TextBox ID="Student_phoneTextBox" runat="server" 
                Text='<%# Bind("Student_phone") %>' />
            <br />
            Teacher:
            <asp:DropDownList ID="DropDownList6" runat="server" 
                DataSourceID="SqlDataSourceteacher" DataTextField="Teacher_name" 
                DataValueField="Teacher_id" SelectedValue='<%# Bind("Teacher") %>'>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceteacher" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [Teacher_id], [Teacher_name] FROM [Teacher]">
            </asp:SqlDataSource>
            <br />
            Family:
            <asp:DropDownList ID="DropDownList7" runat="server" 
                DataSourceID="SqlDataSourcefamily" DataTextField="Family_username" 
                DataValueField="Family_id" SelectedValue='<%# Bind("Family") %>'>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourcefamily" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [Family_id], [Family_username] FROM [Family]">
            </asp:SqlDataSource>
            <br />
            Year:
            <asp:DropDownList ID="DropDownListyear" runat="server" AutoPostBack="True" 
                DataSourceID="SqlDataSourceyear" DataTextField="Year" 
                DataValueField="Year_id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceyear" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [Year_id], [Year] FROM [Year]"></asp:SqlDataSource>
            <br />
            Class:
            <asp:DropDownList ID="DropDownListclass" runat="server" AutoPostBack="True" 
                DataSourceID="SqlDataSourceclass" DataTextField="Class_name" 
                DataValueField="Class_id" SelectedValue='<%# Bind("Class") %>'>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceclass" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [Class_id], [Class_name] FROM [Class] WHERE ([Year] = @Year)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListyear" Name="Year" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            Group:
            <asp:DropDownList ID="DropDownList8" runat="server" 
                DataSourceID="SqlDataSourcegroup" DataTextField="Group_name" 
                DataValueField="Group_id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourcegroup" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [Group_id], [Group_name] FROM [Group] WHERE ([Class_id] = @Class_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListclass" Name="Class_id" 
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
            Student_id:
            <asp:Label ID="Student_idLabel" runat="server" 
                Text='<%# Eval("Student_id") %>' />
            <br />
            Student_username:
            <asp:Label ID="Student_usernameLabel" runat="server" 
                Text='<%# Bind("Student_username") %>' />
            <br />
            Student_password:
            <asp:Label ID="Student_passwordLabel" runat="server" 
                Text='<%# Bind("Student_password") %>' />
            <br />
            Student_fname:
            <asp:Label ID="Student_fnameLabel" runat="server" 
                Text='<%# Bind("Student_fname") %>' />
            <br />
            Student_lname:
            <asp:Label ID="Student_lnameLabel" runat="server" 
                Text='<%# Bind("Student_lname") %>' />
            <br />
            Student_mname:
            <asp:Label ID="Student_mnameLabel" runat="server" 
                Text='<%# Bind("Student_mname") %>' />
            <br />
            Student_birthday:
            <asp:Label ID="Student_birthdayLabel" runat="server" 
                Text='<%# Bind("Student_birthday") %>' />
            <br />
            Student_address:
            <asp:Label ID="Student_addressLabel" runat="server" 
                Text='<%# Bind("Student_address") %>' />
            <br />
            Student_phone:
            <asp:Label ID="Student_phoneLabel" runat="server" 
                Text='<%# Bind("Student_phone") %>' />
            <br />
            Teacher:
            <asp:Label ID="TeacherLabel" runat="server" Text='<%# Bind("Teacher") %>' />
            <br />
            Family:
            <asp:Label ID="FamilyLabel" runat="server" Text='<%# Bind("Family") %>' />
            <br />
            Class:
            <asp:Label ID="ClassLabel" runat="server" Text='<%# Bind("Class") %>' />
            <br />
            Group:
            <asp:Label ID="GroupLabel" runat="server" Text='<%# Bind("Group") %>' />
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
     
    <asp:SqlDataSource ID="SqlDSstudent" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Student] WHERE [Student_id] = @Student_id" 
        InsertCommand="INSERT INTO [Student] ([Student_username], [Student_password], [Student_fname], [Student_lname], [Student_mname], [Student_birthday], [Student_address], [Student_phone], [Teacher], [Family], [Class], [Group]) VALUES (@Student_username, @Student_password, @Student_fname, @Student_lname, @Student_mname, @Student_birthday, @Student_address, @Student_phone, @Teacher, @Family, @Class, @Group)" 
        SelectCommand="SELECT * FROM [Student]" 
        
        
        
        
            UpdateCommand="UPDATE [Student] SET [Student_username] = @Student_username, [Student_password] = @Student_password, [Student_fname] = @Student_fname, [Student_lname] = @Student_lname, [Student_mname] = @Student_mname, [Student_birthday] = @Student_birthday, [Student_address] = @Student_address, [Student_phone] = @Student_phone, [Teacher] = @Teacher, [Family] = @Family, [Class] = @Class, [Group] = @Group WHERE [Student_id] = @Student_id">
        <DeleteParameters>
            <asp:Parameter Name="Student_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Student_username" Type="String" />
            <asp:Parameter Name="Student_password" Type="String" />
            <asp:Parameter Name="Student_fname" Type="String" />
            <asp:Parameter Name="Student_lname" Type="String" />
            <asp:Parameter Name="Student_mname" Type="String" />
            <asp:Parameter Name="Student_birthday" DbType="Date" />
            <asp:Parameter Name="Student_address" Type="String" />
            <asp:Parameter Name="Student_phone" Type="Int32" />
            <asp:Parameter Name="Teacher" Type="Int32" />
            <asp:Parameter Name="Family" Type="Int32" />
            <asp:Parameter Name="Class" Type="Int32" />
            <asp:Parameter Name="Group" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Student_username" Type="String" />
            <asp:Parameter Name="Student_password" Type="String" />
            <asp:Parameter Name="Student_fname" Type="String" />
            <asp:Parameter Name="Student_lname" Type="String" />
            <asp:Parameter Name="Student_mname" Type="String" />
            <asp:Parameter Name="Student_birthday" DbType="Date" />
            <asp:Parameter Name="Student_address" Type="String" />
            <asp:Parameter Name="Student_phone" Type="Int32" />
            <asp:Parameter Name="Teacher" Type="Int32" />
            <asp:Parameter Name="Family" Type="Int32" />
            <asp:Parameter Name="Class" Type="Int32" />
            <asp:Parameter Name="Group" Type="Int32" />
            <asp:Parameter Name="Student_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </div>
     <br /> <br /> <br /> <br /> <br /> <br />
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

