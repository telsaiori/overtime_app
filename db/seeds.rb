@user = User.create(email: "test@gmail.com", password: '123456', password_confirmation: '123456', first_name: 'aiuchi', last_name: 'haruna')
100.times do |post|
  @user.posts.create!(date: Date.today, rationale: "#{post} rationale content")
end

puts "100 posts have been created"