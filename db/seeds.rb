# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# these already exist for me (andrew)
#District.create(district_id: 1, name: "Test District")
#Campus.create(campus_id: 1, name: "Test Campus", districts_id: 1)

User.create(user_id: 1, name: "Test User", email: "a", campuses_id: 1, districts_id: 1)
