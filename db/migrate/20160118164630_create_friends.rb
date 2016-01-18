class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.references :user, index: true, foreign_key: true
      t.references :users_friend, index: true

      t.timestamps null: false
    end
    add_foreign_key :friends, :users, column: :users_friend_id
    add_index :friends, [:user_id, :users_friend_id], unique: true
  end
end
