# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do
  title = Faker::Book.title 
  Board.create(
    name: Faker::Name.name, 
    title: title,
    body: "今日#{title}を手に入れました"
  )
end