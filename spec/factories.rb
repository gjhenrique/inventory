FactoryGirl.define do

  factory :user do
    email 'admin@admin.com'

    factory :admin do 
    	admin true 
    end 

    after(:build) { |u| u.password = 'admin'}
  end
end