class Payment < ActiveRecord::Base
  belongs_to :client
  validates :client_id, presence: true
  validates :service_type, presence: true
  validates :price, presence: true, numericality: true
  validates :payment_time, presence: true
  validates :validity_service, presence: true, numericality: {only_integer: true}

end
