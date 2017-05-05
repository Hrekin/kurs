json.extract! payment, :id, :client_id, :service_type, :price, :payment_time, :validity_service, :created_at, :updated_at
json.url payment_url(payment, format: :json)
