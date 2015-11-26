require "rails_helper"

RSpec.describe Item, type: :model do
  before { @item = FactoryGirl.build(:item) }

  describe "creation of valid user" do
    subject { @item }

    it { should respond_to(:done) }
    it { should respond_to(:bucketlist) }
    it { should respond_to(:name) }
  end

  describe "should not be valid for empty name" do
    before { @item.name = "" }
    it { should_not be_valid }
  end

  describe "should not be valid for empty bucketlist" do
    before { @item.bucketlist = nil }
    it { should_not be_valid }
  end
end
