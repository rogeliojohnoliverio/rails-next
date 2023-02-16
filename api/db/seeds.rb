# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.where(id: 1).first_or_create!(
  name: 'Rogelio Oliverio',
  email: 'rogelio@gmail.com',
  password: 'password',
  password_confirmation: 'password'
)
User.where(id: 2).first_or_create!(
  name: 'John Oliverio',
  email: 'john@gmail.com',
  password: 'password',
  password_confirmation: 'password'
)

5.times do |i|
  Post.where(id: i + 1).first_or_create!(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    user_id: rand(1..2)
  )
end
