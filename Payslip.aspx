<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Payslip.aspx.cs" Inherits="PrintPaySlip" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .hidden {
            display: none;
        }

        .table-form {
            width: 100%;
        }

            .table-form td:nth-child(odd) {
                width: 15%;
                color: #000000;
                text-align: left;
                /*background-color: yellow;*/
            }

            .table-form td:nth-child(even) {
                width: 35%;
                text-align: left;
                font-weight: 700;
                /*background-color:red;*/
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="bread-crumbs">
            <%--<span>Dashboard \ Reservations \<b> Checkout</b>&nbsp;(Customer#  <asp:Label ID="lblcustomerid" runat="server"></asp:Label>)</span>--%>
        </div>
        <div class="error-section" id="div_error" runat="server" visible="false">
            <asp:Label ID="lblerror" runat="server">cc</asp:Label>
        </div>
        <div style="margin: 0px; width: 100%; text-align: center">
            <h1>NOLA AUTO SHINE</h1>
            <br />
            <h3>SALARY SLIP FOR MONTH OF
                <asp:Label ID="lblmonthhead" runat="server"></asp:Label></h3>
            <hr />
            <table class="table-form">
                <tr>
                    <td style="width: 15%">EMPLOYEE ID</td>
                    <td style="width: 35%">
                        <asp:Label ID="lblEmployeeId" runat="server"></asp:Label></td>
                    <td style="width: 15%">DATE</td>
                    <td style="width: 35%">

                        <asp:Label ID="lbldate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>EMPLOYEE NAME</td>
                    <td>
                        <asp:Label ID="lblemployeename" runat="server"></asp:Label></td>
                    <td>PAY TYPE</td>
                    <td>
                        <asp:Label ID="lblpaytype" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>DEPARTMENT</td>
                    <td>
                        <asp:Label ID="lbldepartment" runat="server"></asp:Label></td>
                    <td>RATE</td>
                    <td>
                        <asp:Label ID="lblrate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>JOB TITLE</td>
                    <td>
                        <asp:Label ID="lbljob" runat="server"></asp:Label></td>
                    <td>WORKED HOURS</td>
                    <td>
                        <asp:Label ID="lblworkedhrs" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>SS No.</td>
                    <td>
                        <asp:Label ID="lblSSNo" runat="server"></asp:Label></td>
                    <td>OT-RATE</td>
                    <td>
                        <asp:Label ID="lblOTRate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>EMAIL</td>
                    <td>
                        <asp:Label ID="lblemail" runat="server"></asp:Label></td>
                    <td>OT HOURS</td>
                    <td>
                        <asp:Label ID="lblothours" runat="server"></asp:Label></td>

                </tr>
                <tr>
                    <td>PHONE</td>
                    <td>
                        <asp:Label ID="lblPhone" runat="server"></asp:Label></td>

                    <td>TOTAL REGULAR</td>
                    <td>
                        <asp:Label ID="lbltotalregular" runat="server"></asp:Label>


                    </td>
                </tr>
                <tr>
                    <td>ADDRESS</td>
                    <td>
                        <asp:Label ID="lbladdress" runat="server"></asp:Label></td>

                    <td>TOTAL OVERTIME</td>
                    <td>
                        <asp:Label ID="lblTotalOT" runat="server"></asp:Label>


                    </td>
                </tr>
                <tr>
                    <td>HIRED DATE</td>
                    <td>
                        <asp:Label ID="lblhireddate" runat="server"></asp:Label></td>

                    <td>TOTAL SALARY</td>
                    <td>
                        <asp:Label ID="lblsalary" runat="server"></asp:Label>


                    </td>
                </tr>
            </table>
            <br />
           <hr />
        </div>
    </form>
</body>
</html>
