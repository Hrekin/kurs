module PaymentsHelper
  def select_service_type
    options_for_select(["1", "2", "3", "4", "Другое"])
  end
end
