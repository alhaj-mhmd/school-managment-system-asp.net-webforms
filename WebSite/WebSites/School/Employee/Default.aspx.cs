using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Family_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LblUsername.Text = "You Are In Employee Pages:   " + (string)Session["username"];
    }
}