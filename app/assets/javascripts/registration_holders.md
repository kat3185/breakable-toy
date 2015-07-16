jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  registrationHolder.setupForm()

registrationHolder =
  setupForm: ->
    $('#new_registration_holder').submit ->
      form = this
      debugger;
      $('input[type=submit]').attr('disabled', true)
      registrationHolder.processCard()
      false

  processCard: ->
    debugger;
    Stripe.createToken(this, registrationHolder.handleStripeResponse)

    handleStripeResponse: (status, response) ->
      if status == 200
        alert("response.id")
      else
        alert("response.error.message")
