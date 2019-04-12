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
    Employee employeemodel = new Employee();
    protected void Page_Load(object sender, EventArgs e)
    {
        BindData();
    }

    protected void gv_employees_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowType == DataControlRowType.DataRow))
        {
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#76777a'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
            int cID = 0, cEmployeeId = 1, cName = 2, cEmp_Job = 3, cPayType = 4, cRate = 5, cWorkedHrs = 6, cOTRate = 7, cOTcWorkedHrs = 8, cTotSalary = 9, cBtnSave = 10, cBtnPrint = 11;


            if (e.Row.Cells[cID].Text.ToString() != "0")
            {
                LinkButton lnkpay = (LinkButton)e.Row.FindControl("lnkbtnsave");
                lnkpay.Text = "UPDATE";
                lnkpay.ForeColor = System.Drawing.Color.OrangeRed;

            }

        }
    }
    private void BindData()
    {
        try
        {
            string qry = "SELECT * FROM PayrollTransaction_V ";
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
        if (e.CommandName == "Save")
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gv_employees.Rows[rowIndex];
            string workedhrs = (row.FindControl("txtWorkedHrs") as TextBox).Text;
            string OTWorkedHrs = (row.FindControl("txtOTHrs") as TextBox).Text;
            int cID = 0, cEmployeeId = 1, cName = 2, cEmp_Job = 3, cPayType = 4, cRate = 5, cWorkedHrs = 6, cOTRate = 7, cOTcWorkedHrs = 8, cTotSalary = 9, cBtnSave = 10, cBtnPrint = 11;

            string id = row.Cells[cID].Text.ToString();//transaction id
            string employeeid = row.Cells[cEmployeeId].Text.ToString();//transaction id
            string payschedule = ddlpayschedule.SelectedValue.ToString();
            lblerror.Text =workedhrs+"/" + OTWorkedHrs + "/" + id + "/" + employeeid + "/" + payschedule;
            div_error.Visible = true;
            //try
            //{
            //    employeemodel.EmployeeId = Convert.ToInt32(employeeid);
            //    employeemodel.PaySchedule = payschedule;
            //    employeemodel.WorkedHrs = Convert.ToDecimal(workedhrs);
            //    employeemodel.OTWorkedHrs = Convert.ToDecimal(OTWorkedHrs);
            //    int affectedrecords = employeemodel.Access_PayrollTransaction(id);
            //    if (affectedrecords > 0)
            //    {
            //        BindData();
            //        //lblerror.Text = workedhrs.ToString() + OTWorkedHrs.ToString();
            //        //div_error.Visible = true;
            //    }
            //}
            //catch (Exception ex)
            //{
            //    lblerror.Text = ex.Message.ToString() + workedhrs;
            //    div_error.Visible = true;
            //}

        }
    }
}