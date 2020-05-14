require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "check validation" do

    it "has a valid factory" do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end

  describe "check validation" do
  
    it "is valid with name, email" do
      user = User.new(
        name: "taro",
        email: "taro@example.com",
        password: "foobar",
        password_confirmation: "foobar",
        )
      expect(user).to be_valid
    end
  end
    
  describe "check validation" do
     
    it "is not valid if name is too long" do
      user = User.new(
        name: "a"*51,
        email: "taro@example.com",
        password: "foobar",
        password_confirmation: "foobar",
      )
      expect(user).to_not be_valid
    end
  end
  
  describe "check validation" do
    
    it "is not valid if email is too long" do
      user = User.new(
        name: "jiro",
        email: "a"*256,
        password: "foobar",
        password_confirmation: "foobar",
      )
      expect(user).to_not be_valid
    end
  end
  
  describe "check validation" do
    
    it "is not valid if password is too long" do
      user = User.new(
        name: "jiro",
        email: "jiro@example.com" ,
        password: "foo",
        password_confirmation: "foo",
      )
      expect(user).to_not be_valid
    end
  end

  describe "check validation" do

    it "only accept valid email address" do
      @user = FactoryBot.create(:user)
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                        first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid
    end
  end
  
  describe "check validation" do
    
    it "is invalid with a duplicate email address" do
      FactoryBot.create(:user, email: "aaron@example.com")
      user = FactoryBot.build(:user, email: "aaron@example.com")
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end
  end
 end
end