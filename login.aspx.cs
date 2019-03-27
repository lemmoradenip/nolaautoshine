using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtUsername.Text.ToString().Trim() != string.Empty && txtPassword.Text.ToString().Trim() != string.Empty)
        {
            //validate using Cryptor and proceed if authenticated
            //redirect to Admin.master page
            Response.Redirect("~/Dashboard.aspx");
        }
        else
        {
            //Opps sorry invalid password here
            lblerror.Text = "Opps! Invalid Login. Please try again!";
        }
    }
}