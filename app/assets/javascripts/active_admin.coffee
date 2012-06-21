#= require active_admin/base
#= require redactor

$ ->
  $('.redactor').redactor({lang: 'pt_br', path: location.origin + '/assets'})
