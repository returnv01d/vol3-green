class Ingredient < ApplicationRecord
  has_and_belongs_to_many :allergic_users,
                          class_name: 'User' ,
                          foreign_key: 'ingredient_id',
                          join_table: :users_allergies
  has_and_belongs_to_many :meals,
                          class_name: 'Meal' ,
                          foreign_key: 'ingredient_id',
                          join_table: :meals_ingredients
  has_and_belongs_to_many :diets,
                          class_name: 'Diet' ,
                          foreign_key: 'ingredient_id',
                          join_table: :diets_ingredients
end
