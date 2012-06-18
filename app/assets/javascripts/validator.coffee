$ ->
  $.validator.setDefaults
    errorElement: 'span'
    errorClass: 'invalid'

  $.extend $.validator.messages,
    required: 'Campo obrigatório'
    email: 'Email inválido'
    digits: 'Apenas números'
    minlength: 'Senha curta. Mínimo 6 caracteres'
