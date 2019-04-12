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
                    <td>Banks
                    </td>
                    <td>
                        <asp:Textbox ID="lblinvoice" runat="server" placeholder="ABC Bank"></asp:Textbox>
                    </td>
                    <td>Cheque No. Series</td>
                    <td>
                        <asp:TextBox ID="txtcheckseries" Enabled="false" runat="server" placeholder="ABC013251947-201"></asp:TextBox>
                    </td>
                </tr>
                
            </table>
        </div>
    </div>
</asp:Content>

