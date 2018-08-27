class Diet < ApplicationRecord
  has_and_belongs_to_many :users,
                          class_name: 'User' ,
                          foreign_key: 'diet_id',
                          join_table: :users_diets
  has_and_belongs_to_many :meals,
                          class_name: 'Meal' ,
                          foreign_key: 'diet_id',
                          join_table: :diets_meals
end
