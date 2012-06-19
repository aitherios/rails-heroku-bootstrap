$ ->
  if ($ '#new_user').length
    ($ '#new_user').validate()
    ($ '#user_email').rules 'add',
      required: true
      email: true
    ($ '#user_password').rules 'add',
      required: true
      minlength: 6
      messages:
        minlength: 'Senha curta. Mínimo 6 caracteres'
    ($ '#user_password_confirmation').rules 'add',
      required: true
      equalTo: '#user_password'
      messages:
        equalTo: 'Senha não confere'
