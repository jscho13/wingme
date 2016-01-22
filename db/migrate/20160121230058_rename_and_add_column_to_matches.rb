class RenameAndAddColumnToMatches < ActiveRecord::Migration
  def change
    change_column :user_matches, :pending, :boolean, null: false, default: true
    add_column :user_matches,
               :pending_acceptance,
               :boolean,
               null: false,
               default: true
  end
end
