using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {

        // Create the Command and the Connection.
        string connectionString = WebConfigurationManager.ConnectionStrings["School"].ConnectionString;

        SqlConnection con = new SqlConnection(connectionString);



        /////Family
        if (DropDownListAS.SelectedValue=="Family")
        {

            string sql = "SELECT count(*) FROM Family where Family_username= @user AND Family_password= @pass";
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.Add(new SqlParameter("@user", SqlDbType.NVarChar, 50));
            cmd.Parameters["@user"].Value = TxtUsername.Text;

            cmd.Parameters.Add(new SqlParameter("@pass", SqlDbType.NVarChar, 50));
            cmd.Parameters["@pass"].Value = TxtPassword.Text;
            
            con.Open();

            int count = (int) cmd.ExecuteScalar();
            if (count==1)
            {
                Session["username"] = TxtUsername.Text;
                Page.Response.Redirect("~/Family/Default.aspx");
               
            }
            else
            {
                Page.Response.Redirect("~/Login.aspx");    
            }
            con.Close();

          
       
            
        }

        ///////Student
        if (DropDownListAS.SelectedValue=="Student")
        {

            string sql = "SELECT count(*) FROM Student where Student_username= @user AND Student_password= @pass";
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.Add(new SqlParameter("@user", SqlDbType.NVarChar, 50));
            cmd.Parameters["@user"].Value = TxtUsername.Text;

            cmd.Parameters.Add(new SqlParameter("@pass", SqlDbType.NVarChar, 50));
            cmd.Parameters["@pass"].Value = TxtPassword.Text;

            con.Open();

            int count = (int)cmd.ExecuteScalar();
            if (count == 1)
            {
                Session["username"] = TxtUsername.Text;
               


                //select id for the loged in student

              
                string sqlid = "SELECT Student_id FROM Student where Student_username= @user AND Student_password= @pass";
                 SqlCommand cmdid = new SqlCommand(sqlid, con);
                 cmdid.Parameters.Add(new SqlParameter("@user", SqlDbType.NVarChar, 50));
                 cmdid.Parameters["@user"].Value = TxtUsername.Text;

                 cmdid.Parameters.Add(new SqlParameter("@pass", SqlDbType.NVarChar, 50));
                 cmdid.Parameters["@pass"].Value = TxtPassword.Text;
               SqlDataReader reader =   cmdid.ExecuteReader();
               reader.Read();
               int sid =(int) reader["Student_id"];
               Session["id"] = sid;
               Page.Response.Redirect("~/Student/Default.aspx");

            }
            else
            {
                Page.Response.Redirect("~/Login.aspx");
            }
            con.Close();

          
        }
        ////////Teacher
        if (DropDownListAS.SelectedValue == "Teacher")
        {

            string sql = "SELECT count(*) FROM Teacher where Teacher_username= @user AND Teacher_password= @pass";
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.Add(new SqlParameter("@user", SqlDbType.NVarChar, 50));
            cmd.Parameters["@user"].Value = TxtUsername.Text;

            cmd.Parameters.Add(new SqlParameter("@pass", SqlDbType.NVarChar, 50));
            cmd.Parameters["@pass"].Value = TxtPassword.Text;

            con.Open();

            int count = (int)cmd.ExecuteScalar();
            if (count == 1)
            {
                Session["username"] = TxtUsername.Text;

                //select id for the loged in Teacher


                string sqlid = "SELECT Teacher_id FROM Teacher where Teacher_username= @user AND Teacher_password= @pass";
                SqlCommand cmdid = new SqlCommand(sqlid, con);
                cmdid.Parameters.Add(new SqlParameter("@user", SqlDbType.NVarChar, 50));
                cmdid.Parameters["@user"].Value = TxtUsername.Text;

                cmdid.Parameters.Add(new SqlParameter("@pass", SqlDbType.NVarChar, 50));
                cmdid.Parameters["@pass"].Value = TxtPassword.Text;
                SqlDataReader reader = cmdid.ExecuteReader();
                reader.Read();
                int sid = (int)reader["Teacher_id"];
                Session["Teacherid"] = sid;
                 Page.Response.Redirect("~/Teacher/Default.aspx");
            }
            else
            {
                Page.Response.Redirect("~/Login.aspx");
            }
            con.Close();

          
        }
        //////////Employee
        if (DropDownListAS.SelectedValue == "Employee")
        {

            string sql = "SELECT count(*) FROM Employee where Employee_username= @user AND Employee_password= @pass";
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.Add(new SqlParameter("@user", SqlDbType.NVarChar, 50));
            cmd.Parameters["@user"].Value = TxtUsername.Text;

            cmd.Parameters.Add(new SqlParameter("@pass", SqlDbType.NVarChar, 50));
            cmd.Parameters["@pass"].Value = TxtPassword.Text;

            con.Open();

            int count = (int)cmd.ExecuteScalar();
            if (count == 1)
            {
                Session["username"] = TxtUsername.Text;
                Page.Response.Redirect("~/Employee/Default.aspx");
            }
            else
            {
                Page.Response.Redirect("~/Login.aspx");
            }
            con.Close();

          
        }

    }
}