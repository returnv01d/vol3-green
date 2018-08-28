class CreateMealsIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :meals_ingredients do |t|
      t.belongs_to :meal, index: true
      t.belongs_to :ingredient, index: true
    end
  end
end
