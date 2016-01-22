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

  let!(:friend_1) do
    UserFriend.create(
      user_id: user_1.id,
      friend_id: user_2.id,
      pending: false
    )
  end

  let!(:friend_2) do
    UserFriend.create(
      user_id: user_2.id,
      friend_id: user_1.id,
      pending: false
    )
  end


  before(:each) do
    sign_in_as(user_1)
  end

  scenario "user can accept a match" do
    visit user_path(user_5)
    click_on "Add Match"
    click_on user_2.first_name + " " + user_2.last_name
    click_on "Sign Out"
    sign_in_as(user_2)
    visit user_path(user_5)
    click_on "Accept Match!"
    visit user_path(user_5)

    expect(page).to have_content("Match Request Pending")
  end

  scenario "user cannot re-add a match" do
    visit user_path(user_5)
    click_on "Add Match"
    click_on user_2.first_name + " " + user_2.last_name
    click_on "Sign Out"
    sign_in_as(user_2)
    visit user_path(user_5)
    click_on "Accept Match!"
    click_on "Sign Out"
    sign_in_as(user_5)
    visit user_path(user_2)
    click_on "Accept Match!"
    visit user_path(user_2)

    expect(page).to_not have_content("Add Match")
  end

  scenario "user does not have a match until other user confirms" do
    visit user_path(user_5)
    click_on "Add Match"
    click_on user_2.first_name + " " + user_2.last_name
    click_on "Sign Out"
    sign_in_as(user_2)
    visit user_path(user_5)
    click_on "Accept Match!"
    click_on "Sign Out"
    sign_in_as(user_5)
    visit user_path(user_2)
    click_on "Accept Match!"

    expect(page).to have_link(user_2.first_name + " " + user_2.last_name, count: 2)
  end

  xscenario "user can remove a match" do
    expect(page).to have_content(user_4.first_name + " " + user_4.last_name)
    expect(page).to have_content(user_5.first_name + " " + user_5.last_name)
  end
end
