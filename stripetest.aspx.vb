
Imports Stripe

Partial Class stripetest
    Inherits System.Web.UI.Page

    Private Const SecretKey As String = "sk_test_2kJjhm9w9gKhYYsEtOP8nqEF"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        StripeConfiguration.ApiKey = SecretKey
    End Sub


    Protected Sub btnCreateCustomer_Click(sender As Object, e As EventArgs) Handles btnCreateCustomer.Click
        ' Create a customer
        Dim customerOptions = New CustomerCreateOptions With {
            .Email = "ian@dimck2.com",' change email each time for testing new customer
            .PaymentMethod = "pm_card_visa"
        }

        Dim customerService = New CustomerService()
        Dim customer = customerService.Create(customerOptions)

        ' Display customer ID or handle as needed
        lblCustomerId.Text = "Customer ID: " & customer.Id
        'created custid = cus_PPu6q9YDsDWMgA
    End Sub

    Protected Sub btnGetSubscriptions_Click(sender As Object, e As EventArgs) Handles btnGetSubscriptions.Click
        ' Retrieve a list of subscription types (plans) from Stripe
        Dim planService = New PlanService()
        Dim options = New PlanListOptions With {
            .Limit = 10 ' Set the number of plans to retrieve
        }

        Dim plans = planService.List(options)

        ' Display the retrieved plans
        For Each plan In plans
            txtSubscriptions.Text += ($"Plan ID: {plan.Id}, Name: {plan.Nickname}, Amount: {plan.Amount} {plan.Currency}")
        Next
        'this returns
        '        Plan ID: plan_HEcSAPefjTZPUp, Name: Basic Monthly plan, Amount:    579 gbp
        'Plan ID: plan_HEcRmpHMS9il6R, Name: Basic Yearly plan, Amount:    6000 gbp
        'Plan ID: plan_HEcHOguTo9yF9S, Name: Monthly premium plan, Amount:    1979 gbp
        'Plan ID: plan_HEcHJrpTXt8ew8, Name: Yearly premium plan, Amount:    20000 gbp
        'Plan ID: plan_H8Ds6T7e2moaPd, Name: Yearly pro plan, Amount:    10000 gbp
        'Plan ID: plan_H8DrqCCuyMcXg3, Name: Monthly pro plan, Amount:    979 gbp
        'Plan ID: samcart_plan_30554_90238, Name:    , Amount: 1000 gbp
        'Plan ID: plan_Gkh2m37p8KhmYK, Name: Yearly Test Plan, Amount:    10000 gbp
        'Plan ID: plan_Gkh1XW26MI8NJw, Name: Monthly Test Plan, Amount:  1000 gbp

        '
    End Sub

    Protected Sub btnSendMoney_Click(sender As Object, e As EventArgs) Handles btnSendMoney.Click
        ' Retrieve customer ID from the text box or your database
        ' Get the customer ID from the text box or your database
        Dim customerId As String = "cus_PPu6q9YDsDWMgA"

        ' Get the plan ID from the text box or your database
        Dim planId As String = "plan_Gkh1XW26MI8NJw"

        Dim options = New SubscriptionCreateOptions With {
        .Customer = customerId,
               .Items = New List(Of SubscriptionItemOptions) From {
            New SubscriptionItemOptions With {
                .Price = planId
            }
        }
    }
        Dim service = New SubscriptionService()
        service.Create(options)

    End Sub
End Class
