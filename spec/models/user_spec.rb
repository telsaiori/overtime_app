require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do 
    before do 
      @user = User.create(email: "test@gmail.com", password: '12345678', password_confirmation: '12345678', first_name: "peng", last_name: "rina")
    end
    it "can be created" do
      expect(@user).to be_valid
    end

    it "can't be create without first_name, last_name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end
end
