require "rails_helper"

feature "user visits their show page" do
  let!(:t_url) do
    'https://ariherzog.com/blog/wp-content/uploads/2010/10/longurl.jpg'
  end

  before(:each) do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = nil
    OmniAuth.config.mock_auth[:facebook] =
      OmniAuth::AuthHash.new(
        provider: 'facebook',
        uid: '123545',
        info: {
          email: 'jscho13@gmail.com',
          name: 'Joseph Cho',
          image: t_url
        },
        extra: { raw_info: { gender: 'Male' } }
      )
    fake_authorization = OmniAuth.config.mock_auth[:facebook]
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
    Rails.application.env_config["omniauth.auth"] = fake_authorization
  end

  scenario "user can sign in with FB" do
    visit "/users/sign_in"
    click_on "Sign in with Facebook"

    expect(page).to have_selector("input[value=\'#{t_url}\']")
  end
end
