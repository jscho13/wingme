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

  before(:each) do
    sign_in_as(user_1)
  end

  scenario "user can add a match" do
    click_on user_2.first_name + " " + user_2.last_name
    click_on "Add Friend"
    click_on "Sign Out"
    sign_in_as(user_2)
    visit user_path(user_1)
    click_on "Accept Friend!"
    click_on "Sign Out"
    sign_in_as(user_1)
    visit user_path(user_5)
    click_on "Add Match"
    click_on user_2.first_name + " " + user_2.last_name
    click_on "Sign Out"
    sign_in_as(user_2)
    click_on "Accept Match!"
    expect(page).to have_link(user_5.first_name + " " + user_5.last_name, count: 2)
  end

  scenario "user cannot re-add a match" do
    click_on user_2.first_name + " " + user_2.last_name
    click_on "Add Friend"
    click_on "Sign Out"
    sign_in_as(user_2)
    visit user_path(user_1)
    click_on "Accept Friend!"
    click_on "Sign Out"
    sign_in_as(user_1)
    visit user_path(user_5)
    click_on "Add Match"
    click_on user_2.first_name + " " + user_2.last_name
    visit user_path(user_5)
    click_on "Add Match"

    expect(page).to_not have_content(user_2.first_name + " " + user_2.last_name)
  end

  xscenario "user does not have a match until other user confirms" do
    expect(page).to have_content(user_4.first_name + " " + user_4.last_name)
    expect(page).to have_content(user_5.first_name + " " + user_5.last_name)
  end

  xscenario "user can remove a match" do
    expect(page).to have_content(user_4.first_name + " " + user_4.last_name)
    expect(page).to have_content(user_5.first_name + " " + user_5.last_name)
  end
end
