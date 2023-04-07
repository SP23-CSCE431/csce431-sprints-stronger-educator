# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Angel stuff

# require 'csv'
# file = File.open("db/DistrictsFinal_test2.csv", "r") do |file|
#   headers = file.gets
#   while line = file.gets
#     name,iden,tea,desc,nces,charter,charterSchool = line.split(",")
#     district = District.create(name: name, district_id: iden)
#     # For debug purposes
#     # puts "Created district: #{district.name} : #{district.district_id}"
#   end
# file.close
# end

# file = File.open("db/CampusFinal_test2.csv", "r") do |file|
#     headers = file.gets
#   while line = file.gets
#     name,iden,type,desc = line.split(",")
#     districtID = iden.slice(0,6) # Get first 6 elements/digits
#     campusID = iden.slice(6,9) # Get last 3 elements/digits
#     campus = Campus.create(name: name, campus_id: campusID, district_id: districtID)
#     # For debug purposes
#     # puts "Created campus: #{campus.name} : #{campus.campus_id}  : #{campus.district_id}"
#   end
# file.close
# end

# Implemented (if not, uncomment and run 'rails db:seed')

# District.create(name: "Test District", id: "123456")
# Campus.create(name: "Test Campus", id: "123456789", district_id: "123456")

# User.create(name: "Andrew Zehrer", email: "andrewzehrer@tamu.edu", campus_id: "123456789", district_id: "123456", is_admin: true)
# User.create(name: "Ethan McKinney", email: "ethan.mckinney@tamu.edu", campus_id: "123456789", district_id: "123456", is_admin: true)
