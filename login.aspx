<%@ Page Title="NOLA" Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!-- Font Awesome Icons -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!-- Plugin CSS -->
<link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">
<!-- Theme CSS - Includes Bootstrap -->
<link href="css/creative.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/master-style.css" />
<link rel="stylesheet" type="text/css" href="css/slider.css" />
<link rel="stylesheet" type="text/css" href="css/login.less" />
<%--<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">--%>
<form id="form1" runat="server">
    <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 navbar-scrolled" id="mainNav">

        <div class="container">
            <a class="navbar-brand js-scroll-trigger" href="#page-top">
                <%--<img src="images/l.jpg" alt="" width="475" height="517" />--%>
                <h3>NOLA Auto Shine</h3>
            </a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
               <ul class="navbar-nav ml-auto my-2 my-lg-0">
                       <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="Index.aspx">HOME</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="Default.aspx#about">ABOUT US</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="Default.aspx#services">SERVICES</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="Default.aspx#pricing">PRICING</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="Appointment.aspx">APPOINTMENT</a>
                    </li>                   
                    <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="Default.aspx#contact">CONTACT</a>
                    </li>
                 <%--   <li class="nav-item">
                        <a class="nav-link js-scroll-trigger" href="login.aspx" target="_self">LOGIN</a>
                    </li>--%>
                </ul>
            </div>
        </div>
    </nav>
    <!--content area-->
    <div class="content centercontent">
        <div class="bread-crumbs">
            <span>Home \ <b>Employee Login</b></span>
        </div>
        <div class="error-section" id="div_error" runat="server" visible="false">
            <asp:Label ID="lblerror" runat="server">cc</asp:Label>
        </div>
        <div id="form-login">
            <h1>Employee Login</h1>
            <%--<h6>Note: All filed with asterisk (*) are required fields.</h6>--%>
            <div class="form-header center-align">
                <br />
                <table>
                    <tr>

                        <td>
                            <asp:TextBox ID="txtUsername" runat="server" Width="100%" placeholder="USERNAME"></asp:TextBox></td>
                    </tr>
                    <tr>

                        <td>
                            <asp:TextBox ID="txtPassword" runat="server" Width="100%" placeholder="PASSWORD" TextMode="Password"></asp:TextBox></td>
                    </tr>
                    <tr>

                        <td id="btn">
                            <asp:Button ID="btnLogin" runat="server" Width="100%" Text="LOGIN" OnClick="btnLogin_Click" />
                        </td>
                    </tr>
                </table>

            </div>
        </div>
    </div>
</form>
<%--</asp:Content>--%>

