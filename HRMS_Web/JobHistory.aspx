<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobHistory.aspx.cs" Inherits="HRMS_Web.JobHistory" %>

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
        <asp:Label ID="Label10" runat="server" BackColor="#FFCCCC" BorderColor="#FF9966" BorderStyle="Solid" Font-Bold="True" Font-Names="Calibri" Font-Size="XX-Large" ForeColor="#666666" Text="Employee's Job History List"></asp:Label>
    </div>
    &nbsp;
        <br />
    <br />
    <div>
    </div>
    Search Job History:
    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
    <asp:Button Text="Search" runat="server" OnClick="Search" />
    <asp:Button Text="Show All" runat="server" OnClick="All" />
    <hr />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="Id"
        OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
        OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." AllowPaging="true"
        OnPageIndexChanging="OnPaging">
        <Columns>
            <asp:TemplateField HeaderText="Employee" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lblEmployee" runat="server" Text='<%# Eval("Employee") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lblEmployee" runat="server" Text='<%# Eval("Employee")%>' Visible="false"></asp:Label>
                    <asp:DropDownList ID="ddlEmployee" runat="server">
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField HeaderText="Manager" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lblman" runat="server" Text='<%# Eval("Manager") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtManager" runat="server" Text='<%# Eval("Manager") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvman" ControlToValidate="txtManager" runat="server"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Job Role" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lblrole" runat="server" Text='<%# Eval("JobRole") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lblrole" runat="server" Text='<%# Eval("JobRole")%>' Visible="false"></asp:Label>
                    <asp:DropDownList ID="ddlrole" runat="server">
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Start Date" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lblStartDate" runat="server" Text='<%# Eval("StartDate") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtStartDate" runat="server" Text='<%# Eval("StartDate") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvdate" ControlToValidate="txtStartDate" runat="server"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rvDate" runat="server" ControlToValidate="txtStartDate" ErrorMessage="Invalid Date" Type="Date" MinimumValue="01/01/1900" MaximumValue="01/01/2100" Display="Dynamic"></asp:RangeValidator>
                </EditItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="End Date" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lblEndDate" runat="server" Text='<%# Eval("EndDate") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtEndDate" runat="server" Text='<%# Eval("EndDate") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvenddate" ControlToValidate="txtEndDate" runat="server"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rvEndDate" runat="server" ControlToValidate="txtEndDate" ErrorMessage="Invalid Date" Type="Date" MinimumValue="01/01/1900" MaximumValue="01/01/2100" Display="Dynamic"></asp:RangeValidator>
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

            <asp:TemplateField HeaderText="Comments" ItemStyle-Width="150">
                <ItemTemplate>
                    <asp:Label ID="lblComments" runat="server" Text='<%# Eval("Comments") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtComments" runat="server" Text='<%# Eval("Comments") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvComments" ControlToValidate="txtComments" runat="server"
                        ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true"
                ItemStyle-Width="150" />
        </Columns>
    </asp:GridView>
    <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
        <tr>
            <td style="width: 150px">Employee:<br />
                <asp:DropDownList ID="ddlEmployee" runat="server" Width="140">
                </asp:DropDownList>
            </td>

            <td style="width: 150px">Manager:<br />
                <asp:TextBox ID="txtManager" runat="server" Width="140" />
            </td>
            <td style="width: 150px">Job Role:<br />
                <asp:DropDownList ID="ddlrole" runat="server" Width="140">
                </asp:DropDownList>
            </td>
            <td style="width: 150px">Start Date:<br />
                <asp:TextBox ID="txtStartDate" runat="server" Width="140" />
                <asp:RangeValidator ID="rvDate" runat="server" ControlToValidate="txtStartDate" ErrorMessage="Invalid Date" Type="Date" MinimumValue="01/01/1900" MaximumValue="01/01/2100" Display="Dynamic"></asp:RangeValidator>
            </td>
            <td style="width: 150px">End Date:<br />
                <asp:TextBox ID="txtEndDate" runat="server" Width="140" />
                <asp:RangeValidator ID="rvEndDate" runat="server" ControlToValidate="txtEndDate" ErrorMessage="Invalid Date" Type="Date" MinimumValue="01/01/1900" MaximumValue="01/01/2100" Display="Dynamic"></asp:RangeValidator>
            </td>

            <td style="width: 150px">Status:<br />
                <asp:TextBox ID="txtStatus" runat="server" Width="140" />
            </td>
            <td style="width: 150px">Comments:<br />
                <asp:TextBox ID="txtComments" runat="server" Width="140" />

            </td>
            <td style="width: 100px">
                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" />
            </td>
        </tr>
    </table>
</asp:Content>
