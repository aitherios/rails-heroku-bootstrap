$ ->
  if ($ '.contact_form').exists()
    new ContactForm '.contact_form'

class window.ContactForm
  constructor: (@form) ->
    @form = ($ @form)
    @form.on 'ajax:beforeSend', @beforeSend
    @form.on 'ajax:error', @error
    @form.on 'ajax:success', @success
    ($ 'input.required, textarea.required', @form).change @markRequired
    ($ 'input[type=email].required', @form).change @markRequiredEmail
    @submit = ($ 'input[type=submit]', @form)
    @form_ready = @submit.data('form-ready')
    @form_sending = @submit.data('form-sending')
    @form_sent = @submit.data('form-sent')
    @form_error = @submit.data('form-error')
    @form_warn = @submit.data('form-warn')

  markRequired: (event) =>
    target = ($ event.target)
    if target.val() == "" then @markBlank(target) else @markFilled(target)

  markRequiredEmail: (event) =>
    target = ($ event.target)
    matches = target.val().match(/\w+@\w+/)
    if matches then @markFilled(target) else @markBlank(target)

  beforeSend: (event, xhr, settings) =>
    @isFormReady() and @isFormValid()

  isFormReady: =>
    @submit.val() == @form_ready

  isFormValid: =>
    isValid = true
    $.each ($ 'input.required, textarea.required', @form), (index, value) =>
      isValid = (@check($ value) and isValid)
      return true

    if isValid
      @changeMsg(@form_sending)
    else
      @changeMsg(@form_warn)
      setTimeout @changeMsgReady, 2000

    isValid

  check: (input) =>
    input = ($ input, @form)
    if input.val() == ""
      @markBlank(input)
      false
    else
      @markFilled(input)
      true

  markBlank: (input) =>
    ($ input).addClass('error')

  markFilled: (input) =>
    ($ input).removeClass('error')

  error: (event, xhr, status, error) =>
    @changeMsg(@form_error)
    setTimeout @changeMsgReady, 2000

  success: (event, data, status, xhr) =>
    @changeMsg(@form_sent)
    setTimeout @clearForm, 3000

  clearForm: =>
    $.each ($ 'input, textarea', @form), (index, value) =>
      @clearInput($ value)
    @changeMsg(@form_ready)

  clearInput: (input) =>
    ($ input, @form).val("")

  changeMsg: (msg) =>
    @submit.val(msg)

  changeMsgReady: =>
    @changeMsg(@form_ready)
