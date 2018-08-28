# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'ffaker'
require_relative  '../app/models/ingredient.rb'

10.times do
  Ingredient.create(name: FFaker::Food.unique.fruit)
end

5.times do
  Ingredient.create(name: FFaker::Food.unique.meat)
end

20.times do
  Ingredient.create(name: FFaker::Food.unique.herb_or_spice)
end

5.times do
  Ingredient.create(name: FFaker::Food.unique.ingredient)
end

20.times do
  Ingredient.create(name: FFaker::Food.unique.vegetable)
end

