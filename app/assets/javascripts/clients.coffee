# nested_start


@add_new_rucl = ->
  $('#add_client_link').on 'click', ->
    $(this).hide()
    # Подменяем временный id с фразой new_ru на случайной число
    new_id = new Date().getTime()
    regexp = new RegExp("new_client", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    # Вставляем на страницу
    $(this).parent().parent().after(content)
    panel = $(this).parent().parent().parent().find('.panel-success').first()
    # Если бы были даты с datepicker-ом 
    window.datepicker_activation_by_item(panel)  
    false
# Запуск всего вышеописанного
ru_readycl = ->
  window.add_new_rucl()
$(document).on 'page:load', ru_readycl # Включаем при ajax обновлении страницы
$(document).ready ru_readycl # Включаем при обычном обновлении страницы
# nested_finish
