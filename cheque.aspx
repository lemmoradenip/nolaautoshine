<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="cheque.aspx.cs" Inherits="Cheque" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content centercontent">
        <div class="form">
            <div class="bread-crumbs">
                <span>Dashboard \ Reservations \ Checkout \ <b>Check Information</b></span>
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
                        <asp:TextBox ID="txtInvoicenetamount" Enabled="false" runat="server" placeholder="0.00"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

