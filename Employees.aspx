<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Employees.aspx.cs" Inherits="Employees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
    <div class="form">
        <div class="bread-crumbs">
            <span>Dashboard \ <b>Employee</b></span>
        </div>
        <div class="error-section" id="div_error" runat="server" visible="false">
            <asp:Label ID="lblerror" runat="server">cc</asp:Label>
        </div>
        <br />
        <table class="table-form">
            <tr>
                <td>Employee Id</td>
                <td>
                    <asp:TextBox ID="txtEmployeeId"  Enabled="false" runat="server"></asp:TextBox>
                </td>
                <td>Department* </td>
                <td>
                    <asp:DropDownList ID="ddldepartment" TabIndex="7" runat="server" AppendDataBoundItems="True" DataSourceID="sds_department" DataTextField="DepartmentName" DataValueField="id">
                        <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sds_department" runat="server" ConnectionString="<%$ ConnectionStrings:DBConstring %>" SelectCommand="SELECT [DepartmentName], [id] FROM [Department] ORDER BY [DepartmentName]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>First Name*</td>
                <td>
                    <asp:TextBox ID="txtFname" TabIndex="1" runat="server" placeholder="First Name"></asp:TextBox>
                </td>

                <td>Job*</td>
                <td>
                    <asp:TextBox ID="txtJOb" TabIndex="8" placeholder="Staff" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Last Name*</td>
                <td>
                    <asp:TextBox ID="txtLname" TabIndex="2" runat="server" placeholder="Last Name"></asp:TextBox>
                </td>
                <td>Hiring date*</td>
                <td>
                    <asp:TextBox ID="txthiringdate" TabIndex="9" TextMode="Date" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Address</td>
                <td>
                    <asp:TextBox ID="txtAddress" TabIndex="3"  placeholder="Address" runat="server"></asp:TextBox>
                </td>
                <td>End date</td>
                <td>
                    <asp:TextBox ID="txtEnddate" TabIndex="10" TextMode="Date" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Phone</td>
                <td>
                    <asp:TextBox ID="txtPhone"  TabIndex="4" TextMode="Number" placeholder="05-000-0000" runat="server"></asp:TextBox>
                </td>
                 <td>Email</td>
                <td>
                    <asp:TextBox ID="txtemail" TabIndex="11" TextMode="Email" placeholder="email@email.com" runat="server"></asp:TextBox>
                </td>
            </tr>
                <tr>
                <td>SSN</td>
                <td>
                    <asp:TextBox ID="txtSSN"  TabIndex="5"  placeholder="Social Security No." runat="server"></asp:TextBox>
                </td>
                 <td>Pay Type</td>
                <td>
                    <asp:DropDownList ID="ddlpaytype" TabIndex="12" runat="server" AppendDataBoundItems="true" >
                         <asp:ListItem Text="HOURLY" Value="HOURLY"></asp:ListItem>
                        <asp:ListItem Text="SALARY" Value="SALARY"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
              <tr>
                <td>RATE</td>
                <td>
                    <asp:TextBox ID="txtRate"  TabIndex="6"   placeholder="Salary / Hourly rate" runat="server"></asp:TextBox>
                </td>
                 <td>OT RATE</td>
                <td>
                    <asp:TextBox ID="txtOtRate"  TabIndex="13"  TextMode="Number" placeholder="Over time rate" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <div class="form-header-bottom">
            <asp:Button ID="btnsave" CssClass="button" TabIndex="9" OnClick="btnsave_Click" runat="server" Text="CREATE" />
            <asp:Button ID="btnfind" runat="server" TabIndex="10" CssClass="button" Text="FIND" />
        </div>
    </div>
    <div id="services">
        <asp:GridView ID="gv_employees" CssClass="table" OnRowDataBound="gv_employees_RowDataBound" Width="100%" AutoGenerateColumns="false" runat="server">
            <Columns>
                <asp:BoundField DataField="Employeeid" />
              <%--  <asp:TemplateField HeaderText="No.">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                    <HeaderStyle Width="5%" />
                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                </asp:TemplateField>--%>
                <asp:BoundField DataField="Name" HeaderText="Name"  ItemStyle-Width="20%" HeaderStyle-Width="20%" />
                <asp:BoundField DataField="DepartmentName" HeaderText="Department" ItemStyle-Width="5%" HeaderStyle-Width="5%" />
                <asp:BoundField DataField="Emp_Address" HeaderText="Address" ItemStyle-Width="35%" HeaderStyle-Width="35%" />
                <asp:BoundField DataField="Emp_Phone" HeaderText="Phone" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                <asp:BoundField DataField="Emp_Job" HeaderText="Job" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                <asp:BoundField DataField="HiredDate" HeaderText="Hire Date" DataFormatString="{0:dd-MMM-yyyy}" ItemStyle-Width="10%" HeaderStyle-Width="10%" />
                <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-Width="10%" HeaderStyle-Width="10%" />

                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkView" TabIndex="11" CssClass="" ForeColor="Yellow" OnClick="lnkView_Click" runat="server" Text="VIEW"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle Width="5%" />
                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                </asp:TemplateField>
                   <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkdelete" TabIndex="11" CssClass="" ForeColor="Red" OnClientClick="return confirm('Are you sure you want to delete?');"  OnClick="lnkdelete_Click" runat="server" Text="DELETE"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle Width="5%" />
                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="hfusername" runat="server" />
    </div>
</asp:Content>

