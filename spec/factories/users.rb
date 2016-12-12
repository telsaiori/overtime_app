FactoryGirl.define do 
  factory :user do 
    first_name "peng"
    last_name 'rina'
    email 'test@gmail.com'
    password '12345678'
    password_confirmation '12345678'
  end

  factory :admin_user, class: "AdminUser" do 
    first_name "admin"
    last_name 'user'
    email 'admin@gmail.com'
    password '12345678'
    password_confirmation '12345678'
  end
end
