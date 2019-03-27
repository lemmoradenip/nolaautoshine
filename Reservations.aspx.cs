using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Reservations : System.Web.UI.Page
{
    DBUtil dbutil = new DBUtil();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblsysdate.Text = DateTime.UtcNow.ToLongDateString();
        BindData();//Bind data to gridviews
    }

    protected void lnkpay_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        GridViewRow row = (GridViewRow)btn.NamingContainer;
        int i = Convert.ToInt32(row.RowIndex);

        string custreservationid = gv_reservations.Rows[i].Cells[0].Text.ToString();
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Openwindow", string.Format("window.open('checkout.aspx?id={0}');", custreservationid), true);//this will open new tab for payment checkout.

    }
    //onmouseover effect
    protected void gv_reservations_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowType == DataControlRowType.DataRow))
        {
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#76777a'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
        }
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        BindData();//Bind data to gridviews with filtering 
    }
    private void BindData()
    {
        try
        {
            string qry = "SELECT * FROM CUSTOMER_v where id<>0 "
                + (txtscheduleddate.Text.ToString().Trim() != string.Empty ? string.Format(" and scheduleddate='{0}'", txtscheduleddate.Text.ToString()) : "")
                + (txtmobileno.Text.ToString().Trim() != "" ? string.Format(" and mobile='{0}'", txtmobileno.Text.ToString()) : "")
                + (ddltime.SelectedValue.ToString() != "" ? string.Format(" and scheduledtime='{0}'", ddltime.SelectedValue.ToString()) : "")
                + " order by scheduleddate";
          
            DataTable dt = new DataTable();
            dt = dbutil.GetData(qry, "btnFind_Click");
            gv_reservations.DataSource = dt;
            gv_reservations.DataBind();
            div_error.Visible = false;
          
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message.ToString();
            div_error.Visible = true;
        }
    }
}