class CreateMealsDiets < ActiveRecord::Migration[5.2]
  def change
    create_table :meals_diets do |t|
      t.belongs_to :meal, index: true
      t.belongs_to :diet, index: true
    end
  end
end