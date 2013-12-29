require "spec_helper"

feature "User sign in into the system" do

  scenario "User fill form and sign in into the system" do
    user = create(:user)

    fill_login_form user.email, user.password

    expect(current_path).to eq(root_path)
  end

  scenario "User fill form with invalid user" do 
    fill_login_form 'invalid_user', 'invalid_password'

    expect(current_path).to eq(new_user_session_path)
  end

  def fill_login_form email, password
    visit new_user_session_path
    
    email_label = I18n.t(:email, scope: [:activerecord, :attributes, :user])
    password_label = I18n.t(:password, scope: [:activerecord, :attributes, :user])
    
    fill_in email_label, with: email
    fill_in password_label, with: password

    click_button I18n.t(:login, scope: [:helpers, :submit])
  end

end