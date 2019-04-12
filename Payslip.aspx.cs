using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class PrintPaySlip : System.Web.UI.Page
{
    DBUtil dbutil = new DBUtil();
    string empid, month;
    protected void Page_Load(object sender, EventArgs e)
    {
     
        empid = Request.QueryString["id"];
        month = Request.QueryString["S"];
        
        if (!IsPostBack)
        {
            lblmonthhead.Text = month;
            BindSlip();
        }
    }
    protected void gv_services_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowType == DataControlRowType.DataRow))
        {
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#76777a'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
        }
    }

    
    public void BindSlip()
    {
        try
        {
            string qry = String.Format("SELECT TOP 1 id,employeeid,name,emp_job,ssn,paytype,rate,otrate,workedhrs,othrs,payschedule,totalregular,totalovertime,totalsalary,departmentname,email,emp_phone,emp_address,hireddate  from PayrollTransaction_V where ID={0} and payschedule='{1}'", this.empid,this.month);
            DataTable dt = dbutil.GetData(qry, "BindInvoiceHeader()");
            if (dt.Rows.Count > 0)
            {
                //column index
                string currency = "  USD";
                int id=0, employeeid=1, name=2, emp_job=3, ssn=4, paytype=5, rate=6, otrate=7, workedhrs=8, othrs=9, payschedule=10, totalregular=11, totalovertime=12, totalsalary=12,departmentname=13,email=14,emp_phone=15, emp_address=16,hireddate=17;
                // String.Format("{0:#,##0.##}", payment.TotalPayment());
                lblEmployeeId.Text = empid.PadLeft(4, '0');
                lblemployeename.Text = dt.Rows[0][name].ToString();
                lbldate.Text = month + DateTime.Now.Year.ToString();
                lblpaytype.Text = dt.Rows[0][paytype].ToString();
                lbldepartment.Text = dt.Rows[0][departmentname].ToString();
                lblrate.Text = String.Format("{0:#,##0.##}", Convert.ToDecimal( dt.Rows[0][rate].ToString()))+currency;
                lbljob.Text = dt.Rows[0][emp_job].ToString();
                lblworkedhrs.Text = String.Format("{0:#,##0.##}", Convert.ToDecimal(dt.Rows[0][workedhrs].ToString()));
                lblSSNo.Text = dt.Rows[0][ssn].ToString();
                lblOTRate.Text = String.Format("{0:#,##0.##}", Convert.ToDecimal(dt.Rows[0][otrate].ToString())) + currency;
                lblemail.Text = dt.Rows[0][email].ToString();
                lblothours.Text = String.Format("{0:#,##0.##}", Convert.ToDecimal(dt.Rows[0][othrs].ToString()));
                lblPhone.Text = dt.Rows[0][emp_phone].ToString();
                lbladdress.Text = dt.Rows[0][emp_address].ToString();
                lblTotalOT.Text = String.Format("{0:#,##0.##}", Convert.ToDecimal(dt.Rows[0][totalovertime].ToString())) + currency;
                lbltotalregular.Text = String.Format("{0:#,##0.##}", Convert.ToDecimal(dt.Rows[0][totalregular].ToString())) + currency;
                lblhireddate.Text = dt.Rows[0][hireddate].ToString();
                lblsalary.Text = String.Format("{0:#,##0.##}", Convert.ToDecimal(dt.Rows[0][totalsalary].ToString())) + currency;


            }
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
            div_error.Visible = true;
        }
    }
   
}