FactoryBot.define do
  factory :diary do
    title { Faker::Lorem.word }
    created_by { Faker::Number.number(10) }
  end
end
