FactoryGirl.define do
  factory :user do
    email 'admin@admin.com'
    encrypted_password  'admin'
  end
end