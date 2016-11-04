class AddCustomGreetingToParties < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :custom_greeting, :string
  end
end
