$ ->
  $.fn.exists = ->
    @.length > 0

  $.fn.addRules = ->
    if ($ @).exists()
      args = Array.prototype.slice.call(arguments)
      args = ['add'].concat(args)
      ($ @).rules.apply(@, args)

  $.validator.setDefaults
    errorElement: 'span'
    errorClass: 'invalid'

  $.extend $.validator.messages,
    required: 'Campo obrigatório'
    email: 'Email inválido'
    digits: 'Apenas números'
    minlength: 'Campo muito curto'
    equalTo: 'Campo não confere'
