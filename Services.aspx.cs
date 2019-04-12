using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Services : System.Web.UI.Page
{
    DBUtil dbutil = new DBUtil();
    InventoryModel inventory = new InventoryModel();
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
        }
        BindervicesData();
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
        string serviceid = gv_services.Rows[i].Cells[0].Text.ToString();
        inventory.Id = Convert.ToInt32(serviceid);
        int updatedrecords = inventory.Access_services("d");
        BindervicesData();
    }
    public void BindervicesData()
    {
        try
        {

            string qry = "SELECT * FROM services ORDER BY id desc";
            DataTable dt = dbutil.GetData(qry, "BindServicesData()");
            gv_services.DataSource = dt;
            gv_services.DataBind();
            lblerror.Text = string.Empty;
            div_error.Visible = false;
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
            div_error.Visible = true;
        }
    }
    /// <summary>
    /// Use to find services
    /// </summary>
    public void BindServicesFilteredData()
    {
        try
        {

            string qry = "SELECT * FROM services " 
                + String.Format(" where cartype='{0}'", ddlvehicletype.SelectedValue.ToString())
                + (txtServices.Text.ToString().Trim() != string.Empty? String.Format(" and like '%{0}%'",txtServices.Text.ToString()):"")
                +" ORDER BY id desc";
            DataTable dt = dbutil.GetData(qry, "BindServicesFilteredData()");
            gv_services.DataSource = dt;
            gv_services.DataBind();
            lblerror.Text = string.Empty;
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
        try
        {
            if (txtServices.Text.ToString().Trim() == string.Empty)
            { throw new Exception("Service Title is required!"); }
            else if (txtamount.Text.ToString().Trim() == string.Empty)
            { throw new Exception("Amount is required!"); }
            else
            {
                inventory.Title = txtServices.Text.ToString();
                inventory.Amount = Convert.ToDecimal(txtamount.Text.ToString());
                inventory.VehicleType = ddlvehicletype.SelectedValue.ToString();
                int affectedrecords = inventory.Access_services(string.Empty);
                if (affectedrecords > 0)
                {
                    BindervicesData();
                    txtamount.Text = string.Empty;
                    txtamount.Focus();
                    div_error.Visible = false;
                }
                else
                {
                    lblerror.Text = "Something went wrong while saving.";
                    div_error.Visible = true;
                }
            }


        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
            div_error.Visible = true;
        }
    }

    protected void btnfind_Click(object sender, EventArgs e)
    {
        BindServicesFilteredData();
    }

    protected void btnreset_Click(object sender, EventArgs e)
    {
        BindervicesData();
    }
}