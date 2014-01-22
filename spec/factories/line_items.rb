# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :line_item do
    quantity 1
    unit_value 1.5
    taxes 1.5
  end
end
