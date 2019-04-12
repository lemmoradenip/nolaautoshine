using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Employees : System.Web.UI.Page
{
    DBUtil dbutil = new DBUtil();
    Employee employeemodel = new Employee();
    Cryptor validate = new Cryptor();
    protected void Page_Load(object sender, EventArgs e)
    {
        //Postback happen when the page refresh
        if (!IsPostBack)
        {

            string usernamesession = (string)(Session["username"]);
            //   hfusername.Text = "*" + usernamesession + validate.ValidateAccessLevel(usernamesession).ToString();
            if (validate.ValidateAccessLevel(usernamesession) != 1)
            {
                Response.Write("<script>confirm('Access Denied! Go back to previous page!   ');</script>");
                Response.Redirect("~/Reservations.aspx");
            }


            BindData();
            Clear();
        }

    }

    protected void gv_employees_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if ((e.Row.RowType == DataControlRowType.DataRow))
        {
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#76777a'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
        }
    }
    private void BindData()
    {
        try
        {
            string qry = "SELECT * FROM EMPLOYEE_V ORDER BY NAME";
            //+ (txtscheduleddate.Text.ToString().Trim() != string.Empty ? string.Format(" and scheduleddate='{0}'", txtscheduleddate.Text.ToString()) : "")
            //+ (txtmobileno.Text.ToString().Trim() != "" ? string.Format(" and mobile='{0}'", txtmobileno.Text.ToString()) : "")
            //+ (ddltime.SelectedValue.ToString() != "" ? string.Format(" and scheduledtime='{0}'", ddltime.SelectedValue.ToString()) : "")
            //+ " order by scheduleddate";

            DataTable dt = new DataTable();
            dt = dbutil.GetData(qry, "btnFind_Click");
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

    protected void btnsave_Click(object sender, EventArgs e)
    {
        //validate inputs
        //get employeeid
        try
        {

            if (txtFname.Text.ToString().Trim() == string.Empty)
            { throw new Exception("First Name is required"); }
            else if (txtLname.Text.ToString().Trim() == string.Empty)
            { throw new Exception("Last Name is required"); }
            else if (txtPhone.Text.ToString().Trim() == string.Empty)
            { throw new Exception("Phone/Mobile is required"); }
            else if (ddldepartment.SelectedValue == "0")
            { throw new Exception("Select a department!"); }
            else if (txtJOb.Text.ToString().Trim() == string.Empty)
            { throw new Exception("Job is required"); }
            else if (txthiringdate.Text.ToString().Trim() == string.Empty)
            { throw new Exception("Hiring date is required"); }
            else
            {
                //if param empty either update if record exist else create new ,check stored procedure if needed
                employeemodel.EmployeeId = Convert.ToInt32(txtEmployeeId.Text.ToString());
                employeemodel.Emp_Fname = txtFname.Text.ToString();
                employeemodel.Emp_Lname = txtLname.Text.ToString();
                employeemodel.Emp_Address = txtAddress.Text.ToString();
                employeemodel.Emp_Phone = txtPhone.Text.ToString();
                employeemodel.Emp_Job = txtJOb.Text.ToString();
                employeemodel.Hireddate = Convert.ToDateTime(txthiringdate.Text.ToString());
                employeemodel.Endate = (txtEnddate.Text != string.Empty ? Convert.ToDateTime(txtEnddate.Text.ToString()) : Convert.ToDateTime("1/1/1753"));
                employeemodel.DepartmentId = Convert.ToInt32(ddldepartment.SelectedValue.ToString());
                employeemodel.Emp_Email = txtemail.Text.ToString();
                employeemodel.SSN = txtSSN.Text.ToString();
                employeemodel.PayType = ddlpaytype.SelectedValue.ToString();
                employeemodel.Rate = Convert.ToDecimal(txtRate.Text.ToString());
                employeemodel.OTRate = Convert.ToDecimal(txtOtRate.Text.ToString());
                int affectedrecords = employeemodel.Access_Employee(string.Empty);
                if (affectedrecords > 0)
                {
                    //clear header fields
                    //rebind griddata
                    //show save alert
                    Response.Write("<script>alert('Saving successful!');</script>");
                    Clear();
                    BindData();
                    btnsave.Text = "CREATE";

                }
            }

        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
            div_error.Visible = true;


        }
    }
    public void Clear()
    {
        try
        {

            txtEmployeeId.Text = employeemodel.GenerateEmployeeId();
            ddldepartment.ClearSelection();
            txtFname.Text = string.Empty;
            txtJOb.Text = string.Empty;
            txtLname.Text = string.Empty;
            txthiringdate.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtEnddate.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtemail.Text = string.Empty;
            div_error.Visible = false;
            txtSSN.Text = string.Empty;
            txtRate.Text = string.Empty;
            txtOtRate.Text = string.Empty;


            txtFname.Focus();
        }
        catch (Exception ex)
        {
            lblerror.Text = "Clear() :" + ex.Message.ToString();
            div_error.Visible = true;
        }
    }

    protected void lnkView_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);

            string employeeid = gv_employees.Rows[i].Cells[0].Text.ToString();
            int Cemployeeid = 0, Cemp_fname = 1, Cemp_lname = 2, Cemp_address = 3, Cemp_phone = 4, Cemp_job = 5, Chireddate = 6, Cdeparmentid = 7, Cemail = 8,CSSN=9,CPaytype=10,CRate=11,COtrate=12; //Column index

            string qry = string.Format("select top 1 employeeid,emp_fname,emp_lname,emp_address,emp_phone,emp_job,hireddate,departmentid,email,SSN,PAYTYPE,RATE,OTRATE from employee where employeeid={0}", employeeid);
            DataTable dt = dbutil.GetData(qry, "lnkView_Click");
            //fill the employee header data section
            txtEmployeeId.Text = dt.Rows[0][Cemployeeid].ToString().PadLeft(4, '0');
            txtFname.Text = dt.Rows[0][Cemp_fname].ToString();
            txtLname.Text = dt.Rows[0][Cemp_lname].ToString();
            txtAddress.Text = dt.Rows[0][Cemp_address].ToString();
            txtPhone.Text = dt.Rows[0][Cemp_phone].ToString();
            ddldepartment.SelectedValue = dt.Rows[0][Cdeparmentid].ToString();
            txtJOb.Text = dt.Rows[0][Cemp_job].ToString();
            txthiringdate.Text = Convert.ToDateTime( dt.Rows[0][Chireddate].ToString()).ToLongDateString();
            txtemail.Text = dt.Rows[0][Cemail].ToString();
            txtSSN.Text = dt.Rows[0][CSSN].ToString();
            ddlpaytype.SelectedValue = dt.Rows[0][CPaytype].ToString();
            txtRate.Text = dt.Rows[0][CRate].ToString();
            txtOtRate.Text = dt.Rows[0][COtrate].ToString();
            btnsave.Text = "UPDATE";
            div_error.Visible = false;
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
            div_error.Visible = true;
        }
    }

    protected void lnkdelete_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);
            string employeeid = gv_employees.Rows[i].Cells[0].Text.ToString();
            int affectedrecords = employeemodel.Delete_Employee(Convert.ToInt32(employeeid));
            if (affectedrecords > 0)
            {
                BindData();
            }

        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
            div_error.Visible = true;
        }
    }
}