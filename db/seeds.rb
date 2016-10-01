# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

Guest.destroy_all

#####################################################

csv_file_path = 'db/seeds/guests.csv'
CSV.foreach(csv_file_path, :headers => true, encoding: "windows-1251:utf-8") do |row|
  Guest.create!(row.to_hash)
end

# #####################################################