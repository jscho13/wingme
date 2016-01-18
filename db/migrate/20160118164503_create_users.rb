class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      table.string :email, null: false
      table.string :first_name, null: false
      table.string :last_name, null: false
      table.string :gender, null: false
      table.string :address
      table.integer :zip_code
      table.string :description

      t.timestamps null: false
    end
  end
end
