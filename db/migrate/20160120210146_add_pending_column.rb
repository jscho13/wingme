class AddPendingColumn < ActiveRecord::Migration
  def change
    add_column :friends, :pending, :boolean
  end
end
