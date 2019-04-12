<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Vendor.aspx.cs" Inherits="Vendor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form">
        <div class="bread-crumbs">
            <span>Dashboard \ Inventory \ <b>Vendor Card</b></span>
        </div>
        <div class="error-section" id="div_error" runat="server" visible="false">
            <asp:Label ID="lblerror" runat="server">cc</asp:Label>
        </div>
        <br />
        <table class="table-form">
            <tr>
                <td>Vendor Id*</td>
                <td>
                    <asp:TextBox ID="txtvendorid" TabIndex="1" Enabled="false"  runat="server"></asp:TextBox>
                </td>
                            </tr>
            <tr>
                <td>Vendor Name</td>
                <td>
                    <asp:TextBox ID="txtVendorName" TabIndex="2" runat="server" placeholder="Vendor Name"></asp:TextBox>
                </td>

                <td>Phone</td>
                <td>
                    <asp:TextBox ID="txtphone" TabIndex="3" placeholder="Contact Number" TextMode="Number" runat="server"></asp:TextBox>
                </td>
            </tr>
           <tr>
                <td>Address</td>
                <td>
                    <asp:TextBox ID="txtaddress" TabIndex="4" runat="server" placeholder="Address/website"></asp:TextBox>
                </td>

                <td>Contact Person</td>
                <td>
                    <asp:TextBox ID="txtcontactperson" TabIndex="5" placeholder="Person"  runat="server"></asp:TextBox>
                </td>
            </tr>
             
        </table>
        <br />
        <div class="form-header-bottom">
            <asp:Button ID="btnsave" CssClass="button"  OnClick="btnsave_Click" TabIndex="6" runat="server" Text="SAVE" />
            <asp:Button ID="btnfind" runat="server" CssClass="button" Text="FIND" />
        </div>
    </div>
    <div id="services">
        <asp:GridView ID="gv_vendor" CssClass="table" OnRowDataBound="gv_vendor_RowDataBound" Width="100%" AutoGenerateColumns="False" runat="server" >
            <Columns>
                <asp:BoundField ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" DataField="ID" />
                <asp:TemplateField HeaderText="No.">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                    <HeaderStyle Width="5%" />
                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                </asp:TemplateField>
                <asp:BoundField DataField="vendorname" HeaderText="Vendor Name"  ItemStyle-Width="20%" HeaderStyle-Width="20%" />
                <asp:BoundField DataField="Address" HeaderText="Address" ItemStyle-Width="20%" HeaderStyle-Width="20%" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
             
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkdelete" OnClick="lnkdelete_Click" CssClass="" ForeColor="Red" runat="server" Text="DELETE"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle Width="5%" />
                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
         <asp:SqlDataSource ID="sds_vendor" runat="server" ConnectionString="<%$ ConnectionStrings:DBConstring %>" SelectCommand="SELECT * FROM vendor order by vendorname  ">
             <SelectParameters>
                 
             </SelectParameters>
         </asp:SqlDataSource>

    </div>
</asp:Content>

