﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (  Session["username"]!=null)
        {
            Labeluser.Text = Session["username"].ToString();
        }
    }

    protected void LinkButtonLogout_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Labeluser.Text = null;
        Page.Response.Redirect("~/Default.aspx");
    }
}
