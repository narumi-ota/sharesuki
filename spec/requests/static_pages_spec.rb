require 'rails_helper'

  RSpec.describe "static_pages", type: :request do
  
  it "home page responds successfully" do
      get root_path
      expect(response).to be_success
      expect(response).to have_http_status "200"
  end
  
  it "about page responds successfully" do
      get about_path
      expect(response).to be_success
      expect(response).to have_http_status "200"
  end
  
  it "contact page responds successfully" do
      get contact_path
      expect(response).to be_success
      expect(response).to have_http_status "200"
  end
end