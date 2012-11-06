FactoryGirl.define do
  sequence(:random_number) { |n| rand(n) }
end