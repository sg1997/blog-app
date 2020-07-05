# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



10.times do |blog|
	Blog.create!(
		title: "My Blog Post #{blog}",
		body: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled"
	)
end

puts "10 blog posts created"

5.times do |skill|
	Skill.create!(
		title: "Rails #{skill}",
		percent_utilized: 15 

	)
end

puts "5 skills posts created"

9.times do |portfolio|
	Portfolio.create!(
		title: "My Portfolio: #{portfolio}",
		subtitle: "A great service",
		body: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem ",
		main_image: "http://placehold.it/600X400",
		thumb_image: "http://placehold.it/350X200"
    )
end

puts "9 portfolios created"
