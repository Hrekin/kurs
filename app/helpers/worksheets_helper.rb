module WorksheetsHelper
  def select_pernicious_habits
    options_for_select(["Курение", "Алкоголь", "Лень", "Другое", "Нет"])
  end
  def select_accommodation_type
    options_for_select(["Своя квартира", "Живу с родителями", "Снимаю квартиру", "Другое"])
  end
  def select_purpose_acquaintance
    options_for_select(["Дружба", "Серьезные отношения", "Общение", "Романтические отношения", "Брак", "Профессиональные интересы", "Интересы по увлечениям"])
  end
end
