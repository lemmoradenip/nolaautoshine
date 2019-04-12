<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="EmployeeAccess.aspx.cs" Inherits="EmployeeAccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form">
        <div class="bread-crumbs">
            <span><b>Employee Access & Permission</b></span>
        </div>
        <div class="error-section" id="div_error" runat="server" visible="false">
            <asp:Label ID="lblerror" runat="server">cc</asp:Label>
        </div>
        <br />
        <table class="table-form">

            <tr>
                <td>Title</td>
                <td>
                    <asp:TextBox ID="txtServices" Width="100%" TabIndex="1" placeholder="Title" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>

                <td>Vehicle Type</td>
                <td>
                  
                </td>
            </tr>
            <tr>

                <td>Amount</td>
                <td>
                    <asp:TextBox ID="txtamount" TabIndex="2" placeholder="0.00" TextMode="Number" runat="server"></asp:TextBox>
                </td>
            </tr>

        </table>
    </div>
</asp:Content>

