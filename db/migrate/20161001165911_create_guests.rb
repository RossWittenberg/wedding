class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :street_address_line_1
      t.string :street_address_line_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.string :phone_number
      t.boolean :attending
      t.boolean :invite_sent
      t.boolean :is_child
      t.string  :flight_number
      t.datetime :arrival
      t.datetime :departure
      t.references :party
      t.string :party_name

      t.timestamps null: false
    end
  end
end
