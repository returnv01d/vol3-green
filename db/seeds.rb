# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'ffaker'
require_relative  '../app/models/ingredient.rb'

#POPULATE INGREDIENTS
p 'POPULATE INGREDIENTS'
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

#ADD BASIC DIETS
p 'ADD BASIC DIETS'
Diet.create(name: 'Meat')
Diet.create(name: 'Vegetarian')
Diet.create(name: 'Vegan')

#ADD TEST USERS
p 'ADD TEST USERS'
User.create(email: 'andrzej@nowak.pl', password: 'nowak11', password_confirmation: 'nowak11')
User.create(email: 'test@test.com', password: '123456', password_confirmation: '123456')

#ADD TEST CATERING
p 'ADD TEST CATERING'

Catering.create(email: 'test@test.com', password: '123456', password_confirmation: '123456',
name: 'test catering',
city: 'test')


#ADD TEST MEALS
p 'ADD TEST MEALS'

meal = Meal.create(name: 'Spaghetti Bolognese', catering: Catering.last)

pasta = Ingredient.find_by(name: 'Pasta') || Ingredient.create(name: 'Pasta')
tomato = Ingredient.find_by(name: 'Tomato') || Ingredient.create(name: 'Tomato')
minced_meat = Ingredient.find_by(name: 'Minced meat') || Ingredient.create(name: 'Minced meat')
onion = Ingredient.find_by(name: 'Onion') || Ingredient.create(name: 'Onion')
garlic = Ingredient.find_by(name: 'Garlic') || Ingredient.create(name: 'Garlic')
tomato_puree = Ingredient.find_by(name: 'Tomato puree') || Ingredient.create(name: 'Tomato puree')
oregano = Ingredient.find_by(name: 'Oregano') || Ingredient.create(name: 'Oregano')
meal.ingredients << pasta << tomato << onion << minced_meat << garlic << tomato_puree << oregano
meal.diets << Diet.find_by(name: 'Meat')

meal = Meal.create(name: 'Scrambled Eggs', catering: Catering.last)

egg = Ingredient.find_by(name: 'Egg') || Ingredient.create(name: 'Egg')
onion = Ingredient.find_by(name: 'Onion') || Ingredient.create(name: 'Onion')
garlic = Ingredient.find_by(name: 'Garlic') || Ingredient.create(name: 'Garlic')
pepper = Ingredient.find_by(name: 'Pepper') || Ingredient.create(name: 'Pepper')
salt = Ingredient.find_by(name: 'Salt') || Ingredient.create(name: 'Salt')
meal.ingredients << onion << egg<< garlic << pepper << salt
meal.diets << Diet.find_by(name: 'Vegetarian')

meal = Meal.create(name: 'Rice Salad', catering: Catering.last)
white_rice = Ingredient.find_by(name: 'White rice') || Ingredient.create(name: 'White rice')
pineapple = Ingredient.find_by(name: 'Pineapple') || Ingredient.create(name: 'Pineapple')
cucumber = Ingredient.find_by(name: 'Cucumber') || Ingredient.create(name: 'Cucumber')
corn = Ingredient.find_by(name: 'Corn') || Ingredient.create(name: 'Corn')
lemon = Ingredient.find_by(name: 'Lemon') || Ingredient.create(name: 'Lemon')
meal.ingredients << white_rice << pineapple << cucumber << corn << lemon
meal.diets << Diet.find_by(name: 'Vegan')

meal = Meal.create(name: 'Chicken Soup', catering: Catering.last)
chicken_meat = Ingredient.find_by(name: 'Chicken meat') || Ingredient.create(name: 'Chicken meat')
carrot = Ingredient.find_by(name: 'Carrot') || Ingredient.create(name: 'Carrot')
celery = Ingredient.find_by(name: 'Celery') || Ingredient.create(name: 'Celery')
leek = Ingredient.find_by(name: 'Leek') || Ingredient.create(name: 'Leek')
parsley = Ingredient.find_by(name: 'Parsley') || Ingredient.create(name: 'Parsley')
meal.ingredients << chicken_meat << carrot << salt << pepper << garlic << onion << celery << leek << parsley
meal.diets << Diet.find_by(name: 'Meat')

meal = Meal.create(name: 'Dumplings', catering: Catering.last)
dumplings = Ingredient.find_by(name: 'Dumplings') || Ingredient.create(name: 'Dumplings')
strawberry = Ingredient.find_by(name: 'Strawberry') || Ingredient.create(name: 'Strawyberry')
yoghurt = Ingredient.find_by(name: 'Yoghurt') || Ingredient.create(name: 'Yoghurt')
white_cheese = Ingredient.find_by(name: 'White cheese') || Ingredient.create(name: 'White cheese')
sugar = Ingredient.find_by(name: 'Sugar') || Ingredient.create(name: 'Sugar')
meal.ingredients << dumplings << strawberry << yoghurt << white_cheese << sugar
meal.diets << Diet.find_by(name: 'Vegetarian')

meal = Meal.create(name: 'Broccoli Salad', catering: Catering.last)
broccoli = Ingredient.find_by(name: 'Broccoli') || Ingredient.create(name: 'Broccoli')
tofu = Ingredient.find_by(name: 'Tofu') || Ingredient.create(name: 'Tofu')
pumpkin = Ingredient.find_by(name: 'Pumpkin') || Ingredient.create(name: 'Pumpkin')
sunflower_seeds = Ingredient.find_by(name: 'Sunflower seeds') || Ingredient.create(name: 'Sunflower seeds')
sweet_potato = Ingredient.find_by(name: 'Sweet potato') || Ingredient.create(name: 'Sweet potato')
meal.ingredients << broccoli << tofu << pumpkin << sunflower_seeds << sweet_potato
meal.diets << Diet.find_by(name: 'Vegan')



