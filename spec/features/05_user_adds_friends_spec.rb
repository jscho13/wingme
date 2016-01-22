require "rails_helper"

feature "user visits their show page" do
  let!(:user_1) do
    User.create(
      email: 'jscho13@gmail.com',
      first_name: 'Joseph',
      last_name: 'Cho',
      gender: 'Male',
      password: 'Applied91'
    )
  end

  let!(:user_2) do
    User.create(
      email: 'krdixon83@gmail.com',
      first_name: 'Dickson',
      last_name: 'Lau',
      gender: 'Male',
      password: 'Applied91'
    )
  end

  let!(:user_3) do
    User.create(
      email: 'shinshiny@gmail.com',
      first_name: 'Hannah',
      last_name: 'Shin',
      gender: 'Female',
      password: 'Applied91'
    )
  end

  let!(:user_4) do
    User.create(
      email: 'jrpespisa@verizon.net',
      first_name: 'John',
      last_name: 'Pespisa',
      gender: 'Male',
      password: 'Applied91'
    )
  end

  let!(:user_5) do
    User.create(
      email: 'amywerner@gmail.com',
      first_name: 'Amy',
      last_name: 'Werner',
      gender: 'Female',
      password: 'Applied91'
    )
  end

  let!(:user_6) do
    User.create(
      email: 'leonrusso@gmail.com',
      first_name: 'Leon',
      last_name: 'Russo',
      gender: 'Male',
      password: 'Applied91'
    )
  end

  let!(:full_name) do
    user_2.first_name + " " + user_2.last_name
  end

  before(:each) do
    sign_in_as(user_1)
  end

  scenario "user can add a friend" do
    click_on user_2.first_name + " " + user_2.last_name
    expect(page).to have_content("Add Friend")
    click_on "Add Friend"
    visit user_path(user_2)
    expect(page).to have_content("Friend Request Pending")
  end

  scenario "user cannot re-add a friend" do
    click_on user_2.first_name + " " + user_2.last_name
    click_on "Add Friend"
    visit user_path(user_2)
    expect(page).to_not have_content("Add Friend")
  end

  scenario "user cannot see other peoples pending list" do
    click_on user_2.first_name + " " + user_2.last_name
    expect(page).to_not have_content("Pending")
  end

  scenario "user does not have a friend until other user confirms" do
    click_on user_2.first_name + " " + user_2.last_name
    click_on "Add Friend"
    page.body.index(full_name).should_not > page.body.index("Friends")
  end

  scenario "user has a friend when the other user confirms" do
    click_on user_2.first_name + " " + user_2.last_name
    click_on "Add Friend"
    click_on "Sign Out"
    sign_in_as(user_2)
    visit user_path(user_1)
    click_on "Accept Friend!"
    expect(page).to have_link(user_1.first_name+" "+user_1.last_name, count: 2)
  end

  xscenario "user can remove a friend" do
    expect(page).to have_content(user_4.first_name + " " + user_4.last_name)
    expect(page).to have_content(user_5.first_name + " " + user_5.last_name)
  end
end
