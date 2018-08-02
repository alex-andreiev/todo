$(document).on 'click turbolinks:load', '[data-exit]', ->
  $('[data-content]').show()
  $('[data-form]').remove()
  $('[data-link]').show()
