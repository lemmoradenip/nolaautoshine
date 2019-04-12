
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
/// Summary description for Payment
/// </summary>
public class Payment
{
    private int id;
    private string username;
    private decimal amount;
    private string paymentmethod;
    private string paymentsource;
    private string cardtype;
    private string cardholdername;
    private string cardnumber;
    private string expirationdate;
    private string cvc;
    private string ip;
    private string checkbank;
    private string checkseries;
    private string month;

    DBUtil dbutil = new DBUtil();
    public Payment()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    /// <summary>
    /// Selected Services Id
    /// </summary>
    public int Id
    {
        get { return this.id; }
        set { this.id = value; }
    }

    public string Username
    {
        get { return this.username; }
        set { this.username = value; }
    }
    public decimal Amount
    {
        get { return this.amount; }
        set { this.amount = value; }
    }
    public string PaymentMethod
    {
        get { return this.paymentmethod; }
        set { this.paymentmethod = value; }
    }

    public string PaymentSource
    {
        get { return this.paymentsource; }
        set { this.paymentsource = value; }
    }

    public string CardType
    {
        get { return this.cardtype; }
        set { this.cardtype = value; }
    }

    public string CardHolderName
    {
        get { return this.cardholdername; }
        set { this.cardholdername = value; }
    }

    public string CardNumber
    {
        get { return this.cardnumber; }
        set { this.cardnumber = value; }
    }

    public string ExpirationDate
    {
        get { return this.expirationdate; }
        set { this.expirationdate = value; }
    }

    public string CVC
    {
        get { return this.cvc; }
        set { this.cvc = value; }
    }

    public string IP
    {
        get { return this.ip; }
        set { this.ip = value; }
    }

    public string CheckBank
    {
        get { return this.checkbank; }
        set { this.checkbank = value; }
    }
    public string CheckSeries
    {
        get { return this.checkseries; }
        set { this.checkseries = value; }
    }

    public string Month
    {
        get { return this.month; }
        set { this.month = value; }
    }




    /// <summary>
    /// Update,Delete SelectedServices, supply
    /// </summary>
    /// <param name="id"></param>
    /// <returns>int</returns>
    public int AccessSelectedServices(int id)
    {
        SqlCommand sqlcmd = new SqlCommand("usp_AccessSelectedService");
        sqlcmd.CommandType = CommandType.StoredProcedure;
        sqlcmd.Parameters.AddWithValue("@id", id);
        sqlcmd.Parameters.AddWithValue("@username", this.username);
        return dbutil.ExecuteNonQuery(sqlcmd);

    }

    /// <summary>
    ///  fill id,customerid,amount,paymentmethod,username,paymentsource,cardtype,cardholdername,cardnumber,expirationdate,cvc,ip,invoicenumber,checkbank,checkseries,username
    /// </summary>
    /// <param name="customerid"></param>
    /// <param name="invoicenumber"></param>
    /// <returns>int</returns>
 
    public int MakePayment(string customerid, string invoicenumber)
    {
        SqlCommand sqlcmd = new SqlCommand("usp_MakePayment");
        sqlcmd.CommandType = CommandType.StoredProcedure;
        sqlcmd.Parameters.AddWithValue("@paymentid", id);
        sqlcmd.Parameters.AddWithValue("@customerid", customerid);
        sqlcmd.Parameters.AddWithValue("@amountreceived", this.amount);
        sqlcmd.Parameters.AddWithValue("@paymentmethod", this.paymentmethod);
        sqlcmd.Parameters.AddWithValue("@username", this.username);
        sqlcmd.Parameters.AddWithValue("@paymentsource", this.paymentsource);
        sqlcmd.Parameters.AddWithValue("@cardtype", this.cardtype);
        sqlcmd.Parameters.AddWithValue("@cardholdername", this.cardholdername);
        sqlcmd.Parameters.AddWithValue("@cardnumber", this.cardnumber);
        sqlcmd.Parameters.AddWithValue("@expirationdate", this.expirationdate);
        sqlcmd.Parameters.AddWithValue("@cvc", this.cvc);
        sqlcmd.Parameters.AddWithValue("@ip", HttpContext.Current.Request.UserHostAddress.ToString());//get machine ip for auditing
        sqlcmd.Parameters.AddWithValue("@invoicenumber", invoicenumber);
        sqlcmd.Parameters.AddWithValue("@checkbank", this.checkbank);
        sqlcmd.Parameters.AddWithValue("@checkseries", this.checkseries);
        return dbutil.ExecuteNonQuery(sqlcmd);

    }

    public decimal TotalPayment()
    {
        string returnval="0";
        try
        {
            DataTable dt = dbutil.GetData(string.Format("SELECT SUM(isnull(amountofcashreceived,invoiceamount)) FROM dbo.PaymentTransaction where UPPER(DATENAME(month,paymentdate))='{0}'", this.month), "TotalPayment");
            returnval = (dt.Rows.Count > 0 ? dt.Rows[0][0].ToString() : "0");
        }
        catch (Exception ex)
        {
            throw new Exception("TotalPayment:" + ex.Message);
        }
        return Convert.ToDecimal((returnval==string.Empty?"0":returnval));
    }

    public decimal TotalInventory()
    {
        string returnval = "0";
        try
        {
            DataTable dt = dbutil.GetData(string.Format("select SUM(unitprice*qtyreceive) from Inventory where UPPER(DATENAME(month,receiveddate))='{0}'", this.month), "TotalPayment");
            returnval = (dt.Rows.Count > 0 ? dt.Rows[0][0].ToString() : "0");
        }
        catch (Exception ex)
        {
            throw new Exception("TotalInventory:" + ex.Message);
        }
        return Convert.ToDecimal((returnval == string.Empty ? "0" : returnval));
    }
    public decimal TotalPayroll()
    {
        string returnval = "0";
        try
        {
            DataTable dt = dbutil.GetData(string.Format("select sum(totalsalary) from payrolltransaction_v where payschedule = '{0}'", this.month), "TotalPayment");
            returnval = (dt.Rows.Count > 0 ? dt.Rows[0][0].ToString() : "0");
        }
        catch (Exception ex)
        {
            throw new Exception("TotalPayroll:" + ex.Message);
        }
        return Convert.ToDecimal((returnval == string.Empty ? "0" : returnval));
    }

    public decimal TotalSalary()
    {
        return TotalPayment() - (TotalPayroll() + TotalInventory());

    }

}