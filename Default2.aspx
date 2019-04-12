<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="style.css" />
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Car Wash</title>

</head>
<body>
    <form id="form1" runat="server">
        <div id="website">
            <div id="header">
                <a href="#" class="logo">
                    <img src="images/logo.jpg" alt="" width="195" height="80" /></a>
                <ul id="menu">
                    <li><a href="#" id="active">HOME</a></li>
                    <%--<li><a href="#">SERVICES</a></li>--%>
                    <%--<li><a href="#">coupons</a></li>--%>
                    <li><a href="#">MAKE APPOINTMENT</a></li>
                    <li><a href="#">LOGIN</a></li>
                </ul>
            </div>
            <!--content-->
            <div id="content">
                <img src="images/title1.gif" alt="" width="271" height="41" /><br />
                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci <a href="#">tation ullamcorper</a> suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla. <a href="#">more</a></p>
                <img src="images/banner.jpg" alt="" width="726" height="187" border="0" usemap="#Map" /><br />


                <img src="images/title2.gif" alt="" width="271" height="45" /><br />
                <p>
                    DLorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
                    <br />
                    laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam
                </p>

                <div id="services">

                    <table id="tblServicesList">
                        <thead>
                            <tr>
                                <th>Choose</th>
                                 <th>Service</th>
                                <th>Fee</th>
                                <th>Description</th>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" /></td>
                                <td><span>Full Service Wash</span></td>
                                    <td><span>$12</span></td>
                                <td>Nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" /></td>
                                <td><span>Full Service Wash</span></td>
                                    <td><span>$12</span></td>
                                <td>Nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</td>
                            </tr>
                        <tr>
                                <td>
                                    <input type="checkbox" /></td>
                                <td><span>Full Service Wash</span></td>
                                    <td><span>$12</span></td>
                                <td>Nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</td>
                            </tr>
                          <tr>
                                <td>
                                    <input type="checkbox" /></td>
                                <td><span>Full Service Wash</span></td>
                                    <td><span>$12</span></td>
                                <td>Nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</td>
                            </tr>
                        </thead>
                    </table>

                </div>
                <br />
                <div id="table">
                    <p><span>Full Service Wash</span>Nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. </p>
                    <p><span>Double Polyprocess</span>Consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet </p>
                    <p><span>Tire Gloss</span>Euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
                    <p><span>Underbody Wash</span>Adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore</p>
                    <p><span>Carpet Shampoo</span>Sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat </p>
                </div>
            </div>
            <!--/content-->
            <div id="footer">
                <!-- VLinks -->
                <p>
                    All Rights Reserved 2019
                </p>
            </div>
        </div>
        <map name="Map">
            <area shape="rect" coords="27,41,562,88" href="#">
            <area shape="rect" coords="589,2,724,185" href="#">
        </map>
    </form>
</body>
</html>
