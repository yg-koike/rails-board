# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


100.times do |n|
  title = Faker::Book.title
  name = Faker::Name.name
  Board.create(
    name: name, 
    title: title,
    body: "今日#{title}を手に入れました",
    user_id: n
  )
  User.create(
    name: n,
    password: "password",
    password_confirmation: "password",
    user_name: name,
    image: open("#{Rails.root}/db/fixtures/default.jpg"),
  )
  Comment.create(
    name: name,
    comment: Faker::Lorem.sentence,
    board_id: n,
  )
  BoardCategory.create(
    board_id: n,
    category_id: rand(10)
  )
end

Category.create([
  { name: "日常" },
  { name: "勉強" },
  { name: "グルメ" },
  { name: "アニメ" },
  { name: "映画" },
  { name: "プログラミング" },
  { name: "政治" },
  { name: "株式" },
  { name: "読書" },
])