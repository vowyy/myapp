FactoryBot.define do
  factory :japanese do
    first_name "田中"
    last_name "鈴木"
    sequence(:email) { |n| "test#{n}@example.com"}
    password "abcd@gmail.com"
  end
end
