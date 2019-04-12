using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Accounting : System.Web.UI.Page
{
    DBUtil dbutil = new DBUtil();
    Employee employeemodel = new Employee();
    Payment payment = new Payment();
    Cryptor validate = new Cryptor();
    protected void Page_Load(object sender, EventArgs e)
    {
        string usernamesession = (string)(Session["username"]);
        if (validate.ValidateAccessLevel(usernamesession) != 1)
        {
            Response.Write("<script>confirm('Access Denied! Go back to previous page!   ');</script>");
            Response.Redirect("~/Reservations.aspx");
        }
        payment.Month = ddlpayschedule.SelectedValue.ToString();
        BindPayrollTransactions();
        BindInventoryTransactions();
        BindPaymentTransactions();

        //summary
       
        lbltotpayment.Text = String.Format("{0:#,##0.##}", payment.TotalPayment());
        lblInventory.Text = String.Format("{0:#,##0.##}", payment.TotalInventory());
        lblpayroll.Text = String.Format("{0:#,##0.##}", payment.TotalPayroll());

        lblprofit.Text = String.Format("{0:#,##0.##}", payment.TotalSalary());
    }
    protected void gv_employees_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowType == DataControlRowType.DataRow))
        {
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#76777a'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
           

        }
    }
    private void BindPayrollTransactions()
    {
        try
        {
            string qry = String.Format("SELECT * FROM PayrollTransaction_V WHERE PAYSCHEDULE='{0}' ",ddlpayschedule.SelectedValue.ToString());
            DataTable dt = new DataTable();
            dt = dbutil.GetData(qry, "BindPayrollTransactions()");
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

    private void BindPaymentTransactions()
    {
        try
        {
            string qry = String.Format("SELECT * FROM PaymentTransaction_V  where UPPER(DATENAME(month,paymentdate))='{0}'",ddlpayschedule.SelectedValue.ToString());
            //+ (txtscheduleddate.Text.ToString().Trim() != string.Empty ? string.Format(" and scheduleddate='{0}'", txtscheduleddate.Text.ToString()) : "")
            //+ (txtmobileno.Text.ToString().Trim() != "" ? string.Format(" and mobile='{0}'", txtmobileno.Text.ToString()) : "")
            //+ (ddltime.SelectedValue.ToString() != "" ? string.Format(" and scheduledtime='{0}'", ddltime.SelectedValue.ToString()) : "")
            //+ " order by scheduleddate";

            DataTable dt = new DataTable();
            dt = dbutil.GetData(qry, "BindPaymentTransactions()");
            gvpayments.DataSource = dt;
            gvpayments.DataBind();
            div_error.Visible = false;

        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
            div_error.Visible = true;
        }
    }


    private void BindInventoryTransactions()
    {
        try
        {
            string qry = String.Format("SELECT * FROM Inventory_V where UPPER(DATENAME(month,receiveddate))='{0}'", ddlpayschedule.SelectedValue.ToString());
            //+ (txtscheduleddate.Text.ToString().Trim() != string.Empty ? string.Format(" and scheduleddate='{0}'", txtscheduleddate.Text.ToString()) : "")
            //+ (txtmobileno.Text.ToString().Trim() != "" ? string.Format(" and mobile='{0}'", txtmobileno.Text.ToString()) : "")
            //+ (ddltime.SelectedValue.ToString() != "" ? string.Format(" and scheduledtime='{0}'", ddltime.SelectedValue.ToString()) : "")
            //+ " order by scheduleddate";

            DataTable dt = new DataTable();
            dt = dbutil.GetData(qry, "BindInventoryTransactions()");
            gv_inventory.DataSource = dt;
            gv_inventory.DataBind();
            div_error.Visible = false;

        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
            div_error.Visible = true;
        }
    }

    protected void gvpayments_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowType == DataControlRowType.DataRow))
        {
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#76777a'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");


        }
    }

    protected void gv_inventory_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowType == DataControlRowType.DataRow))
        {
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#76777a'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");


        }
    }
}