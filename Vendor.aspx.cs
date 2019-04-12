using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Vendor : System.Web.UI.Page
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
            Clear();
            BindData();
        }
    }

    protected void gv_vendor_RowDataBound(object sender, GridViewRowEventArgs e)
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
            if (txtVendorName.Text.ToString().Trim() == string.Empty)
            { throw new Exception("Vendor name is required!"); }
            else
            {
                inventory.VendorId = Convert.ToInt32(txtvendorid.Text.ToString());
                inventory.VendorName = txtVendorName.Text.ToString();
                inventory.Address = txtaddress.Text.ToString();
                inventory.Phone = txtphone.Text.ToString();
                inventory.ContactPerson = txtcontactperson.Text.ToString();
                int result = inventory.Access_Vendor(string.Empty);
                if (result > 0)
                {
                    Response.Write("<script>alert('Saving successful!');</script>");
                    Clear();
                    btnsave.Text = "SAVE";
                    BindData();
                }
                //ACCESS CODE here
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
        txtvendorid.Text = inventory.GenerateVendorId();
        txtVendorName.Text = string.Empty;
        txtphone.Text = string.Empty;
        txtcontactperson.Text = string.Empty;
        txtaddress.Text = string.Empty;
    }
    private void BindData()
    {
        try
        {
            string qry = "SELECT * FROM Vendor where id<>0 "
            + (txtVendorName.Text.ToString().Trim() != string.Empty ? string.Format(" and vendorname='{0}'", txtVendorName.Text.ToString()) : "")
            + " order by id ";
            //+ (txtmobileno.Text.ToString().Trim() != "" ? string.Format(" and mobile='{0}'", txtmobileno.Text.ToString()) : "")
            DataTable dt = new DataTable();
            dt = dbutil.GetData(qry, "BindData()");
            gv_vendor.DataSource = dt;
            gv_vendor.DataBind();
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
        try {
        LinkButton btn = (LinkButton)sender;
        GridViewRow row = (GridViewRow)btn.NamingContainer;
        int i = Convert.ToInt32(row.RowIndex);
        string item = gv_vendor.Rows[i].Cells[0].Text.ToString();
        inventory.VendorId = Convert.ToInt32(item);
        int result = inventory.Access_Vendor("d");//delete
        if (result > 0)
        {
            //rebind data on grida
            BindData();
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
}