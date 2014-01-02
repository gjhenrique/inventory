require "spec_helper"

describe "admin creates new user" do

	let(:current_user) { @controller.current_user }

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

		it "should not delete any user" do
			delete registration_path create(:user)
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
		let(:password) {build(:admin).password}
			
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

		it "should delete other users" do
			delete_message = I18n.t("activerecord.successfully.deleted", model: User.model_name.human)
			user = create :user
			expect { delete registration_path user }.to change(User,:count)
			follow_redirect!
			expect(response.body).to include(delete_message)
			expect(response).to render_template("items/index")
		end

		it "should delete current user and sign out" do
			expect { delete registration_path current_user }.to change(User,:count)
			follow_redirect!
			follow_redirect!
			expect(response).to render_template("layouts/login")
		end
	end	
end