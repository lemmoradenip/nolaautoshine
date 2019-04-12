using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Print : System.Web.UI.Page
{
    DBUtil dbutil = new DBUtil();
    AppointmentModel myappointment = new AppointmentModel();
    protected void Page_Load(object sender, EventArgs e)
    {
        string customerid;
        customerid = Request.QueryString["id"];
        lbljobid.Text = customerid;
        BindInvoiceHeader();
        BindSelectServicesData();
    }
    protected void gv_services_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowType == DataControlRowType.DataRow))
        {
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#76777a'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
        }
    }

    public void BindSelectServicesData()
    {
        try
        {

            string qry = string.Format("SELECT * FROM SELECTEDSERVICES_V WHERE ispaid is null and Customerid={0}  ORDER BY Services", lbljobid.Text.ToString());
            DataTable dt = dbutil.GetData(qry, "BindSelectServicesData()");
            gv_services.DataSource = dt;
            gv_services.DataBind();

        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
            div_error.Visible = true;
        }
    }
    public void BindInvoiceHeader()
    {
        try
        {
            string qry = String.Format("SELECT TOP 1000 [id],[Name],[Mobile],[Email],[carmake],[ScheduledDate],[ScheduledTime],[Address],[CreatedDate],case when Ispaid=1 then 'PAID' ELSE 'UNPAID' END,[VehicleType],[color],[Model],jobstatus "
  + "FROM[CarWash].[dbo].[Customer_V]  where ID={0}", lbljobid.Text.ToString());
            DataTable dt = dbutil.GetData(qry, "BindInvoiceHeader()");
            if (dt.Rows.Count > 0)
            {
                //column index
                int id = 0,
                   name = 1,
                   mobile = 2,
                   email = 3,
                   carmake = 4,
                   scheduleddate = 5,
                   scheduledtime = 6,
                   address = 7,
                   createddate = 8,
                   ispaid = 9,
                   vehicletype = 10,
                   color = 11,
                   modle = 12,
                   jobstatus = 13;

                // lbljobid.Text = dt.Rows[0][id].ToString();
                lblscheduleddate.Text = Convert.ToDateTime(dt.Rows[0][scheduleddate]).ToLongDateString();
                lblcustomername.Text = "MR/MS.  " + dt.Rows[0][name].ToString();
                lblscheduledtime.Text = dt.Rows[0][scheduledtime].ToString();
                lbladdress.Text = dt.Rows[0][address].ToString();
                lblvehiclemake.Text = dt.Rows[0][carmake].ToString();
                lblmobile.Text = dt.Rows[0][mobile].ToString();
                lblmodel.Text = dt.Rows[0][modle].ToString();
                lblemail.Text = dt.Rows[0][email].ToString();
                lblcolor.Text = dt.Rows[0][color].ToString();
                lblvehicletype.Text = dt.Rows[0][vehicletype].ToString();
                LBLsysdate.Text = DateTime.Now.ToLongDateString();
                LBLPAID.Text = dt.Rows[0][ispaid].ToString();
                if (dt.Rows[0][jobstatus].ToString() != string.Empty)
                {
                    if (dt.Rows[0][jobstatus].ToString() == "DONE" || dt.Rows[0][jobstatus].ToString() == "UNDONE")
                    {
                        btndone.Visible = false;
                        btnundone.Visible = false;
                        lblstatus.Text = dt.Rows[0][jobstatus].ToString();
                    }

                    else
                    {
                        btndone.Visible = true;
                        btnundone.Visible = true;
                    }
                }
                else
                {
                    btndone.Visible = true;
                    btnundone.Visible = true;
                }
            }
        }
        catch (Exception ex)
        {
            //lblerror.Text = ex.Message.ToString();
            //div_error.Visible = true;
        }
    }
    protected void lnkremove_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        GridViewRow row = (GridViewRow)btn.NamingContainer;
        int i = Convert.ToInt32(row.RowIndex);
        string custreservationid = gv_services.Rows[i].Cells[0].Text.ToString();

        //payment.Username = "undefined";
        //int updatedrecords = payment.AccessSelectedServices(Convert.ToInt32(custreservationid));
        //gv_services.DataSourceID = "sds_services";
        //gv_services.DataBind();
        //put here the code for void
        // ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Openwindow", string.Format("window.open('confirmationpage.aspx?rn=1"), true);

    }


    protected void btndone_Click(object sender, EventArgs e)
    {
        try
        {
            string custreservationid = lbljobid.Text.ToString();
            int affectedrow = myappointment.Jobstatus(custreservationid, "DONE");
            if (affectedrow > 0)
            {
                btndone.Visible = false;
                btnundone.Visible = false;
                lblstatus.Text = "DONE";
                btndone.Enabled = false;
                btnundone.Enabled = false;
                div_error.Visible = false;
            }
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
            div_error.Visible = true;
        }
    }

    protected void btnundone_Click(object sender, EventArgs e)
    {
        try
        {
            string custreservationid = lbljobid.Text.ToString();
            int affectedrow = myappointment.Jobstatus(custreservationid, "UNDONE");
            if (affectedrow > 0)
            {
                btndone.Visible = false;
                btnundone.Visible = false;
                lblstatus.Text = "UNDONE";
                btndone.Enabled = false;
                btnundone.Enabled = false;
                div_error.Visible = false;
            }
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
            div_error.Visible = true;
        }
    }
}