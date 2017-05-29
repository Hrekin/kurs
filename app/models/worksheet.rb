class Worksheet < ActiveRecord::Base

  #validates_associated :client
  validates :client, presence: true
  validates :client_id, uniqueness: true
  validates :description_client, presence: true
  validates :hobbies, presence: true
  validates :pernicious_habits, presence: true
  validates :accommodation_type, presence: true
  validates :purpose_acquaintance, presence: true
  belongs_to :client, dependent: :destroy, inverse_of: :worksheet
  accepts_nested_attributes_for :client, allow_destroy: true
end
