<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Accounting.aspx.cs" Inherits="Accounting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
    <style type="text/css">
        .MyTabStyle .ajax__tab_header {
            font-family: Verdana, Sans-Serif;
            font-size: 9pt;
            font-weight: bold;
            font-weight: bold;
            display: block;
            color: yellow;
            background-color: #234D6B;
            width: 100%;
        }

        .MyTabStyle .ajax__tab_tab {
            color: #000 !important;
        }

        .MyTabStyle .ajax__tab_header .ajax__tab_outer {
            border-color: #222;
            color: yellow;
            padding-left: 10px;
            margin-right: 3px;
            /*border: solid 1px #d7d7d7;*/
        }

        .MyTabStyle .ajax__tab_header .ajax__tab_inner {
            border-color: #666;
            color: #666;
            padding: 3px 10px 2px 0px;
        }

        .MyTabStyle .ajax__tab_hover .ajax__tab_outer {
            background-color: #234D6B;
        }

        .MyTabStyle .ajax__tab_hover .ajax__tab_inner {
            color: #fff;
        }

        .MyTabStyle .ajax__tab_active .ajax__tab_outer {
            border-bottom-color: #ffffff;
            background-color: #fff;
        }

        .MyTabStyle .ajax__tab_active .ajax__tab_inner {
            color: #000;
            border-color: #333;
        }

        .MyTabStyle .ajax__tab_body {
            font-family: verdana,tahoma,helvetica;
            font-size: 10pt;
            background-color: #fff;
            border-top-width: 0;
            border: solid 1px #d7d7d7;
            border-top-color: #ffffff;
        }

        .MyTabStyle .ajax__tab_header .ajax__tab_outer {
            color: yellow;
        }
        #services {
    margin: 10px;
    padding: 0px 0 25px 0;
    overflow:auto;
    height: 300px;
}

    #services .table {
        margin-top: auto;
        padding: 0 0 55px 0;
        width: 50%;
        
    }

        #services .table th {
            color: #bece6e;
            height: 30px;
            text-transform: uppercase;
        }

        #services .table tr {
            /*display: block;
        float: left;*/
            font-family: Tahoma;
            font-size: 14px;
            color: #AFB8D3;
            line-height: 18px;
            width: 100%;
            margin: 0 10px 0 0;
            border: 1px solid #1E2027
        }

        #services .table td {
            padding: 10px 0 10px 0;
            margin: 0 0 13px 0;
            border-bottom: 1px solid #1E2027;
            text-align: center;
        }
    </style>
    <ajaxToolkit:ToolkitScriptManager ID="tsm" runat="server"></ajaxToolkit:ToolkitScriptManager>
    <div class="content centercontent">
        <div class="bread-crumbs">
            <span>Dashboard \ <b>Payment Transactions</b></span>
        </div>
        <div class="error-section" id="div_error" runat="server" visible="false">
            <asp:Label ID="lblerror" runat="server">cc</asp:Label>
        </div>
        <br />
        <table class="table-form">
            <tr>
                <td style="width: 150px">YEAR</td>
                <td>
                    <asp:DropDownList ID="ddlyear" Enabled="false" runat="server">
                        <asp:ListItem Value="2019" Text="2019"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>MONTH</td>
                <td>
                    <asp:DropDownList ID="ddlpayschedule" runat="server" AutoPostBack="true">
                        <asp:ListItem Value="JANUARY" Text="JANUARY"></asp:ListItem>
                        <asp:ListItem Value="FEBRUARY" Text="FEBRUARY"></asp:ListItem>
                        <asp:ListItem Value="MARCH" Text="MARCH"></asp:ListItem>
                        <asp:ListItem Value="APRIL" Selected="True" Text="APRIL"></asp:ListItem>
                        <asp:ListItem Value="MAY" Text="MAY"></asp:ListItem>
                        <asp:ListItem Value="JUNE" Text="JUNE"></asp:ListItem>
                        <asp:ListItem Value="JULY" Text="JULY"></asp:ListItem>
                        <asp:ListItem Value="AUGUST" Text="AUGUST"></asp:ListItem>
                        <asp:ListItem Value="SEPTEMBER" Text="SEPTEMBER"></asp:ListItem>
                        <asp:ListItem Value="OCTOBER" Text="OCTOBER"></asp:ListItem>
                        <asp:ListItem Value="NOVEMBER" Text="NOVEMBER"></asp:ListItem>
                        <asp:ListItem Value="DECEMBER" Text="DECEMBER"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Total Payment:</td>
                <td>
                    <asp:Label ID="lbltotpayment" runat="server">0.00</asp:Label></td>
            </tr>
            <tr>
                <td>Total Inventory:</td>
                <td>
                    <asp:Label ID="lblInventory" runat="server">0.00</asp:Label></td>
            </tr>
            <tr>
                <td>Total Payroll:</td>
                <td>
                    <asp:Label ID="lblpayroll" runat="server">0.00</asp:Label></td>
            </tr>
            <tr>
                <td>NET Profit:</td>
                <td>
                    <asp:Label ID="lblprofit" runat="server">0.00</asp:Label></td>
            </tr>
        </table>
        <hr />
        <div style="width: 1126px"></div>
        <br />

        <ajaxToolkit:TabContainer ID="tc_main" Width="100%" runat="server" ActiveTabIndex="0" CssClass="MyTabStyle" BackColor="#234D6B">
            <%--##Loan Transaction include : Reduction/Premiums Payment,Renewal,Payments--%>
            <ajaxToolkit:TabPanel ID="tp_payments" runat="server" HeaderText="PAYMENTS" BackColor="#234D6B">
                <ContentTemplate>
                    <!--PAYMENTS TRANSACTIONS-->
                    <div class="services">
                        <asp:GridView ID="gvpayments" runat="server" Width="100%" AutoGenerateColumns="false" HeaderStyle-ForeColor="Yellow" OnRowDataBound="gvpayments_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="Paymentdate" HeaderText="Payment date" ItemStyle-Width="20%" DataFormatString="{0:dd, MMM yyyy}" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="20%" />
                                <asp:BoundField DataField="Name" HeaderText="Payee" ItemStyle-Width="20%" HeaderStyle-Width="20%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Currency" HeaderText="Currency" ItemStyle-Width="15%" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="PaymentType" HeaderText="Payment Type" ItemStyle-Width="15%" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="PaymentSource" HeaderText="Payment Source" ItemStyle-Width="15%" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount " ItemStyle-Width="15%" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:N2}" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="tp_inventory" runat="server" HeaderText="INVENTORY" BackColor="#234D6B">
                <ContentTemplate>
                    <!--INVENTORY TRANSACTIONS-->
                    <div class="services">
                        <asp:GridView ID="gv_inventory" runat="server" Width="100%" AutoGenerateColumns="false" HeaderStyle-ForeColor="Yellow" OnRowDataBound="gv_inventory_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="InvoiceNO" HeaderText="Invoice" ItemStyle-Width="10%" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="MaterialId" HeaderText="ItemID" ItemStyle-Width="10%" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="ProductName" HeaderText="Product Name" ItemStyle-Width="20%" HeaderStyle-Width="20%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="VendorName" HeaderText="Vendor" ItemStyle-Width="20%" HeaderStyle-Width="20%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" ItemStyle-Width="10%" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:N2}" />
                                <asp:BoundField DataField="QtyReceive" HeaderText="Qty" ItemStyle-Width="5%" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:N2}" />
                                <asp:BoundField DataField="Total" HeaderText="Line Total" ItemStyle-Width="10%" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="UOM" HeaderText="UOM" ItemStyle-Width="5%" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="ReceivedDate" DataFormatString="{0:dd, MMM yyyy}" HeaderText="Received Date" ItemStyle-Width="10%" HeaderStyle-Width="10% " ItemStyle-HorizontalAlign="Center" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="tp_payroll" runat="server" HeaderText="PAYROLL" BackColor="#234D6B">
                <ContentTemplate>
                    <!--PAYROLL TRANSACTIONS-->
                    <div class="services">
                        <asp:GridView ID="gv_employees" OnRowDataBound="gv_employees_RowDataBound" Width="100%" AutoGenerateColumns="false" runat="server" HeaderStyle-ForeColor="Yellow">
                            <Columns>
                                <asp:BoundField DataField="ID" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Employeeid" HeaderText="ID" ItemStyle-Width="5%" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="20%" HeaderStyle-Width="20%" ItemStyle-HorizontalAlign="Center" />
                                <%--<asp:BoundField DataField="DepartmentName" HeaderText="DEPARTMENT" ItemStyle-Width="5%" HeaderStyle-Width="5%" />--%>
                                <asp:BoundField DataField="Emp_Job" HeaderText="JOB" ItemStyle-Width="10%" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Paytype" HeaderText="TYPE" ItemStyle-Width="5%" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Rate" HeaderText="RATE" ItemStyle-Width="10%" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:N2}" />
                                <asp:BoundField DataField="workedhrs" HeaderText="Worked Hours" ItemStyle-Width="10%" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:N2}" />
                                <%--<asp:TemplateField HeaderText="WorkedHrs">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtWorkedHrs" runat="server" placeholder="0.00" Width="99%" Text='<%# Eval("workedhrs") %>' Height="100%"></asp:TextBox>
                                </ItemTemplate>
                                <HeaderStyle Width="10%" />
                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                            </asp:TemplateField>--%>
                                <%--<asp:BoundField DataField="totalregular" HeaderText="TOTAL" ItemStyle-Width="10%" HeaderStyle-Width="10%" />--%>
                                <asp:BoundField DataField="OTRATE" HeaderText="OT-RATE" ItemStyle-Width="10%" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:N2}" />
                                <asp:BoundField DataField="OTHRS" HeaderText="OT Hours" ItemStyle-Width="10%" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:N2}" />
                                <%--<asp:TemplateField HeaderText="OT-HRS">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtOTHrs" runat="server" placeholder="0.00" Text='<%# Eval("OTHRS") %>' Width="99%" Height="99%"></asp:TextBox>
                                </ItemTemplate>
                                <HeaderStyle Width="10%" />
                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                            </asp:TemplateField>--%>
                                <asp:BoundField DataField="TOTALSALARY" HeaderText="TOTAL SALARY" ItemStyle-Width="10%" HeaderStyle-Width="10%" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Center" />
                                <%--  <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkbtnsave" CommandArgument="<%# Container.DataItemIndex %>" CommandName="Save" ForeColor="LightGreen" runat="server" Text="SAVE"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Width="5%" />
                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SLIP">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnktbtnprint" runat="server" ForeColor="Yellow" Text="PRINT"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Width="5%" />
                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:TemplateField>--%>
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>


    </div>
</asp:Content>

