module ControllerMacros
  def login_admin
    before(:each) do
      admin = FactoryBot.create(:admin_user)
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in admin
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:active_user)
      sign_in user
    end
  end

  def http_login(user, password)
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end
end
