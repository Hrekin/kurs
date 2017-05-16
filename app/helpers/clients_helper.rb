module ClientsHelper
  def client_options
    Client.all.pluck("client_login, id")
    
  end
  # nested_start  
  def link_to_add_client2(form)
    # Создаём новый объект. Аналог build в ранних примерах
    new_object = Client.new()
    
    # Нам нужна nested-форма. В момент создания ссылки её ещё нет. Создадим её
    # Все role_users в форме имеют свой номер 
    # Мы его пока заменям на фразу new_ru
    fields = form.fields_for(:client, new_object, 
      :child_index => 'new_client') do |client|
      render('clients/one_client_form', client: client)
    end
  end
    def link_to_add_client(form, user)
    # Создаём новый объект. Аналог build в ранних примерах
    new_object = Client.new()
    # Нам нужна nested-форма. В момент создания ссылки её ещё нет. Создадим её
    # Все role_users в форме имеют свой номер 
    # Мы его пока заменям на фразу new_ru
    fields = form.fields_for(:client, new_object, 
      :child_index => 'new_client') do |client|
      render('clients/one_client_form', client: client)
    end
    # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
    link_to(?#, class: 'btn btn-info', 
        id: 'add_client_link', data: {content: "#{fields}"}) do 
      fa_icon("plus") + " Новый клиент" 
    end
  end
end

