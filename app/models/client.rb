class Client < ActiveRecord::Base
  has_many :payments
  has_one :worksheet
  validates :client_login, presence: true
  validates :client_password, presence: true
  validates :client_name, presence: true
  validates :client_sex, presence: true, inclusion: {in: ['м', 'ж']}
  validates :client_birthday, presence: true
  validates :client_country, presence: true
  validates :client_city, presence: true
  validates :client_mail, presence: true, uniqueness: true
  validates :client_last_visit, presence: true
  validates :client_rating, presence: true, numericality: { only_integer: true }
end

