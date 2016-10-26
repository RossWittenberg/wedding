class AddDetailsToParty < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :street_address_line_1, :string
    add_column :parties, :street_address_line_2, :string
    add_column :parties, :city, :string
    add_column :parties, :state, :string
    add_column :parties, :zip_code, :string
    add_column :parties, :country, :string
    add_column :parties, :phone_number, :string
    add_column :parties, :invite_sent, :boolean
  end
end