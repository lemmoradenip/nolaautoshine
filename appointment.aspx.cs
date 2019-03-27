using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Appointment : System.Web.UI.Page
{
    AppointmentModel myAppointment = new AppointmentModel();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private String GetSelectedServicesId(GridView gridview)
    {
        string selectedservices = null;
        try
        {
            // get selected services and concatenate them in string 
            foreach (GridViewRow row in gridview.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    //typecast object Checkbox
                    CheckBox cbService = (row.FindControl("cbselectservice") as CheckBox);
                    string Id = row.Cells[0].Text.ToString();

                    if (cbService.Checked)
                    {
                        selectedservices += Id.ToString() + ",";
                    }
                }
            }
        }
        catch (Exception ex)
        {
            //throw an error exception
        }
        return selectedservices;
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string selectedservices = GetSelectedServicesId(gvInterior) + GetSelectedServicesId(gv_exterior);

            if (txtCFname.Text.ToString().Trim() == string.Empty)
            { throw new Exception("Opps! First Name is required."); }
            else if (txtCLname.Text.ToString().Trim() == string.Empty)
            { throw new Exception("Opps! Lame Name is required."); }
            else if (txtCphoneNumber.Text.ToString().Trim() == string.Empty)
            { throw new Exception("Opps! Mobile is required."); }
            else if (txtCus_Email.Text.ToString().Trim() == string.Empty)
            { throw new Exception("Opps! Email is required."); }
            else if (ddlCcartype.SelectedValue.ToString()=="0")
            { throw new Exception("Opps! Car model is required."); }
            else if (txtscheduleddate.Text == string.Empty)
            { throw new Exception("Opps! Date is required."); }
            else if (selectedservices=="")
            { throw new Exception("Please atleast 1(one) of our service"); }
            else
            {
              //  string selectedservices = GetSelectedServicesId(gvInterior) + GetSelectedServicesId(gv_exterior);
                //insert here the validation code or on javascript
                //add update panel to avoid postback
                myAppointment.CustomerId = 0;
                myAppointment.Lname = txtCLname.Text.ToString();
                myAppointment.Fname = txtCFname.Text.ToString();
                myAppointment.Address = txtCAddress.Text.ToString();
                myAppointment.Mobile = txtCphoneNumber.Text.ToString().Trim();
                myAppointment.Email = txtCus_Email.Text.ToString().Trim();
                myAppointment.Carmodel = Convert.ToInt32(ddlCcartype.SelectedValue.ToString());
                myAppointment.ServiceProvider = txtServiceProvider.Text.ToString().Trim();
                myAppointment.ScheduledDate = Convert.ToDateTime(txtscheduleddate.Text.ToString());
                myAppointment.ScheduledTime = ddlCTime.SelectedValue.ToString();
                int result = myAppointment.AccessAppointment(selectedservices.Trim());
                if (result > 0)
                {
                    div_error.Visible = false;
                    Response.Redirect("~/successful.aspx");
                }
                else
                {
                    lblerror.Text = "Ooopps! Something went wrong!" + result.ToString();
                    div_error.Visible = true;
                }
            }
        }
        catch (Exception error)
        {
            lblerror.Text = error.Message.ToString();
            div_error.Visible = true;
        }
    
    }
    protected void gvInterior_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowType == DataControlRowType.DataRow))
        {
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#76777a'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
        }
    }
}