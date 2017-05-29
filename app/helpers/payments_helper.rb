module PaymentsHelper
  def select_service_type
    options_for_select(["1", "2", "3", "4", "Другое"], @payment.service_type)
  end
  def select_service_type1
    options_for_select(["1", "2", "3", "4", "Другое"], params["search"]["service_type"])
  end
  def client_option
    Client.pluck("client_name, id")
    #@selected_options = Client.where(client_mail: @current_user.email).first.pluck("client_name, id")
    #raise "#{Client.first.client_name}"
  end
end
