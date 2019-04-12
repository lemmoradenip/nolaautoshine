<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Department.aspx.cs" Inherits="Employees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" type="text/css" href="css/dashboard.css" />
    <div class="form">
        <div class="bread-crumbs">
            <span>Dashboard \ <b>Department</b></span>
        </div>
        <div class="error-section" id="div_error" runat="server" visible="false">
            <asp:Label ID="lblerror" runat="server">cc</asp:Label>
        </div>
        <br />
        <table class="table-form">
            <tr>
                <td>Department Id</td>
                <td>
                    <asp:TextBox ID="txtEmployeeId" Enabled="false" runat="server"></asp:TextBox>
                </td>
               <td>Manager Id*</td>
                <td>
                    <asp:TextBox ID="txtmanagerid" TabIndex="0" runat="server" TextMode="Number" placeholder="Manager Id"></asp:TextBox>
                </td>
            </tr>
            <tr>
               
                  <td>Department Name* </td>
                <td>
                    <asp:TextBox ID="txtdepartmentname" placeholder="Department Name" runat="server"></asp:TextBox>
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
                <asp:BoundField  DataField="id"  HeaderText="Id" ItemStyle-Width="5%" HeaderStyle-Width="5%"/>
                <%--<asp:TemplateField HeaderText="No.">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                    <HeaderStyle Width="5%" />
                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                </asp:TemplateField>--%>
                <asp:BoundField DataField="departmentname" HeaderText="Name"  ItemStyle-Width="85%" HeaderStyle-Width="85%" />
          
                    <asp:BoundField DataField="MANAGERID" HeaderText="MANAGERID"  ItemStyle-Width="5%" HeaderStyle-Width="5%" />
          
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkView" TabIndex="11" CssClass="" OnClick="lnkView_Click" runat="server" Text="VIEW"></asp:LinkButton>
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

    </div>
</asp:Content>

