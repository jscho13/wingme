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
      friend_id: user_2.id
    )
  end

  let!(:friend_2) do
    UserFriend.create(
      user_id: user_1.id,
      friend_id: user_3.id
    )
  end

  let!(:match) do
    UserMatch.create(
      user_id: user_2.id,
      match_id: user_4.id
    )
  end

  let!(:match_2) do
    UserMatch.create(
      user_id: user_2.id,
      match_id: user_5.id
    )
  end

  scenario "user can view their friends" do
    sign_in_as(user_1)

    expect(page).to have_content(user_2.name)
    expect(page).to have_content(user_3.name)
  end

  scenario "user can view their matches" do
    sign_in_as(user_1)

    expect(page).to have_content(user_4.name)
    expect(page).to have_content(user_5.name)
  end

  scenario "user can view all users" do
    sign_in_as(user_1)

    expect(page).to have_content(user_1.name)
    expect(page).to have_content(user_2.name)
    expect(page).to have_content(user_4.name)
    expect(page).to have_content(user_5.name)
  end
end
