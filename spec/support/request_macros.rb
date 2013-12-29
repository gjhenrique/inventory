module RequestMacros

  def login_user factory_symbol = :user
    before(:each) do
      user = FactoryGirl.create factory_symbol
      # post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
      post_via_redirect user_session_path, user: { email: user.email, password: user.password }
    end
  end

end