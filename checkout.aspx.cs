using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Checkout : System.Web.UI.Page
{
    Payment payment = new Payment();
    DBUtil dbutil = new DBUtil();
    string customerid;
    protected void Page_Load(object sender, EventArgs e)
    {
        customerid = Request.QueryString["id"];
        //Bind header data
        BindInvoiceHeader();
        //Bind selected data
        BindSelectServicesData();
    }



    protected void gv_services_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowType == DataControlRowType.DataRow))
        {
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#76777a'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
        }
    }

    protected void lnkremove_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        GridViewRow row = (GridViewRow)btn.NamingContainer;
        int i = Convert.ToInt32(row.RowIndex);
        string custreservationid = gv_services.Rows[i].Cells[0].Text.ToString();

        payment.Username = "undefined";
        int updatedrecords = payment.AccessSelectedServices(Convert.ToInt32(custreservationid));
        gv_services.DataSourceID = "sds_services";
        gv_services.DataBind();
        //put here the code for void
        // ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Openwindow", string.Format("window.open('confirmationpage.aspx?rn=1"), true);

    }


    public void BindSelectServicesData()
    {
        string qry = String.Format("SELECT * FROM SELECTEDSERVICES_V WHERE  Customerid ={0} ORDER BY Services", customerid);
        DataTable dt = dbutil.GetData(qry, "BindData()");
        gv_services.DataSource = dt;
        gv_services.DataBind();
    }
    public void BindInvoiceHeader()
    {
        try
        {
            string qry = String.Format("SELECT top 1  invoiceno,invoicedate,billtocustomer,billtoaddr,servicedate,vehicletype,carmake,currency,invoicenetamount "
            + " FROM Checkout_V WHERE  Customerid ={0} ", this.customerid);
            DataTable dt = dbutil.GetData(qry, "BindData()");
            if (dt.Rows.Count > 0)
            {
                //column index
                int invoiceno = 0,
                   invoicedate = 1,
                   billtocustomer = 2,
                   billtoaddr = 3,
                   servicedate = 4,
                   vehicletype = 5,
                   carmake = 6,
                   currency = 7,
                   invoicenetamount = 8;

                lblinvoice.Text = dt.Rows[0][invoiceno].ToString().PadLeft(4, '0');
                txtInvoicenetamount.Text = String.Format("{0:#,##0.##}", dt.Rows[0][invoicenetamount].ToString());
                lblInvoicedate.Text = dt.Rows[0][invoicedate].ToString();
                lblcustomername.Text = dt.Rows[0][billtocustomer].ToString();
                lblbilltoaddr.Text = dt.Rows[0][billtoaddr].ToString();
                lblservicedate.Text = dt.Rows[0][servicedate].ToString();
                lblvehicletype.Text = dt.Rows[0][vehicletype].ToString();
                lblvehiclemake.Text = dt.Rows[0][carmake].ToString();
                lblcurrency.Text = dt.Rows[0][currency].ToString();
                txtinvoiceamount.Text = String.Format("{0:#,##0.##}", dt.Rows[0][invoicenetamount].ToString());

                lblerror.Text = string.Empty;
                div_error.Visible = false;
            }
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
            div_error.Visible = true;
        }
    }


    protected void txtAmountReceived_TextChanged(object sender, EventArgs e)
    {
        //do balance here
        if (txtAmountReceived.Text.ToString().Trim() != string.Empty)
        {
            decimal balance = Convert.ToDecimal(txtinvoiceamount.Text.ToString()) - Convert.ToDecimal(txtAmountReceived.Text.ToString());
            //lblchanged.Text = balance.ToString("D");
            lblchanged.Text = String.Format("{0:#,##0.##}", balance);
        }
        else
        { lblchanged.Text = "--"; }
    }
    protected void ddlpaymentmode_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlpaymentmode.SelectedValue == "CARD")
        {
            txtAmountReceived.Enabled = false;
            txtAmountReceived.BackColor = System.Drawing.Color.LightGray;
            btnpay.Text = "PAY";
        }
        else if (ddlpaymentmode.SelectedValue == "CHECK")
        {
            txtAmountReceived.BackColor = System.Drawing.Color.LightGray;
            btnpay.Text = "NEXT";
        }
        else
        {
            txtAmountReceived.Enabled = true;
            txtAmountReceived.BackColor = System.Drawing.Color.Yellow;
            btnpay.Text = "PAY";
        }
    }
    protected void btnpay_Click(object sender, EventArgs e)
    {
        try
        {
            if (ddlpaymentmode.SelectedValue.ToString() == "CHECK")
            {
                string custreservationid = string.Empty;//gv_reservations.Rows[i].Cells[0].Text.ToString();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Openwindow", string.Format("window.open('cheque.aspx?id={0}');", custreservationid), true);//this will open new tab for payment checkout.
            }

            else //if cash amount received is required else card is being swiped by preconfigured POS, which means it's auto debit to bank account given.
            {
                payment.Amount = Convert.ToDecimal(txtAmountReceived.Text.ToString());
                payment.PaymentMethod = ddlpaymentmode.SelectedValue.ToString();
                payment.Username = "[session]";
                payment.PaymentSource = string.Format("CASHIER#{0}", "01");// just concatenate which CASHIER No. example CASHIER#10
                int affectedrecords = payment.MakePayment(customerid, lblinvoice.Text.ToString());
                if (affectedrecords > 0)
                {
                    //print invoice via crystall report on _self , that means posted transactions
                    lblerror.Text = string.Empty;
                    div_error.Visible = false;
                }
                else
                {
                    //error message
                    lblerror.Text = "Oopps! Something wen't wrong during saving!Contact your SysAdmin";
                    div_error.Visible = true;
                }
            }
        }
        catch (Exception ex)//catch error during run time
        {
            lblerror.Text = ex.Message.ToString();
            div_error.Visible = true;
        }
    }
}