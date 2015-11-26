FactoryGirl.define do
  factory :user do
    id 1
    name "Blessing"
    email "bbaa@gmail.com"
    password "password"
    auth_token false
    factory :authenticated_user do
      auth_token true
    end
    factory :invalid_user do
      email nil
    end
  end
end
