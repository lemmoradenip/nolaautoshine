using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Inventory : System.Web.UI.Page
{
    InventoryModel inventory = new InventoryModel();
    DBUtil dbutil = new DBUtil();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Cryptor validate = new Cryptor();
            string usernamesession = (string)(Session["username"]);
            //hfusername.Text = usernamesession;
            if (validate.ValidateAccessLevel(usernamesession) == 0)
            {
                Response.Write("<script>alert('Sorry you do not have access here!');</script>");
                Response.Redirect("~/Reservations.aspx");
            }
            BindData();
        }
    }

    protected void gv_items_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowType == DataControlRowType.DataRow))
        {
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#76777a'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
        }
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtItemNo.Text.ToString().Trim() == string.Empty)
            { throw new Exception("Item No. is required!"); }
            else if (txtItemDesc.Text.ToString().Trim() == string.Empty)
            { throw new Exception("Item Description is required!"); }
            else if (txtqtyreceive.Text.ToString().Trim() == string.Empty)
            { throw new Exception("Quantity to receive is required!"); }
            else if (ddlvendor.SelectedValue.ToString() == "0")
            { throw new Exception("Vendor is required!"); }
            else if (txtBaseAmount.Text.ToString().Trim() == string.Empty)
            { throw new Exception("Unit amount is required!"); }
            else if (txtUOM.Text.ToString().Trim() == string.Empty)
            { throw new Exception("UOM is required!"); }
            else if (txtamountreceive.Text.ToString().Trim() == string.Empty)
            { throw new Exception("Amount receive is required!"); }
            else if (txtdatereceive.Text.ToString().Trim() == string.Empty)
            { throw new Exception("Receiving date is required!"); }
            else
            {
                inventory.Materialid = 0; ;//Hidden field
                inventory.Itemno = txtItemNo.Text.ToString();
                inventory.ProductName = txtItemDesc.Text.ToString();
                inventory.Receiveddate = Convert.ToDateTime(txtdatereceive.Text.ToString());
                inventory.UnitPrice = Convert.ToDecimal(txtBaseAmount.Text.ToString());
                inventory.VendorId = Convert.ToInt32(ddlvendor.SelectedValue.ToString());
                inventory.Username = "";
                inventory.InvoiceNo = txtInvoice.Text.ToString();
                inventory.Notes = txtnotes.Text.ToString();
                inventory.AmountReceive = Convert.ToDecimal(txtamountreceive.Text);
                inventory.UOM = txtUOM.Text.ToString();
                inventory.Qtyreceived = Convert.ToInt32(txtqtyreceive.Text.ToString());
                int affectedrecords = inventory.Access_Item(string.Empty);
                if (affectedrecords > 0)
                {
                    Response.Write("<script>alert('Saving successful!');</script>");
                    Clear();
                    btnsave.Text = "CREATE";
                    div_error.Visible = false;
                    BindData();
                }
                else
                {
                    lblerror.Text = "Unable to save";
                    div_error.Visible = true;
                }
;
            }
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
            div_error.Visible = true;
        }


    }

    private void BindData()
    {
        try
        {
            string qry = "SELECT * FROM Inventory_v order by materialid ";
            // +(txtItemNo.Text.ToString().Trim() != string.Empty ? string.Format(" and itemno='{0}'", txtItemNo.Text.ToString()) : "");
            //+ (txtmobileno.Text.ToString().Trim() != "" ? string.Format(" and mobile='{0}'", txtmobileno.Text.ToString()) : "")
            //+ (ddltime.SelectedValue.ToString() != "" ? string.Format(" and scheduledtime='{0}'", ddltime.SelectedValue.ToString()) : "")
            //+ " order by scheduleddate";

            DataTable dt = new DataTable();
            dt = dbutil.GetData(qry, "BindData");
            gv_items.DataSource = dt;
            gv_items.DataBind();
            div_error.Visible = false;

        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
            div_error.Visible = true;
        }
    }
    private void BindDataFind()
    {
        try
        {
            string qry = "SELECT * FROM Inventory_v where materialid<>0 "
           + (txtItemNo.Text.ToString().Trim() != string.Empty ? string.Format(" and itemno='{0}'", txtItemNo.Text.ToString()) : "");
            //+ (txtmobileno.Text.ToString().Trim() != "" ? string.Format(" and mobile='{0}'", txtmobileno.Text.ToString()) : "")
            //+ (ddltime.SelectedValue.ToString() != "" ? string.Format(" and scheduledtime='{0}'", ddltime.SelectedValue.ToString()) : "")
            //+ " order by scheduleddate";

            DataTable dt = new DataTable();
            dt = dbutil.GetData(qry, "BindData");
            gv_items.DataSource = dt;
            gv_items.DataBind();
            div_error.Visible = false;

        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
            div_error.Visible = true;
        }
    }
    void Clear()
    {
        txtItemNo.Text = string.Empty;
        txtItemDesc.Text = string.Empty;
        txtqtyreceive.Text = string.Empty;
        ddlvendor.ClearSelection();
        txtInvoice.Text = string.Empty;
        txtUOM.Text = string.Empty;
        txtUOM.Text = string.Empty;
        txtamountreceive.Text = string.Empty;
        txtdatereceive.Text = string.Empty;
        txtnotes.Text = string.Empty;

    }

    protected void btnfind_Click(object sender, EventArgs e)
    {
        BindDataFind();

    }

    protected void lnkdelete_Click(object sender, EventArgs e)
    {
        int deletedrecords;
        try
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int i = Convert.ToInt32(row.RowIndex);
            string item = gv_items.Rows[i].Cells[0].Text.ToString();
            inventory.Materialid = Convert.ToInt32(item);
            deletedrecords = inventory.Delete_Item();
            if (deletedrecords > 0)
            {
                //rebind data
                BindData();
                lblerror.Text = string.Empty;
                div_error.Visible = false;
            }
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString() + " on lnkdelete_Click() event";
            div_error.Visible = true;
        }
    }
}