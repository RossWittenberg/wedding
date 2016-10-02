class CreateParty < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :party_name
      t.string :accomodation_name
      t.string :accomodation_address
      t.text :notes
    end
  end
end
