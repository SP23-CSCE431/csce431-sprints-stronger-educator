# location: spec/feature/integration_spec.rb
require 'rails_helper'
require 'integration_spec_helper'


def login_with_oauth(service = :Google)
  # visit upload_path
  # click_link 'Sign in'
  Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google]

end

RSpec.feature 'Checking page content' do
  before do
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: '123545',
      info: {
        name: "Ethan McKinney",
        email: "ethan.mckinney@tamu.edu"
      },
      credentials: {
        token: "token",
        refresh_token: 'refresh_token',
        expires_at: DateTime.now + 1.week
      }
      # etc.
    })
  end
  # let(:admin) {Admin.where(:full_name => "Ethan McKinney")}

  scenario 'Sign in page should contain text' do
    visit upload_path
    # click_button 'Sign in with Google'
    # login_with_oauth(:google)
    expect(page).to have_content('You need to sign in')
  end

  scenario 'Google OAuth sign in' do
    visit new_admin_session_path
    click_button "Sign in with Google"
    expect(page).to have_content('Sign Out')
  end
end
