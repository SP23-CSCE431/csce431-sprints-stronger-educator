module IntegrationSpecHelper
  def login_with_oauth(service = :Google)
    #   # visit upload_path
    #   # click_link 'Sign in'
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google]
  end
end
