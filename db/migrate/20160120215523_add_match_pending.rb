class AddMatchPending < ActiveRecord::Migration
  def change
    add_column :matches, :pending, :boolean
  end
end
