<%@ Page Title="Payroll" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" EnableEventValidation="true" CodeFile="Payroll.aspx.cs" Inherits="Payroll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
    <asp:ScriptManager ID="scrptmgr" runat="server"></asp:ScriptManager>
    <div class="form">
        <div class="bread-crumbs">
            <span>Dashboard \ <b>PAYROLL</b></span>
        </div>
        <asp:UpdatePanel ID="updatepnl" runat="server">
            <ContentTemplate>

                <div class="error-section" id="div_error" runat="server" visible="false">
                    <asp:Label ID="lblerror" runat="server">cc</asp:Label>
                </div>
                <br />
                <table class="table-form">
                    <tr>
                        <td>YEAR</td>
                        <td>
                            <asp:DropDownList ID="ddlyear" Enabled="false" runat="server">
                                <asp:ListItem Value="2019" Text="2019"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>MONTH</td>
                        <td>
                            <asp:DropDownList ID="ddlpayschedule" OnSelectedIndexChanged="ddlpayschedule_SelectedIndexChanged" runat="server" AutoPostBack="true">
                                <asp:ListItem Value="JANUARY" Text="JANUARY"></asp:ListItem>
                                <asp:ListItem Value="FEBRUARY" Text="FEBRUARY"></asp:ListItem>
                                <asp:ListItem Value="MARCH" Text="MARCH"></asp:ListItem>
                                <asp:ListItem Value="APRIL"  Text="APRIL"></asp:ListItem>
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
                </table>

                <%--    <div class="form-header-bottom">
            <asp:Button ID="btnsave" CssClass="button" TabIndex="9" OnClick="btnsave_Click" runat="server" Text="SAVE" />
         
        </div>--%>
                <div id="services">
                    <asp:GridView ID="gv_employees" CssClass="table" OnRowDataBound="gv_employees_RowDataBound" Width="100%" AutoGenerateColumns="false" runat="server" OnRowCommand="gv_employees_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="ID" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
                            <asp:BoundField DataField="Employeeid" HeaderText="ID" ItemStyle-Width="5%" HeaderStyle-Width="5%" />
                            <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="20%" HeaderStyle-Width="20%" />
                            <%--<asp:BoundField DataField="DepartmentName" HeaderText="DEPARTMENT" ItemStyle-Width="5%" HeaderStyle-Width="5%" />--%>
                            <asp:BoundField DataField="Emp_Job" HeaderText="JOB" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                            <asp:BoundField DataField="Paytype" HeaderText="TYPE" ItemStyle-Width="5%" HeaderStyle-Width="5%" />
                            <%--<asp:BoundField DataField="Rate" HeaderText="RATE" DataFormatString="{0:N}" ItemStyle-Width="10%" HeaderStyle-Width="10%" />--%>
                              <asp:TemplateField HeaderText="Rate">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtrate" runat="server" BackColor="#234D6B" ForeColor="Yellow" BorderColor="Transparent" placeholder="0.00" Width="99%" Text='<%# Eval("rate") %>' Height="100%"></asp:TextBox>
                                </ItemTemplate>
                                <HeaderStyle Width="10%" />
                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="WorkedHrs">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtWorkedHrs" runat="server" BackColor="#234D6B" ForeColor="Yellow" BorderColor="Transparent" placeholder="0.00" Width="99%" Text='<%# Eval("workedhrs") %>' Height="100%"></asp:TextBox>
                                </ItemTemplate>
                                <HeaderStyle Width="10%" />
                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                            </asp:TemplateField>
                            <%--<asp:BoundField DataField="totalregular" HeaderText="TOTAL" ItemStyle-Width="10%" HeaderStyle-Width="10%" />--%>
                            <%--<asp:BoundField DataField="OTRATE" HeaderText="OT-RATE" DataFormatString="{0:N}" ItemStyle-Width="10%" HeaderStyle-Width="10%" />--%>
                              <asp:TemplateField HeaderText="OT-RATE">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtotrate" runat="server" BackColor="#234D6B" ForeColor="Yellow" BorderColor="Transparent" placeholder="0.00" Width="99%" Text='<%# Eval("OTRATE") %>' Height="100%"></asp:TextBox>
                                </ItemTemplate>
                                <HeaderStyle Width="10%" />
                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="OT-HRS">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtOTHrs" runat="server" BackColor="#234D6B" placeholder="0.00"   ForeColor="Yellow"  BorderColor="Transparent" Text='<%# Eval("OTHRS") %>' Width="99%" Height="99%"></asp:TextBox>
                                </ItemTemplate>
                                <HeaderStyle Width="10%" />
                                <ItemStyle HorizontalAlign="Center" Width="10%"  VerticalAlign="Middle"/>
                            </asp:TemplateField>
                            <asp:BoundField DataField="TOTALSALARY" DataFormatString="{0:N}" HeaderText="TOTAL SALARY" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkbtnsave" CommandArgument="<%# Container.DataItemIndex %>" CommandName="Save" ForeColor="LightGreen" runat="server" Text="SAVE"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Width="5%" />
                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SLIP">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnktbtnprint" runat="server" CommandArgument="<%# Container.DataItemIndex %>" CommandName="Print" ForeColor="Yellow" Text="PRINT"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Width="5%" />
                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

             </div>

            </ContentTemplate>
        </asp:UpdatePanel>

           </div>
</asp:Content>

