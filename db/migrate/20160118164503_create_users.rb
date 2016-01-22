class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.string :gender, null: false
      t.string :address
      t.integer :zip_code
      t.string :description

      t.timestamps null: false
    end
  end
end
