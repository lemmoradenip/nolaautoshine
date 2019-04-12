<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Services.aspx.cs" Inherits="Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form">
        <div class="bread-crumbs">
            <span>Dashboard \  <b>Services</b></span>
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
                  <asp:DropDownList ID="ddlvehicletype" runat="server" AppendDataBoundItems="True" DataSourceID="sds_vehicletype" DataTextField="cartypedescription" DataValueField="cartypecode">
                     
                  </asp:DropDownList>
                </td>
            </tr>
            <tr>

                <td>Amount</td>
                <td>
                    <asp:TextBox ID="txtamount" TabIndex="2" placeholder="0.00" TextMode="Number" runat="server"></asp:TextBox>
                </td>
            </tr>
           
        </table>
         <div class="form-header-bottom">
            <asp:Button ID="btnsave" CssClass="button" TabIndex="6" runat="server" Text="SAVE" OnClick="btnsave_Click" />
            <asp:Button ID="btnfind" runat="server" CssClass="button" Text="FIND" OnClick="btnfind_Click" />
              <asp:Button ID="btnreset" runat="server" CssClass="button" Text="RESET" OnClick="btnreset_Click" />
        </div>
        <div id="services">
            <asp:GridView ID="gv_services" CssClass="table" OnRowDataBound="gv_services_RowDataBound" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" runat="server" Width="100%">
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
                    <asp:BoundField DataField="ServiceCharge" HeaderText="Service fee($)" />
                    <asp:BoundField DataField="Cartype" HeaderText="Vehicle type" />
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkremove" CssClass="" OnClick="lnkremove_Click" ForeColor="Red" OnClientClick="return confirm('Are you sure you want to void this line?');" runat="server" Text="REMOVE"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="5%" />
                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
              <asp:SqlDataSource ID="sds_vehicletype" runat="server" ConnectionString="<%$ ConnectionStrings:DBConstring %>" SelectCommand="SELECT * FROM vehicletype order by id"></asp:SqlDataSource>
      
        </div>
    </div>
</asp:Content>

