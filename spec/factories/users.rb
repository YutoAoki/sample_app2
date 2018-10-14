FactoryBot.define do
  factory :user do
    name "Manami"
    sequence(:email) { |n| "mana-#{n}@gmail.com" }
    password "mana1216"
  end
end
