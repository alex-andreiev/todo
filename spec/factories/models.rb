# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password' }
  end

  factory :todo do
    title { 'My Todo List' }
    user
  end

  factory :task do
    task { 'My Task' }
    todo
  end
end
