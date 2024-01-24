
Imports Stripe

Partial Class SubscriptionPage
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' Set up Stripe API keys
        StripeConfiguration.ApiKey = ConfigurationManager.AppSettings("StripeSecretKey")

        ' Create a SetupIntent to set up a new subscription
        Dim setupIntent = New SetupIntentCreateOptions
        setupIntent.Usage = "off_session"

        Dim service = New SetupIntentService()
        Dim intent = service.Create(setupIntent)

        ' Pass the client secret to the client-side script
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "StripeSetup", $"var clientSecret = '{intent.ClientSecret}';", True)
    End Sub
End Class
