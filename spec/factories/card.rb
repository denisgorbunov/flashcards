FactoryGirl.define do
  factory :card do
    association :user
    original_text { "дом" }
    translated_text { "house" }
  end
end

