class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.string :phone_number
      t.boolean :confirmed
      t.boolean :std_sent
      t.boolean :invite_sent
      t.boolean :is_child

      t.timestamps null: false
    end
  end
end
