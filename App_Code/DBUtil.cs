using System.Net;
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
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Data.OleDb;
using System.IO;
using System.Diagnostics;
//using System.DirectoryServices;
using System.Linq;
using System.Data.Odbc;
/// <summary>
/// Summary description for DBUtil
/// </summary>
/// 
public class DBUtil
{

    private string MSDBConnectionString = ConfigurationManager.ConnectionStrings["DBConstring"].ToString();
    //private string DBConnectionString;
    private SqlConnection sqlcon;

    private DataSet ds;
    private SqlCommand sqlcmd;
    private SqlDataAdapter da;
    private DataTable dt;
    public DBUtil()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    //public DataTable GetData(string query)
    //{

    //    sqlcon = new OleDbConnection(MSDBConnectionString);
    //    sqlcmd = new OleDbCommand(query, sqlcon);
    //    if (sqlcon.State == ConnectionState.Closed)
    //    {
    //        sqlcon.Open();
    //    }
    //    try
    //    {
    //        using (da = new OleDbDataAdapter(query, sqlcon))
    //        {
    //            sqlcmd.CommandTimeout = 0;
    //            da.SelectCommand = sqlcmd;
    //            da.SelectCommand.CommandTimeout = 0;
    //            da.Fill(dt);
    //        }
    //    }
    //    catch (Exception error)
    //    {
    //        throw new Exception("Problem occur " + error.Message.ToString());
    //    }
    //    return dt;
    //}

    public DataTable GetData(string Query, string ErrKeyword)
    {
        DataTable result = new DataTable();
        try
        {

            sqlcon = new SqlConnection(this.MSDBConnectionString);
            sqlcmd = new SqlCommand(Query, sqlcon);
            if (sqlcon.State == ConnectionState.Closed)
            {
                sqlcon.Open();
            }
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                sqlcmd.CommandType = CommandType.Text;
                sqlcmd.CommandTimeout = 0;
                sda.SelectCommand = sqlcmd;
                sda.SelectCommand.CommandTimeout = 0;
                sda.Fill(result);
            }
        }
        catch (Exception ex)
        {

            throw new Exception(String.Format("Error 401 {2} {3} ", "DBUtil", "Getdata", ErrKeyword, ex.Message.ToString()));
        }
        return result;
    }
    public int ExecuteNonQuery(SqlCommand command)
    {
        DBUtil dbutil = new DBUtil();
        SqlConnection connection = new SqlConnection(MSDBConnectionString);

        int rowsAffected = 0;
        try
        {

            command.Connection = connection;
            command.CommandTimeout = connection.ConnectionTimeout;
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
            rowsAffected = command.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw new Exception(String.Format("ERROR 201 : {0}", (ex.Message.ToString().Contains("duplicate") ? "Record already Exist!" : ex.Message.ToString())));
        }
        finally
        {
            if (connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
            connection.Dispose();
            command.Dispose();
        }
        return rowsAffected;
    }

    


}