FactoryBot.define do
  factory :subscription do
    title { Faker::Movies::LordOfTheRings.character }
    price { rand(1.0...30.9) }
    frequency { 1 }
  end
end
