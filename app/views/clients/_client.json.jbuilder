json.extract! client, :id, :client_login, :client_password, :client_name, :client_sex, :client_birthday, :client_country, :client_city, :client_mail, :client_last_visit, :client_rating, :user_id, :created_at, :updated_at
json.url client_url(client, format: :json)
