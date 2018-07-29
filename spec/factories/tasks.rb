FactoryBot.define do
  factory :task do
    task { Faker::Lorem.sentence }
    todo
  end
end
