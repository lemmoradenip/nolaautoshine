<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerCheckout.aspx.cs" Inherits="CustomerCheckout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Checkout</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <div class="logo">
                    <h1>
                        <a href="#" class="logo">
                            <img src="images/logo.jpg" alt="" width="195" height="80" /></a>
                    </h1>
                </div>
                <div class="center">
                    <h1>Invoice 
                    </h1>
                </div>
                <div class="info">

               <%--     <span><b>Address</b>:King Abdullah Road Kingdom of Jordan</span>
                    <br />
                    <span><b>Phone/Email</b>:0505050505 /info@carwash.com</span>
                    <br />
                    <span><b>Website/Social Media: </b>www.carwash.somee.com </span>--%>
                    <table>
                        <tr>
                            <td>
                                <b>Address:</b>
                            </td>
                            <td>King Abdullah Road Kingdom of Jordan</td>
                        </tr>
                        <tr><td>
                            <b>Phone:</b>
                            </td>
                            <td>:0505050505 /info@carwash.com</td>
                        </tr>
                        <tr>
                            <td>Website:</td>
                            <td>www.carwash.somee.com</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
