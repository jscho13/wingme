require "rails_helper"

feature "user visits their show page" do
  let!(:user_1) { User.create(email: 'jscho13@gmail.com', first_name: 'Joseph', last_name: 'Cho', gender: 'M') }
  let!(:user_2) { User.create(email: 'krdixon83@gmail.com', first_name: 'Dickson', last_name: 'Lau', gender: 'M') }
  let!(:user_3) { User.create(email: 'shinshiny@gmail.com', first_name: 'Hannah', last_name: 'Shin', gender: 'F') }
  let!(:user_4) { User.create(email: 'jrpespisa@verizon.net', first_name: 'John', last_name: 'Pespisa', gender: 'M') }
  let!(:user_5) { User.create(email: 'amywerner@gmail.com', first_name: 'Amy', last_name: 'Werner', gender: 'F') }
  let!(:user_6) { User.create(email: 'leonrusso@gmail.com', first_name: 'Leon', last_name: 'Russo', gender: 'M') }
  let!(:friend_1) { Friend.create(user_id: user_1.id, users_friend_id: user_2.id) }
  let!(:friend_2) { Friend.create(user_id: user_1.id, users_friend_id: user_3.id) }
  let!(:match) { Match.create(user_id: user_2.id, users_match_id: user_4.id) }
  let!(:match_2) { Match.create(user_id: user_2.id, users_match_id: user_5.id) }

  scenario "user can view their friends" do
    visit user_path(user_1)

    expect(page).to have_content(user_2.first_name + " " + user_2.last_name)
    expect(page).to have_content(user_3.first_name + " " + user_3.last_name)
  end

  scenario "user can view their matches" do
    visit user_path(user_2)

    expect(page).to have_content(user_4.first_name + " " + user_4.last_name)
    expect(page).to have_content(user_5.first_name + " " + user_5.last_name)
  end

  scenario "user can view all users" do
    visit user_path(user_3)

    expect(page).to have_content(user_1.first_name + " " + user_1.last_name)
    expect(page).to have_content(user_2.first_name + " " + user_2.last_name)
    expect(page).to have_content(user_4.first_name + " " + user_4.last_name)
    expect(page).to have_content(user_5.first_name + " " + user_5.last_name)
  end
end
