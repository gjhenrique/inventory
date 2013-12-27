FactoryGirl.define do
  factory :user do
    email 'admin@admin.com'
    encrypted_password  User.new(password: 'admin').encrypted_password
  end
end