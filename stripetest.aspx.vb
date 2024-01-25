
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
            .Email = txtCustomerEmail.Text
        }

        Dim customerService = New CustomerService()
        Dim customer = customerService.Create(customerOptions)

        Dim cardNumber As String = txtCardNumber.Text
        Dim month As String = txtExpirationMonth.Text
        Dim year As String = txtExpirationYear.Text
        Dim cvc As String = txtCvc.Text

        Dim cardOptions = New CardCreateOptions With {
            .Source = New CardCreateNestedOptions With {
                .Number = cardNumber,
                .ExpMonth = month,
                .ExpYear = year,
                .Cvc = cvc
            }
        }
        Dim cardService = New CardService()
        cardService.Create(customer.Id, cardOptions)

        ' Display customer ID or handle as needed
        lblCustomerId.Text = customer.Id
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
            txtSubscriptions.Text += ($"Plan ID: {plan.Id}, Name: {plan.Nickname}, Amount: {plan.Amount} {plan.Currency} {vbCrlf}")
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
        Dim customerId As String = lblCustomerId.Text
        Dim planId As String = txtSubscriptionID.Text

        'Try
        Dim options = New SubscriptionCreateOptions With {
                .Customer = customerId,
                .Items = New List(Of SubscriptionItemOptions) From {
                    New SubscriptionItemOptions With {
                        .Price = planId
                    }
                }
            }
            Dim service = New SubscriptionService()
            Dim subscription = service.Create(options)

        Dim startDateStr As String = subscription.StartDate.ToString("MM/dd/yyyy")

        lblMessage.Text = "Subscription result: "
        lblMessage.Text += ($"customer: {subscription.CustomerId}")
        lblMessage.Text += ($", Start Date: {startDateStr}")
        lblMessage.Text += ($", status: {subscription.Status}")
        'Catch ex As Exception
        '    lblMessage.Text = "Something went wrong!"
        'End Try


    End Sub
End Class
