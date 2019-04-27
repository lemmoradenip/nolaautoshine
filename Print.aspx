<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Print.aspx.cs" Inherits="Print" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .hidden {
        display:none;
        }
        .table-form {
        width:100%;
        }
         .table-form td:nth-child(odd) {
        width: 15%;
        color: #000000;
        text-align:left;
        /*background-color: yellow;*/
    }
    .table-form td:nth-child(even) {
        width: 35%;
        text-align:left;
        font-weight:700;
        /*background-color:red;*/
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="bread-crumbs">
            <%--<span>Dashboard \ Reservations \<b> Checkout</b>&nbsp;(Customer#  <asp:Label ID="lblcustomerid" runat="server"></asp:Label>)</span>--%>
        </div>
        <div class="error-section" id="div_error" runat="server" visible="false">
            <asp:Label ID="lblerror" runat="server">cc</asp:Label>
        </div>
        <div style="margin:0px;width:100%;text-align:center">
              <h1>NOLA AUTO SHINE</h1> <br />
            <h3>JOB TICKET</h3>
            <hr />
            <table class="table-form">
                <tr>
                    <td style="width: 15%">JOB ID</td>
                    <td style="width: 35%">
                        <asp:Label ID="lbljobid" runat="server"></asp:Label></td>
                    <td style="width: 15%">SCHEDULED DATE</td>
                    <td style="width: 35%">

                        <asp:Label ID="lblscheduleddate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>CUSTOMER NAME</td>
                    <td>
                        <asp:Label ID="lblcustomername" runat="server"></asp:Label></td>
                    <td>SCHEDULED TIME</td>
                    <td>
                        <asp:Label ID="lblscheduledtime" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>ADDRESS</td>
                    <td>
                        <asp:Label ID="lbladdress" runat="server"></asp:Label></td>
                    <td>VEHICLE MAKE</td>
                    <td>
                        <asp:Label ID="lblvehiclemake" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>MOBILE</td>
                    <td>
                        <asp:Label ID="lblmobile" runat="server"></asp:Label></td>
                    <td>MODEL</td>
                    <td>
                        <asp:Label ID="lblmodel" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>EMAIL</td>
                    <td>
                        <asp:Label ID="lblemail" runat="server"></asp:Label></td>
                    <td>COLOR</td>
                    <td>
                        <asp:Label ID="lblcolor" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>VEHICLE TYPE</td>
                    <td>
                        <asp:Label ID="lblvehicletype" runat="server"></asp:Label></td>
                     <td>PRINTED DATE</td>
                    <td>
                        <asp:Label ID="LBLsysdate" runat="server"></asp:Label></td>

                </tr>
                <tr>
                    <td>PAID</td>
                    <td>
                        <asp:Label ID="LBLPAID" runat="server"></asp:Label></td>
                    <td>PAYMENT METHOD</td>
                    <td>
                        <asp:Label ID="lblpaymentmethod" runat="server"></asp:Label></td>
                    

                </tr>
            </table>
            <br />
            <div id="services">
                <asp:GridView ID="gv_services" CssClass="table" OnRowDataBound="gv_services_RowDataBound" AutoGenerateColumns="False" runat="server" Width="100%">
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
                        <asp:BoundField DataField="cartype" HeaderText="Type" />

                        <asp:BoundField DataField="ServiceCharges" HeaderText="Cost" />
                        <asp:BoundField DataField="Isvoid" HeaderText="Void" />
                            <%--<asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkremove" CssClass="" OnClick="lnkremove_Click" ForeColor="Red" OnClientClick="return confirm('Are you sure you want to void this line?');" runat="server" Text="REMOVE"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Width="5%" />
                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:TemplateField>--%>
                    </Columns>
                </asp:GridView>

            </div>
        </div>
    </form>
</body>
</html>
