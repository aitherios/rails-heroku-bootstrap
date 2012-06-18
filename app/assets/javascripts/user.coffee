$ ->
  if ($ '#new_user').length
    ($ '#new_user').validate()
    ($ '#user_email').rules 'add',
      required: true
      email: true
    ($ '#user_password').rules 'add',
      required: true
      minlength: 6
