require 'spec_helper'

describe ItemsController do

	login_user

	it "user exists in session" do
		expect(subject.current_user).not_to be_nil
	end

	it "enter initial page with success" do
		get :index
		expect(response.status).to eq(200), "Does not load initial page"
	end	

end
