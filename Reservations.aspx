﻿<%@ Page Title="NOLA" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Reservations.aspx.cs" Inherits="Reservations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
    <div class="content centercontent">
        <div class="form">
            <div class="bread-crumbs">
                <span>Dashboard \ <b>Reservation list</b></span>
            </div>
            <div class="error-section" id="div_error" runat="server" visible="false">
                <asp:Label ID="lblerror" runat="server">cc</asp:Label>
            </div>
            <br />
            <table class="table-form">
                <tr>
                    <td>System Date</td>
                    <td><asp:Label ID="lblsysdate" runat="server"></asp:Label></td>
                </tr>
               
                 <tr>
                    <td>Scheduled Date
                    </td>
                    <td>
                        <asp:TextBox ID="txtscheduleddate"  runat="server" MaxLength="10" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Time
                    </td>
                    <td>
                        <asp:DropDownList ID="ddltime" runat="server" AppendDataBoundItems="true" DataSourceID="sds_time" DataTextField="timetitle" DataValueField="timetitle">
                            <asp:ListItem Value="" Text="Select"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Mobile No.
                    </td>
                    <td>
                        <asp:TextBox ID="txtmobileno" placeholder="Mobile Number" runat="server" MaxLength="10" TextMode="Number"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button CssClass="button" ID="btnFind" OnClick="btnFind_Click"  runat="server" Text="Find" />
                    </td>
                </tr>
            </table>
        </div>
        
        <div id="services">
            <asp:GridView ID="gv_reservations" CssClass="table" OnRowDataBound="gv_reservations_RowDataBound" OnDataBound="gv_reservations_DataBound"  Width="100%" AutoGenerateColumns="false" runat="server" >
                <Columns>
                    <asp:BoundField ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" DataField="id" />
                    <asp:TemplateField HeaderText="No.">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                        <HeaderStyle Width="3%" />
                        <ItemStyle HorizontalAlign="Center" Width="3%" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="name" HeaderText="Customer Name" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                    <asp:BoundField DataField="scheduleddate" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                    <asp:BoundField DataField="ScheduledTime" HeaderText="Time" ItemStyle-Width="10%" HeaderStyle-Width="10%"/>
                    <asp:BoundField DataField="carmake" HeaderText="Carmake" ItemStyle-Width="5%" HeaderStyle-Width="5%"/>                   
                      <asp:BoundField DataField="vehicletype" HeaderText="Type" ItemStyle-Width="10%" HeaderStyle-Width="10%"/>
                       <asp:BoundField DataField="color" HeaderText="Color" ItemStyle-Width="5%" HeaderStyle-Width="5%"/>
                    <asp:BoundField DataField="mobile" HeaderText="Mobile No." ItemStyle-Width="10%" HeaderStyle-Width="10%"/>
                    <%--<asp:BoundField DataField="email" HeaderText="Email" ItemStyle-Width="10%" HeaderStyle-Width="10%"/>--%>
                      <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkprint" CssClass="" OnClick="lnkprint_Click"  runat="server" ForeColor="ORANGE" Text="PRINT"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="5%" />
                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkjob" CssClass="" ForeColor="LightGreen" OnClick="lnkjob_Click"  runat="server" Text="CLOSE TICKET"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="5%" />
                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkpay" CssClass="" OnClick="lnkpay_Click" ForeColor="YELLOW"  runat="server" Text="PAY"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="5%" />
                        <ItemStyle HorizontalAlign="Center" Width="5%"   />
                    </asp:TemplateField>
                      <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkdelete" CssClass="" OnClientClick="return confirm('Are you sure you want to delete?');" ForeColor="Red" OnClick="lnkdelete_Click"  runat="server" Text="DELETE"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="5%" />
                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                    </asp:TemplateField>
                     <asp:BoundField ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" DataField="ispaid" />
                </Columns>
            </asp:GridView>
        </div>

        <asp:SqlDataSource ID="sds_reservations" runat="server" ConnectionString="<%$ ConnectionStrings:DBConstring %>" SelectCommand="SELECT * FROM CUSTOMER_v  ORDER BY SCHEDULEDDATE ">
<%--            <SelectParameters>
                <asp:ControlParameter Name="scheduleddate" ControlID="txtscheduleddate" Type="String"   PropertyName="TextChanged"/>
            </SelectParameters>--%>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sds_time" runat="server" ConnectionString="<%$ ConnectionStrings:DBConstring %>" SelectCommand="SELECT * FROM SCHEDULEDtime ORDER BY id"></asp:SqlDataSource>

    </div>
</asp:Content>

