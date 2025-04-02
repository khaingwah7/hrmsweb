<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="HRMS_Web.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Contact us.</h3>
        <address>
            Choa Chu Kang Central<br />
            Singapore 680355<br />
            <abbr title="Phone">Phone :</abbr>
            +65 98527051
        </address>

        <address>
            <strong>Support:</strong>   <a href="mailto:khaingwahwm@gmail.com">khaingwahwm@gmail.com</a><br />
            <strong>Marketing:</strong> <a href="mailto:kwahwm@gmail.com">kwahwm@gmail.com</a>
        </address>
    </main>
</asp:Content>
