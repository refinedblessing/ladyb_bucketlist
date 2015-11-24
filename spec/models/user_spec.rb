require "rails_helper"

RSpec.describe User, type: :model do
  before { @user = FactoryGirl.build(:user) }

  describe "creation of valid user" do
    subject { @user }

    it { should respond_to(:email) }
    it { should respond_to(:password) }
    it { should respond_to(:name) }

    it { should be_valid }
  end

  describe "should not be valid for empty email" do
    before { @user.email = "" }
    it { should_not be_valid }
  end

  describe "should not be valid for empty password" do
    before { @user.password = "" }
    it { should_not be_valid }
  end
end
