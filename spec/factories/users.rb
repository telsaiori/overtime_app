FactoryGirl.define do 
  sequence :email do |n|
    "test#{n}@gmail.com"
  end

  factory :user do 
    first_name "peng"
    last_name 'rina'
    email { generate :email }
    password '12345678'
    password_confirmation '12345678'
    phone '5555553323'
  end


  factory :admin_user, class: "AdminUser" do 
    first_name "admin"
    last_name 'user'
    email { generate :email }
    password '12345678'
    password_confirmation '12345678'
    phone '5555553323'
  end

  factory :non_authorized_user, class: "User" do 
    first_name "non"
    last_name 'authorized'
    email { generate :email }
    password '12345678'
    password_confirmation '12345678'
    phone '5555553323'
  end
end
