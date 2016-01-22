class RenameTablesAndColumns < ActiveRecord::Migration
  def change
    rename_table :friends, :user_friends
    rename_column :user_friends, :users_friend_id, :friend_id
    change_column :user_friends, :pending, :boolean, null: false, default: true

    rename_table :matches, :user_matches
    rename_column :user_matches, :users_match_id, :match_id
  end
end
