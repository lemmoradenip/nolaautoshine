
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using System.Globalization;

/// <summary>
/// Summary description for Employee
/// </summary>
public class Employee
{
    DBUtil dbutil = new DBUtil();
    private int employeeid, managerid, status, departmentid;
    private decimal rate, otrate,workedhrs,othrs;
    private string emp_fname, emp_lname, emp_address, emp_phone, emp_job, email, ssn, paytype,payschedule;
    private DateTime hireddate, enddate;

    public Employee()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int EmployeeId
    {
        get { return this.employeeid; }
        set { this.employeeid = value; }
    }
    public string Emp_Fname
    {
        get { return this.emp_fname; }
        set { this.emp_fname = value; }
    }
    public string Emp_Lname
    {
        get { return this.emp_lname; }
        set { this.emp_lname = value; }
    }
    public string Emp_Address
    {
        get { return this.emp_address; }
        set { this.emp_address = value; }
    }
    public string Emp_Phone
    {
        get { return this.emp_phone; }
        set { this.emp_phone = value; }
    }
    public string Emp_Job
    {
        get { return this.emp_job; }
        set { this.emp_job = value; }
    }
    public DateTime Hireddate
    {
        get { return this.hireddate; }
        set { this.hireddate = value; }
    }
    public DateTime Endate
    {
        get { return this.enddate; }
        set { this.enddate = value; }
    }
    public int DepartmentId
    {
        get { return this.departmentid; }
        set { this.departmentid = value; }
    }
    public int ManagerId
    {
        get { return this.managerid; }
        set { this.managerid = value; }
    }
    public string Emp_Email
    {
        get { return this.email; }
        set { this.email = value; }
    }
    public string SSN
    {
        get { return this.ssn; }
        set { this.ssn = value; }
    }
    public string PayType
    {
        get { return this.paytype; }
        set { this.paytype = value; }
    }
    public decimal Rate
    {
        get { return this.rate; }
        set { this.rate = value; }
    }
    public decimal OTRate
    {
        get { return this.otrate; }
        set { this.otrate = value; }
    }
    public decimal WorkedHrs
    {
        get { return this.workedhrs; }
        set { this.workedhrs = value; }
    }
    public decimal OTWorkedHrs
    {
        get { return this.othrs; }
        set { this.othrs = value; }
    }
    public string PaySchedule
    {
        get { return this.payschedule; }
        set { this.payschedule = value; }
    }
    /// <summary>
    /// fill @Emp_Fname,@Emp_Lname,@Emp_Address,@Emp_Phone,@Emp_Job,@HiredDate,@DepartmentId,ssn,paytype,rate,otrate
    /// </summary>
    /// <param name="commandtype"></param>
    /// <returns>int</returns>
    public int Access_Employee(string commandtype)
    {
        SqlCommand sqlcmd = new SqlCommand("usp_Access_Employee");
        sqlcmd.CommandType = CommandType.StoredProcedure;
        sqlcmd.Parameters.AddWithValue("@commandtype", commandtype);//d=delete, i/u is null
        sqlcmd.Parameters.AddWithValue("@emp_lname", this.emp_lname);
        sqlcmd.Parameters.AddWithValue("@emp_fname", this.emp_fname);
        sqlcmd.Parameters.AddWithValue("@emp_address", this.emp_address);
        sqlcmd.Parameters.AddWithValue("@emp_phone", this.emp_phone);
        sqlcmd.Parameters.AddWithValue("@emp_job", this.emp_job);
        sqlcmd.Parameters.AddWithValue("@hireddate", this.hireddate);
        sqlcmd.Parameters.AddWithValue("@enddate", this.enddate);
        sqlcmd.Parameters.AddWithValue("@email", this.email);
        sqlcmd.Parameters.AddWithValue("@departmentid", this.departmentid);
        sqlcmd.Parameters.AddWithValue("@id", this.employeeid);
        sqlcmd.Parameters.AddWithValue("@SSN", this.ssn);
        sqlcmd.Parameters.AddWithValue("@Paytype", this.paytype);
        sqlcmd.Parameters.AddWithValue("@rate", this.rate);
        sqlcmd.Parameters.AddWithValue("@otrate", this.otrate);
        return dbutil.ExecuteNonQuery(sqlcmd);
    }

    public int Access_Department(string commandtype, string id, string departmentname, int managerid)
    {
        SqlCommand sqlcmd = new SqlCommand("usp_Department");
        sqlcmd.CommandType = CommandType.StoredProcedure;
        sqlcmd.Parameters.AddWithValue("@commandtype", commandtype);//d=delete, i/u is null
        sqlcmd.Parameters.AddWithValue("@id", id);//d=delete, i/u is null
        sqlcmd.Parameters.AddWithValue("@departmentname", departmentname);
        sqlcmd.Parameters.AddWithValue("@managerid", managerid);
        return dbutil.ExecuteNonQuery(sqlcmd);
    }

    /// <summary>
    /// id,employeeid,payschedule,workedhrs,ot
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public int Access_PayrollTransaction(string id)
    {
        SqlCommand sqlcmd = new SqlCommand("usp_AccessPayrollTransaction");
        sqlcmd.CommandType = CommandType.StoredProcedure;
        sqlcmd.Parameters.AddWithValue("@id",id);//d=delete, i/u is null
        sqlcmd.Parameters.AddWithValue("@employeeid", this.employeeid);
        sqlcmd.Parameters.AddWithValue("@payschedule", this.payschedule);
        sqlcmd.Parameters.AddWithValue("@workedhrs", this.workedhrs);
        sqlcmd.Parameters.AddWithValue("@ot", this.othrs);
        return dbutil.ExecuteNonQuery(sqlcmd);
    }

    public int Delete_Employee(int employeeid)
    {
        SqlCommand sqlcmd = new SqlCommand("usp_Access_Employee");
        sqlcmd.CommandType = CommandType.StoredProcedure;
        sqlcmd.Parameters.AddWithValue("@commandtype", "d");//d=delete, i/u is null     
        sqlcmd.Parameters.AddWithValue("@id", employeeid);
        return dbutil.ExecuteNonQuery(sqlcmd);
    }


    public string GenerateEmployeeId()
    {
        string returnval;
        try
        {
            DataTable dt = dbutil.GetData("select top 1 employeeid+1 from employee order by employeeid desc", "GenerateEmployeeId");
            returnval = (dt.Rows.Count > 0 ? dt.Rows[0][0].ToString().PadLeft(4, '0') : "0001");
        }
        catch (Exception ex)
        {
            throw new Exception("Access_Employee:" + ex.Message);
        }
        return returnval;
    }

}