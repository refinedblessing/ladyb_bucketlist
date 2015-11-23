FactoryGirl.define do
  factory :bucketlist do
    created_by "1"
    name "MyString"
    factory :bucketlist2 do
      name "bucket"
    end
    factory :invalid_bucketlist do
      name nil
    end
  end
end
