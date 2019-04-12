using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.IO;
using System.Net;
public partial class Ticket : System.Web.UI.Page
{
    public ReportDocument reportdocument = new ReportDocument();
    protected void Page_Load(object sender, EventArgs e)
    {
      string id =   Request.QueryString["id"];
        //reportdocument.SetDatabaseLogon("sa", "123456789", ".", "carwash");
 


        CrystalReportViewer1.ReportSource = reportdocument;
         
        reportdocument.Load(Server.MapPath("~\\report\\JobTicket.rpt"));
        reportdocument.SetDatabaseLogon("sa", "123456789", ".", "carwash");
   
        reportdocument.SetParameterValue("id", Convert.ToInt32(id)); //print by  
        reportdocument.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "Report.pdf");

        CrystalReportViewer1.Dispose();
        reportdocument.Dispose();
        reportdocument.Close();

    }
}