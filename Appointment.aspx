<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="appointment.aspx.cs" Inherits="Appointment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls"
        TagPrefix="BDP" %>
    <%--<asp:ScriptManager runat="server" ID="scriptmanager2"></asp:ScriptManager>--%>
    <%--  <asp:ScriptManager runat="server" ID="scriptmanager"></asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="updatepanel">
        <ContentTemplate>--%>


    <%--<link rel="stylesheet" type="text/css" href="css/style.css" />--%>
    <div class="content centercontent">
         
        <div class="bread-crumbs">
            <span>Home \ <b>Appointment</b></span>
        </div>
       <div class="error-section" id="div_error" runat="server" visible="false">
            <asp:Label ID="lblerror" runat="server">cSSSSSSSSSSSSSSSSSc</asp:Label>
        </div>
        <div id="form">
            <h1>APPOINTMENT REQUEST FORM</h1>
            <h6>Note: All filed with asterisk (*) are required fields.</h6>
            <div class="form-header">

                <table>
                    <tr>
                        <td>First Name *
                        </td>
                        <td>
                            <asp:TextBox ID="txtCFname" runat="server" placeholder="(required)"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Last Name *
                        </td>
                        <td>
                            <asp:TextBox ID="txtCLname" runat="server" placeholder="(required)"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Address  
                        </td>
                        <td>
                            <asp:TextBox ID="txtCAddress" runat="server" placeholder=""></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Phone Number *
                        </td>
                        <td>
                            <asp:TextBox ID="txtCphoneNumber" TextMode="Number" runat="server" placeholder="(required)"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Email Address
                        </td>
                        <td>
                            <asp:TextBox ID="txtCus_Email" TextMode="Email" runat="server" placeholder="(required)"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Service Provider 
                        </td>
                        <td>
                            <asp:TextBox ID="txtServiceProvider"  runat="server" placeholder=""></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Car Model Type *
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCcartype" runat="server" DataSourceID="sds_carmake" AppendDataBoundItems="true" DataTextField="CarMake" DataValueField="ID">
                                <asp:ListItem Value="0" Text="Select Car Type"></asp:ListItem>
                            </asp:DropDownList>

                        </td>
                    </tr>
                    <tr>
                        <td>Schedule Date
                        </td>
                        <td>
                            <%--<input typeof="text" placeholder="DD/MM/YYYY" />--%>
                            <%--<BDP:BDPLite ID="dpScheduleDate" TextBoxStyle-Width="60%" runat="server"></BDP:BDPLite>--%>
                              <asp:TextBox ID="txtscheduleddate"  runat="server" MaxLength="10" TextMode="Date"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Time</td>
                        <td>
                            <asp:DropDownList ID="ddlCTime" runat="server" AppendDataBoundItems="True" DataSourceID="sds_time" DataTextField="timetitle" DataValueField="timetitle">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </div>

            <div id="services">
                <h4>Interior Detail Services (Please select all desired services)</h4>


                <asp:GridView ID="gvInterior" Width="100%" CssClass="table" OnRowDataBound="gvInterior_RowDataBound" runat="server" DataSourceID="sds_interior" AutoGenerateColumns="False" DataKeyNames="Services,ServiceCode">
                    <Columns>
                        <asp:BoundField DataField="id" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" HeaderText="id" InsertVisible="False" SortExpression="id" ReadOnly="True" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="cbselectservice" Width="100%" Height="100%" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Services" HeaderText="Service" ReadOnly="True" SortExpression="Services" />
                        <%--<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />--%>
                        <%--<asp:BoundField DataField="ServiceCode" HeaderText="ServiceCode" SortExpression="ServiceCode" ReadOnly="True" />--%>
                        <asp:BoundField DataField="ServiceCharge" HeaderText="Cost($)" SortExpression="ServiceCharge" />
                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="sds_interior" runat="server" ConnectionString="<%$ ConnectionStrings:DBConstring %>" SelectCommand="SELECT * FROM [Services] where type='Interior'"></asp:SqlDataSource>
                <br />
                <h4>Exterior Detail Services (Please select all desired services)</h4>
                <asp:GridView ID="gv_exterior" Width="100%" CssClass="table" runat="server" DataSourceID="sds_exterior" AutoGenerateColumns="False" DataKeyNames="Services,ServiceCode">
                    <Columns>
                        <asp:BoundField DataField="id" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" HeaderText="id" InsertVisible="False" SortExpression="id" ReadOnly="True" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="cbselectservice" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Services" HeaderText="Service" ReadOnly="True" SortExpression="Services" />
                        <%--<asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />--%>
                        <%--<asp:BoundField DataField="ServiceCode" HeaderText="ServiceCode" SortExpression="ServiceCode" ReadOnly="True" />--%>
                        <asp:BoundField DataField="ServiceCharge" HeaderText="Cost($)" SortExpression="ServiceCharge" />
                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    </Columns>
                </asp:GridView>

                <span></span>
                <asp:SqlDataSource ID="sds_exterior" runat="server" ConnectionString="<%$ ConnectionStrings:DBConstring %>" SelectCommand="SELECT * FROM [Services] where type='Exterior'"></asp:SqlDataSource>
            </div>
            <div class="form-footer">
                <asp:Button ID="btnSubmit"  CssClass="button" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
                <%--<input type="button" class="button" title="SUBMIT" value="SUBMIT" />--%>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="sds_carmake" runat="server" ConnectionString="<%$ ConnectionStrings:DBConstring %>" SelectCommand="SELECT id,UPPER(carmake) carmake FROM CarMakerlist order by carmake"></asp:SqlDataSource>
   <asp:SqlDataSource ID="sds_time" runat="server" ConnectionString="<%$ ConnectionStrings:DBConstring %>" SelectCommand="SELECT * FROM SCHEDULEDtime ORDER BY id"></asp:SqlDataSource>

</asp:Content>

