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

30.times do |n|
	name = Faker::Name.name
	User.create!(
		name: name, 
		email: "#{name.split.join}@example.com", 
		password: "password", 
		password_confirmation: "password")
end

10.times do |n|
	User.all.each do |user|
		user.posts.create!(content: Faker::Lorem.paragraph)
	end
end

user1 = User.first
User.all[1..8].each do |user|
	user1.friendships.create!(friend_id: user.id, accepted: true)
end
User.all[9..15].each do |user|
	user1.friendships.create!(friend_id: user.id)
end
User.all[16..25].each do |user|
	user.friendships.create!(friend_id: user1.id)
end
