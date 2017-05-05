class Worksheet < ActiveRecord::Base
  belongs_to :client
  #validates_associated :client
  validates :client_id, presence: true, uniqueness: true
  validates :description_client, presence: true
  validates :hobbies, presence: true
  validates :pernicious_habits, presence: true
  validates :accommodation_type, presence: true
  validates :purpose_acquaintance, presence: true
end
