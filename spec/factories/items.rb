FactoryGirl.define do
  factory :item do
    name "MyString"
    done false
    bucketlist_id 1
    factory :true_item do
      done true
      factory :invalid_item do
        name nil
      end
    end
  end
end
