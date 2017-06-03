class Client < ActiveRecord::Base
  has_many :payments, inverse_of: :client
  has_one :worksheet, inverse_of: :client
  belongs_to :user
  validates :client_name, presence: true
  validates :client_sex, presence: true, inclusion: {in: ['м', 'ж']}
  validates :client_country, presence: true
  validates :client_city, presence: true
  validates :client_rating, presence: true, numericality: { only_integer: true }
  validates :user_id, presence: true, uniqueness: true

  def self.search(params)
    result = Client.includes(:payments, :worksheet,:user)
    #raise params.inspect

    if params['client_name'].present?
      result = result.where(client_name: params['client_name'])
    end
    if params['client_sexm'].present?
      result = result.where(client_sex: 'м')
    end
    if params['client_sexf'].present?
      result = result.where(client_sex: 'ж')
    end
    if params['client_sexm'].present? and params['client_sexf'].present?
      result = Client.all
    end
    if params['client_country'].present?
      result = result.where(client_country: params['client_country'])
    end
    if params['client_city'].present?
      result = result.where(client_city: params['client_city'])
    end
    if params['client_mail'].present?
      result = result.where(users: {email: params['client_mail']})
    end
    if params['client_rating'].present?
      result = result.where(client_rating: params['client_rating'])
    end
    if params['description_client'].present?
      result = result.where(worksheets: {description_client: params['description_client']})
    end
    if params['hobbies'].present?
      result = result.where(worksheets: {hobbies: params['hobbies']})
    end
    if params['accommodation_type'].present?
      result = result.where(worksheets: {accommodation_type: params['accommodation_type']})
    end
    if params['purpose_acquaintance'].present?
      result = result.where(worksheets: {purpose_acquaintance: params['purpose_acquaintance']})
    end
    if params['pernicious_habits'].present?
      #raise (params['pernicious_habits']).to_s.delete("[,],\"").inspect
      #result = result.where(worksheets: {pernicious_habits.map{ |s| params['pernicious_habits']}})
      #Topic.where("name like '?%' ", params[:name])
      result = result.joins(:worksheet).where("worksheets.pernicious_habits like ? ", "%#{params['pernicious_habits'].first}%")
      #result = result.joins(:worksheet).where("worksheets.pernicious_habits like ? ", params['pernicious_habits'].each{|s| "%#{s}%"})
    end
    if params['service_type'].present?
      result = result.where(payments: {service_type: params['service_type']})
    end
    if params['validity_service'].present?
      result = result.where(payments: {validity_service: params['validity_service']})
    end
    if params['price'].present?
      #raise params['price'].inspect
      result = result.where(payments: {price: params['price']})
    end
    if params['payment_times'].present?
      #raise params['payment_times'].inspect
      result = result.joins(:payments).where("payment_time >= :start_date",{start_date: params[:payment_times]})
    end
    if params['payment_timepo'].present?
      result = result.joins(:payments).where("payment_time <= :start_date",{start_date: params[:payment_timepo]})
    end
    if params['payment_times'].present? and params['payment_timepo'].present?
      result = result.joins(:payments).where("payment_time >= :start_date AND payment_time <= :end_date",{start_date: params[:payment_times], end_date: params[:payment_timepo]})
    end
    return result.all
  end
end
