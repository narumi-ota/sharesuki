require 'rails_helper'

RSpec.feature "Login", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  include Support
  
  # ログインに成功すること
  scenario "user successfully login" do
    
     visit login_path
      expect {
        fill_in "Email",     with: "saburo@example.com"
        fill_in "Password",         with: "foobar"
        click_button "Log in"
      }

    expect(current_path).to eq user_path(user)
  end
  
  # ログアウトするとルートへ移動すること
  scenario "user successfully logout" do
    
    login_as(user)
    click_link "Log out"
    expect(current_path).to eq root_path
  end

  #ログイン失敗時のフラッシュメッセージはリロード後消える
  scenario "user successfully login" do

    visit login_path
      expect {
        fill_in "Email",     with: " "
        fill_in "Password",         with: " "
        click_button "Log in"
      }
      
      expect(page).to have_content "Invalid email/password combination"
      expect(current_path).to eq login_path
      visit root_path
      expect(page).to_not have_content "Invalid email/password combination"
  end
end