<%@ Page Title="NOLA" Language="C#" AutoEventWireup="true" CodeFile="Appointment.aspx.cs" Inherits="Appointment" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">--%>
<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls"
    TagPrefix="BDP" %>

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
<%-- 
    <link rel="stylesheet" type="text/css" href="css/slider.css" />
   <link rel="stylesheet" type="text/css" href="css/login.less" />--%>

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
    <div class="content centercontent">

        <div class="bread-crumbs">
            <span><a href="Default.aspx">Home</a> \ <b>Appointment</b></span>
        </div>
        <div class="error-section" id="div_error" runat="server" visible="false">
            <asp:label id="lblerror" runat="server">cSSSSSSSSSSSSSSSSSc</asp:label>
        </div>
        <div id="form">
            <h4>WE'VE GOT WHAT YOU NEED!</h4>
            <h5>You may contact us directly or complete the request appointment form</h5>
            <h6>Note: All filed with asterisk (*) are required fields.</h6>
            <div class="form-header">

                <table class="table table-striped ">
                    <tr>
                        <td>First Name *
                        </td>
                        <td>
                            <asp:textbox id="txtCFname" runat="server" placeholder="(required)"></asp:textbox>
                        </td>
                    </tr>
                    <tr>
                        <td>Last Name *
                        </td>
                        <td>
                            <asp:textbox id="txtCLname" runat="server" placeholder="(required)"></asp:textbox>
                        </td>
                    </tr>
                    <tr>
                        <td>Address  
                        </td>
                        <td>
                            <asp:textbox id="txtCAddress" runat="server" placeholder=""></asp:textbox>
                        </td>
                    </tr>
                    <tr>
                        <td>Phone Number *
                        </td>
                        <td>
                            <asp:textbox id="txtCphoneNumber" textmode="Number" runat="server" placeholder="(required)"></asp:textbox>
                        </td>
                    </tr>
                    <tr>
                        <td>Email Address
                        </td>
                        <td>
                            <asp:textbox id="txtCus_Email" textmode="Email" runat="server" placeholder="(required)"></asp:textbox>
                        </td>
                    </tr>
                    <tr>
                        <td>Service Provider 
                        </td>
                        <td>
                            <asp:textbox id="txtServiceProvider" runat="server" placeholder=""></asp:textbox>
                        </td>
                    </tr>
                    <tr>
                        <td>Vehicle Type *
                        </td>
                        <td>
                            <asp:dropdownlist id="ddlvehicletype" runat="server" appenddatabounditems="true" autopostback="true">
                                <asp:ListItem Value="CAR" Text="CAR"></asp:ListItem>
                                  <asp:ListItem Value="SUV" Text="SUV or SMALL TRUCKS"></asp:ListItem>
                                 <asp:ListItem Value="OVERSIZED" Text="OVERSIZE TRUCKS"></asp:ListItem>
                            </asp:dropdownlist>

                        </td>
                    </tr>
                    <tr>
                        <td>Make*
                        </td>
                        <td>
                            <asp:dropdownlist id="ddlCcartype" runat="server" datasourceid="sds_carmake" appenddatabounditems="true" datatextfield="CarMake" datavaluefield="ID">
                                <asp:ListItem Value="0" Text="Select Car Type"></asp:ListItem>
                            </asp:dropdownlist>

                        </td>
                    </tr>
                    <tr>
                        <td>Vehicle model
                        </td>
                        <td>

                            <asp:textbox id="txtcarmodel" runat="server" placeholder="e.i HONDA ACCORD 2019"></asp:textbox>

                        </td>
                    </tr>
                    <tr>
                        <td>Vehicle Color
                        </td>
                        <td>
                            <asp:textbox id="txtcolor" runat="server" placeholder="You vehicle color e.i RED,BLUE,WHITE"></asp:textbox>

                        </td>
                    </tr>

                    <tr>
                        <td>Schedule Date
                        </td>
                        <td>
                            <%--<input typeof="text" placeholder="DD/MM/YYYY" />--%>
                            <%--<BDP:BDPLite ID="dpScheduleDate" TextBoxStyle-Width="60%" runat="server"></BDP:BDPLite>--%>
                            <asp:textbox id="txtscheduleddate" runat="server" maxlength="10" textmode="Date"></asp:textbox>
                        </td>
                    </tr>
                    <tr>
                        <td>Time</td>
                        <td>
                            <asp:dropdownlist id="ddlCTime" runat="server" appenddatabounditems="True" datasourceid="sds_time" datatextfield="timetitle" datavaluefield="timetitle">
                            </asp:dropdownlist>
                        </td>
                    </tr>
                    <tr>
                        <td>Payment type</td>
                        <td>
                            <asp:dropdownlist id="ddlpaymenttype" runat="server" appenddatabounditems="True">
                                <asp:ListItem Value="CASH" Text="OVER THE COUNTER"></asp:ListItem>
                                  <asp:ListItem Value="CARD" Text="ONLINE PAYMENT(Credit Card)"></asp:ListItem>
                            </asp:dropdownlist>
                        </td>
                    </tr>
                </table>
            </div>
            <a href="facebook.com" style="padding:"></a>
            <div id="services">
                <h5>Our Services (Please select all desired services, prices may change depending on vehicle type)</h5>


                <asp:gridview id="gvInterior" width="100%" cssclass="table" onrowdatabound="gvInterior_RowDataBound" runat="server" datasourceid="sds_interior" autogeneratecolumns="False" datakeynames="Services,ServiceCode">
                    <Columns>
                        <asp:BoundField DataField="id" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" HeaderText="id" InsertVisible="False" SortExpression="id" ReadOnly="True" >
                            <HeaderStyle CssClass="hidden"></HeaderStyle>

                            <ItemStyle CssClass="hidden"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="cbselectservice" Width="100%" Height="100%" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Services" HeaderText="Service Name" ReadOnly="True" SortExpression="Services"  />
                        <%--<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />--%>
                        <%--<asp:BoundField DataField="ServiceCode" HeaderText="ServiceCode" SortExpression="ServiceCode" ReadOnly="True" />--%>
                        <asp:BoundField DataField="ServiceCharge" HeaderText="Cost($)" SortExpression="ServiceCharge" />
                        <%--<asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />--%>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:gridview>
                <asp:sqldatasource id="sds_interior" runat="server" connectionstring="<%$ ConnectionStrings:DBConstring %>" selectcommand="SELECT * FROM [Services] where cartype='addons' or cartype=@type">
                    <SelectParameters>
                <asp:ControlParameter ControlID="ddlvehicletype" Type="String"  Name="type" />
                
            </SelectParameters>
                </asp:sqldatasource>

                <%--<asp:sqldatasource id="sds_exterior" runat="server" connectionstring="<%$ ConnectionStrings:DBConstring %>" selectcommand="SELECT * FROM [Services] where type='Exterior'"></asp:sqldatasource>--%>
            </div>
            <div class="form-footer">
                <asp:button id="btnSubmit" cssclass="button" runat="server" onclick="btnSubmit_Click" text="Submit" />
                <%--<input type="button" class="button" title="SUBMIT" value="SUBMIT" />--%>
            </div>
        </div>
    </div>
    <asp:sqldatasource id="sds_carmake" runat="server" connectionstring="<%$ ConnectionStrings:DBConstring %>" selectcommand="SELECT id,UPPER(carmake) carmake FROM CarMakerlist order by carmake"></asp:sqldatasource>
    <asp:sqldatasource id="sds_time" runat="server" connectionstring="<%$ ConnectionStrings:DBConstring %>" selectcommand="SELECT * FROM SCHEDULEDtime ORDER BY id"></asp:sqldatasource>
</form>
<%--</asp:Content>--%>

