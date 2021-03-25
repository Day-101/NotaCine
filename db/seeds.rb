# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.destroy_all
Genre.destroy_all
Notation.destroy_all

movies = ["https://www.imdb.com/title/tt0109830/?ref_=nv_sr_srsg_1", "https://www.imdb.com/title/tt0137523/?ref_=nv_sr_srsg_0", "https://www.imdb.com/title/tt1675434/?ref_=nv_sr_srsg_0"]
movies.each do |id|
	ImdbApi.add_from_id(id.match(/\w{2}\d{7}/))
end
50.times do |i|
	n = Notation.new(movie: Movie.all.sample, user: User.all.sample)
	scenario: rand(0..100)
	image: rand(0..100)
	editing: rand(0..100)
	sound: rand(0..100)
	makeup: rand(0..100) 
	directing: rand(0..100)
	n.save
end