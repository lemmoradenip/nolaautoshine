using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    Cryptor validatelogin = new Cryptor();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtUsername.Text.ToString().Trim() != string.Empty && txtPassword.Text.ToString().Trim() != string.Empty)
            {
                //validate using Cryptor and proceed if authenticated
                //redirect to Admin.master page
                if (validatelogin.Login(txtUsername.Text.ToString(), txtPassword.Text.ToString()) == "valid")
                {
                    Response.Redirect("~/Reservations.aspx");
                    div_error.Visible = false;
                }
                else { throw new Exception("Login Credentials invalid!"); }

            }
            else
            {
                //Opps sorry invalid password here
               throw new Exception( "Opps! Invalid Login. Please try again!");
            }
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
            div_error.Visible = true;
        }

    }
}