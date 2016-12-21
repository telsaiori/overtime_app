require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = FactoryGirl.create(:user)
  end
  describe "creation" do 

    it "can be created" do
      expect(@user).to be_valid
    end

    it "can't be create without first_name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end
  

    it "can't be create without last_name" do

      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  

    it "can't be create without phone" do
      @user.phone = nil
      expect(@user).to_not be_valid
    end
  end

  describe "custom name methods" do 
    it "has a fill name method that combines first and last name" do 
      expect(@user.full_name).to eq("RINA, PENG")
    end
  end

end
