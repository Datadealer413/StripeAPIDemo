<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SubscriptionPage.aspx.vb" Inherits="SubscriptionPage" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Stripe Subscription</title>
    <script src="https://js.stripe.com/v3/"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Subscribe to Our Service</h1>
            <div id="payment-form">
                <input type="text" id="card-holder-name" placeholder="Card Holder Name" />
                <div id="card-element"></div>
                <button id="card-button">Subscribe</button>
                <div id="card-errors" role="alert"></div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        var stripe = Stripe('your_publishable_key');
        var elements = stripe.elements();

        var card = elements.create('card');
        card.mount('#card-element');

        var cardButton = document.getElementById('card-button');
        var cardHolderName = document.getElementById('card-holder-name');
        var clientSecret = 'your_client_secret'; // Retrieve this from the server

        cardButton.addEventListener('click', function () {
            stripe.confirmCardSetup(
                clientSecret,
                {
                    payment_method: {
                        card: card,
                        billing_details: {
                            name: cardHolderName.value
                        }
                    }
                }
            ).then(function (result) {
                if (result.error) {
                    var errorElement = document.getElementById('card-errors');
                    errorElement.textContent = result.error.message;
                } else {
                    // Handle successful subscription
                }
            });
        });
    </script>
</body>
</html>

