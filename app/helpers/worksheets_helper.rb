module WorksheetsHelper
  def select_pernicious_habits
    options_for_select(["Курение", "Алкоголь", "Лень", "Другое", "Нет"], @worksheet.pernicious_habits.nil? ? @worksheet.pernicious_habits : JSON.parse(@worksheet.pernicious_habits))
  end
  def select_accommodation_type
    options_for_select(["Своя квартира", "Живу с родителями", "Снимаю квартиру", "Другое"], @worksheet.accommodation_type)
  end
  def select_purpose_acquaintance
    options_for_select(["Дружба", "Серьезные отношения", "Общение", "Романтические отношения", "Брак", "Профессиональные интересы", "Интересы по увлечениям"], @worksheet.purpose_acquaintance)
  end
  def select_pernicious_habits1
    options_for_select([" " ,"Курение", "Алкоголь", "Лень", "Другое", "Нет"], params["search"]["pernicious_habits"])
  end
  def select_accommodation_type1
    options_for_select(["Своя квартира", "Живу с родителями", "Снимаю квартиру", "Другое"], params["search"]["accommodation_type"])
  end
  def select_purpose_acquaintance1
    options_for_select(["Дружба", "Серьезные отношения", "Общение", "Романтические отношения", "Брак", "Профессиональные интересы", "Интересы по увлечениям"], params["search"]["purpose_acquaintance"])
  end
end
