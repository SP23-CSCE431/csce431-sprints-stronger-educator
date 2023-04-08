# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Implemented (if not, uncomment and run 'rails db:seed')

require 'csv'
puts "Start scaping Districts."
file = File.open("db/DistrictsFinal_test2.csv", "r") do |file|
  headers = file.gets
  while line = file.gets
    name,iden,tea,desc,nces,charter,charterSchool = line.split(",")
    # district = District.create(name: name, district_id: iden)
    district = District.create(name: name, id: iden)
    # For debug purposes
    # puts "Created district: #{district.name} : #{district.id}"
  end
file.close
end
puts "End scaping Districts."
puts "Start scaping Campuses."

file = File.open("db/CampusFinal_test2.csv", "r") do |file|
    headers = file.gets
  while line = file.gets
    name,iden,type,desc = line.split(",")
    districtID = iden.slice(0,6) # Get first 6 elements/digits
    # campusID = iden.slice(6,9) # Get last 3 elements/digits
    # campus = Campus.create(name: name, campus_id: campusID, district_id: districtID)
    # /*
    # # Id for campus will now be the full 9 digits because if we just take 3
    # # then duplicate key values will violate unique constraint
    # */
    campus = Campus.create(name: name, id: iden, district_id: districtID)
    # For debug purposes
    # puts "Created campus: #{campus.name} : #{campus.id}  : #{campus.district_id}"
  end
file.close
end
puts "End scaping Campuses."


District.create(id: 1, name: "Test District")
Campus.create(id: 1, name: "Test Campus", district_id: 1)
User.create(id: 0, name: "Test User", email: "test@email", campus_id: 1, district_id: 1)
User.create(id: 999, name: "Andrew Zehrer", email: "andrewzehrer@tamu.edu", campus_id: 1, district_id: 1, is_admin: true)
User.create(id: 998, name: "Ethan McKinney", email: "ethan.mckinney@tamu.edu", campus_id: 1, district_id: 1, is_admin: true)
User.create(id: 997, name: "Angel Ham", email: "angelalexham@tamu.edu", campus_id: 1, district_id: 1, is_admin: true)