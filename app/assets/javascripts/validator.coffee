$ ->
  $.validator.setDefaults
    errorElement: 'span'
    errorClass: 'invalid'

  $.extend $.validator.messages,
    required: 'Campo obrigatório'
    email: 'Email inválido'
    digits: 'Apenas números'
    minlength: 'Campo muito curto'
    equalTo: 'Campo não confere'
