require "rails_helper"

feature "user visits their show" do
  let!(:user) { User.create(email: 'jscho13@gmail.com', first_name: 'Joseph', last_name: 'Cho', gender: 'M') }
  let!(:user_2) { User.create(email: 'krdixon83@gmail.com', first_name: 'Dickson', last_name: 'Lau', gender: 'M') }
  let!(:user_3) { User.create(email: 'shinshiny@gmail.com', first_name: 'Hannah', last_name: 'Shin', gender: 'F') }
  let!(:friend) { Friend.create(user_id: user.id, users_friend_id: user_2.id) }
  let!(:friend_2) { Friend.create(user_id: user.id, users_friend_id: user_3.id) }


  scenario "user can view their friends" do
    visit user_path(user)

    expect(page).to have_content(user_2.first_name + " " + user_2.last_name)
    expect(page).to have_content(user_3.first_name + " " + user_3.last_name)
  end
end
