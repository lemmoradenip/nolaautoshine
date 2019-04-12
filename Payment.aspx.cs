using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Payments : System.Web.UI.Page
{
    Payment payment = new Payment();
    DBUtil dbutil = new DBUtil();

    protected void Page_Load(object sender, EventArgs e)
    {
        string customerid;
        customerid = Request.QueryString["id"];
        lblcustomerid.Text = customerid;
        ddlcardtype.Focus();

    }

  /// <summary>
  /// Event handler for the payments
  /// </summary>
  /// <param name="sender"></param>
  /// <param name="e"></param>
    protected void btnpay_Click(object sender, EventArgs e)
    {
        try
        {
            string qry = String.Format("SELECT top 1  invoiceno,invoicedate,billtocustomer,billtoaddr,servicedate,vehicletype,carmake,currency,invoicenetamount "
           + " FROM Checkout_V WHERE ispaid is null and Customerid ={0} ", lblcustomerid.Text.ToString());
            DataTable dt = dbutil.GetData(qry, "BindInvoiceHeader()");

            int invoiceno = 0, invoicedate = 1, billtocustomer = 2, billtoaddr = 3, servicedate = 4, vehicletype = 5, carmake = 6, currency = 7, invoicenetamount = 8;

            //no worries not to supply all parameter for they have default null values
            payment.Amount = Convert.ToDecimal(dt.Rows[0][invoicenetamount]);
            payment.PaymentMethod = "CARD";
            payment.Username = "[session]";
            payment.PaymentSource = "ONLINE";
            payment.CardHolderName = txtcardholdername.Text.ToString();
            payment.CardNumber = txtcardnumber.Text.ToString();
            payment.CardType = ddlcardtype.SelectedValue.ToString();
            payment.CVC = txtCVC.Text.ToString();
            payment.ExpirationDate = txtExpirationdate.Text.ToString();

            int affectedrecords = payment.MakePayment(lblcustomerid.Text.ToString(), dt.Rows[0][invoiceno].ToString().PadLeft(4, '0'));
            if (affectedrecords > 0)
            {
                //print invoice via crystall report on _self , that means posted transactions
                lblerror.Text = string.Empty;
                div_error.Visible = false;
                Response.Redirect("~/successful.aspx");//THANK YOU Page
            }
            else
            {
                //error message
                lblerror.Text = "Oopps! Something wen't wrong during saving!Contact your SysAdmin";
                div_error.Visible = true;
            }
            lblerror.Text = affectedrecords.ToString();
            div_error.Visible = true;
        }
        catch (Exception ex)//catch error during run time
        {
            lblerror.Text = ex.Message.ToString();
            div_error.Visible = true;
        }
    }
}