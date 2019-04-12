
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
/// Summary description for Appointment
/// </summary>
public class AppointmentModel
{
    private int customerid;
    private string lname;
    private string fname;
    private string mobile;
    private string email;
    private int carmodel;
    private string serviceprovider;
    private DateTime scheduleddate;
    private string address;
    private string scheduledtime;
    private string vehicletype;
    private string vehiclecolor;
    private string vehiclemodel;
    DBUtil dbutil = new DBUtil();
    public AppointmentModel()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public int CustomerId {
        get { return this.customerid; }
        set { this.customerid = value; }
    }
    public string VehicleType
    {
        get { return this.vehicletype; }
        set { this.vehicletype = value; }
    }
    public string Lname
    {
        get { return this.lname; }
        set { this.lname = value; }
    }
    public string Fname
    {
        get { return this.fname; }
        set { this.fname = value; }
    }
    public string Mobile
    {
        get { return this.mobile; }
        set { this.mobile = value; }
    }
    public string Email
    {
        get { return this.email; }
        set { this.email = value; }
    }
    public int Carmodel
    {
        get { return this.carmodel; }
        set { this.carmodel = value; }
    }
    public string ServiceProvider
    {
        get { return this.serviceprovider; }
        set { this.serviceprovider = value; }
    }
    public DateTime ScheduledDate
    {
        get { return this.scheduleddate; }
        set { this.scheduleddate = value; }
    }
    public string Address
    {
        get { return this.address; }
        set { this.address = value; }
    }
    public string ScheduledTime
    {
        get { return this.scheduledtime; }
        set { this.scheduledtime = value; }
    }
    public string VehicleColor
    {
        get { return this.vehiclecolor; }
        set { this.vehiclecolor = value; }
    }
    public string VehicleModel
    {
        get { return this.vehiclemodel; }
        set { this.vehiclemodel = value; }
    }
    /// <summary>
    ///fill property: @lname,@fname,@phonenumber,@email,@carmodel,@serviceprovider,GETDATE(),@scheduledate,@address,@time
    /// </summary>
    /// <param name="selectedservices">concatenated string from selected services</param>
    /// <returns>int</returns>
    public int AccessAppointment(string selectedservices)
    {
        SqlCommand sqlcmd = new SqlCommand("usp_AccessAppointment");
        sqlcmd.CommandType = CommandType.StoredProcedure;
        sqlcmd.Parameters.AddWithValue("@customerid", this.customerid);
        sqlcmd.Parameters.AddWithValue("@fname", this.fname);
        sqlcmd.Parameters.AddWithValue("@lname", this.lname);
        sqlcmd.Parameters.AddWithValue("@address", this.address);
        sqlcmd.Parameters.AddWithValue("@phonenumber", this.mobile);
        sqlcmd.Parameters.AddWithValue("@email", this.email);
        sqlcmd.Parameters.AddWithValue("@carmodel", this.carmodel);
        sqlcmd.Parameters.AddWithValue("@serviceprovider", this.serviceprovider);
        sqlcmd.Parameters.AddWithValue("@vehicletype", this.vehicletype);
        sqlcmd.Parameters.AddWithValue("@scheduledate", this.scheduleddate);
        sqlcmd.Parameters.AddWithValue("@time", this.scheduledtime);
        sqlcmd.Parameters.AddWithValue("@vehiclecolor", this.vehiclecolor);
        sqlcmd.Parameters.AddWithValue("@selectedservices", selectedservices);//concatenated string
        sqlcmd.Parameters.AddWithValue("@vehiclemodel", this.vehiclemodel);//concatenated string
        return dbutil.ExecuteNonQuery(sqlcmd);
    }


    public int DeleteAppointment(string customerid)
    {
        SqlCommand sqlcmd = new SqlCommand("usp_AccessAppointment");
        sqlcmd.CommandType = CommandType.StoredProcedure;
        sqlcmd.Parameters.AddWithValue("@customerid", Convert.ToInt32(customerid));
        sqlcmd.Parameters.AddWithValue("@commandtype", "d");//concatenated string
        return dbutil.ExecuteNonQuery(sqlcmd);
    }

    public int Jobstatus(string customerid,string jobstatus)
    {
        SqlCommand sqlcmd = new SqlCommand("usp_AccessAppointment");
        sqlcmd.CommandType = CommandType.StoredProcedure;
        sqlcmd.Parameters.AddWithValue("@customerid", Convert.ToInt32(customerid));
        sqlcmd.Parameters.AddWithValue("@commandtype", "job");//concatenated string
        sqlcmd.Parameters.AddWithValue("@jobstatus", jobstatus);//concatenated string
      
        return dbutil.ExecuteNonQuery(sqlcmd);
    }


    /// <summary>
    /// This will get customer id from mobile number registered
    /// </summary>
    /// <param name="mobile"></param>
    /// <returns></returns>
    public string GetCustomerId(string mobile)
    {
        DataTable dt = dbutil.GetData(string.Format("select top 1 id from dbo.customer where mobile='{0}'",mobile),"GetCustomerId");       
        return (dt.Rows.Count > 0 ? dt.Rows[0][0].ToString() : dt.Rows.Count.ToString());        
    }

}