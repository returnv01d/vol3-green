class Meal < ApplicationRecord
  belongs_to :catering
  has_many :daily_meals
  has_and_belongs_to_many :ingredients,
                          class_name: 'Ingredient' ,
                          foreign_key: 'meal_id',
                          join_table: :meals_ingredients
  has_and_belongs_to_many :diets,
                          class_name: 'Diet' ,
                          foreign_key: 'meal_id',
                          join_table: :meals_diets

  def is_allergic?(user_allergies)
    if user_allergies and self.ingredients
      return true
    end
    false
  end
end
