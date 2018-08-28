class Meal < ApplicationRecord
  belongs_to :catering
  has_many :daily_meals
  has_and_belongs_to_many :ingredients,
                          class_name: 'Ingredient' ,
                          foreign_key: 'meal_id',
                          join_table: :meals_ingredient

end
