require "rails_helper"

RSpec.describe Bucketlist, type: :model do
  before { @bucketlist = FactoryGirl.build(:bucketlist) }

  describe "creation of valid user" do
    subject { @bucketlist }

    it { should respond_to(:created_by) }
    it { should respond_to(:name) }
  end

  describe "should not be valid for empty name" do
    before { @bucketlist.name = "" }
    it { should_not be_valid }
  end

  describe "should not be valid for empty created_by" do
    before { @bucketlist.created_by = nil }
    it { should_not be_valid }
  end
end
