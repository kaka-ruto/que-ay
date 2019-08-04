FactoryBot.define do
  factory :result do
    association :user
    association :answer
  end
end
