<%@ Page Title="CHECKOUT" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls"
        TagPrefix="BDP" %>
    <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
    <div class="content centercontent">
        <div class="form">
            <div class="bread-crumbs">
                <span>Dashboard \ Reservations \<b> Checkout</b>&nbsp;(Customer#  <asp:Label ID="lblcustomerid" runat="server"></asp:Label>)</span>
            </div>
            <div class="error-section" id="div_error" runat="server" visible="false">
                <asp:Label ID="lblerror" runat="server">cc</asp:Label>
            </div>
            <br />
            <table class="table-form">

                <tr>
                    <td>Invoice No.
                    </td>
                    <td>
                        <asp:Label ID="lblinvoice" runat="server">--</asp:Label>
                    </td>
                    <td>Invoice Net Amount</td>
                    <td>
                        <asp:TextBox ID="txtInvoicenetamount"  Enabled="false" runat="server" placeholder="0.00"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Invoice date
                    </td>

                    <td>
                        <asp:Label ID="lblInvoicedate" runat="server">--</asp:Label>
                    </td>
                     <td>VAT Amount</td>
                    <td>
                        <asp:TextBox ID="txtvatamount" Enabled="false" runat="server" placeholder="0.00">0.00</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Bill to Customer
                    </td>
                    <td>
                        <asp:Label ID="lblcustomername" runat="server">--</asp:Label>
                    </td>
                   
                    <td>Total Invoice Amount</td>
                    <td>
                        <asp:TextBox ID="txtinvoiceamount" Enabled="false" runat="server" placeholder="0.00"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Bill to Address
                    </td>
                    <td>
                        <asp:Label ID="lblbilltoaddr" runat="server">--</asp:Label>
                    </td>
                     
                   <td>Currency</td>
                    <td><asp:Label ID="lblcurrency" runat="server">USD</asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Service date
                    </td>
                    <td>
                        <asp:Label ID="lblservicedate" runat="server">--</asp:Label>
                    </td>
                     
                    <td>Payment Method</td>
                    <td>
                        <asp:DropDownList ID="ddlpaymentmode" AutoPostBack="true" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlpaymentmode_SelectedIndexChanged">
                            <asp:ListItem Value="CASH" Text="CASH"></asp:ListItem>
                            <asp:ListItem Value="CARD" Text="CARD"></asp:ListItem>
                                 <asp:ListItem Value="CHECK" Text="CHECK"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Vehicle Make
                    </td>
                    <td>
                        <asp:Label ID="lblvehiclemake" runat="server">--</asp:Label>
                    </td>
                    <td>Amount Received
                    </td>
                    <td>
                        <asp:TextBox ID="txtAmountReceived" TextMode="Number" align="left" BackColor="Yellow" placeholder="0.00" AutoPostBack="true"  runat="server" OnTextChanged="txtAmountReceived_TextChanged"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Vehicle Type
                    </td>
                    <td>
                        <asp:Label ID="lblvehicletype" runat="server">--</asp:Label>
                    </td>
                    <td>Changed
                    </td>
                    <td>
                        <asp:Label ID="lblchanged"  runat="server">--</asp:Label>
                    </td>
                </tr>
            </table>
        </div>

        <div id="services">
            <asp:GridView ID="gv_services" CssClass="table" OnRowDataBound="gv_services_RowDataBound" AutoGenerateColumns="False" runat="server" Width="100%" >
                <Columns>
                    <asp:BoundField ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" DataField="id" />
                    <asp:TemplateField HeaderText="No.">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                        <HeaderStyle Width="5%" />
                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Services" HeaderText="Services" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="ServiceCharges" HeaderText="Cost" />
                    <asp:BoundField DataField="Isvoid" HeaderText="Void" />
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkremove" CssClass=""  OnClick="lnkremove_Click" ForeColor="Red" OnClientClick="return confirm('Are you sure you want to void this line?');" runat="server" Text="REMOVE"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="5%" />
                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
        <div class="form-footer">
            <asp:Button ID="btnpay" CssClass="button" runat="server" OnClick="btnpay_Click" Text="PAY" />
            <%--<input type="button" class="button" title="SUBMIT" value="SUBMIT" />--%>
        </div>
        <asp:SqlDataSource ID="sds_services" runat="server" ConnectionString="<%$ ConnectionStrings:DBConstring %>" SelectCommand="SELECT * FROM SELECTEDSERVICES_V  ORDER BY Services"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sds_time" runat="server" ConnectionString="<%$ ConnectionStrings:DBConstring %>" SelectCommand="SELECT * FROM SCHEDULEDtime ORDER BY id"></asp:SqlDataSource>
        <asp:HiddenField ID="hf_customerid" runat="server" />

      
    </div>
</asp:Content>

