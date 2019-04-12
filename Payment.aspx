<%@ Page Title="NOLA" Language="C#" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payments" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">--%>
<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls"
    TagPrefix="BDP" %>
<%--<link rel="stylesheet" type="text/css" href="css/dashboard.css" />--%>

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

<form id="form1" runat="server">
    <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 navbar-scrolled" id="mainNav">

        <div class="container">
            <a class="navbar-brand js-scroll-trigger" href="#page-top">
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

    <div class="content centercontent">
        <div class="form">
            <div class="bread-crumbs">
                <span>Dashboard \ Appointment \<b> Payments</b>&nbsp;(Customer# 
                    <asp:label id="lblcustomerid" runat="server"></asp:label>
                    )</span>
            </div>
            <div class="error-section" runat="server" visible="false" id="div_error">
                <asp:label id="lblerror" runat="server">cc</asp:label>
            </div>
            <div id="form">

                <%--<h6>Note: All filed with asterisk (*) are required fields.</h6>--%>
                <div class="form-header">

                    <table class="table table-striped">
                        <tr>
                            <td>Card Type
                            </td>
                            <td>
                                <asp:dropdownlist id="ddlcardtype" runat="server" appenddatabounditems="true">
                                    <asp:ListItem Value="CREDITCARD" Text="CREDIT CARD" />
                                    <asp:ListItem Value="DEBITCARD" Text="DEBIT CARD" />
                                    <asp:ListItem Value="OTHER" Text="OTHER" />
                                </asp:dropdownlist>
                        </tr>
                        <tr>
                            <td>Card Holder Name
                            </td>
                            <td>
                                <asp:textbox id="txtcardholdername" runat="server" placeholder="Card Holder Name"></asp:textbox>
                            </td>
                        </tr>
                        <tr>
                            <td>Card Number
                            </td>
                            <td>
                                <asp:textbox id="txtcardnumber" textmode="Number" runat="server" placeholder="123456789"></asp:textbox>
                            </td>
                        </tr>
                        <tr>
                            <td>CVC
                            </td>
                            <td>
                                <asp:textbox id="txtCVC" runat="server" textmode="Number" maxlength="3" placeholder="101"></asp:textbox>
                            </td>
                        </tr>
                        <tr>
                            <td>Expiration date
                            </td>
                            <td>
                                <asp:textbox id="txtExpirationdate" runat="server" placeholder="MM/YYYY"></asp:textbox>
                            </td>
                        </tr>
                        <%-- <tr>
                            <td colspan="2">
                                <asp:Button CssClass="button" ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" Text="Submit" />
                            </td>
                        </tr>--%>
                    </table>
                </div>
                <div class="form-footer">
                    <asp:button id="btnpay" cssclass="button" runat="server" onclick="btnpay_Click" text="Submit" />
                    <%--<input type="button" class="button" title="SUBMIT" value="SUBMIT" />--%>
                </div>
            </div>
        </div>
    </div>
    <%--</asp:Content>--%>
</form>
