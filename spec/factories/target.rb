FactoryGirl.define do
  factory :target do
    sequence(:hostname) { |n| "target#{n}" }
    sequence(:address) { |n| "127.0.0.#{n}" }
    reachable true
    appliance
  end
end
