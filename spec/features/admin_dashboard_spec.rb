require 'rails_helper'

describe 'admin dashboard' do 

  it "dose not allow users to asscess without being signed in" do 
    visit admin_root_path
    expect(current_path).to eq(new_user_session_path)
  end

  it "can't be reached by non admin users" do 
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit admin_root_path
    expect(current_path).to eq(root_path)
  end

  it "can't be reached by an admin users" do 
    admin_user = FactoryGirl.create(:admin_user)
    login_as(admin_user, scope: :user)
    visit admin_root_path
    expect(current_path).to eq(admin_root_path)
  end
end