require 'rails_helper'

RSpec.feature "SignUps", type: :feature do
  include ActiveJob::TestHelper

  # ユーザーはサインアップに成功する
  scenario "user successfully signs up" do
    visit new_user_path
      expect {
        fill_in "Name",              with: "Example"
        fill_in "Email",     with: "test@example.com"
        fill_in "Password",         with: "test123"
        fill_in "Confirmation",  with: "test123"
        click_button "Create my account"
      }.to change(User, :count).by(1)
      
      expect(page).to have_content "ShareSukiへようこそ！"
      #expect(current_path).to eq user_path(user)
  end
end