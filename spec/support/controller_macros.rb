module ControllerMacros

  def login_user factory_symbol = :user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in create(factory_symbol)
    end
  end

end
