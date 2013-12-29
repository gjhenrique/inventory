require "spec_helper"

describe "admin creates new user" do

	context "not authorized user" do

		login_user

		it "should not display user form" do
			get new_user_registration_path
			expect_unauthorized_response
		end

		it "should not create new user" do
			post user_registration_path
			expect_unauthorized_response
		end 

		def expect_unauthorized_response
			unauthorized_message = I18n.t("unauthorized.manage.all")
			follow_redirect!
			expect(response.body).to include(unauthorized_message)
		end
	end

	context "authorized user" do

		login_user :admin
		let(:password) {build(:user).password}
			
		it "should display user form" do
			get new_user_registration_path
			expect(response.body).to include("Novo Usuário")
		end

		it "should create new user" do
			user_creation_message = I18n.t('activerecord.successfully.created', model: User.model_name.human)
			post user_registration_path, user: attributes_for(:user, password: password , password_confirmation: password)
			follow_redirect!
			expect(response.body).to include(user_creation_message)
		end
	end	
end