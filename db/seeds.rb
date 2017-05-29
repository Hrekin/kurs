if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
if (u3 = User.find_by_email('test@localhost')).nil?
  u3 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'test@localhost')
  u3.activate!
end
if (u4 = User.find_by_email('test1@localhost')).nil?
  u4 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'test1@localhost')
  u4.activate!
end
if (u5 = User.find_by_email('test2@localhost')).nil?
  u5 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'test2@localhost')
  u5.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)

cl1 = Client.create(client_name: 'test', client_sex: 'м', client_country: 'Russia', client_city: 'Vladimir', client_rating: 1, user_id: User.find_by_email('test@localhost').id )
cl2 = Client.create(client_name: 'test1', client_sex: 'ж', client_country: 'Russia', client_city: 'Moscow', client_rating: 2, user_id: User.find_by_email('test1@localhost').id )
pay1 = Payment.create(client: cl1, service_type: 1, price: 110, payment_time: DateTime.now, validity_service: 6)
pay2 = Payment.create(client: cl2, service_type: 1, price: 110, payment_time: DateTime.now, validity_service: 6)
wr1 = Worksheet.create(client: cl1, description_client: 'qq', hobbies: 'play games', pernicious_habits: ["", "Курение", "Другое"], accommodation_type: 'Своя квартира', purpose_acquaintance: 'Дружба')
wr2 = Worksheet.create(client: cl2, description_client: 'qq', hobbies: 'play games', pernicious_habits: ["", "Курение", "Алкоголь"], accommodation_type: 'Другое', purpose_acquaintance: 'Дружба')
