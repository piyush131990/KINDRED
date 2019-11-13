<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Kindred.MIT.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
         body {
    background-color: #997A8D;
}
        .navbar-inverse {
    background-color: #f4decb;
    border-color: #f4decb;
}
        .navbar-inverse .navbar-brand {
    color: #94618E;
}
        .navbar-inverse .navbar-nav>li>a {
    color: #94618E;
}
        .btn-block {
    display: block;
    width: 32%;
}
        .btn-primary {
    color: #fff;
    background-color: #997A8D;
    border-color: #997A8D;
}
    </style>
    <h2><%: Title %>.</h2>
    <h3>Your contact page.</h3>
    <address>
        One Microsoft Way<br />
        Redmond, WA 98052-6399<br />
        <abbr title="Phone">P:</abbr>
        425.555.0100
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>
</asp:Content>
