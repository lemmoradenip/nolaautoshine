<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Inventory.aspx.cs" Inherits="Inventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
    <div class="form">
        <div class="bread-crumbs">
            <span>Dashboard \ Inventory \ <b>Item Card</b></span>
        </div>
        <div class="error-section" id="div_error" runat="server" visible="false">
            <asp:Label ID="lblerror" runat="server">cc</asp:Label>
        </div>
        <br />
        <table class="table-form">
            <tr>
                <td>Item No.*</td>
                <td>
                    <asp:TextBox ID="txtItemNo" Enabled="true" placeholder="Item No./Code" runat="server"></asp:TextBox>
                </td>
                <td>Unit Amount*</td>
                <td>
                    <asp:TextBox ID="txtBaseAmount" TextMode="Number" placeholder="0.00" Enabled="true" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Item Description*</td>
                <td>
                    <asp:TextBox ID="txtItemDesc" runat="server" placeholder="Item Description"></asp:TextBox>
                </td>

                <td>UOM*</td>
                <td>
                    <asp:TextBox ID="txtUOM" placeholder="Unit of Measure" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Quantity Receive*</td>
                <td>
                    <asp:TextBox ID="txtqtyreceive" runat="server" TextMode="Number" placeholder="Qty receive"></asp:TextBox>
                </td>

                <td>Total Amount Receive*</td>
                <td>
                    <asp:TextBox ID="txtamountreceive" placeholder="0.00" TextMode="Number" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>From Vendor*</td>
                <td>
                    <asp:DropDownList ID="ddlvendor" runat="server" AppendDataBoundItems="True" DataSourceID="sds_vendor" DataTextField="VendorName" DataValueField="id">
                        <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sds_vendor" runat="server" ConnectionString="<%$ ConnectionStrings:DBConstring %>" SelectCommand="SELECT [id], [VendorName] FROM [Vendor] ORDER BY [VendorName]"></asp:SqlDataSource>
                </td>

                <td>Date Receiving*</td>
                <td>
                    <asp:TextBox ID="txtdatereceive" TextMode="Date" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Invoice*</td>
                <td>
                    <asp:TextBox ID="txtInvoice" runat="server" placeholder="Invoice No."></asp:TextBox>
                </td>

                <td>Notes</td>
                <td>
                    <asp:TextBox ID="txtnotes" runat="server" placeholder="Comments/Notes"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <div class="form-header-bottom">
            <asp:Button ID="btnsave" CssClass="button" OnClick="btnsave_Click" runat="server" Text="SAVE" />
            <asp:Button ID="btnfind" runat="server" OnClick="btnfind_Click" CssClass="button" Text="FIND" />
        </div>
    </div>
    <div id="services">
        <asp:GridView ID="gv_items" CssClass="table" OnRowDataBound="gv_items_RowDataBound" Width="100%" AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:BoundField ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" DataField="materialid" />
                <asp:TemplateField HeaderText="No.">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                    <HeaderStyle Width="5%" />
                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                </asp:TemplateField>
                <asp:BoundField DataField="ItemNo" HeaderText="Item No." ItemStyle-Width="20%" HeaderStyle-Width="20%" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" ItemStyle-Width="20%" HeaderStyle-Width="20%" />
                <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                <asp:BoundField DataField="QtyReceive" HeaderText="Qty Receive" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                  <asp:BoundField DataField="Total" HeaderText="TOTAL" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                                <asp:BoundField DataField="UOM" HeaderText="UOM" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                <asp:BoundField DataField="VendorName" HeaderText="Vendor" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                <asp:BoundField DataField="InvoiceNo" HeaderText="Invoice" DataFormatString="{0:dd-MMM-yyyy}" ItemStyle-Width="10%" HeaderStyle-Width="10%" />


                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkdelete" ForeColor="Red" runat="server" OnClick="lnkdelete_Click" Text="DELETE"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle Width="5%" />
                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:HiddenField ID="hfmaterialid" runat="server" />
    </div>
</asp:Content>

