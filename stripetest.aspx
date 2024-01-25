<%@ Page Language="VB" AutoEventWireup="false" CodeFile="stripetest.aspx.vb" Inherits="stripetest" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Stripe Elements Example</title>
    <script src="https://js.stripe.com/v3/"></script>
    <style>
        /* Custom styles for the card element */
        #card-element {
            width: 600px;
            height: 20px;
            padding: 10px 12px;
            color: #32325d;
            background-color: white;
            border: 1px solid transparent;
            border-radius: 4px;
            box-shadow: 0 1px 3px 0 #e6ebf1;
            -webkit-transition: box-shadow 150ms ease;
            transition: box-shadow 150ms ease;
        }
        .card-element--focus {
          box-shadow: 0 1px 3px 0 #cfd7df;
        }
        .card-element--invalid {
          border-color: #fa755a;
        }
        .error-message {
          color: #fa755a;
        }
      </style>
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
        <div id="card-element" style="margin-top: 30px"></div>
        <button id="createToken" style="margin-top: 10px">
            Create Card Token
        </button>
        <asp:TextBox ID="txtCardTokenId" runat="server" Text="" ></asp:TextBox>

        <%--<p style="margin-top: 30px;">
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
        </p>--%>
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

    <script type="text/javascript">
        var stripe = Stripe('pk_test_BDpNcsZv8ZQfy0DtrJYEOypc');
        var elements = stripe.elements();

        // Customize the appearance of the card element
        var style = {
            base: {
                fontSize: '16px',
                color: '#32325d',
            },
        };

        // Create the card element with custom style and hide the postal code field
        var card = elements.create('card', {
            style: style,
            hidePostalCode: true  // Hide the postal code field
        });

        card.mount('#card-element');

        var createTokenEle = document.getElementById('createToken');
        createTokenEle.addEventListener('click', function (event) {
            event.preventDefault();

            stripe.createToken(card).then(function (result) {
                if (result.error) {
                    // Inform the user if there was an error
                    console.log(result.error.message);
                } else {
                    // Send the token to your server
                    stripeTokenHandler(result.token);
                }
            });
        });

        function stripeTokenHandler(token) {
            // Insert the token ID into the form so it gets submitted to the server
            var cardToken = document.getElementById('txtCardTokenId');
            cardToken.value = token.id;
        }
    </script>
</body>
</html>

