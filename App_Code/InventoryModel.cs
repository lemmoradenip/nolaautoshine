
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
/// Summary description for Inventory
/// </summary>
public class InventoryModel
{
    DBUtil dbutil = new DBUtil();//new instance
    /*vendor*/
    private int vendorid;
    private string vendorname;
    private string phone;
    private string contactperson;
    private string address;

    /*items*/
    private int materialid;
    private string itemno;
    private string productname;
    private DateTime receiveddate;
    private int qtyreceived;
    private decimal unitprice;
    private string username;
    private string invoiceno;
    private string notes;
    private decimal amountreceive;
    private string uom;

    /*services*/
    private int id;
    private string title;
    private decimal amount;
    private string vehicletype;

    public InventoryModel()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int VendorId
    {
        get { return this.vendorid; }
        set { this.vendorid = value; }
    }
    public string VendorName
    {
        get { return this.vendorname; }
        set { this.vendorname = value; }
    }
    public string Phone
    {
        get { return this.phone; }
        set { this.phone = value; }
    }
    public string ContactPerson
    {
        get { return this.contactperson; }
        set { this.contactperson = value; }
    }
    public string Address
    {
        get { return this.address; }
        set { this.address = value; }
    }
    /*Items property*/
    public int Materialid
    {
        get { return this.materialid; }
        set { this.materialid = value; }
    }
    public string Itemno
    {
        get { return this.itemno; }
        set { this.itemno = value; }
    }
    public string ProductName
    {
        get { return this.productname; }
        set { this.productname = value; }
    }
    public DateTime Receiveddate
    {
        get { return this.receiveddate; }
        set { this.receiveddate = value; }
    }
    public int Qtyreceived
    {
        get { return this.qtyreceived; }
        set { this.qtyreceived = value; }
    }
    public decimal UnitPrice
    {
        get { return this.unitprice; }
        set { this.unitprice = value; }
    }
    public string Username
    {
        get { return this.username; }
        set { this.username = value; }
    }
    public string InvoiceNo
    {
        get { return this.invoiceno; }
        set { this.invoiceno = value; }
    }
    public string Notes
    {
        get { return this.notes; }
        set { this.notes = value; }
    }
    public decimal AmountReceive
    {
        get { return this.amountreceive; }
        set { this.amountreceive = value; }
    }
    public string UOM
    {
        get { return this.uom; }
        set { this.uom = value; }
    }
    /*services property*/
    public int Id
    {
        get { return this.id; }
        set { this.id = value; }
    }
    public string Title
    {
        get { return this.title; }
        set { this.title = value; }
    }
    public decimal Amount
    {
        get { return this.amount; }
        set { this.amount = value; }
    }
    public string VehicleType
    {
        get { return this.vehicletype; }
        set { this.vehicletype = value; }
    }

    /// <summary>
    /// 
    /// </summary>vendorid,vendorname,phone,contactperson,address
    /// <param name="commandtype"></param>
    /// <returns>int</returns>
    public int Access_Vendor(string commandtype)
    {
        SqlCommand sqlcmd = new SqlCommand("usp_Access_Vendor");
        sqlcmd.CommandType = CommandType.StoredProcedure;
        sqlcmd.Parameters.AddWithValue("@commandtype", commandtype);//d=delete, i/u is null
        sqlcmd.Parameters.AddWithValue("@vendorid", this.vendorid);
        sqlcmd.Parameters.AddWithValue("@vendorname", this.vendorname);
        sqlcmd.Parameters.AddWithValue("@phone", this.phone);
        sqlcmd.Parameters.AddWithValue("@contactperson", this.contactperson);
        sqlcmd.Parameters.AddWithValue("@address", this.address);
        return dbutil.ExecuteNonQuery(sqlcmd);

    }

    public int Access_Item(string commandtype)
    {
        SqlCommand sqlcmd = new SqlCommand("usp_Access_Item");
        sqlcmd.CommandType = CommandType.StoredProcedure;
        sqlcmd.Parameters.AddWithValue("@commandtype", commandtype);//d=delete, i/u is null
        sqlcmd.Parameters.AddWithValue("@materialid", this.materialid);
        sqlcmd.Parameters.AddWithValue("@itemno", this.itemno);
        sqlcmd.Parameters.AddWithValue("@productname", this.productname);
        sqlcmd.Parameters.AddWithValue("@receiveddate", this.receiveddate);
        sqlcmd.Parameters.AddWithValue("@unitprice", this.unitprice);
        sqlcmd.Parameters.AddWithValue("@vendorid", this.vendorid);
        sqlcmd.Parameters.AddWithValue("@username", this.username);
        sqlcmd.Parameters.AddWithValue("@invoiceno", this.invoiceno);
        sqlcmd.Parameters.AddWithValue("@notes", this.notes);
        sqlcmd.Parameters.AddWithValue("@amountreceive", this.amountreceive);
        sqlcmd.Parameters.AddWithValue("@uom", this.uom);
        sqlcmd.Parameters.AddWithValue("@qtyreceive", this.qtyreceived);

        return dbutil.ExecuteNonQuery(sqlcmd);
    }
    /// <summary>
    /// delete item using materialid
    /// </summary>
    /// <returns></returns>
    public int Delete_Item()
    {
        SqlCommand sqlcmd = new SqlCommand("usp_Access_Item");
        sqlcmd.CommandType = CommandType.StoredProcedure;
        sqlcmd.Parameters.AddWithValue("@commandtype", "d");//d=delete, i/u is null
        sqlcmd.Parameters.AddWithValue("@materialid", this.materialid);
        return dbutil.ExecuteNonQuery(sqlcmd);

    }
    /// <summary>
    /// Generate vendor number series
    /// </summary>
    /// <returns></returns>
    public string GenerateVendorId()
    {
        string returnval;
        try
        {
            DataTable dt = dbutil.GetData("select top 1 id+1 from vendor order by id desc", "GenerateVendorId");
            returnval = (dt.Rows.Count > 0 ? dt.Rows[0][0].ToString().PadLeft(4, '0') : dt.Rows.Count.ToString());
        }
        catch (Exception ex)
        {
            throw new Exception("GenerateVendorId:" + ex.Message);
        }
        return returnval;
    }


    /// <summary>
    /// Fille parameter title,amount,vehicletype
    /// </summary>
    /// <param name="commandtype"></param>
    /// <returns>int</returns>
    public int Access_services(string commandtype)
    {
        SqlCommand sqlcmd = new SqlCommand("usp_Services");
        sqlcmd.CommandType = CommandType.StoredProcedure;
        sqlcmd.Parameters.AddWithValue("@commandtype", commandtype);//d=delete, i/u is null
        sqlcmd.Parameters.AddWithValue("@id", this.id);
        sqlcmd.Parameters.AddWithValue("@title", this.title);
        sqlcmd.Parameters.AddWithValue("@amount", this.amount);
        sqlcmd.Parameters.AddWithValue("@vehicletype", this.vehicletype);        
        return dbutil.ExecuteNonQuery(sqlcmd);

    }
}