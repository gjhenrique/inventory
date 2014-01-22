FactoryGirl.define do

	trait :password_trait do
		"admin"
	end

	factory :user do
    sequence(:email) {|n| "admin#{n}@admin.com" }
    factory :admin do
    	admin true
    end

    after(:build) { |u| u.password_confirmation = u.password = 'admin'}
  end
end