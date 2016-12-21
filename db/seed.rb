
@user = User.create(email: "test@test.com",
                    password: "12345678",
                    password_confirmation: "asdfasdf",
                    first_name: "aiuchi",
                    last_name: "haruna",
                    phone: "12345678900")

puts "1 User created"

AdminUser.create(email: "admin@gmail.com", 
                 password: '123456', 
                password_confirmation: '123456', 
                first_name: 'admin', 
                last_name: 'name',
                phone: "1234567890")


puts "1 Admin User created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end

puts "100 Posts have been created"

100.times do |audit_log|
  AuditLog.create!(user_id: User.last.id, status: 0, start_date: (Date.today - 6.days))
end

puts "100 audit logs have been created"