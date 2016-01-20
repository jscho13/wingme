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

  scenario "user can add a friend" do
    click_on user_2.first_name + " " + user_2.last_name
    expect(page).to have_content(user_2.first_name + " " + user_2.last_name)
    expect(page).to have_content(user_3.first_name + " " + user_3.last_name)
  end

  xscenario "user can add a match" do
    expect(page).to have_content(user_4.first_name + " " + user_4.last_name)
    expect(page).to have_content(user_5.first_name + " " + user_5.last_name)
  end

  xscenario "user cannot re-add a friend" do
    expect(page).to have_content(user_1.first_name + " " + user_1.last_name)
    expect(page).to have_content(user_2.first_name + " " + user_2.last_name)
  end

  xscenario "user cannot re-add a match" do
    expect(page).to have_content(user_1.first_name + " " + user_1.last_name)
    expect(page).to have_content(user_2.first_name + " " + user_2.last_name)
  end
end
