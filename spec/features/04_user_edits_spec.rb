require 'rails_helper'

feature "user edits their profile page" do
  let!(:user_1) do
    User.create(
      email: 'jscho13@gmail.com',
      name: 'Joseph Cho',
      gender: 'Male',
      password: 'Applied91'
    )
  end

  scenario "unauthenticated user visits edit page" do
    visit '/users/edit'
    expect(page).to have_content('You need to sign in or sign up')
  end

  scenario "user succesfully edits their gender" do
    sign_in_as(user_1)
    visit '/users/edit'
    choose 'user_gender_other'
    fill_in 'Current password', with: user_1.password
    click_on "Update"
    expect(page).to have_content('Your account has been updated successfully.')
  end

  scenario "user cannot edit with invalid confirmation" do
    sign_in_as(user_1)
    visit '/users/edit'
    fill_in 'Current password', with: "abcd123"
    click_on "Update"
    expect(page).to have_content('Current password is invalid')
  end
end
