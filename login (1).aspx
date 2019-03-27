<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content centercontent">
        <div class="bread-crumbs">
            <span>Home \ <b>Employee Login</b></span>
        </div>
        <div class="error-section" id="div_error" runat="server" visible="false">
            <asp:Label ID="lblerror" runat="server">cc</asp:Label>
        </div>
        <div id="form-login">
            <h1>LOGIN FORM</h1>
            <%--<h6>Note: All filed with asterisk (*) are required fields.</h6>--%>
            <div class="form-header center-align">
               <br />
                <table>
                    <tr>
                       
                        <td>
                            <asp:TextBox ID="txtUsername" runat="server" Width="100%" placeholder="USERNAME"></asp:TextBox></td>
                    </tr>
                     <tr>
                       
                        <td>
                            <asp:TextBox ID="txtPassword" runat="server" Width="100%" placeholder="PASSWORD" TextMode="Password"></asp:TextBox></td>
                    </tr>
                      <tr>
                       
                        <td  id="btn">
                        <asp:Button ID="btnLogin" runat="server" Width="100%" Text="LOGIN" OnClick="btnLogin_Click" />
                        </td>
                    </tr>
                </table>

            </div>
        </div>
    </div>
</asp:Content>

