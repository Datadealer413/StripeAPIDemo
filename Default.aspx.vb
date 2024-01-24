Imports System.Web.Configuration
Imports Stripe
Partial Class _Default
    Inherits System.Web.UI.Page
    Private Const SecretKey As String = "sk_test_2kJjhm9w9gKhYYsEtOP8nqEF"
    Public stripePublishableKey As String = WebConfigurationManager.AppSettings("StripePublishableKey")

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load


        ' Set your Stripe secret key
        StripeConfiguration.ApiKey = SecretKey

        ' Replace with an actual plan ID
        Dim planId As String = "plan_Gkh1XW26MI8NJw"
        ' Replace with actual plan ID and PaymentMethod ID or token

        Dim paymentMethodIdOrToken As String = "pm_card_visa" ' Replace with actual PaymentMethod ID or token

        ' Create a new customer with a default payment method
        Dim customerOptions = New CustomerCreateOptions With {
            .Email = "ian@dimck4.com",
            .PaymentMethod = paymentMethodIdOrToken
        }

        Dim customerService = New CustomerService()
        Dim customer = customerService.Create(customerOptions)

        ' Subscribe the customer to a plan
        Dim subscriptionOptions = New SubscriptionCreateOptions With {
            .Customer = customer.Id,
            .Items = New List(Of SubscriptionItemOptions) From {
                New SubscriptionItemOptions With {
                    .Plan = planId
                }
            }
        }

        Dim subscriptionService = New SubscriptionService()
        Dim subscription = subscriptionService.Create(subscriptionOptions)

        ' Display customer and subscription information or handle as needed
        Console.WriteLine($"Customer ID: {customer.Id}")
        Console.WriteLine($"Subscription ID: {subscription.Id}")
    End Sub

End Class
