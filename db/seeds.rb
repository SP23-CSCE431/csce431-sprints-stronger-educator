# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Implemented (if not, uncomment and run 'rails db:seed')


# require 'csv'
# puts "Seeding districts..."
# CSV.foreach('db/District-Type2021.csv', headers: true) do |row|
  # district = District.create(name: row['District'], id: row['District Number'])
  # puts "Created district: #{district.name}"
# end
# puts "Finished seeding districts."


# puts "Seeding campuses..."
# CSV.foreach('db/campus-analyze-2020-21.csv', headers: true) do |row|
#   campus = Campus.create(name: row['Campus Name'], id: row['Campus'])
#   puts "Created campus: #{campus.name}"
# end
# puts "Finished seeding campuses."


District.create(id: 1, name: "Test District")
Campus.create(id: 1, name: "Test Campus", district_id: 1)
User.create(id: 0, name: "Test User", email: "test@email", campus_id: 1, district_id: 1)
User.create(id: 999, name: "Andrew Zehrer", email: "andrewzehrer@tamu.edu", campus_id: 1, district_id: 1, is_admin: true)
User.create(id: 998, name: "Ethan McKinney", email: "ethan.mckinney@tamu.edu", campus_id: 1, district_id: 1, is_admin: true)
