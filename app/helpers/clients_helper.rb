module ClientsHelper
  def client_options
    Client.all.pluck("client_login, id")
    
  end
  # nested_start  
  def link_to_add_client(form)
    # Создаём новый объект. Аналог build в ранних примерах
    new_object = Client.new(client_last_visit: Time.now, client_rating: (Client.last.client_rating.to_i + 1) , user_id: User.find_by_email("#{@current_user.email}").id)
    
    # Нам нужна nested-форма. В момент создания ссылки её ещё нет. Создадим её
    # Все role_users в форме имеют свой номер 
    # Мы его пока заменям на фразу new_ru
    fields = form.fields_for(:client, new_object, 
      :child_index => 'new_client') do |fr|
      render('clients/one_client_form', fr: fr)
    end

  end

  # nested_finish
end

