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
    protected void Page_Load(object sender, EventArgs e)
    {
        //Postback happen when the page refresh
        if (!IsPostBack)
        {

            Cryptor validate = new Cryptor();
            string usernamesession = (string)(Session["username"]);
          //  hfusername.Text = usernamesession;
            if (validate.ValidateAccessLevel(usernamesession) == 0)
            {
                Response.Write("<script>alert('Sorry you do not have access here!');</script>");
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
            string qry = "SELECT * FROM Department ORDER BY id desc";
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

            if (txtdepartmentname.Text.ToString().Trim() == string.Empty)
            { throw new Exception("Department Name is required"); }
            else if (txtmanagerid.Text.ToString().Trim() == string.Empty)
            { throw new Exception("Manager Id is required"); }
            else
            {
                //if param empty either update if record exist else create new ,check stored procedure if needed

                int affectedrecords = employeemodel.Access_Department(string.Empty, txtEmployeeId.Text.ToString(), txtdepartmentname.Text.ToString(), Convert.ToInt32(txtmanagerid.Text.ToString()));
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
            txtdepartmentname.Text = string.Empty;
            txtmanagerid.Text = string.Empty;
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
            int CDepartmentid=0,Cdepartmentname=1,CManagerid=2; //Column index

            string qry = string.Format("select top 1 id,departmentname,managerid from department where id={0}", employeeid);
            DataTable dt = dbutil.GetData(qry, "lnkView_Click");
            //fill the employee header data section
            txtEmployeeId.Text = employeeid.PadLeft(4, '0');
          txtdepartmentname.Text = dt.Rows[0][Cdepartmentname].ToString();
            txtmanagerid.Text = dt.Rows[0][CManagerid].ToString();
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
            string departmentid = gv_employees.Rows[i].Cells[0].Text.ToString();
            int affectedrecords = employeemodel.Access_Department("d", departmentid, string.Empty,0);
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