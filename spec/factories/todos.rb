FactoryBot.define do
  factory :todo do
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
  end
end
