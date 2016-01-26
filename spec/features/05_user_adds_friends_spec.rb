require "rails_helper"

feature "user visits their show page" do
  let!(:user_1) do
    User.create(
      email: 'jscho13@gmail.com',
      name: 'Joseph Cho',
      gender: 'Male',
      password: 'Applied91'
    )
  end

  let!(:user_2) do
    User.create(
      email: 'krdixon83@gmail.com',
      name: 'Dickson Lau',
      gender: 'Male',
      password: 'Applied91'
    )
  end

  let!(:full_name_1) do
    user_1.name
  end

  let!(:full_name_2) do
    user_2.name
  end

  before(:each) do
    sign_in_as(user_1)
  end

  scenario "user can add a friend" do
    visit user_path(user_2)
    click_on "Add Friend"
    visit user_path(user_2)
    expect(page).to have_content("Friend Request Pending")
  end

  scenario "user cannot re-add a friend" do
    visit user_path(user_2)
    click_on "Add Friend"
    visit user_path(user_2)
    expect(page).to_not have_content("Add Friend")
  end

  scenario "user cannot see other peoples pending list" do
    visit user_path(user_2)
    expect(page).to_not have_content("Pending")
  end

  scenario "user does not have a friend until other user confirms" do
    visit user_path(user_2)
    click_on "Add Friend"
    visit user_friends_path(user_1)
    expect(page).to_not have_content(full_name_2)
  end

  scenario "user has a friend when both users confirm" do
    visit user_path(user_2)
    click_on "Add Friend"
    click_on "Sign Out"
    sign_in_as(user_2)
    visit user_path(user_1)
    click_on "Friend Back!"
    visit user_friends_path(user_2)
    expect(page).to have_content(full_name_1)
  end

  xscenario "user can remove a friend" do
    expect(page).to have_content(user_4.name)
    expect(page).to have_content(user_5.name)
  end
end
