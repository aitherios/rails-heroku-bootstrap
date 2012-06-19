$ ->
  if ($ '#new_user').exists()
    ($ '#new_user').validate()

    ($ '#user_email').addRules
      required: true
      email: true

    ($ '#user_password').addRules
      required: true
      minlength: 6
      messages:
        minlength: 'Senha curta. Mínimo 6 caracteres'

    ($ '#user_password_confirmation').addRules
      required: true
      equalTo: '#user_password'
      messages:
        equalTo: 'Senha não confere'
