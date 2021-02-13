using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_insertmark : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null)
        {
            Label1.Text = "welcome:  (" + Session["username"].ToString() + ")  ";

        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
    }
    protected void MarkTextBox_TextChanged(object sender, EventArgs e)
    {
        int mark = int.Parse( MarkTextBox.Text);
        if (mark >= 50)
        {
            StausTextBox.Text="successful";
        }
        else
        {
            StausTextBox.Text = "fail";

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        mark.Insert();
        Response.Write("<script>alert('تم ادخال العلامة');</script>");
        
    }
}