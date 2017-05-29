class Payment < ActiveRecord::Base
  validates :client, presence: true
  validates :service_type, presence: true
  validates :price, presence: true, numericality: true
  validates :payment_time, presence: true
  validates :validity_service, presence: true, numericality: {only_integer: true}
  belongs_to :client, dependent: :destroy, inverse_of: :payments
  accepts_nested_attributes_for :client, allow_destroy: true, :reject_if => :all_blank
end
