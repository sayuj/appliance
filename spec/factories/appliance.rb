FactoryGirl.define do
  factory :appliance do
    sequence(:name) { |n| "app#{n}" }
    customer  "cust1"
  end
end
