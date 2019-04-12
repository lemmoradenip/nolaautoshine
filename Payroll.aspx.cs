using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Payroll : System.Web.UI.Page
{
    DBUtil dbutil = new DBUtil();
    Cryptor validate = new Cryptor();
    Employee employeemodel = new Employee();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlpayschedule.SelectedValue = DateTime.Now.ToString("MMMM").ToUpper();//to select current month
            BindData();
            string usernamesession = (string)(Session["username"]);
            //   hfusername.Text = "*" + usernamesession + validate.ValidateAccessLevel(usernamesession).ToString();
            if (validate.ValidateAccessLevel(usernamesession) != 1)
            {
                Response.Write("<script>confirm('Access Denied! Go back to previous page!   ');</script>");
                Response.Redirect("~/Reservations.aspx");
            }
      
           
        }

    }

    protected void gv_employees_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowType == DataControlRowType.DataRow))
        {
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#76777a'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
            int cID = 0, cEmployeeId = 1, cName = 2, cEmp_Job = 3, cPayType = 4, cRate = 5, cWorkedHrs = 6, cOTRate = 7, cOTcWorkedHrs = 8, cTotSalary = 9, cBtnSave = 10, cBtnPrint = 11;


            //if (e.Row.Cells[cWorkedHrs].Text.ToString() != string)
            //{
            //    LinkButton lnkpay = (LinkButton)e.Row.FindControl("lnkbtnsave");
            //    lnkpay.Text = "UPDATE";
            //    lnkpay.ForeColor = System.Drawing.Color.OrangeRed;

            //}

        }
    }
    private void BindData()
    {
        try
        {
            string qry = String.Format("SELECT * FROM PayrollTransaction_V WHERE PAYSCHEDULE='{0}' and transactionyear='{1}'",ddlpayschedule.SelectedValue.ToString(),ddlyear.SelectedValue.ToString());
            //+ (txtscheduleddate.Text.ToString().Trim() != string.Empty ? string.Format(" and scheduleddate='{0}'", txtscheduleddate.Text.ToString()) : "")
            //+ (txtmobileno.Text.ToString().Trim() != "" ? string.Format(" and mobile='{0}'", txtmobileno.Text.ToString()) : "")
            //+ (ddltime.SelectedValue.ToString() != "" ? string.Format(" and scheduledtime='{0}'", ddltime.SelectedValue.ToString()) : "")
            //+ " order by scheduleddate";

            DataTable dt = new DataTable();
            dt = dbutil.GetData(qry, "BindData()");
            gv_employees.DataSource = dt;
            gv_employees.DataBind();
            div_error.Visible = false;

        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
            div_error.Visible = true;
        }
    }



    //protected void lnkbtnsave_Click(object sender, EventArgs e)
    //{
    //    LinkButton btn = (LinkButton)sender;

    //    GridViewRow row = (GridViewRow)btn.NamingContainer;
    //    int i = Convert.ToInt32(row.RowIndex);
    //    int cID = 0, cEmployeeId = 1, cName = 2, cEmp_Job = 3, cPayType = 4, cRate = 5, cWorkedHrs = 6, cOTRate = 7, cOTcWorkedHrs = 8, cTotSalary = 9, cBtnSave = 10, cBtnPrint = 11;

    //    string id = gv_employees.Rows[i].Cells[cID].Text.ToString();//transaction id
    //    string employeeid = gv_employees.Rows[i].Cells[cEmployeeId].Text.ToString();//transaction id
    //    string payschedule = ddlpayschedule.SelectedValue.ToString();
    //    string workedhrs = gv_employees.Rows[i].Cells[cWorkedHrs].Text.ToString();//based rate
    //    string ot = gv_employees.Rows[i].Cells[cOTcWorkedHrs].Text.ToString();//based rate

    //    try
    //    {
    //        TextBox text = (TextBox)gv_employees.FindControl("txtWorkedHrs");
    //        lblerror.Text = text.Text.ToString();
    //        div_error.Visible = true;

    //        employeemodel.EmployeeId = Convert.ToInt32(employeeid);
    //        employeemodel.PaySchedule = payschedule;
    //        employeemodel.WorkedHrs = Convert.ToDecimal(workedhrs);
    //        employeemodel.OTWorkedHrs = Convert.ToDecimal(ot);
    //        int affectedrecords = employeemodel.Access_PayrollTransaction(id);
    //        if (affectedrecords > 0)
    //        {
    //            BindData();
    //            lblerror.Text = string.Empty;
    //            div_error.Visible = false;
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        lblerror.Text = ex.Message.ToString();
    //        div_error.Visible = true;
    //    }
    //}




    protected void gv_employees_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int cID = 0, cEmployeeId = 1, cName = 2, cEmp_Job = 3, cPayType = 4, cRate = 5, cWorkedHrs = 6, cOTRate = 7, cOTcWorkedHrs = 8, cTotSalary = 9, cBtnSave = 10, cBtnPrint = 11;
        if (e.CommandName == "Save")
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gv_employees.Rows[rowIndex];
            string workedhrs = (row.FindControl("txtWorkedHrs") as TextBox).Text;
            string OTWorkedHrs = (row.FindControl("txtOTHrs") as TextBox).Text;


            string id = row.Cells[cID].Text.ToString();//transaction id
            string employeeid = row.Cells[cEmployeeId].Text.ToString();//transaction id
            string payschedule = ddlpayschedule.SelectedValue.ToString();
            //     lblerror.Text =workedhrs+"/" + OTWorkedHrs + "/" + id + "/" + employeeid + "/" + payschedule;
            div_error.Visible = true;
            try
            {
                employeemodel.EmployeeId = Convert.ToInt32(employeeid);
                employeemodel.PaySchedule = payschedule;
                employeemodel.WorkedHrs = Convert.ToDecimal((workedhrs == string.Empty ? "0" : workedhrs));
                employeemodel.OTWorkedHrs = Convert.ToDecimal((OTWorkedHrs == string.Empty ? "0" : OTWorkedHrs));
                int affectedrecords = employeemodel.Access_PayrollTransaction(id);
                if (affectedrecords > 0)
                {
                    BindData();
                    //lblerror.Text = workedhrs.ToString() + OTWorkedHrs.ToString();
                    //div_error.Visible = true;
                }
            }
            catch (Exception ex)
            {
                lblerror.Text = "SAVE COMMAND: " + ex.Message.ToString();
                div_error.Visible = true;
            }

        }
        try
        {
            if (e.CommandName == "Print")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gv_employees.Rows[rowIndex];
                string id = row.Cells[cID].Text.ToString();//transaction id
                string payschedule = ddlpayschedule.SelectedValue.ToString();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Openwindow", string.Format("window.open('payslip.aspx?id={0}&S={1}');", id, payschedule), true);//this will open new tab for payment checkout.
            }
        }
        catch (Exception ex)
        {
            lblerror.Text = "PRINT COMMAND:"+ex.Message.ToString();
            div_error.Visible = true;
        }
    }



    protected void ddlpayschedule_SelectedIndexChanged(object sender, EventArgs e)
    {
        //create series of empty transaction for the employees active in payroll
        int createdlines = employeemodel.GeneratePayrollTemporaryTransactions(ddlyear.SelectedValue.ToString(), ddlpayschedule.SelectedValue.ToString());

        BindData();
        
    }
}