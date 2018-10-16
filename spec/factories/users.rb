FactoryBot.define do
  factory :user do
    name "Manami"
    sequence(:email) { |n| "mana-#{n}@gmail.com" }
    password "mana0722"
  end
end
