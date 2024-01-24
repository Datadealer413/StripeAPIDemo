<%@ Page Language="VB" AutoEventWireup="false" CodeFile="stripetest.aspx.vb" Inherits="stripetest" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Button ID="btnSubmit" runat="server" Text="Button" />
        <p>
            <asp:Label ID="lblResult" runat="server" Text="Label"></asp:Label>
        </p>
        <p>
            <asp:Button ID="btnCreateCustomer" runat="server" Font-Size="14pt" Text="Create Customer" />
        </p>
        <asp:Button ID="btnSendMoney" runat="server" Font-Size="16pt" Text="Send Money to subscription" />
        <asp:Label ID="lblSubscriptionID" runat="server" Font-Size="14pt" Text="Label"></asp:Label>
        <p>
            <asp:Label ID="lblMessage" runat="server" Font-Size="14pt" Text="Label"></asp:Label>
        </p>
        <p>
            <asp:Label ID="lblCustomerId" runat="server" Font-Size="14pt" Text="Label"></asp:Label>
        </p>
        <asp:Button ID="btnGetSubscriptions" runat="server" Font-Size="14pt" Text="Get Subscriptions" />
        <p>
            <asp:TextBox ID="txtSubscriptions" runat="server" Height="500px" TextMode="MultiLine" Width="500px"></asp:TextBox>
        </p>
        <asp:Button ID="Button1" runat="server" Text="Button" />
    </form>
</body>
</html>

