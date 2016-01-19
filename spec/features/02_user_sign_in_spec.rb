require 'rails_helper'

feature "user signs into website" do
  let!(:user_1) { User.create(email: 'jscho13@gmail.com',
                              first_name: 'Joseph',
                              last_name: 'Cho',
                              gender: 'M',
                              password: 'Applied91') }

  scenario "unauthenticated user visits site" do
    visit '/users'
    expect(page).to have_content('Log In')
  end

  scenario "user succesfully signs in" do
    sign_in_as(user_1)
    expect(page).to have_content('Signed in successfully.')
  end

  scenario "user can successfully signs out" do
    sign_in_as(user_1)
    click_on 'Sign Out'
    expect(page).to have_content('Signed out successfully.')
  end

  scenario "user cannot sign in with wrong info" do
    visit '/users/sign_in'
    fill_in 'Email', with: user_1.email
    fill_in 'Password', with: "Hello password"
    click_on 'Log in'

    expect(page).to have_content('Invalid email or password.')
  end
end
