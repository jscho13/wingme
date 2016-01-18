class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :user, index: true, foreign_key: true
      t.references :users_match, index: true

      t.timestamps null: false
    end
    add_index :matches, [:user_id, :users_match_id], unique: true
  end
end
