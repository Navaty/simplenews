# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.create!({email:"test@test.ru", password: "qwerty", password_confirmation: "qwerty"})
1..7.times do |i| 
	u.posts.create!({title: "Simple#{i}", body:"This body of simple #{i}", category: "Авто", age_rating: "0+", source: "Simple source", source_url:"ya.ru"})
end
