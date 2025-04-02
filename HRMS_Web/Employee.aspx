<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="HRMS_Web.Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        body {
            font-family: Arial;
            font-size: 10pt;
        }

        table {
            border: 1px solid #ccc;
            border-collapse: collapse;
            background-color: #fff;
        }

            table th {
                background-color: #B8DBFD;
                color: #333;
                font-weight: bold;
            }

            table th, table td {
                padding: 5px;
                border: 1px solid #ccc;
            }

            table, table table td {
                border: 0px solid #ccc;
            }
    </style>
    <script type="text/javascript">
        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
        <br />
        <asp:Label ID="Label10" runat="server" BackColor="#FFCCCC" BorderColor="#FF9966" BorderStyle="Solid" Font-Bold="True" Font-Names="Calibri" Font-Size="XX-Large" ForeColor="#666666" Text="Employee List"></asp:Label>
    </div>
    &nbsp;
    <br />
    <br />
    <div>
    </div>
    Search Employee:
    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
    <asp:Button Text="Search" runat="server" OnClick="Search" />
    <asp:Button Text="Show All" runat="server" OnClick="All" />
    <hr />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="Id"
        OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
        OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." AllowPaging="true"
        OnPageIndexChanging="OnPaging">
        <Columns>
            <asp:TemplateField HeaderText="Name" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" ControlToValidate="txtName" runat="server"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Birth Date" ItemStyle-Width="150">
                <ItemTemplate>
                    <%--<asp:Label ID="lblDate" runat="server" Text='<%# Bind("BirthDate" , "{0:dd/MM/yyyy HH:mm tt}") %>' />--%>
                    <asp:Label ID="lblDate" runat="server" Text='<%# Eval("BirthDate") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <%--<asp:TextBox ID="txtDate" runat="server" Text='<%# Bind("BirthDate" , "{0:dd/MM/yyyy HH:mm tt}") %>'></asp:TextBox>--%>
                    <asp:TextBox ID="txtDate" runat="server" Text='<%# Eval("BirthDate") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvdate" ControlToValidate="txtDate" runat="server"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rvDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Invalid Date" Type="Date" MinimumValue="01/01/1900" MaximumValue="01/01/2100" Display="Dynamic"></asp:RangeValidator>

                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtPhone" runat="server" Text='<%# Eval("Phone") %>' onkeypress="return isNumber(event)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPhone" ControlToValidate="txtPhone" runat="server"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Email" ItemStyle-Width="200">
                <ItemTemplate>
                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" ControlToValidate="txtEmail" runat="server"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Gender" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtGender" runat="server" Text='<%# Eval("Gender") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvGender" ControlToValidate="txtGender" runat="server"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAddress" ControlToValidate="txtAddress" runat="server"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtStatus" runat="server" Text='<%# Eval("Status") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvStatus" ControlToValidate="txtStatus" runat="server"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true"
                ItemStyle-Width="150" />
        </Columns>
    </asp:GridView>
    <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
        <tr>
            <td style="width: 150px">Name:<br />
                <asp:TextBox ID="txtName" runat="server" Width="140" />
                <%--<asp:RequiredFieldValidator ID="rfvName" ControlToValidate="txtName" runat="server"
                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
            </td>
            <td style="width: 150px">Birth Date:<br />
                <asp:TextBox ID="txtDate" runat="server" Width="140" />
                <%--<asp:RequiredFieldValidator ID="rfvdate" ControlToValidate="txtDate" runat="server"
                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                <asp:RangeValidator ID="rvDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Invalid Date" Type="Date" MinimumValue="01/01/1900" MaximumValue="01/01/2100" Display="Dynamic"></asp:RangeValidator>
            </td>
            <td style="width: 150px">Phone:<br />
                <asp:TextBox ID="txtPhone" runat="server" Width="140" onkeypress="return isNumber(event)" />
                <%--<asp:RequiredFieldValidator ID="rfvPhone" ControlToValidate="txtPhone" runat="server"
                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                <%--<asp:CompareValidator ID="cv" runat="server" ControlToValidate="txtPhone" Type="Integer"
                    Operator="DataTypeCheck" ErrorMessage="Please enter number only!" />--%>
            </td>
            <td style="width: 150px">Email:<br />
                <asp:TextBox ID="txtEmail" runat="server" Width="190" />
                <%-- <asp:RequiredFieldValidator ID="rfvEmail" ControlToValidate="txtEmail" runat="server"
                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
            </td>
            <td style="width: 150px">Gender:<br />
                <asp:TextBox ID="txtGender" runat="server" Width="140" />
                <%-- <asp:RequiredFieldValidator ID="rfvGender" ControlToValidate="txtGender" runat="server"
                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
            </td>
            <td style="width: 150px">Address:<br />
                <asp:TextBox ID="txtAddress" runat="server" Width="140" />
                <%--  <asp:RequiredFieldValidator ID="rfvAddress" ControlToValidate="txtAddress" runat="server"
                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
            </td>
            <td style="width: 150px">Status:<br />
                <asp:TextBox ID="txtStatus" runat="server" Width="140" />
                <%--<asp:RequiredFieldValidator ID="rfvStatus" ControlToValidate="txtStatus" runat="server"
                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
            </td>
            <td style="width: 100px">
                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" />
            </td>
        </tr>
    </table>
</asp:Content>
