<%@ Page Language="VB" AutoEventWireup="false" CodeFile="stripetest.aspx.vb" Inherits="stripetest" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <%--<asp:Button ID="btnSubmit" runat="server" Text="Button" />
        <p>
            <asp:Label ID="lblResult" runat="server" Text="Label"></asp:Label>
        </p>--%>
        <p style="margin-top: 30px;">
            <asp:Label ID="Label3" runat="server" Text="Email: "></asp:Label>
            <asp:TextBox ID="txtCustomerEmail" runat="server" Text=""></asp:TextBox>
        </p>
        <p style="margin-top: 30px;">
            <asp:Label ID="Label1" runat="server" Text="Card Number: "></asp:Label>
            <asp:TextBox ID="txtCardNumber" runat="server" Text=""></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Expiration Data (Month / Year): "></asp:Label>
            <asp:TextBox ID="txtExpirationMonth" runat="server" Text="" Width="20px"></asp:TextBox>
            <asp:Label ID="Label6" runat="server" Text="/"></asp:Label>
            <asp:TextBox ID="txtExpirationYear" runat="server" Text="" Width="30px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="CVC: "></asp:Label>
            <asp:TextBox ID="txtCvc" runat="server" Text=""></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="btnCreateCustomer" runat="server" Font-Size="14pt" Text="Create Customer" style="margin-top: 25px"/>
        </p>
        <p>
            <asp:Label ID="Label7" runat="server" Font-Size="14pt" Text="CustomerID: "></asp:Label>
            <asp:Label ID="lblCustomerId" runat="server" Font-Size="14pt" Text=""></asp:Label>
        </p>
        <asp:Button ID="btnGetSubscriptions" runat="server" Font-Size="14pt" Text="Get Subscriptions" style="margin-top: 25px"/>
        <p>
            <asp:TextBox ID="txtSubscriptions" runat="server" Height="300px" TextMode="MultiLine" Width="700px"></asp:TextBox>
        </p>
        <p style="margin-top: 30px;">
            <asp:Label ID="Label5" runat="server" Text="Plan ID: "></asp:Label>
            <asp:TextBox ID="txtSubscriptionID" runat="server" Text="" Width="300px"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="btnSendMoney" runat="server" Font-Size="16pt" Text="Purchase Subscription" />
        </p>
        <p>
            <asp:Label ID="lblMessage" runat="server" Font-Size="14pt" Text="Subscription result: "></asp:Label>
        </p>

        <%--<asp:Label ID="lblSubscriptionID" runat="server" Font-Size="14pt" Text="Label"></asp:Label>--%>
        
        <%--<asp:Button ID="Button1" runat="server" Text="Button" />--%>
    </form>
</body>
</html>

