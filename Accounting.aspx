<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Accounting.aspx.cs" Inherits="Accounting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
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
                <td style="width:150px">YEAR</td>
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
        <hr  />
        <div style="width:1126px"></div>
        <br />

        <ajaxToolkit:TabContainer ID="tc_main" Width="100%" runat="server" ActiveTabIndex="1" BackColor="#234D6B">
            <%--##Loan Transaction include : Reduction/Premiums Payment,Renewal,Payments--%>
            <ajaxToolkit:TabPanel ID="tp_payments" runat="server" HeaderText="PAYMENTS" BackColor="#234D6B">
                <ContentTemplate >
                    <!--PAYMENTS TRANSACTIONS-->
                    
                    <asp:GridView ID="gvpayments" runat="server" Width="100%" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="Paymentdate" HeaderText="Payment date" ItemStyle-Width="20%" HeaderStyle-Width="20%" />
                            <asp:BoundField DataField="Name" HeaderText="Payee" ItemStyle-Width="20%" HeaderStyle-Width="20%" />
                              <asp:BoundField DataField="Currency" HeaderText="Currency" ItemStyle-Width="15%" HeaderStyle-Width="15%" />
                            <asp:BoundField DataField="PaymentType" HeaderText="Payment Type" ItemStyle-Width="15%" HeaderStyle-Width="15%" />
                            <asp:BoundField DataField="PaymentSource" HeaderText="Payment Source" ItemStyle-Width="15%" HeaderStyle-Width="15%" />
                            <asp:BoundField DataField="Amount" HeaderText="Amount " ItemStyle-Width="15%" HeaderStyle-Width="15%" />


                        </Columns>
                    </asp:GridView>

                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="tp_inventory" runat="server" HeaderText="INVENTORY" BackColor="#234D6B">
                <ContentTemplate>
                    <!--INVENTORY TRANSACTIONS-->
                    <asp:GridView ID="gv_inventory" runat="server" Width="100%" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="InvoiceNO" HeaderText="Invoice" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                            <asp:BoundField DataField="MaterialId" HeaderText="ItemID" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                            <asp:BoundField DataField="ProductName" HeaderText="Product Name" ItemStyle-Width="20%" HeaderStyle-Width="20%" />
                            <asp:BoundField DataField="VendorName" HeaderText="Vendor" ItemStyle-Width="20%" HeaderStyle-Width="20%" />
                            <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                            <asp:BoundField DataField="QtyReceive" HeaderText="Qty" ItemStyle-Width="5%" HeaderStyle-Width="5%" />
                            <asp:BoundField DataField="Total" HeaderText="Line Total" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                            <asp:BoundField DataField="UOM" HeaderText="UOM" ItemStyle-Width="5%" HeaderStyle-Width="5%" />
                            <asp:BoundField DataField="ReceivedDate" DataFormatString="{0:dd, MMM yyyy}" HeaderText="Received Date" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="tp_payroll" runat="server" HeaderText="PAYROLL" BackColor="#234D6B">
                <ContentTemplate>
                    <!--PAYROLL TRANSACTIONS-->
                    <asp:GridView ID="gv_employees" OnRowDataBound="gv_employees_RowDataBound" Width="100%" AutoGenerateColumns="false" runat="server">
                        <Columns>
                            <asp:BoundField DataField="ID" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
                            <asp:BoundField DataField="Employeeid" HeaderText="ID" ItemStyle-Width="5%" HeaderStyle-Width="5%" />
                            <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="20%" HeaderStyle-Width="20%" />
                            <%--<asp:BoundField DataField="DepartmentName" HeaderText="DEPARTMENT" ItemStyle-Width="5%" HeaderStyle-Width="5%" />--%>
                            <asp:BoundField DataField="Emp_Job" HeaderText="JOB" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                            <asp:BoundField DataField="Paytype" HeaderText="TYPE" ItemStyle-Width="5%" HeaderStyle-Width="5%" />
                            <asp:BoundField DataField="Rate" HeaderText="RATE" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                            <asp:BoundField DataField="workedhrs" HeaderText="Worked Hours" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                            <%--<asp:TemplateField HeaderText="WorkedHrs">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtWorkedHrs" runat="server" placeholder="0.00" Width="99%" Text='<%# Eval("workedhrs") %>' Height="100%"></asp:TextBox>
                                </ItemTemplate>
                                <HeaderStyle Width="10%" />
                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                            </asp:TemplateField>--%>
                            <%--<asp:BoundField DataField="totalregular" HeaderText="TOTAL" ItemStyle-Width="10%" HeaderStyle-Width="10%" />--%>
                            <asp:BoundField DataField="OTRATE" HeaderText="OT-RATE" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                            <asp:BoundField DataField="OTHRS" HeaderText="OT Hours" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                            <%--<asp:TemplateField HeaderText="OT-HRS">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtOTHrs" runat="server" placeholder="0.00" Text='<%# Eval("OTHRS") %>' Width="99%" Height="99%"></asp:TextBox>
                                </ItemTemplate>
                                <HeaderStyle Width="10%" />
                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                            </asp:TemplateField>--%>
                            <asp:BoundField DataField="TOTALSALARY" HeaderText="TOTAL SALARY" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
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

                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>


    </div>
</asp:Content>

