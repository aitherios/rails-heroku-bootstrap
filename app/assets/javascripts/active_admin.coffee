#= require active_admin/base
#= require redactor

$ ->
  $('.redactor').redactor({lang: 'pt_br', path: location.origin + '/assets'})
  
  $('.index.admin_funds .action_item .btn').text('Importar Fundos')
