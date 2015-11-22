FactoryGirl.define do
  factory :user do
    id 1
    name "Blessing"
    email "bb@gmail.com"
    password "password"
    factory :invalid_user do
      email nil
    end
  end
end
