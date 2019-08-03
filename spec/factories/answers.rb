FactoryBot.define do
  factory :answer do
    association :question
    answer { 'I have been investing for 7 years' }
    points { '3' }
    is_correct { true }
  end
end
