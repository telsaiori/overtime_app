@user = User.create(email: "test@gmail.com", password: '123456', 
                    password_confirmation: '123456', 
                    first_name: 'aiuchi', last_name: 'haruna',
                    phone: "")

AdminUser.create(email: "admin@gmail.com", password: '123456', 
                 password_confirmation: '123456', 
                 first_name: 'admin', last_name: 'name',
                 phone: "")

100.times do |post|
  @user.posts.create!(date: Date.today, rationale: "#{post} rationale content", overtime_request: 2.5)
end

puts "100 posts have been created"