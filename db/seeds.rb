# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(
	name: "Example User",
	email: "example@railstutorial.org",
	password: "foobar",
	password_confirmation: "foobar"
)

20.times do |n|
	name = Faker::Name.name
	User.create!(
		name: name, 
		email: "#{name.split.join}@example.com", 
		password: "password", 
		password_confirmation: "password")
end

User.all.each do |user|
	10.times do |n|
		user.posts.create!(content: Faker::Lorem.paragraph)
	end
end
