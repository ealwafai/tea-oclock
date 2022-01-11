FactoryBot.define do
  factory :membership do
    customer { rand(Customer.count) }
    tea { rand(Tea.count) }
    subscription { rand(Subscription.count) }
    active { true }
  end
end
