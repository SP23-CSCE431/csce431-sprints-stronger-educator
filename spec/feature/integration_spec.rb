# location: spec/feature/integration_spec.rb
require 'rails_helper'
require 'integration_spec_helper'

def login_with_oauth(_service = :Google)
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

  scenario 'Switch to Upload tab' do
    visit new_admin_session_path
    click_button "Sign in with Google"
    click_link "Upload Data"
    expect(page).to have_content('Sign Out')
  end

  scenario 'Switch to upload data tab' do
    visit new_admin_session_path
    click_button "Sign in with Google"
    click_link "Upload Data"
    expect(page).to have_content('Sign Out')
  end

  scenario 'Switch to help tab' do
    visit new_admin_session_path
    click_button "Sign in with Google"
    click_link "Help"
    expect(page).to have_content('Sign Out')
  end

  scenario 'Switch to Add User tab' do
    visit new_admin_session_path
    click_button "Sign in with Google"
    click_link "Add User"
    expect(page).to have_content('Sign Out')
  end

  scenario 'Switch to Find User tab' do
    visit new_admin_session_path
    click_button "Sign in with Google"
    click_link "Find User"
    expect(page).to have_content('Sign Out')
  end

  scenario 'Switch to add campus/district tab' do
    visit new_admin_session_path
    click_button "Sign in with Google"
    click_link "Add C/D"
    expect(page).to have_content('Sign Out')
  end

  scenario 'Switch to find campus/district tab' do
    visit new_admin_session_path
    click_button "Sign in with Google"
    click_link "Find C/D"
    expect(page).to have_content('Sign Out')
  end

  scenario 'Switch to Upload Image tab' do
    visit new_admin_session_path
    click_button "Sign in with Google"
    click_link "Upload Image"
    expect(page).to have_content('Sign Out')
  end

  scenario 'Sign Out' do
    visit new_admin_session_path
    click_button "Sign in with Google"
    click_link "Sign Out"
    expect(page).to have_content('Signed out')
  end
end

RSpec.feature 'Add User testing' do
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

  scenario 'Add Valid User' do
    visit new_admin_session_path
    click_button "Sign in with Google"
    click_link "Add User"
    fill_in "First and Last Name", with: "Test Name"
    fill_in "Email", with: "test_email@test.com"
    fill_in "Campus ID", with: "1"
    fill_in "District ID", with: "1"
    click_button "Submit"
    user1 = User.create(name: "Test Name", email: "test_email@test.com", campus_id: "1", district_id: "1")
    expect(User.find_by(name: "Test Name")).to eq(user1)
  end

  scenario 'Find new user' do
    visit new_admin_session_path
    click_button "Sign in with Google"
    User.create(name: "Test Name2", email: "test_email2@test.com", campus_id: "1", district_id: "1")
    click_link "Find User"
    expect(page).to have_content('Test Name2')
  end

  scenario 'Sort User table in Find User tab' do
    visit new_admin_session_path
    click_button "Sign in with Google"
    click_link "Find User"
    find('th', text: 'Name').click
    # user1 = User.create(name: "Test Name", email: "test_email@test.com", campus_id: "1", district_id: "1")
    expect(page).to have_content('Andrew Zehrer')
    expect(page).to have_content('Ethan McKinney')
    expect(page.body.index('Andrew Zehrer')).to be < page.body.index('Ethan McKinney')
  end

  scenario 'Able to view Edit User page' do
    visit new_admin_session_path
    click_button "Sign in with Google"
    click_link "Find User"
    # find('td', text: 'Andrew Zehrer').click
    user_row = find('tr[data-user-id]', match: :first)
    user_id = user_row['data-user-id']
    visit "/users/#{user_id}/edit"
    expect(page).to have_content('Editing')
  end

  scenario 'Able to Delete User' do
    visit new_admin_session_path
    click_button "Sign in with Google"
    click_link "Find User"
    # find('td', text: 'Andrew Zehrer').click
    user_row = find('tr', text: 'Test Name2')
    user_id = user_row['data-user-id']
    visit "/users/#{user_id}/edit"
    click_button "Delete User"
    expect(page).to have_content('User was successfully deleted')
  end

  scenario 'Cannot delete yourself' do
    visit new_admin_session_path
    click_button "Sign in with Google"
    click_link "Find User"
    # find('td', text: 'Andrew Zehrer').click
    user_row = find('tr', text: 'Ethan McKinney')
    user_id = user_row['data-user-id']
    visit "/users/#{user_id}/edit"
    click_button "Delete User"
    expect(page).to have_content('You cannot delete yourself!')
  end
end

RSpec.feature 'Add User testing' do
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

  scenario 'Add Valid District' do
    visit new_admin_session_path
    click_button "Sign in with Google"
    click_link "Add C/D"
    sleep 3
    fill_in "District Name", with: "Test District"
    # within 'form#district' do
    #   fill_in 'District ID', with: '5'
    # end
    fill_in 'District ID', with: '5', match: :first
    all('input[type="submit"]')[0].click
    expect(District.exists?(name: "Test District")).to be_truthy
  end
end
