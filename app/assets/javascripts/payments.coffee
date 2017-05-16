# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@add_time = ->
  $('.clockpicker').clockpicker()
# Запуск всего вышеописанного
tm_ready = ->
  window.add_time()
$(document).ready tm_ready # Включаем при обычном обновлении страницы