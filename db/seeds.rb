# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'
# puts "Start scraping Districts."
file = File.open("db/DistrictsFinal_test2.csv", "r") do |file|
  headers = file.gets
  while line = file.gets
    name,iden,tea,desc,nces,charter,charterSchool = line.split(",")
    district = District.find_or_create_by(name: name, id: iden)
    # puts "Created district: #{district.name} : #{district.id}"
  end
file.close
end
# puts "End scraping Districts."
# puts "Start scraping Campuses."

file = File.open("db/CampusFinal_test2.csv", "r") do |file|
    headers = file.gets
  while line = file.gets
    name,iden,type,desc = line.split(",")
    districtID = iden.slice(0,6) # Get first 6 elements/digits

    # ID for campus will now be the full 9 digits
    campus = Campus.find_or_create_by(name: name, id: iden, district_id: districtID)
    # puts "Created campus: #{campus.name} : #{campus.id}  : #{campus.district_id}"
  end
file.close
end
# puts "End scraping Campuses."

District.find_or_create_by(name: "No District", id: "0")
District.find_or_create_by(name: "StrongerEd Admin", id: "1")
Campus.find_or_create_by(name: "StrongerEd Admin", id: "1", district_id: "1")
User.find_or_create_by(name: "Andrew Zehrer", email: "andrewzehrer@tamu.edu", campus_id: "1", district_id: "1", is_admin: true)
User.find_or_create_by(name: "Ethan McKinney", email: "ethan.mckinney@tamu.edu", campus_id: "1", district_id: "1", is_admin: true)
User.find_or_create_by(name: "Angel Ham", email: "angelalexham@tamu.edu", campus_id: "1", district_id: "1", is_admin: true)
User.find_or_create_by(name: "Michael Pham", email: "phammichael1001@tamu.edu", campus_id: "1", district_id: "1", is_admin: true)
User.find_or_create_by(name: "Abhishek Sinha", email: "abhishek_sinha@tamu.edu", campus_id: "1", district_id: "1", is_admin: true)
User.find_or_create_by(name: "Pauline C Wade", email: "paulinewade@tamu.edu", campus_id: "1", district_id: "1", is_admin: true)
User.find_or_create_by(name: "Apurva A Shinde", email: "ashinde1112@tamu.edu", campus_id: "1", district_id: "1", is_admin: true)
User.find_or_create_by(name: "Anthony Luevanos", email: "aluevanos@tamu.edu", campus_id: "1", district_id: "1", is_admin: true)
User.find_or_create_by(name: "Stronger Educator", email: "stronger@strongered.com", campus_id: "1", district_id: "1", is_admin: true)

