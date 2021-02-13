using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Student_RegistNewCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"]!=null)
        {
            Label1.Text = "welcome:  (" + Session["username"].ToString() + ")  this is your studing year and class";

        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
        Labelc.Text = GridView1.Rows[0].Cells[3].Text;
        Labely.Text = GridView1.Rows[0].Cells[4].Text;
        Labels.Text = GridView1.Rows[0].Cells[2].Text;



    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["School"].ConnectionString;

        SqlConnection con = new SqlConnection(connectionString);


        con.Open();
        for (int i = 0; i < CheckBoxList1.Items.Count; i++)
        {
            string sql = "INSERT INTO [StudentCourse] ([Course], [Student]) VALUES (@Course, @Student)";
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.Add(new SqlParameter("@Student", SqlDbType.Int));
            cmd.Parameters["@Student"].Value = Labels.Text;
                    cmd.Parameters.Add(new SqlParameter("@Course", SqlDbType.Int));
        cmd.Parameters["@Course"].Value = CheckBoxList1.Items[i].Value;


        cmd.ExecuteNonQuery();
        }

        con.Close();
    }
}