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

  let!(:user_3) do
    User.create(
      email: 'shinshiny@gmail.com',
      name: 'Hannah Shin',
      gender: 'Female',
      password: 'Applied91'
    )
  end

  let!(:user_4) do
    User.create(
      email: 'jrpespisa@verizon.net',
      name: 'John Pepisa',
      gender: 'Male',
      password: 'Applied91'
    )
  end

  let!(:user_5) do
    User.create(
      email: 'amywerner@gmail.com',
      name: 'Amy Werner',
      gender: 'Female',
      password: 'Applied91'
    )
  end

  let!(:user_6) do
    User.create(
      email: 'leonrusso@gmail.com',
      name: 'Leon Russo',
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
      user_id: user_1.id,
      friend_id: user_3.id,
      pending: false
    )
  end

  let!(:full_name) do
    user_2.name
  end

  before(:each) do
    sign_in_as(user_1)
  end

  scenario "user can accept a match" do
    visit user_path(user_5)
    click_on "Add Match"
    click_on user_2.name
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
    click_on user_2.name
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
    click_on user_2.name
    click_on "Sign Out"
    sign_in_as(user_2)
    visit user_path(user_5)
    click_on "Accept Match!"
    click_on "Sign Out"
    sign_in_as(user_5)
    visit user_path(user_2)
    click_on "Accept Match!"

    expect(page).to have_link(full_name, count: 2)
  end

  scenario "user cannot be matched with themself" do
    visit user_path(user_2)
    click_on "Add Match"

    expect(page).to_not have_content(full_name)
  end

  xscenario "user can remove a match" do
    expect(page).to have_content(user_4.name)
    expect(page).to have_content(user_5.name)
  end
end
