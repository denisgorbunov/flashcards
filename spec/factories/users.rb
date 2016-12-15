FactoryGirl.define do
  factory :user do
    email { "test@test.com" }
    password { "123" }
    password_confirmation { "123" }
  end
end
